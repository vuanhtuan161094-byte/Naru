# Offline region renderer derived from WanderlanLima/Naruto-Shinobi-Studio-Sprite @ 6151a2b2d66698fb1dbe0228ea4cdc4b844df22a
# Source: src/utils/termuxCharacterExportScript.ts, pure image/math routines only.
# No source game logic, no network or filesystem writes in this core. Region-only; mesh/IK/draw-order fidelity unverified.
import math, re, io
from PIL import Image, ImageChops
import numpy as np
PRIORITY_ANIM_ORDER=[]
def parse_atlas(atlas_text: str):
    pages = []
    current_page = None
    current_region = None
    def parse_pair(val):
        parts = [int(float(s.strip())) for s in val.split(",") if s.strip()]
        return (parts[0] if len(parts) > 0 else 0, parts[1] if len(parts) > 1 else 0)
    for raw_line in atlas_text.splitlines():
        trimmed = raw_line.strip()
        if not trimmed:
            if current_region and current_page:
                current_page["regions"].append(current_region)
                current_region = None
            current_page = None
            continue
        is_indented = bool(re.match(r"^\s+", raw_line))
        colon_idx = trimmed.find(":")
        if current_page is None:
            current_page = {"name": trimmed, "width": 0, "height": 0, "regions": []}
            pages.append(current_page)
            continue
        if not is_indented and colon_idx != -1 and current_region is None:
            key = trimmed[:colon_idx].strip()
            val = trimmed[colon_idx + 1:].strip()
            if key == "size":
                current_page["width"], current_page["height"] = parse_pair(val)
            continue
        if not is_indented and colon_idx == -1:
            if re.search(r"\.(png|webp|jpe?g|gif|ktx2?)$", trimmed, re.I):
                if current_region:
                    current_page["regions"].append(current_region)
                    current_region = None
                current_page = {"name": trimmed, "width": 0, "height": 0, "regions": []}
                pages.append(current_page)
            else:
                if current_region:
                    current_page["regions"].append(current_region)
                current_region = {
                    "name": trimmed, "pageName": current_page["name"],
                    "rotate": 0, "x": 0, "y": 0, "width": 0, "height": 0,
                    "origWidth": 0, "origHeight": 0, "offsetX": 0, "offsetY": 0, "index": -1,
                }
            continue
        if current_region is not None and colon_idx != -1:
            key = trimmed[:colon_idx].strip()
            val = trimmed[colon_idx + 1:].strip()
            if key == "rotate":
                if val == "true": current_region["rotate"] = 90
                elif val == "false": current_region["rotate"] = 0
                else:
                    try: current_region["rotate"] = int(float(val))
                    except Exception: current_region["rotate"] = 0
            elif key == "xy":
                current_region["x"], current_region["y"] = parse_pair(val)
            elif key == "size":
                current_region["width"], current_region["height"] = parse_pair(val)
            elif key == "orig":
                current_region["origWidth"], current_region["origHeight"] = parse_pair(val)
            elif key == "offset":
                current_region["offsetX"], current_region["offsetY"] = parse_pair(val)
            elif key == "index":
                try: current_region["index"] = int(val)
                except Exception: current_region["index"] = -1
    if current_region and current_page:
        current_page["regions"].append(current_region)
    return pages

def extract_region_pil(region, page_img: Image.Image) -> Image.Image:
    out_w = max(1, region["origWidth"] or region["width"])
    out_h = max(1, region["origHeight"] or region["height"])
    is_rot90 = region["rotate"] == 90
    src_w = region["height"] if is_rot90 else region["width"]
    src_h = region["width"] if is_rot90 else region["height"]
    rx, ry = region["x"], region["y"]
    pw, ph = page_img.size
    cx0, cy0 = max(0, rx), max(0, ry)
    cx1, cy1 = min(pw, rx + src_w), min(ph, ry + src_h)
    out = Image.new("RGBA", (out_w, out_h), (0, 0, 0, 0))
    if cx1 <= cx0 or cy1 <= cy0 or src_w <= 0 or src_h <= 0:
        return out
    crop = page_img.crop((cx0, cy0, cx1, cy1))
    if crop.size != (src_w, src_h):
        padded = Image.new("RGBA", (src_w, src_h), (0, 0, 0, 0))
        padded.paste(crop, (cx0 - rx, cy0 - ry))
        crop = padded
    if is_rot90:
        crop = crop.transpose(Image.Transpose.ROTATE_90)
    dest_x = region["offsetX"] or 0
    dest_y = max(0, out_h - (region["offsetY"] or 0) - region["height"])
    out.paste(crop, (dest_x, dest_y))
    return out

def pil_to_png_bytes(img: Image.Image) -> bytes:
    buf = io.BytesIO()
    img.save(buf, format="PNG", compress_level=6)
    return buf.getvalue()

def get_default_skin_attachments(skeleton):
    skins = skeleton.get("skins")
    if not skins:
        return {}
    if isinstance(skins, list):
        for s in skins:
            if s.get("name") == "default":
                return s.get("attachments") or {}
        return (skins[0].get("attachments") or {}) if skins else {}
    if "default" in skins:
        return skins["default"] or {}
    vals = list(skins.values())
    return vals[0] if vals else {}

