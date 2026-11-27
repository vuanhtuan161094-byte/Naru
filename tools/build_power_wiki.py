#!/usr/bin/env python3
"""Build the offline power reference site directly from Naru's source data."""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NEW_STATS = {
    "seal_power", "seal_chance", "seal_duration", "seal_resist", "stun_resist", "bind_resist",
    "silence_resist", "poison_resist", "burn_resist", "freeze_resist", "block_chance",
    "block_efficiency", "block_pen", "damage_reduction_pen", "fire_power", "fire_resist",
    "water_power", "water_resist", "wind_power", "wind_resist", "lightning_power",
    "lightning_resist", "earth_power", "earth_resist", "dot_power", "dot_resist",
    "chakra_lock_pen", "shield_power", "shield_break", "healing_received",
}


def read_json(relative: str):
    return json.loads((ROOT / relative).read_text(encoding="utf-8"))


def indexed(rows, key="id"):
    return {str(row[key]): row for row in rows}


def build_data():
    ninjas = read_json("data/ninjas.json")
    stats = read_json("data/stats.json")
    formulas = indexed(read_json("data/stat_formulas.json"), "stat_id")
    skills = read_json("data/skills.json") + read_json("data/additional_skills.json")
    passives = []
    for path in sorted((ROOT / "data/passive-p1").glob("passives-*.json")):
        passives.extend(json.loads(path.read_text(encoding="utf-8")))
    progression = indexed(read_json("data/skill_progression_policies.json"), "skill_id")
    p2_skills = {}
    for path in sorted((ROOT / "data/skill-p2").glob("SKILL-P2-*.json")):
        for row in json.loads(path.read_text(encoding="utf-8")):
            p2_skills[str(row["skill_id"])] = row
    branch_source = read_json("data/skill-depth-v3/branch-contracts.json")
    branches = branch_source["rows"]
    held_branch_rows = read_json("data/skill-depth-v3/final-holds.json")["branch_holds"]
    branch_holds = {str(row["id"]): row for row in held_branch_rows}
    branch_resolution = {str(row["id"]): row for row in read_json("data/skill-depth-v4/branch-resolution.json")}
    branches = [
        {
            **row,
            "ledger_status": "HOLD" if row["id"] in branch_holds else (
                "HOLD_RUNTIME" if branch_resolution.get(row["id"], {}).get("runtime", "").startswith("HOLD") else "DATA_READY"
            ),
            "hold_record": branch_holds.get(row["id"], {}),
            "runtime_resolution": branch_resolution.get(row["id"], {}),
        }
        for row in branches
    ]
    forms = read_json("data/ninja_forms.json")
    p2_forms = indexed(read_json("data/skill-p2/forms.json"), "form_id")
    combos = read_json("data/combo_skills.json")
    p2_combos = indexed(read_json("data/skill-p2/combos.json"), "id")
    combo_contracts = indexed(read_json("data/skill-depth-v5/combo-contracts.json"), "id")
    gear = read_json("data/equipment_templates.json")
    slots = read_json("data/equipment_slots.json")
    affix_pools = read_json("data/equipment_affix_pools.json")
    affinity_rows = read_json("data/d4/element_affinity.json")

    required = {
        "ninjas": (ninjas, 144),
        "stats": (stats, 78),
        "skills": (skills, 1152),
        "passives": (passives, 864),
        "branches": (branches, 432),
        "forms": (forms, 54),
        "combos": (combos, 12),
        "equipment": (gear, 128),
        "equipment_slots": (slots, 16),
    }
    for label, (rows, expected) in required.items():
        if len(rows) != expected:
            raise ValueError(f"{label}: expected {expected} records, found {len(rows)}")
    if len({str(row["id"]) for row in skills}) != 1152:
        raise ValueError("skill IDs are not unique")
    if len({str(row["id"]) for row in passives}) != 864:
        raise ValueError("passive IDs are not unique")
    if set(formulas) != {str(row["id"]) for row in stats}:
        raise ValueError("stat catalog and formula IDs differ")
    stat_ids = {str(row["id"]) for row in stats}
    affix_ids = {str(stat_id) for pool in affix_pools.values() for stat_id in pool}
    if len(NEW_STATS) != 30 or not NEW_STATS <= stat_ids or not NEW_STATS <= affix_ids:
        raise ValueError("new stat IDs are incomplete in catalog or equipment affix pools")
    element_labels = {str(row["attack"]) for row in affinity_rows} | {str(row["defense"]) for row in affinity_rows}
    if len(element_labels) != 21 or len(affinity_rows) != 441 or len({(row["attack"], row["defense"]) for row in affinity_rows}) != 441:
        raise ValueError("element affinity matrix is not a complete 21 by 21 table")
    ninja_ids = {str(row["id"]) for row in ninjas}
    if len(ninja_ids) != 144:
        raise ValueError("ninja IDs are not unique")
    for ninja in ninjas:
        ninja_id = str(ninja["id"])
        primary = ninja.get("base_stats", {})
        growth = ninja.get("level_growth", {})
        if len(primary) != 6 or set(primary) != set(growth):
            raise ValueError(f"{ninja_id}: expected matching six-stat base and growth profiles")
        if len(ninja.get("skills", [])) != 6 or len(ninja.get("additional_skill_ids", [])) != 2:
            raise ValueError(f"{ninja_id}: expected eight skill slots")
        if not ninja.get("unique_talent_design", {}).get("skill_id"):
            raise ValueError(f"{ninja_id}: missing signature talent skill link")
    for row in stats:
        formula = formulas[str(row["id"])]
        for key in ("formula", "unit", "status", "opposition", "sources", "stacking", "tooltip_vi"):
            if key not in formula or formula[key] is None:
                raise ValueError(f"{row['id']}: missing formula contract field {key}")
        for key in ("name_vi", "unit", "group", "status", "tooltip_vi"):
            if key not in row or row[key] is None:
                raise ValueError(f"{row['id']}: missing catalog field {key}")
    if len(p2_skills) != 1152:
        raise ValueError(f"P2 overlay inventory: expected 1152 IDs, found {len(p2_skills)}")
    if {str(row["id"]) for row in skills} != {str(row["skill_id"]) for rows in p2_skills.values() for row in [rows]}:
        raise ValueError("P2 overlay and skill database IDs differ")
    if len(p2_forms) != 54 or len(p2_combos) != 12:
        raise ValueError("runtime form/combo contract count differs from catalog")

    data = {
        "counts": {label: len(rows) for label, (rows, _expected) in required.items()},
        "ninjas": indexed(ninjas),
        "stats": {str(row["id"]): {"definition": row, "formula": formulas[str(row["id"])]} for row in stats},
        "skills": {
            str(row["id"]): {
                "definition": row,
                "progression": progression.get(str(row["id"]), {}),
                "p2_overlay": p2_skills.get(str(row["id"]), {}),
            }
            for row in skills
        },
        "passives": indexed(passives),
        "branches": indexed(branches),
        "forms": {str(row["id"]): {"definition": row, "runtime_contract": p2_forms.get(str(row["id"]), {})} for row in forms},
        "combos": {
            str(row["id"]): {"definition": row, "runtime_contract": p2_combos.get(str(row["id"]), {}), "event_contract": combo_contracts.get(str(row["id"]), {})}
            for row in combos
        },
        "equipment": indexed(gear),
        "equipment_slots": indexed(slots),
        "element_labels": sorted(element_labels),
        "element_affinity": affinity_rows,
        "new_stat_ids": sorted(NEW_STATS),
        "stat_runtime": read_json("data/stat_formulas.json"),
        "content_notice": "Thiết kế và giá trị chưa được nghiệm thu giữ nguyên trạng thái PROPOSED/DEV/HOLD trong dữ liệu nguồn. Wiki này không biến DATA_READY thành RUNTIME_PASS.",
    }
    return data


