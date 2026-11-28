#!/usr/bin/env python3
"""Package one reference-conditioned V4 production atlas into runtime cels/overlay."""
from __future__ import annotations

import argparse
import base64
import hashlib
import json
from pathlib import Path
from statistics import median
from datetime import datetime, timezone
from collections import deque

from PIL import Image, ImageDraw, ImageFont


REPO = Path(__file__).resolve().parents[1]
CONTRACT = REPO / "art/factory/CONTRACT.json"
ALPHA_THRESHOLD = 32
RUNTIME_CELL = (96, 112)
RUNTIME_ANCHOR = (48, 104)
TARGET_NEUTRAL_HEIGHT = 90
SAFE_X = (3, 93)


def sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def bbox_alpha(im: Image.Image):
    alpha = im.getchannel("A").point(lambda a: 255 if a >= ALPHA_THRESHOLD else 0)
    return alpha.getbbox()


def discard_subthreshold_alpha(im: Image.Image) -> Image.Image:
    """Remove only alpha pixels already excluded by the V4 silhouette threshold."""
    rgba = im.convert("RGBA")
    px = rgba.load()
    w, h = rgba.size
    def matte(pixel):
        r, g, b, a = pixel
        return a >= ALPHA_THRESHOLD and min(r, g, b) >= 175 and max(r, g, b) - min(r, g, b) <= 38
    # Some generated atlases have an opaque near-white studio matte despite
    # requesting transparency. Remove only the neutral component connected to
    # the cell border, preserving enclosed whites such as eyes and headbands.
    border = set()
    for x in range(w):
        border.add(x)
        border.add((h - 1) * w + x)
    for y in range(h):
        border.add(y * w)
        border.add(y * w + w - 1)
    queue = deque(i for i in border if matte(px[i % w, i // w]))
    seen = bytearray(w * h)
    for i in queue:
        seen[i] = 1
    while queue:
        i = queue.popleft()
        x, y = i % w, i // w
        px[x, y] = (0, 0, 0, 0)
        for j in (i - 1 if x else -1, i + 1 if x + 1 < w else -1, i - w if y else -1, i + w if y + 1 < h else -1):
            if j >= 0 and not seen[j] and matte(px[j % w, j // w]):
                seen[j] = 1
                queue.append(j)
    alpha = rgba.getchannel("A").point(lambda a: 0 if a < ALPHA_THRESHOLD else a)
    rgba.putalpha(alpha)
    return rgba


def grid_cell(im: Image.Image, row: int, col: int, rows: int, cols: int):
    x0 = round(col * im.width / cols)
    x1 = round((col + 1) * im.width / cols)
    y0 = round(row * im.height / rows)
    y1 = round((row + 1) * im.height / rows)
    return im.crop((x0, y0, x1, y1)), (x0, y0, x1, y1)


def alpha_run_cells(im: Image.Image, row: int, count: int):
    """Recover full row sprites using their alpha silhouettes, allowing Fall to overhang nominal cells."""
    y0 = round(row * im.height / 2)
    y1 = round((row + 1) * im.height / 2)
    row_image = im.crop((0, y0, im.width, y1))
    alpha = row_image.getchannel("A")
    row_height = row_image.height
    # Ignore isolated translucent edge noise while retaining the complete body contour.
    threshold = max(ALPHA_THRESHOLD, 32)
    projection = [0] * row_image.width
    for x in range(row_image.width):
        projection[x] = sum(1 for y in range(row_height) if alpha.getpixel((x, y)) >= threshold)
    occupied = [value >= max(2, round(row_height * 0.01)) for value in projection]
    # Close tiny gaps caused by antialiasing or disconnected pixels within a cel.
    for x in range(1, len(occupied) - 1):
        if not occupied[x] and occupied[x - 1] and occupied[x + 1]:
            occupied[x] = True
    runs = []
    start = None
    for x, active in enumerate(occupied + [False]):
        if active and start is None:
            start = x
        elif not active and start is not None:
            score = sum(projection[start:x])
            runs.append((start, x, score))
            start = None
    if len(runs) > count:
        runs = sorted(sorted(runs, key=lambda run: run[2], reverse=True)[:count], key=lambda run: run[0])
    if len(runs) != count:
        raise SystemExit(f"could not separate all {count} full alpha silhouettes in fall row {row}: found {len(runs)}")

    result = []
    for left, right, _score in runs:
        # Preserve source pixels and a small safety gutter around the silhouette.
        left = max(0, left - 3)
        right = min(im.width, right + 3)
        box = (left, y0, right, y1)
        cell = discard_subthreshold_alpha(im.crop(box))
        bounds = bbox_alpha(cell)
        if not bounds:
            raise SystemExit(f"empty fall silhouette in row {row}")
        margin = min(bounds[0], bounds[1], cell.width - bounds[2], cell.height - bounds[3])
        result.append((cell, box, bounds, margin))
    return result


def crop_with_pad(im: Image.Image, bbox, pad=2):
    l, t, r, b = bbox
    return im.crop((max(0, l - pad), max(0, t - pad), min(im.width, r + pad), min(im.height, b + pad)))


def paste_runtime(source: Image.Image, cell_box, bbox, scale: float) -> Image.Image:
    cell = Image.new("RGBA", RUNTIME_CELL, (0, 0, 0, 0))
    l, t, r, b = bbox
    crop = source.crop(bbox)
    w = max(1, round(crop.width * scale))
    h = max(1, round(crop.height * scale))
    crop = crop.resize((w, h), Image.Resampling.LANCZOS)

    source_cell_center = source.width / 2
    source_bbox_center = (l + r) / 2
    left = round(RUNTIME_ANCHOR[0] + (source_bbox_center - source_cell_center) * scale - w / 2)
    if left < SAFE_X[0]:
        left = SAFE_X[0]
    if left + w > SAFE_X[1]:
        left = SAFE_X[1] - w
    top = RUNTIME_ANCHOR[1] - h
    if top < 2:
        top = 2
    cell.alpha_composite(crop, (left, top))
    return cell


def remove_runtime_specks(im: Image.Image, minimum_component_pixels: int = 80):
    """Drop only detached alpha specks too small to matter at 96x112 game scale."""
    rgba = im.convert("RGBA")
    alpha = rgba.getchannel("A")
    px = alpha.load()
    w, h = rgba.size
    # LANCZOS resampling can restore faint (<32 alpha) source-matte residue after
    # the source cell was cleaned. Apply the same V4 silhouette threshold again
    # after the final 96x112 resize.
    for y in range(h):
        for x in range(w):
            if px[x, y] < ALPHA_THRESHOLD:
                px[x, y] = 0
    seen = bytearray(w * h)
    removed_components = 0
    removed_pixels = 0
    for y in range(h):
        for x in range(w):
            start = y * w + x
            if seen[start] or px[x, y] < ALPHA_THRESHOLD:
                continue
            queue = deque([start])
            seen[start] = 1
            component = []
            while queue:
                i = queue.popleft()
                cx, cy = i % w, i // w
                component.append(i)
                for j in (i - 1 if cx else -1, i + 1 if cx + 1 < w else -1,
                          i - w if cy else -1, i + w if cy + 1 < h else -1):
                    if j >= 0 and not seen[j] and px[j % w, j // w] >= ALPHA_THRESHOLD:
                        seen[j] = 1
                        queue.append(j)
            if len(component) < minimum_component_pixels:
                for i in component:
                    px[i % w, i // w] = 0
                removed_components += 1
                removed_pixels += len(component)
    rgba.putalpha(alpha)
    return rgba, {"removed_components": removed_components, "removed_pixels": removed_pixels}


def gif_frame(im: Image.Image, background=(24, 36, 45)) -> Image.Image:
    bg = Image.new("RGBA", im.size, (*background, 255))
    bg.alpha_composite(im)
    return bg.convert("RGB")


def make_gif(frames, path: Path, durations, looping: bool):
    rgb = [gif_frame(f) for f in frames]
    rgb[0].save(path, save_all=True, append_images=rgb[1:], duration=durations,
                loop=0 if looping else 1, optimize=False, disposal=2)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("kit", type=Path, help="art/factory/production/NIN-xxx directory")
    args = parser.parse_args()
    root = args.kit.resolve()
    if not root.is_dir() or not (root / "source/model.png").is_file():
        raise SystemExit("kit must contain source/model.png")

    contract = json.loads(CONTRACT.read_text())
    previous_ledger_path = root / "ledger.json"
    previous_ledger = json.loads(previous_ledger_path.read_text()) if previous_ledger_path.is_file() else {}
    production_path = root / "source/production.json"
    production = json.loads(production_path.read_text()) if production_path.is_file() else {}
    identity = production.get("identity", {})
    model_path = root / "source/model.png"
    model = Image.open(model_path).convert("RGBA")
    # Two equally sized, independently authored views are placed side by side.
    model_views = {}
    for direction, lo, hi in (("se", 0, model.width // 2), ("sw", model.width // 2, model.width)):
        half = model.crop((lo, 0, hi, model.height))
        bounds = bbox_alpha(half)
        if not bounds:
            raise SystemExit(f"empty canonical model view {direction}")
        view = crop_with_pad(half, bounds, 18)
        view_path = root / f"native/model_{direction}.png"
        view_path.parent.mkdir(parents=True, exist_ok=True)
        view.save(view_path)
        model_views[direction] = {"path": view_path.relative_to(root).as_posix(), "sha256": sha(view_path.read_bytes()), "bounds": list(bounds), "height": bounds[3] - bounds[1]}

    character_id = root.name
    if not character_id.startswith("NIN-") or len(character_id) != 7:
        raise SystemExit("kit directory must be named NIN-xxx")

    runtime_root = root / "runtime"
    native_root = root / "native/cels"
    preview_root = root / "previews"
    for p in (runtime_root / "characters", runtime_root / "animation" / character_id, native_root, preview_root):
        p.mkdir(parents=True, exist_ok=True)

    assets = {}
    clips = {}
    complete_frames = {}
    stats = {}

    # The single neutral SE anchor fixes visible game scale; each source atlas is
    # normalized once per clip, then that same scale is used for every cel in it.
    static_view = model.crop((0, 0, model.width // 2, model.height))
    static_bbox = bbox_alpha(static_view)
    if not static_bbox:
        raise SystemExit("empty SE static view")
    static_crop = crop_with_pad(static_view, static_bbox, 4)
    static_scale = TARGET_NEUTRAL_HEIGHT / (static_bbox[3] - static_bbox[1])
    static = Image.new("RGBA", RUNTIME_CELL, (0, 0, 0, 0))
    sw = round(static_crop.width * static_scale)
    sh = round(static_crop.height * static_scale)
    static_crop = static_crop.resize((sw, sh), Image.Resampling.LANCZOS)
    static.alpha_composite(static_crop, (RUNTIME_ANCHOR[0] - sw // 2, RUNTIME_ANCHOR[1] - sh))
    static_path = runtime_root / "characters" / f"{character_id}.png"
    static.save(static_path)
    raw = static_path.read_bytes()
    static_key = f"characters/{character_id}.png"
    assets[static_key] = {"png": base64.b64encode(raw).decode("ascii"), "width": 96, "height": 112, "sha256": sha(raw)}

    for action, spec in contract["actions"].items():
        count = int(spec["frames"])
        source_path = root / "source" / f"{action}_atlas.png"
        if not source_path.is_file():
            raise SystemExit(f"missing source atlas: {source_path}")
        atlas = Image.open(source_path).convert("RGBA")
        per_direction = {}
        all_bounds = []
        cell_records = []
        for row, direction in enumerate(("se", "sw")):
            if action == "fall":
                row_cells = alpha_run_cells(atlas, row, count)
                extraction_mode = "row_alpha_runs_variable_width"
            else:
                row_cells = []
                extraction_mode = "equal_grid_cells"
                for col in range(count):
                    raw_cell, box = grid_cell(atlas, row, col, 2, count)
                    raw_cell = discard_subthreshold_alpha(raw_cell)
                    bounds = bbox_alpha(raw_cell)
                    if not bounds:
                        raise SystemExit(f"empty cel: {action} {direction} {col}")
                    bw, bh = bounds[2] - bounds[0], bounds[3] - bounds[1]
                    margin = min(bounds[0], bounds[1], raw_cell.width - bounds[2], raw_cell.height - bounds[3])
                    row_cells.append((raw_cell, box, bounds, margin))

            for col, (raw_cell, box, bounds, margin) in enumerate(row_cells):
                bw, bh = bounds[2] - bounds[0], bounds[3] - bounds[1]
                all_bounds.append((direction, col, bw, bh))
                cell_records.append({"direction": direction, "frame": col, "cell_rect": list(box), "alpha_bounds_in_cell": list(bounds), "source_margin_px": margin, "edge_contact": margin == 0, "extraction": extraction_mode})

            heights = [c[2][3] - c[2][1] for c in row_cells]
            widths = [c[2][2] - c[2][0] for c in row_cells]
            # Use the first chronological pose and the widest pose to select one
            # isotropic scale for the complete directional clip.
            scale = TARGET_NEUTRAL_HEIGHT / heights[0]
            scale = min(scale, 88 / max(widths), 104 / max(heights))
            frames = []
            native_dir = native_root / action
            native_dir.mkdir(parents=True, exist_ok=True)
            speck_totals = {"removed_components": 0, "removed_pixels": 0}
            for col, (raw_cell, cell_box, bounds, margin) in enumerate(row_cells):
                native = crop_with_pad(raw_cell, bounds, 2)
                native_path = native_dir / f"{direction}_{col:02d}.png"
                native.save(native_path)
                frame = paste_runtime(raw_cell, cell_box, bounds, scale)
                frame, speck_stats = remove_runtime_specks(frame)
                for key in speck_totals:
                    speck_totals[key] += speck_stats[key]
                frame_path = runtime_root / "animation" / character_id / f"{action}_{direction}_{col:02d}.png"
                frame.save(frame_path)
                frames.append(frame)
            hashes = [sha(frame.tobytes()) for frame in frames]
            if len(set(hashes)) != count:
                raise SystemExit(f"duplicate runtime frame after 96x112 sampling: {action} {direction} ({len(set(hashes))}/{count})")
            strip = Image.new("RGBA", (96 * count, 112), (0, 0, 0, 0))
            for i, frame in enumerate(frames):
                strip.alpha_composite(frame, (96 * i, 0))
            strip_path = runtime_root / "animation" / character_id / f"{action}_{direction}.png"
            strip.save(strip_path)
            raw = strip_path.read_bytes()
            key = f"animation/{character_id}/{action}_{direction}.png"
            assets[key] = {"png": base64.b64encode(raw).decode("ascii"), "width": 96 * count, "height": 112, "sha256": sha(raw)}
            clips[key] = {"anchor": [48, 104], "sha256": sha(raw), "frames": [{"rect": [i * 96, 0, 96, 112], "duration_ms": int(spec["default_ms"])} for i in range(count)]}
            looping = bool(spec["loop"])
            make_gif(frames, preview_root / f"{action}_{direction}.gif", [int(spec["default_ms"])] * count, looping)
            per_direction[direction] = frames
            stats[f"{action}_{direction}"] = {"frames": count, "distinct_runtime_frames": len(set(hashes)), "fixed_source_scale": round(scale, 6), "source_heights": heights, "source_widths": widths, "runtime_speck_filter": speck_totals}
        complete_frames[action] = per_direction
        source_hash = sha(source_path.read_bytes())
        (root / "source" / f"{action}_source.sha256").write_text(source_hash + "\n")
        extraction = "row_alpha_runs_variable_width" if action == "fall" else "equal_grid_cells"
        (root / "source" / f"{action}_cells.json").write_text(json.dumps({"source_sha256": source_hash, "atlas_size": list(atlas.size), "grid": [2, count], "alpha_threshold": ALPHA_THRESHOLD, "extraction": extraction, "cells": cell_records}, indent=2) + "\n")

    pack = {"schema": 1, "revision": "v4", "status": "REVIEW_ONLY", "character_id": character_id, "assets": assets, "clips": clips}
    overlay_path = runtime_root / f"{character_id}.json"
    overlay_path.write_text(json.dumps(pack, ensure_ascii=False, separators=(",", ":")) + "\n")

    # One combined in-game-size sheet for the required lean visual pass.
    label_h, cols = 18, 8
    rows = [(a, d, complete_frames[a][d]) for a in contract["actions"] for d in ("se", "sw")]
    sheet = Image.new("RGBA", (cols * 96, len(rows) * (112 + label_h)), (24, 36, 45, 255))
    draw = ImageDraw.Draw(sheet)
    font = ImageFont.load_default()
    for ri, (action, direction, frames) in enumerate(rows):
        y = ri * (112 + label_h)
        draw.text((4, y + 2), f"{action.upper()}  {direction.upper()}", font=font, fill=(230, 236, 238, 255))
        for i, frame in enumerate(frames):
            bg = Image.new("RGBA", (96, 112), (24, 36, 45, 255))
            bg.alpha_composite(frame)
            sheet.alpha_composite(bg, (i * 96, y + label_h))
    sheet_path = preview_root / "contact_sheet_96x112.png"
    sheet.save(sheet_path)

    # Source and pack ledger; visual/runtime/owner acceptance are independent gates.
    refs = {
        "global_style": "art/factory/production/NIN-007/source/model.png",
        "global_style_sha256": sha((REPO / "art/factory/production/NIN-007/source/model.png").read_bytes()),
        "secondary_style_reference": "art/factory/references/generated/Move_R3_6_Ninja.gif",
        "motion_guides": {},
        "model_sheet_sha256": sha(model_path.read_bytes()),
        "model_views": model_views,
    }
    identity_reference = root / "source/identity_reference.png"
    if identity_reference.is_file():
        refs["identity_reference"] = {"path": identity_reference.relative_to(root).as_posix(), "sha256": sha(identity_reference.read_bytes())}
    canon_reference_path = root / "source/canon_reference.json"
    canon_reference = json.loads(canon_reference_path.read_text()) if canon_reference_path.is_file() else {}
    if canon_reference:
        refs["canon_identity_reference"] = {k: canon_reference.get(k) for k in ("provider", "source_page", "source_image_url", "sha256", "dimensions_px", "era", "form", "reference_role")}
    for action in contract["actions"]:
        guide = root / "source/guides" / f"{action}_motion_guide.png"
        refs["motion_guides"][action] = {"path": guide.relative_to(root).as_posix(), "sha256": sha(guide.read_bytes()), "source_se_sha256": sha((REPO / f"art/factory/references/generated/sasuke_v3/{action}_se.png").read_bytes()), "source_sw_sha256": sha((REPO / f"art/factory/references/generated/sasuke_v3/{action}_sw.png").read_bytes())}
    sources = {}
    generated_source_paths = [model_path]
    generated_source_paths.extend(root / "source" / f"{action}_atlas.png" for action in contract["actions"])
    render_records = {}
    observed_packaging_utc = datetime.now(timezone.utc).isoformat()
    for p in generated_source_paths:
        if not p.is_file():
            continue
        img = Image.open(p)
        action = p.stem.removesuffix("_atlas") if p.name.endswith("_atlas.png") else "model"
        input_map = production.get("render_input_references", {})
        if action in input_map:
            inputs = list(input_map[action])
        else:
            identity_input = "source/identity_reference.png" if identity_reference.is_file() else "source/identity_traits.txt"
            inputs = [identity_input, "source/canon_reference.json:temporary_image_path", "art/factory/production/NIN-007/source/model.png (style only)", "art/factory/references/generated/Move_R3_6_Ninja.gif"]
            if action != "model":
                inputs.insert(1, f"source/guides/{action}_motion_guide.png")
        render_records[p.name] = {
            "provider": "OpenAI imagegen",
            "prompt_version": "ART_V4_FAST_IDENTITY_LOCK_V2",
            "canon_reference_source": canon_reference.get("source_page"),
            "canon_reference_sha256": canon_reference.get("sha256"),
            "prompt_record": "source/PROMPTS.md",
            "input_references": inputs,
            "dimensions_px": list(img.size),
            "sha256": sha(p.read_bytes()),
            "size_bytes": p.stat().st_size,
            "provider_creation_timestamp": None,
            "packaged_observed_utc": observed_packaging_utc,
        }
    previous_attempts = production.get("additional_render_attempts", [])
    actual_render_count = production.get("source_render_requests")
    if actual_render_count is None:
        actual_render_count = len(render_records) + len(previous_attempts)
    production["actual_source_render_count"] = actual_render_count
    production["prompt_version"] = "ART_V4_FAST_IDENTITY_LOCK_V2"
    production["generated_source_records"] = render_records
    production_path.write_text(json.dumps(production, ensure_ascii=False, indent=2) + "\n")
    prompts_path = root / "source/PROMPTS.md"
    if not prompts_path.exists():
        usage = production.get("identity_reference_usage", {})
        if usage.get("master_direct_canon_reference_used"):
            master_reference_note = "The current master was directly conditioned on the recorded canon image and database form sprite; owner acceptance remains pending.\n\n"
        elif model_path.is_file() and canon_reference:
            master_reference_note = "The current master predates direct canon-image conditioning; the canon image is acquired for the next action-atlas prompts and any specifically required identity correction.\n\n"
        else:
            master_reference_note = "Use the recorded canon image directly when rendering the master; the database sprite or text locks this selected era/form.\n\n"
        master_style_note = "The current master used the approved Shikamaru rendering style.\n\n" if usage.get("master_used_shikamaru_style") else "The current master predates the Shikamaru style-lock update; use the Shikamaru sheet only for style in subsequent atlases.\n\n"
        prompts_path.write_text(
            "# ART V4 FAST source prompt record\n\n"
            "Profile: `ART_V4_FAST_IDENTITY_LOCK_V2`. Provider: OpenAI imagegen (model and seed not exposed). "
            "The image tool did not return creation timestamps or spend estimates.\n\n"
            "## Locked identity/model sheet\n\n"
            f"Create a transparent, two-view pixel-art character sheet for {identity.get('name', character_id)}. "
            "Use the Naruto-associated canon image recorded in `canon_reference.json` directly for face, eyes, hair and signature accessories. "
            "Use `identity_reference.png` (or `identity_traits.txt`) to lock this database roster's era, form and outfit. "
            "Use `art/factory/production/NIN-007/source/model.png` only for linework, eye-rendering technique, pixel shading and detail density; never borrow Shikamaru's face, body or costume. "
            "Move R3 is secondary palette guidance. "
            "Draw exactly two independently authored full-body three-quarter views, SE and SW, with matching outfit and scale. "
            "Neutral battle-ready pose; complete silhouette; no scenery, labels, extra characters, shadows or VFX.\n\n"
            + master_reference_note + master_style_note
            + "## Action atlases\n\n"
            "For each action, use the locked `model.png`, the same canon image, the database form reference and `guides/<action>_motion_guide.png`. "
            "Use `art/factory/production/NIN-007/source/model.png` only for style, never for character face or build. "
            "Produce one transparent equal-cell grid with two rows and the contract frame count as columns. "
            "Top row is independently drawn SE; bottom row is independently drawn SW, never mirrored. "
            "Frames run chronologically through the phase names in `art/factory/CONTRACT.json`; preserve the character's model, scale and outfit. "
            "Keep full silhouettes in their cells, with no background, labels, cell lines, shadows, other characters or VFX. "
            "Fall may use variable-width alpha-run extraction to recover full source silhouettes from the atlas.\n\n"
            "## Render inventory\n\n"
            "Expected: one master and six action atlases (`idle`, `move`, `attack`, `cast`, `hit`, `fall`), "
            "68 authored cels across 12 clips and two directions. Run is stored under the compatible `move` key. "
            "No rig, tween, mirroring, interpolation, synthetic frames, or repeated cosmetic rerendering.\n",
            encoding="utf-8",
        )

    for p in sorted((root / "source").glob("*_atlas*.png")):
        sources[p.name] = {"sha256": sha(p.read_bytes()), "size_bytes": p.stat().st_size}
    for p in [model_path, identity_reference]:
        if p.is_file():
            sources[p.name] = {"sha256": sha(p.read_bytes()), "size_bytes": p.stat().st_size}
    previous_sources = previous_ledger.get("source_atlases", {})
    unchanged_sources = bool(previous_sources) and previous_sources == sources
    previous_overlay_hash = previous_ledger.get("overlay", {}).get("sha256", "")
    overlay_hash = sha(overlay_path.read_bytes())
    unchanged_output = unchanged_sources and previous_overlay_hash == overlay_hash
    preserved_statuses = previous_ledger.get("statuses", {}) if unchanged_output else {}
    preserved_qa = previous_ledger.get("qa", {}) if unchanged_output else {}
    validation_path = runtime_root / "validation.json"
    validator_pass = False
    if validation_path.is_file() and unchanged_output:
        try:
            validator_pass = json.loads(validation_path.read_text()).get("technical_status") == "PASS"
        except (ValueError, OSError):
            validator_pass = False
    statuses = {
        "source": preserved_statuses.get("source", "SOURCE_REVIEW"),
        "pack": "PACK_PASS" if validator_pass else preserved_statuses.get("pack", "PACK_PENDING_VALIDATOR"),
        "visual": preserved_statuses.get("visual", "NOT_TESTED"),
        "runtime": preserved_statuses.get("runtime", "NOT_TESTED"),
        "owner": preserved_statuses.get("owner", "PENDING"),
    }
    ledger = {
        "schema": 1, "character_id": character_id, "revision": "V4_FAST_OWNER_LOCKED_2026-11-28",
        "identity": {"name": identity.get("name", character_id), "era": identity.get("era", "unverified"), "form": identity.get("form", "base"), "source_identity_status": identity.get("source_status", "SOURCE_REVIEW")},
        "production": {"provider": "OpenAI imagegen", "model": "not exposed by tool", "seed": None, "transparent_background": True, "prompt_version": production.get("prompt_version", "ART_V4_FAST_7R_V1"), "prompt_record": "source/PROMPTS.md", "target_source_render_count": production.get("target_source_render_count", 7), "actual_source_render_count": actual_render_count, "source_render_records": render_records, "method": "reference-conditioned model and action atlases; no mirror/tween/rig/interpolation", "runtime_normalization": "one fixed isotropic scale per action/direction atlas; calibrated to 90px neutral pose; Fall extracted from variable-width row alpha runs; per-frame crop/placement only"},
        "references": refs, "source_atlases": sources,
        "counts": {"model_views": 2, "animation_clips": len(clips), "cels": sum(int(s["frames"]) * 2 for s in contract["actions"].values()), "runtime_assets": len(assets)},
        "assets": {k: v["sha256"] for k, v in ((k, {"sha256": obj["sha256"]}) for k, obj in assets.items())},
        "metrics_96x112": stats,
        "statuses": statuses, "qa": preserved_qa,
        "blockers": previous_ledger.get("blockers", []) if unchanged_output else [], "overlay": {"path": overlay_path.relative_to(root).as_posix(), "sha256": overlay_hash},
        "contact_sheet": {"path": sheet_path.relative_to(root).as_posix(), "sha256": sha(sheet_path.read_bytes())},
    }
    (root / "ledger.json").write_text(json.dumps(ledger, ensure_ascii=False, indent=2) + "\n")
    print(json.dumps({"character_id": character_id, "assets": len(assets), "clips": len(clips), "cels": ledger["counts"]["cels"], "overlay": str(overlay_path), "contact_sheet": str(sheet_path), "scale_range": [min(v["fixed_source_scale"] for v in stats.values()), max(v["fixed_source_scale"] for v in stats.values())]}, indent=2))


if __name__ == "__main__":
    main()