def has_visible_animation_content(skeleton, anim_name: str) -> bool:
    if not skeleton or not anim_name:
        return False
    if any(s.get("attachment") for s in (skeleton.get("slots") or [])):
        return True
    anim = (skeleton.get("animations") or {}).get(anim_name)
    if not anim or not anim.get("slots"):
        return False
    for slot_anim in anim["slots"].values():
        for kf in (slot_anim.get("attachment") or []):
            if kf.get("name"):
                return True
    return False

def resolve_effective_animation_name(skeleton, anim_name: str) -> str:
    anims = (skeleton or {}).get("animations") or {}
    if not anims or not anim_name:
        return anim_name
    current = anim_name
    visited = set()
    for _ in range(3):
        if current in visited:
            break
        visited.add(current)
        if has_visible_animation_content(skeleton, current):
            return current
        anim = anims.get(current) or {}
        events = anim.get("events") or []
        if not events:
            break
        candidates = []
        for ev in events:
            s = ev.get("string") or ""
            for m in re.finditer(r"\{PLAY:([^}]+)\}", s):
                nm = re.search(r'name\s*=\s*["\']([^"\']+)["\']', m.group(1))
                target = nm.group(1).strip() if nm else ""
                if target and target in anims and target not in visited:
                    candidates.append(target)
        if not candidates:
            break
        non_tp = [c for c in candidates if not re.search(r"shunyi|teleport|blink", c, re.I)]
        nxt = non_tp[-1] if non_tp else candidates[-1]
        if not nxt or nxt == current:
            break
        current = nxt
    return current

def get_sorted_animation_names(skeleton):
    raw = list(((skeleton or {}).get("animations") or {}).keys())
    def sort_key(a):
        if a.lower() == "idle":
            return (0, 0, a)
        if a in PRIORITY_ANIM_ORDER:
            return (1, PRIORITY_ANIM_ORDER.index(a), a)
        return (2, 0, a)
    return sorted(raw, key=sort_key)

def get_animation_duration(skeleton, anim_name: str) -> float:
    anim = ((skeleton or {}).get("animations") or {}).get(anim_name)
    if not anim:
        return 0.0
    max_t = 0.0
    for slot_anim in (anim.get("slots") or {}).values():
        for key in ("attachment", "color", "twoColor"):
            for kf in (slot_anim.get(key) or []):
                t = float(kf.get("time") or 0)
                if t > max_t: max_t = t
    for bone_anim in (anim.get("bones") or {}).values():
        for key in ("rotate", "translate", "scale", "shear"):
            for kf in (bone_anim.get(key) or []):
                t = float(kf.get("time") or 0)
                if t > max_t: max_t = t
    for ev in (anim.get("events") or []):
        t = float(ev.get("time") or 0)
        if t > max_t: max_t = t
    return (max_t + 1.0 / 24.0) if max_t > 0 else 0.5

def extract_spine_effect_refs(skeleton, anim_name: str):
    if not skeleton or not anim_name:
        return []
    eff = resolve_effective_animation_name(skeleton, anim_name)
    anims = skeleton.get("animations") or {}
    inspect_list = [anims.get(anim_name), anims.get(eff)] if eff != anim_name else [anims.get(anim_name)]
    refs = []
    seen = set()
    for anim in inspect_list:
        if not anim or not anim.get("events"):
            continue
        for ev in anim["events"]:
            s = ev.get("string") or ""
            if not s:
                continue
            for m in re.finditer(r"\{([A-Za-z0-9_]+):([^}]+)(?:\}|$)", s):
                cmd_type, body = m.group(1), m.group(2)
                if not cmd_type.startswith("DISPLAY"):
                    continue
                sm = re.search(r'spine\s*=\s*["\']([^"\']+)["\']', body)
                srcm = re.search(r'source\s*=\s*["\']([^"\']+)["\']', body)
                if not sm or not srcm:
                    continue
                lm = re.search(r'layer\s*=\s*["\']([^"\']+)["\']', body)
                loopm = re.search(r'loop\s*=\s*["\']([^"\']+)["\']', body)
                has_explicit_targets = bool(re.search(r"targets\s*=\s*\[", body, flags=re.I))
                has_self = bool(re.search(r'targets\s*=\s*\[[^\]]*["\']self["\'][^\]]*\]', body, flags=re.I))
                spine_id = sm.group(1).strip()
                eff_anim = srcm.group(1).strip()
                lval = (lm.group(1) if lm else "").lower()
                layer = "behind" if lval in ("rbg", "bg") else "front"
                loop_val = (loopm.group(1) if loopm else "").lower()
                loop = loop_val in ("true", "1", "loop")
                is_generic_impact = bool(re.match(r"^(?:noe_)?(?:f?dajitexiao\d*|dianliu|huoshouji|feng|erweibaodian|vdf_.*_hit)$", spine_id, flags=re.I))
                is_self_or_screen = (cmd_type == "DISPLAY") or has_self or (not has_explicit_targets and not is_generic_impact)
                start_t = max(0.0, float(ev.get("time") or 0))
                key = f"{spine_id}::{eff_anim}::{start_t:.4f}::{layer}"
                if key in seen:
                    continue
                seen.add(key)
                refs.append({
                    "spineId": spine_id, "animName": eff_anim, "startTime": start_t,
                    "layer": layer, "isSelfOrScreen": is_self_or_screen, "loop": loop,
                    "rawCommand": m.group(0),
                })
    return refs