PAGE = r'''<!doctype html>
<html lang="vi"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="theme-color" content="#171b21"><title>Naru • Sổ tay sức mạnh</title>
<style>
:root{color-scheme:dark;--bg:#12161b;--panel:#1c232b;--line:#35414c;--ink:#edf2f6;--muted:#aeb9c3;--gold:#edc579;--blue:#94c9e8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font:15px/1.5 system-ui,sans-serif}header{padding:22px 4vw;border-bottom:1px solid var(--line);background:#171b21}h1{margin:0 0 4px;font-size:25px}header p{margin:0;color:var(--muted)}.counts{display:flex;flex-wrap:wrap;gap:8px;margin-top:15px}.pill{border:1px solid var(--line);border-radius:20px;padding:3px 10px;color:var(--gold);font-size:13px}
main{display:grid;grid-template-columns:minmax(250px,34%) 1fr;gap:16px;padding:16px 4vw;min-height:75vh}.panel{background:var(--panel);border:1px solid var(--line);border-radius:9px;overflow:hidden}.controls{display:flex;gap:8px;padding:12px;border-bottom:1px solid var(--line)}input,select{min-width:0;background:#101419;border:1px solid var(--line);border-radius:5px;color:var(--ink);padding:9px}input{flex:1}#results{max-height:72vh;overflow:auto}.item{width:100%;text-align:left;padding:9px 12px;border:0;border-bottom:1px solid #303941;background:transparent;color:var(--ink);cursor:pointer}.item:hover,.item.active{background:#293540}.item b{display:block;color:var(--blue);font-size:14px}.item small{color:var(--muted)}.empty{padding:14px;color:var(--muted)}#detail{padding:18px;max-height:80vh;overflow:auto}#detail h2{margin:0 0 8px;color:var(--gold);font-size:21px}#detail pre{white-space:pre-wrap;overflow-wrap:anywhere;background:#11161b;border:1px solid var(--line);border-radius:6px;padding:13px;font:13px/1.5 ui-monospace,monospace}footer{padding:12px 4vw;color:var(--muted);font-size:13px;border-top:1px solid var(--line)}@media(max-width:760px){main{grid-template-columns:1fr}#results{max-height:35vh}#detail{max-height:none}}
</style></head><body><header><h1>NARU RPG · Sổ tay sức mạnh</h1><p>Tra cứu theo database dùng chung: hồ sơ ninja, công thức, nhẫn thuật, nội tại, nhánh, hình thái, combo và trang bị.</p><div id="counts" class="counts"></div></header>
<main><section class="panel"><div class="controls"><input id="query" type="search" placeholder="Tìm theo tên hoặc ID…"><select id="kind"><option value="all">Tất cả</option><option value="ninjas">Ninja</option><option value="stats">Thuộc tính</option><option value="skills">Nhẫn thuật</option><option value="passives">Nội tại</option><option value="branches">Nhánh tiến hóa</option><option value="forms">Hình thái</option><option value="combos">Combo</option><option value="equipment">Trang bị</option><option value="equipment_slots">Vị trí</option></select></div><div id="results" aria-live="polite"></div></section><article id="detail" class="panel"><h2>Chọn một mục</h2><p>Dữ liệu và trạng thái nghiệm thu được hiển thị theo hồ sơ nguồn.</p></article></main>
<footer id="notice"></footer><script>
const categories=["ninjas","stats","skills","passives","branches","forms","combos","equipment","equipment_slots"];
const titleFor=(kind,row)=>kind==="stats"?row.definition.name_vi:kind==="skills"?row.definition.name_vi:kind==="forms"?row.definition.name_vi:kind==="combos"?row.definition.name_vi:kind==="equipment_slots"?row.name_vi:row.name_vi||row.label||row.id;
let DATA=null,ENTRIES=[],selected="";
function detailFor(kind,id){const row=DATA[kind][id];if(!row)return{};if(kind==="ninjas"){return {profile:row,skills:(row.skills||[]).concat(row.additional_skill_ids||[]).map(x=>DATA.skills[x]).filter(Boolean),passives:Object.values(DATA.passives).filter(x=>x.ninja_id===id),forms:(row.form_ids||[]).map(x=>DATA.forms[x]).filter(Boolean)}}return row}
function drawDetail(entry){selected=entry.kind+":"+entry.id;const article=document.getElementById("detail");article.replaceChildren();const h=document.createElement("h2");h.textContent=titleFor(entry.kind,DATA[entry.kind][entry.id])||entry.id;article.appendChild(h);const p=document.createElement("p");p.textContent=entry.kind+" · "+entry.id;article.appendChild(p);const pre=document.createElement("pre");pre.textContent=JSON.stringify(detailFor(entry.kind,entry.id),null,2);article.appendChild(pre);filter()}
function filter(){if(!DATA)return;const q=document.getElementById("query").value.trim().toLocaleLowerCase("vi"),kind=document.getElementById("kind").value;const found=ENTRIES.filter(x=>(kind==="all"||x.kind===kind)&&(!q||x.search.includes(q)));const root=document.getElementById("results");root.replaceChildren();for(const row of found.slice(0,180)){const b=document.createElement("button");b.className="item"+(selected===row.kind+":"+row.id?" active":"");b.onclick=()=>drawDetail(row);const title=document.createElement("b");title.textContent=row.title;const small=document.createElement("small");small.textContent=row.id+" · "+row.summary;b.append(title,small);root.appendChild(b)}if(!found.length){const e=document.createElement("div");e.className="empty";e.textContent="Không tìm thấy mục phù hợp.";root.appendChild(e)}else if(found.length>180){const e=document.createElement("div");e.className="empty";e.textContent="Đang hiển thị 180 mục đầu trong "+found.length+" kết quả. Hãy thu hẹp từ khóa.";root.appendChild(e)}}
fetch("./data.json").then(r=>{if(!r.ok)throw Error("HTTP "+r.status);return r.json()}).then(data=>{DATA=data;for(const kind of categories){for(const [id,row] of Object.entries(data[kind])){const title=String(titleFor(kind,row)||id);ENTRIES.push({kind,id,title,summary:String(row.era||row.role_hint||row.status||row.ledger_status||row.group||""),search:(id+" "+title+" "+JSON.stringify(row)).toLocaleLowerCase("vi")})}}ENTRIES.sort((a,b)=>a.kind.localeCompare(b.kind)||a.id.localeCompare(b.id));const counts=document.getElementById("counts");for(const [key,value] of Object.entries(data.counts)){const span=document.createElement("span");span.className="pill";span.textContent=key+": "+value;counts.appendChild(span)}document.getElementById("notice").textContent=data.content_notice;document.getElementById("query").oninput=filter;document.getElementById("kind").onchange=filter;filter()}).catch(e=>{document.getElementById("results").textContent="Không nạp được data.json: "+e.message+" · chạy python3 -m http.server trong thư mục Wiki."});
</script></body></html>'''


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=ROOT / "wiki/power")
    parser.add_argument("--check", action="store_true", help="validate source ledger without writing files")
    args = parser.parse_args()
    try:
        data = build_data()
    except (KeyError, ValueError, json.JSONDecodeError) as exc:
        print(f"POWER_WIKI_FAIL {exc}", file=sys.stderr)
        return 1
    if args.check:
        print("POWER_WIKI_SOURCE_OK " + json.dumps(data["counts"], ensure_ascii=False, sort_keys=True))
        return 0
    args.output.mkdir(parents=True, exist_ok=True)
    encoded = json.dumps(data, ensure_ascii=False, separators=(",", ":")).replace("</", "<\\/")
    (args.output / "data.json").write_text(encoded + "\n", encoding="utf-8")
    (args.output / "index.html").write_text(PAGE, encoding="utf-8")
    (args.output / "README.txt").write_text(
        "Naru Power Wiki, generated from the project's JSON databases.\n"
        "Serve this directory with: python3 -m http.server 8000\n"
        "Open http://localhost:8000/index.html; do not open via file://.\n"
        "This is a local player reference. It does not change public Pages.\n",
        encoding="utf-8",
    )
    print(f"POWER_WIKI_BUILT {args.output} records={sum(data['counts'].values())}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
