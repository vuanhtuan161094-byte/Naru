#!/usr/bin/env python3
"""Prepare V4 kit identity references and shared motion guides from database IDs."""
from __future__ import annotations

import argparse
import json
import shutil
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ROSTER = ROOT / "data/ninjas.json"
STYLE = ROOT / "assets/production/r14/static_roster.svg"
IRUKA_STYLE = ROOT / "assets/production/r12/iruka.svg"
SHIKAMARU_STYLE = ROOT / "art/factory/production/NIN-007/source/model.png"
GUIDE_ROOT = ROOT / "art/factory/production/NIN-003/source/guides"
OUT_ROOT = ROOT / "art/factory/production"
CANON_REFS = Path("/tmp/naru-identity-refs")
ACTIONS = ("idle", "move", "attack", "cast", "hit", "fall")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("ids", nargs="+", help="database IDs such as NIN-005")
    args = parser.parse_args()
    inkscape = shutil.which("inkscape")
    if not inkscape:
        raise SystemExit("inkscape is required to export identity references from the roster SVG")
    roster = {entry["id"]: entry for entry in json.loads(ROSTER.read_text())}
    for character_id in args.ids:
        if character_id not in roster:
            raise SystemExit(f"unknown database roster ID: {character_id}")
        entry = roster[character_id]
        kit = OUT_ROOT / character_id
        source = kit / "source"
        if (kit / "runtime" / f"{character_id}.json").exists() or (source / "model.png").exists():
            raise SystemExit(f"refusing to replace existing completed/model work: {character_id}")
        (source / "guides").mkdir(parents=True, exist_ok=True)
        for action in ACTIONS:
            shutil.copy2(GUIDE_ROOT / f"{action}_motion_guide.png", source / "guides" / f"{action}_motion_guide.png")
        ref_path = source / "identity_reference.png"
        if character_id == "NIN-005":
            subprocess.run([inkscape, str(IRUKA_STYLE), "--export-background-opacity=0", "--export-width=192", "--export-height=224", f"--export-filename={ref_path}"], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            origin = "assets/production/r12/iruka.svg"
        elif character_id == "NIN-016":
            # This legacy protected roster identity is absent from the static SVG.
            origin = "source/identity_traits.txt"
        else:
            subprocess.run([
                inkscape, str(STYLE), f"--export-id={character_id}", "--export-id-only",
                "--export-background-opacity=0", "--export-width=192", "--export-height=224",
                f"--export-filename={ref_path}",
            ], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            if not ref_path.is_file() or ref_path.stat().st_size == 0:
                raise SystemExit(f"missing database identity artwork for {character_id}; add a textual identity note before rendering")
            origin = f"assets/production/r14/static_roster.svg#{character_id}"
        canon_meta = CANON_REFS / f"{character_id}.json"
        canon = json.loads(canon_meta.read_text(encoding="utf-8")) if canon_meta.is_file() else None
        (source / "identity_traits.txt").write_text(
            f"{entry['name_vi']} — {entry['era']}. The database sprite/text is the exact era/form lock. Use the Naruto-associated canon image for face and signature features. Use {SHIKAMARU_STYLE.relative_to(ROOT)} for linework and rendering style only, never physique, face or costume.\n",
            encoding="utf-8",
        )
        production = {
            "character_id": character_id,
            "identity": {
                "name": entry["name_vi"],
                "era": entry["era"],
                "form": "base",
                "source_status": f"UNVERIFIED; database roster identity reference: {origin}",
            },
            "identity_reference_origin": origin,
            "canon_reference": canon,
            "approved_style_reference": str(SHIKAMARU_STYLE.relative_to(ROOT)),
            "target_source_render_count": 7,
            "owner_visual_acceptance": "PENDING",
        }
        (source / "production.json").write_text(json.dumps(production, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(f"PREPARED {character_id} {entry['name_vi']} {ref_path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