def extract_spine_audio_refs(skeleton, anim_name: str):
    if not skeleton or not anim_name:
        return []
    eff = resolve_effective_animation_name(skeleton, anim_name)
    anims = skeleton.get("animations") or {}
    inspect_list = [anims.get(anim_name), anims.get(eff)] if eff != anim_name else [anims.get(anim_name)]
    refs = []
    seen = set()
    for anim in inspect_list:
        if not anim or not anim.get("events"):
            continue
        for ev in anim["events"]:
            t = max(0.0, float(ev.get("time") or 0))
            s = ev.get("string") or ""
            if s:
                for m in re.finditer(r"\{SOUND:([^}]+)\}", s, re.I):
                    body = m.group(1)
                    nm = re.search(r'name\s*=\s*["\']([^"\']+)["\']', body) or re.search(r'source\s*=\s*["\']([^"\']+)["\']', body)
                    if nm:
                        sname = nm.group(1).strip()
                        key = f"{sname}::{t:.3f}"
                        if sname and key not in seen:
                            seen.add(key)
                            refs.append({"soundName": sname, "time": t})
            raw_name = (ev.get("name") or "").strip()
            if (raw_name and raw_name != "@CMD" and raw_name.lower() != "label"
                and not raw_name.lower().startswith("no:") and not raw_name.startswith("{")
                and re.match(r"^[A-Za-z0-9_/-]+$", raw_name)):
                key = f"{raw_name}::{t:.3f}"
                if key not in seen:
                    seen.add(key)
                    refs.append({"soundName": raw_name, "time": t})
    refs.sort(key=lambda x: x["time"])
    return refs

def extract_spine_video_refs(skeleton, anim_name: str):
    if not skeleton or not anim_name:
        return []
    eff = resolve_effective_animation_name(skeleton, anim_name)
    anims = skeleton.get("animations") or {}
    inspect_list = [anims.get(anim_name), anims.get(eff)] if eff != anim_name else [anims.get(anim_name)]
    refs = []
    seen = set()
    for anim in inspect_list:
        if not anim or not anim.get("events"):
            continue
        for ev in anim["events"]:
            s = ev.get("string") or ""
            if not s:
                continue
            for m in re.finditer(r"\{PLAYV(?:E|I)D(?:E|I)O:([^}]+)\}", s, re.I):
                body = m.group(1) or ""
                sm = re.search(r'source\s*=\s*["\']([^"\']+)["\']', body, re.I) or re.search(r"source\s*=\s*([A-Za-z0-9_.-]+)", body, re.I)
                if not sm:
                    continue
                source = sm.group(1).strip()
                cm = re.search(r'careforward\s*=\s*["\']?([^"\',\s}]+)["\']?', body, re.I)
                care = (cm.group(1).lower() in ("1", "true")) if cm else False
                resolved = f"{source}_left" if care else source
                t = max(0.0, float(ev.get("time") or 0))
                key = f"{resolved}::{t:.3f}"
                if key not in seen:
                    seen.add(key)
                    refs.append({"source": source, "resolvedName": resolved, "time": t, "careforward": care})
    refs.sort(key=lambda x: x["time"])
    return refs

def filter_effect_refs_by_scope(refs, scope: str):
    if scope == "base": return []
    if scope == "powers": return [r for r in refs if r["isSelfOrScreen"]]
    return refs

def get_composite_animation_duration(base_dur: float, layers) -> float:
    total = base_dur
    for layer in layers:
        if not layer["loop"] and layer["duration"] > 0:
            end = layer["startTime"] + min(layer["duration"], 8.0)
            if end > total:
                total = end
    return total

def sample_linear(frames, t: float, field: str, default_val: float) -> float:
    if not frames:
        return default_val
    first_t = float(frames[0].get("time") or 0)
    if t < first_t - 1e-5:
        return default_val
    if t <= first_t:
        v = frames[0].get(field)
        return float(v) if isinstance(v, (int, float)) else default_val
    for i in range(len(frames) - 1):
        a, b = frames[i], frames[i + 1]
        ta, tb = float(a.get("time") or 0), float(b.get("time") or 0)
        if ta <= t <= tb:
            va = float(a.get(field)) if isinstance(a.get(field), (int, float)) else default_val
            vb = float(b.get(field)) if isinstance(b.get(field), (int, float)) else default_val
            if a.get("curve") == "stepped" or tb == ta:
                return va
            return va + (vb - va) * ((t - ta) / (tb - ta))
    last = frames[-1]
    v = last.get(field)
    return float(v) if isinstance(v, (int, float)) else default_val

def sample_angle(frames, t: float) -> float:
    if not frames:
        return 0.0
    first_t = float(frames[0].get("time") or 0)
    if t < first_t - 1e-5:
        return 0.0
    if t <= first_t:
        return float(frames[0].get("angle") or 0)
    for i in range(len(frames) - 1):
        a, b = frames[i], frames[i + 1]
        ta, tb = float(a.get("time") or 0), float(b.get("time") or 0)
        if ta <= t <= tb:
            va = float(a.get("angle") or 0)
            vb = float(b.get("angle") or 0)
            if a.get("curve") == "stepped" or tb == ta:
                return va
            diff = vb - va
            while diff > 180.0: diff -= 360.0
            while diff < -180.0: diff += 360.0
            return va + diff * ((t - ta) / (tb - ta))
    return float(frames[-1].get("angle") or 0)

def parse_hex_rgba(color_hex):
    if not color_hex or len(color_hex) < 6:
        return (255, 255, 255, 1.0)
    try:
        r = max(0, min(255, int(color_hex[0:2], 16)))
        g = max(0, min(255, int(color_hex[2:4], 16)))
        b = max(0, min(255, int(color_hex[4:6], 16)))
        a_byte = int(color_hex[6:8], 16) if len(color_hex) >= 8 else 255
        return (r, g, b, max(0.0, min(1.0, a_byte / 255.0)))
    except Exception:
        return (255, 255, 255, 1.0)

def sample_hex_rgba_timeline(frames, key_name: str, t: float):
    if not frames:
        return None
    first_t = float(frames[0].get("time") or 0)
    if t < first_t - 1e-5:
        return None
    if t <= first_t:
        return parse_hex_rgba(frames[0].get(key_name))
    for i in range(len(frames) - 1):
        a, b = frames[i], frames[i + 1]
        ta, tb = float(a.get("time") or 0), float(b.get("time") or 0)
        if ta <= t <= tb:
            ca = parse_hex_rgba(a.get(key_name))
            cb = parse_hex_rgba(b.get(key_name))
            if a.get("curve") == "stepped" or tb == ta:
                return ca
            alpha = (t - ta) / (tb - ta)
            return (
                round(ca[0] + (cb[0] - ca[0]) * alpha),
                round(ca[1] + (cb[1] - ca[1]) * alpha),
                round(ca[2] + (cb[2] - ca[2]) * alpha),
                ca[3] + (cb[3] - ca[3]) * alpha,
            )
    return parse_hex_rgba(frames[-1].get(key_name))

def sample_slot_color(slot, anim, t: float):
    base = parse_hex_rgba(slot.get("color"))
    slot_anim = ((anim or {}).get("slots") or {}).get(slot["name"]) or {}
    cs = sample_hex_rgba_timeline(slot_anim.get("color"), "color", t)
    if cs is not None:
        return cs
    tcs = sample_hex_rgba_timeline(slot_anim.get("twoColor"), "light", t)
    if tcs is not None:
        return tcs
    return base

def resolve_slot_attachment(slot_name: str, default_att, anim, t: float):
    att = default_att
    tl = (((anim or {}).get("slots") or {}).get(slot_name) or {}).get("attachment")
    if tl:
        for kf in tl:
            if float(kf.get("time") or 0) <= t + 1e-5:
                att = kf.get("name")
            else:
                break
    return att

def make_local_mat(x, y, rot_deg, sx, sy, shx=0.0, shy=0.0):
    rad_x = math.radians(rot_deg + shx)
    rad_y = math.radians(rot_deg + 90.0 + shy)
    return (math.cos(rad_x) * sx, math.sin(rad_x) * sx, math.cos(rad_y) * sy, math.sin(rad_y) * sy, x, y)

def mul_mat(p, c):
    pa, pb, pc, pd, ptx, pty = p
    ca, cb, cc, cd, ctx, cty = c
    return (
        pa * ca + pc * cb,
        pb * ca + pd * cb,
        pa * cc + pc * cd,
        pb * cc + pd * cd,
        pa * ctx + pc * cty + ptx,
        pb * ctx + pd * cty + pty,
    )

def build_world_matrix_resolver(skeleton, anim, t: float):
    bone_map = {b["name"]: b for b in (skeleton.get("bones") or [])}
    cache = {}
    def get_wm(bname):
        if bname in cache:
            return cache[bname]
        b = bone_map.get(bname)
        if not b:
            res = (1.0, 0.0, 0.0, 1.0, 0.0, 0.0)
            cache[bname] = res
            return res
        ba = ((anim or {}).get("bones") or {}).get(bname) or {}
        lx = float(b.get("x") or 0) + sample_linear(ba.get("translate"), t, "x", 0.0)
        ly = float(b.get("y") or 0) + sample_linear(ba.get("translate"), t, "y", 0.0)
        lrot = float(b.get("rotation") or 0) + sample_angle(ba.get("rotate"), t)
        lsx = float(b.get("scaleX") if b.get("scaleX") is not None else 1.0) * sample_linear(ba.get("scale"), t, "x", 1.0)
        lsy = float(b.get("scaleY") if b.get("scaleY") is not None else 1.0) * sample_linear(ba.get("scale"), t, "y", 1.0)
        lshx = float(b.get("shearX") or 0) + sample_linear(ba.get("shear"), t, "x", 0.0)
        lshy = float(b.get("shearY") or 0) + sample_linear(ba.get("shear"), t, "y", 0.0)
        local = make_local_mat(lx, ly, lrot, lsx, lsy, lshx, lshy)
        parent = b.get("parent")
        world = mul_mat(get_wm(parent), local) if parent else local
        cache[bname] = world
        return world
    return get_wm

def collect_sample_times(anim, duration: float, samples: int):
    times = set()
    step_count = max(2, samples)
    for s in range(step_count):
        times.add(0.0 if step_count == 1 else (s / (step_count - 1)) * duration)
    for slot_anim in ((anim or {}).get("slots") or {}).values():
        for kf in (slot_anim.get("attachment") or []):
            if isinstance(kf.get("time"), (int, float)):
                times.add(float(kf["time"]))
    for bone_anim in ((anim or {}).get("bones") or {}).values():
        for k in ("translate", "rotate", "scale"):
            for kf in (bone_anim.get(k) or []):
                if isinstance(kf.get("time"), (int, float)):
                    times.add(float(kf["time"]))
    return sorted(times)

def accumulate_bounds_at_time(skeleton, anim_name, region_sizes, t, acc, max_slot_span=None, anchor_cx=None, anchor_cy=None, max_anchor_dist=None):
    anim = (skeleton.get("animations") or {}).get(anim_name)
    skin_atts = get_default_skin_attachments(skeleton)
    get_wm = build_world_matrix_resolver(skeleton, anim, t)
    for slot in (skeleton.get("slots") or []):
        att_name = resolve_slot_attachment(slot["name"], slot.get("attachment"), anim, t)
        if not att_name:
            continue
        if sample_slot_color(slot, anim, t)[3] <= 0.01:
            continue
        att_info = (skin_atts.get(slot["name"]) or {}).get(att_name) or {}
        rkey = att_info.get("path") or att_info.get("name") or att_name
        rsize = region_sizes.get(rkey)
        if not rsize:
            continue
        wm = get_wm(slot["bone"])
        lmat = make_local_mat(
            float(att_info.get("x") or 0), float(att_info.get("y") or 0),
            float(att_info.get("rotation") or 0),
            float(att_info.get("scaleX") if att_info.get("scaleX") is not None else 1.0),
            float(att_info.get("scaleY") if att_info.get("scaleY") is not None else 1.0),
        )
        fm = mul_mat(wm, lmat)
        hw = float(att_info.get("width") or rsize[0]) / 2.0
        hh = float(att_info.get("height") or rsize[1]) / 2.0
        qmin_x = qmin_y = math.inf
        qmax_x = qmax_y = -math.inf
        for cx, cy in ((-hw, -hh), (hw, -hh), (hw, hh), (-hw, hh)):
            wx = fm[0] * cx + fm[2] * cy + fm[4]
            wy = fm[1] * cx + fm[3] * cy + fm[5]
            if not (math.isfinite(wx) and math.isfinite(wy)):
                qmin_x = math.inf
                break
            if wx < qmin_x: qmin_x = wx
            if wx > qmax_x: qmax_x = wx
            if wy < qmin_y: qmin_y = wy
            if wy > qmax_y: qmax_y = wy
        if not math.isfinite(qmin_x):
            continue
        if max_slot_span is not None:
            if (qmax_x - qmin_x) > max_slot_span or (qmax_y - qmin_y) > max_slot_span:
                continue
        if anchor_cx is not None and anchor_cy is not None and max_anchor_dist is not None:
            qcx = (qmin_x + qmax_x) / 2.0
            qcy = (qmin_y + qmax_y) / 2.0
            if abs(qcx - anchor_cx) > max_anchor_dist or abs(qcy - anchor_cy) > max_anchor_dist:
                continue
        if qmin_x < acc["minX"]: acc["minX"] = qmin_x
        if qmax_x > acc["maxX"]: acc["maxX"] = qmax_x
        if qmin_y < acc["minY"]: acc["minY"] = qmin_y
        if qmax_y > acc["maxY"]: acc["maxY"] = qmax_y

def compute_composite_bounds(skeleton, anim_name, region_sizes, layers, samples=24):
    anim = (skeleton.get("animations") or {}).get(anim_name)
    base_dur = get_animation_duration(skeleton, anim_name)
    base_acc = {"minX": math.inf, "maxX": -math.inf, "minY": math.inf, "maxY": -math.inf}
    stimes = collect_sample_times(anim, base_dur, samples)
    for t in stimes:
        accumulate_bounds_at_time(skeleton, anim_name, region_sizes, t, base_acc, max_slot_span=2400.0)
    if not (math.isfinite(base_acc["minX"]) and math.isfinite(base_acc["minY"])):
        for t in stimes:
            accumulate_bounds_at_time(skeleton, anim_name, region_sizes, t, base_acc)
    has_base = math.isfinite(base_acc["minX"]) and math.isfinite(base_acc["minY"])
    base_w = max(40.0, base_acc["maxX"] - base_acc["minX"]) if has_base else 160.0
    base_h = max(40.0, base_acc["maxY"] - base_acc["minY"]) if has_base else 160.0
    base_cx = (base_acc["minX"] + base_acc["maxX"]) / 2.0 if has_base else 0.0
    base_cy = (base_acc["minY"] + base_acc["maxY"]) / 2.0 if has_base else 80.0
    acc = dict(base_acc)
    if layers:
        eff_acc = {"minX": math.inf, "maxX": -math.inf, "minY": math.inf, "maxY": -math.inf}
        max_span = max(1500.0, max(base_w, base_h) * 8.0) if has_base else 2400.0
        max_dist = max(1600.0, max(base_w, base_h) * 9.0) if has_base else None
        for layer in layers:
            la = (layer["skeleton"].get("animations") or {}).get(layer["animName"])
            ltimes = collect_sample_times(la, layer["duration"], min(samples, 16))
            for lt in ltimes:
                accumulate_bounds_at_time(
                    layer["skeleton"], layer["animName"], layer["regionSizes"], lt, eff_acc,
                    max_slot_span=max_span,
                    anchor_cx=base_cx if has_base else None,
                    anchor_cy=base_cy if has_base else None,
                    max_anchor_dist=max_dist,
                )
        if math.isfinite(eff_acc["minX"]) and math.isfinite(eff_acc["minY"]):
            if has_base:
                pad_l = max(680.0, base_w * 3.4)
                pad_r = max(680.0, base_w * 3.4)
                pad_b = max(460.0, base_h * 2.2)
                pad_t = max(680.0, base_h * 3.4)
                acc["minX"] = min(acc["minX"], max(eff_acc["minX"], base_acc["minX"] - pad_l))
                acc["maxX"] = max(acc["maxX"], min(eff_acc["maxX"], base_acc["maxX"] + pad_r))
                acc["minY"] = min(acc["minY"], max(eff_acc["minY"], base_acc["minY"] - pad_b))
                acc["maxY"] = max(acc["maxY"], min(eff_acc["maxY"], base_acc["maxY"] + pad_t))
            else:
                acc = eff_acc
    if not (math.isfinite(acc["minX"]) and math.isfinite(acc["minY"])):
        sw = max(80.0, float((skeleton.get("skeleton") or {}).get("width") or 160))
        sh = max(80.0, float((skeleton.get("skeleton") or {}).get("height") or 160))
        return {"minX": -sw/2, "maxX": sw/2, "minY": 0.0, "maxY": sh, "width": sw, "height": sh, "centerX": 0.0, "centerY": sh/2}
    w = max(16.0, acc["maxX"] - acc["minX"])
    h = max(16.0, acc["maxY"] - acc["minY"])
    return {
        "minX": acc["minX"], "maxX": acc["maxX"], "minY": acc["minY"], "maxY": acc["maxY"],
        "width": w, "height": h,
        "centerX": (acc["minX"] + acc["maxX"]) / 2.0,
        "centerY": (acc["minY"] + acc["maxY"]) / 2.0,
    }

def compute_native_export_cell_size(bounds, max_dim=2048):
    w = max(160, math.ceil(bounds["width"] * 1.16))
    h = max(160, math.ceil(bounds["height"] * 1.16))
    if w > max_dim or h > max_dim:
        ratio = min(max_dim / w, max_dim / h)
        w = max(160, math.floor(w * ratio))
        h = max(160, math.floor(h * ratio))
    return int(w), int(h)

def compute_strip_layout(bounds, frame_count, max_cell_side=1536):
    cols = max(1, min(frame_count, math.ceil(math.sqrt(frame_count))))
    rows = max(1, math.ceil(frame_count / cols))
    cell_w, cell_h = compute_native_export_cell_size(bounds, max_cell_side)
    max_side = 12288
    max_px = 64 * 1024 * 1024
    scale = 1.0
    if cols * cell_w > max_side:
        scale = min(scale, max_side / (cols * cell_w))
    if rows * cell_h > max_side:
        scale = min(scale, max_side / (rows * cell_h))
    total_px = (cols * cell_w * scale) * (rows * cell_h * scale)
    if total_px > max_px:
        scale *= math.sqrt(max_px / total_px)
    if scale < 1.0:
        cell_w = max(128, math.floor(cell_w * scale))
        cell_h = max(128, math.floor(cell_h * scale))
    return int(cols), int(rows), int(cell_w), int(cell_h)

# ---------- Exact 2D Spine Compositor (Pillow AFFINE + optional NumPy / pure Pillow C fallback) ----------
_UNPREMULT_LUT = [bytes(256)] + [bytes(min(255, int(round(c * 255.0 / a))) for c in range(256)) for a in range(1, 256)]
_GIF_SHIFT_LUT = [min(255, i + 1) for i in range(256)]
_GIF_TRANSP_MASK_LUT = [255 if i < 32 else 0 for i in range(256)]

def aff_mul(m1, m2):
    a1, b1, tx1, c1, d1, ty1 = m1
    a2, b2, tx2, c2, d2, ty2 = m2
    return (
        a1 * a2 + b1 * c2,
        a1 * b2 + b1 * d2,
        a1 * tx2 + b1 * ty2 + tx1,
        c1 * a2 + d1 * c2,
        c1 * b2 + d1 * d2,
        c1 * tx2 + d1 * ty2 + ty1,
    )

def aff_inv(m):
    a, b, tx, c, d, ty = m
    det = a * d - b * c
    if abs(det) < 1e-8:
        return None
    inv_d = 1.0 / det
    ia = d * inv_d
    ib = -b * inv_d
    ic = -c * inv_d
    id_ = a * inv_d
    return (ia, ib, -(ia * tx + ib * ty), ic, id_, -(ic * tx + id_ * ty))

def aff_pt(m, x: float, y: float):
    return (m[0] * x + m[1] * y + m[2], m[3] * x + m[4] * y + m[5])

def _iter_warped_slots(cw: int, ch: int, view_aff, skeleton, anim_name: str, t: float, region_imgs):
    anim = (skeleton.get("animations") or {}).get(anim_name)
    skin_atts = get_default_skin_attachments(skeleton)
    get_wm = build_world_matrix_resolver(skeleton, anim, t)
    for slot in (skeleton.get("slots") or []):
        att_name = resolve_slot_attachment(slot["name"], slot.get("attachment"), anim, t)
        if not att_name:
            continue
        sr, sg, sb, sa_slot = sample_slot_color(slot, anim, t)
        if sa_slot <= 0.004:
            continue
        att_info = (skin_atts.get(slot["name"]) or {}).get(att_name) or {}
        rkey = att_info.get("path") or att_info.get("name") or att_name
        sprite = region_imgs.get(rkey)
        if sprite is None:
            continue
        out_w, out_h = sprite.size
        wm = get_wm(slot["bone"])
        m_world = (wm[0], wm[2], wm[4], wm[1], wm[3], wm[5])
        ax = float(att_info.get("x") or 0)
        ay = float(att_info.get("y") or 0)
        arot = math.radians(float(att_info.get("rotation") or 0))
        asx = float(att_info.get("scaleX") if att_info.get("scaleX") is not None else 1.0)
        asy = float(att_info.get("scaleY") if att_info.get("scaleY") is not None else 1.0)
        aw = float(att_info.get("width") or out_w)
        ah = float(att_info.get("height") or out_h)
        ca, sa_r = math.cos(arot), math.sin(arot)
        m_tr = (ca * asx, -sa_r * (-asy), ax, sa_r * asx, ca * (-asy), ay)
        m_uv = (aw / out_w, 0.0, -aw / 2.0, 0.0, ah / out_h, -ah / 2.0)
        m_fwd = aff_mul(aff_mul(aff_mul(view_aff, m_world), m_tr), m_uv)
        m_inv = aff_inv(m_fwd)
        if m_inv is None:
            continue
        p0 = aff_pt(m_fwd, 0.0, 0.0)
        p1 = aff_pt(m_fwd, float(out_w), 0.0)
        p2 = aff_pt(m_fwd, float(out_w), float(out_h))
        p3 = aff_pt(m_fwd, 0.0, float(out_h))
        x0 = max(0, int(math.floor(min(p0[0], p1[0], p2[0], p3[0]))) - 1)
        y0 = max(0, int(math.floor(min(p0[1], p1[1], p2[1], p3[1]))) - 1)
        x1 = min(cw, int(math.ceil(max(p0[0], p1[0], p2[0], p3[0]))) + 1)
        y1 = min(ch, int(math.ceil(max(p0[1], p1[1], p2[1], p3[1]))) + 1)
        bw, bh = x1 - x0, y1 - y0
        if bw <= 0 or bh <= 0:
            continue
        coeffs = aff_mul(m_inv, (1.0, 0.0, float(x0), 0.0, 1.0, float(y0)))
        warped = sprite.transform((bw, bh), Image.Transform.AFFINE, coeffs, resample=Image.Resampling.BILINEAR)
        yield (x0, y0, x1, y1, warped, sr, sg, sb, sa_slot, slot.get("blend") or "normal")

def draw_skeleton_on_canvas_np(canvas_pm, view_aff, skeleton, anim_name: str, t: float, region_imgs):
    ch, cw = canvas_pm.shape[:2]
    for (x0, y0, x1, y1, warped, sr, sg, sb, sa_slot, blend) in _iter_warped_slots(cw, ch, view_aff, skeleton, anim_name, t, region_imgs):
        src = np.asarray(warped, dtype=np.float32) * (1.0 / 255.0)
        src_a = src[:, :, 3:4]
        if sa_slot < 0.996:
            src_a = src_a * float(sa_slot)
        if not np.any(src_a > 1e-4):
            continue
        src_rgb = src[:, :, :3]
        if sr < 248 or sg < 248 or sb < 248:
            src_rgb = src_rgb * np.array([sr / 255.0, sg / 255.0, sb / 255.0], dtype=np.float32)
        src_pm = src_rgb * src_a
        dst = canvas_pm[y0:y1, x0:x1]
        dst_pm = dst[:, :, :3]
        dst_a = dst[:, :, 3:4]
        if blend == "additive":
            dst[:, :, :3] = np.minimum(1.0, dst_pm + src_pm)
            dst[:, :, 3:4] = np.minimum(1.0, dst_a + src_a)
        elif blend == "multiply":
            d_rgb = np.divide(dst_pm, np.maximum(dst_a, 1e-6))
            dst[:, :, :3] = src_pm * (1.0 - dst_a) + dst_pm * (1.0 - src_a) + (src_a * dst_a) * (d_rgb * src_rgb)
            dst[:, :, 3:4] = src_a + dst_a * (1.0 - src_a)
        elif blend == "screen":
            d_rgb = np.divide(dst_pm, np.maximum(dst_a, 1e-6))
            dst[:, :, :3] = src_pm * (1.0 - dst_a) + dst_pm * (1.0 - src_a) + (src_a * dst_a) * (d_rgb + src_rgb - d_rgb * src_rgb)
            dst[:, :, 3:4] = src_a + dst_a * (1.0 - src_a)
        else:
            inv_sa = 1.0 - src_a
            dst[:, :, :3] = src_pm + dst_pm * inv_sa
            dst[:, :, 3:4] = src_a + dst_a * inv_sa

def _unpremult_channel_pil(ch_img: Image.Image, a_img: Image.Image) -> Image.Image:
    if a_img.getextrema() == (255, 255):
        return ch_img
    ch_b = ch_img.tobytes()
    a_b = a_img.tobytes()
    lut = _UNPREMULT_LUT
    out_b = bytes(lut[a][c] for c, a in zip(ch_b, a_b))
    return Image.frombytes("L", ch_img.size, out_b)

def draw_skeleton_on_canvas_pil(canvas_img: Image.Image, view_aff, skeleton, anim_name: str, t: float, region_imgs):
    cw, ch = canvas_img.size
    for (x0, y0, x1, y1, warped, sr, sg, sb, sa_slot, blend) in _iter_warped_slots(cw, ch, view_aff, skeleton, anim_name, t, region_imgs):
        need_tint = (sr < 248 or sg < 248 or sb < 248)
        need_alpha = (sa_slot < 0.996)
        if need_tint or need_alpha:
            r_ch, g_ch, b_ch, a_ch = warped.split()
            if need_alpha:
                a_ch = a_ch.point([min(255, int(round(i * sa_slot))) for i in range(256)])
            if a_ch.getbbox() is None:
                continue
            if sr < 248:
                r_ch = r_ch.point([int(round(i * sr / 255.0)) for i in range(256)])
            if sg < 248:
                g_ch = g_ch.point([int(round(i * sg / 255.0)) for i in range(256)])
            if sb < 248:
                b_ch = b_ch.point([int(round(i * sb / 255.0)) for i in range(256)])
            src_img = Image.merge("RGBA", (r_ch, g_ch, b_ch, a_ch))
        else:
            if warped.getchannel("A").getbbox() is None:
                continue
            src_img = warped
        dst_roi = canvas_img.crop((x0, y0, x1, y1))
        if blend == "additive":
            dr, dg, db, da = dst_roi.split()
            sr_c, sg_c, sb_c, sa_c = src_img.split()
            out_r_p = ImageChops.add(ImageChops.multiply(dr, da), ImageChops.multiply(sr_c, sa_c))
            out_g_p = ImageChops.add(ImageChops.multiply(dg, da), ImageChops.multiply(sg_c, sa_c))
            out_b_p = ImageChops.add(ImageChops.multiply(db, da), ImageChops.multiply(sb_c, sa_c))
            out_a = ImageChops.add(da, sa_c)
            blended = Image.merge("RGBA", (
                _unpremult_channel_pil(out_r_p, out_a),
                _unpremult_channel_pil(out_g_p, out_a),
                _unpremult_channel_pil(out_b_p, out_a),
                out_a,
            ))
        elif blend == "multiply" or blend == "screen":
            da = dst_roi.getchannel("A")
            sa_c = src_img.getchannel("A")
            dst_rgb = dst_roi.convert("RGB")
            src_rgb = src_img.convert("RGB")
            mix_rgb = ImageChops.multiply(dst_rgb, src_rgb) if blend == "multiply" else ImageChops.screen(dst_rgb, src_rgb)
            eff_rgb = Image.composite(mix_rgb, src_rgb, da)
            er, eg, eb = eff_rgb.split()
            blended = Image.alpha_composite(dst_roi, Image.merge("RGBA", (er, eg, eb, sa_c)))
        else:
            blended = Image.alpha_composite(dst_roi, src_img)
        canvas_img.paste(blended, (x0, y0))

def render_spine_frame_pil(cw: int, ch: int, skeleton, anim_name: str, t: float, region_imgs, bounds, layers, fill_ratio: float = 0.86, max_scale: float = 4.0) -> Image.Image:
    fit_scale = min((cw * fill_ratio) / bounds["width"], (ch * fill_ratio) / bounds["height"])
    eff_scale = min(max_scale, max(0.05, fit_scale))
    anchor_x = cw / 2.0 - bounds["centerX"] * eff_scale
    anchor_y = ch / 2.0 + bounds["centerY"] * eff_scale
    view_aff = (eff_scale, 0.0, anchor_x, 0.0, -eff_scale, anchor_y)
    if np is not None:
        canvas_pm = np.zeros((ch, cw, 4), dtype=np.float32)
        def draw_layer_np(layer):
            if t < layer["startTime"]:
                return
            elapsed = t - layer["startTime"]
            if not layer["loop"] and elapsed > layer["duration"]:
                return
            lt = (elapsed % layer["duration"]) if (layer["loop"] and layer["duration"] > 0) else elapsed
            draw_skeleton_on_canvas_np(canvas_pm, view_aff, layer["skeleton"], layer["animName"], lt, layer["regionImgs"])
        for layer in layers:
            if layer["layer"] == "behind":
                draw_layer_np(layer)
        draw_skeleton_on_canvas_np(canvas_pm, view_aff, skeleton, anim_name, t, region_imgs)
        for layer in layers:
            if layer["layer"] == "front":
                draw_layer_np(layer)
        alpha = np.clip(canvas_pm[:, :, 3:4], 0.0, 1.0)
        rgb = np.where(alpha > 1e-5, np.clip(canvas_pm[:, :, :3] / np.maximum(alpha, 1e-5), 0.0, 1.0), 0.0)
        rgba = np.concatenate([rgb, alpha], axis=2)
        return Image.fromarray(np.rint(rgba * 255.0).astype(np.uint8), mode="RGBA")
    canvas_img = Image.new("RGBA", (cw, ch), (0, 0, 0, 0))
    def draw_layer_pil(layer):
        if t < layer["startTime"]:
            return
        elapsed = t - layer["startTime"]
        if not layer["loop"] and elapsed > layer["duration"]:
            return
        lt = (elapsed % layer["duration"]) if (layer["loop"] and layer["duration"] > 0) else elapsed
        draw_skeleton_on_canvas_pil(canvas_img, view_aff, layer["skeleton"], layer["animName"], lt, layer["regionImgs"])
    for layer in layers:
        if layer["layer"] == "behind":
            draw_layer_pil(layer)
    draw_skeleton_on_canvas_pil(canvas_img, view_aff, skeleton, anim_name, t, region_imgs)
    for layer in layers:
        if layer["layer"] == "front":
            draw_layer_pil(layer)
    return canvas_img

