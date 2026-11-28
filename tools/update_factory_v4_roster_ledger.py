#!/usr/bin/env python3
"""Refresh the compact ID-by-ID handoff ledger for the active 24-ninja batch."""
from __future__ import annotations

import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "art/factory/production/BATCH_R16_V4_IDENTITY_LOCK_LEDGER.csv"


def main() -> None:
    roster = json.loads((ROOT / "data/ninjas.json").read_text(encoding="utf-8"))
    selected = [n for n in roster if 5 <= int(n["id"].split("-")[1]) <= 28]
    with OUT.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=["id", "name", "era", "canon_reference", "reference_sha256", "source_renders", "master_canon_used", "master_shikamaru_style", "identity_review_96x112", "visual_review_96x112", "model", "atlas", "pack", "runtime", "owner", "note"], lineterminator="\n")
        writer.writeheader()
        for ninja in selected:
            cid = ninja["id"]
            source = ROOT / "art/factory/production" / cid / "source"
            production_path = source / "production.json"
            production = json.loads(production_path.read_text(encoding="utf-8")) if production_path.is_file() else {}
            canon_path = source / "canon_reference.json"
            canon = json.loads(canon_path.read_text(encoding="utf-8")) if canon_path.is_file() else {}
            runtime_path = ROOT / "art/factory/production" / cid / "runtime" / f"{cid}.json"
            validation_path = ROOT / "art/factory/production" / cid / "runtime/validation.json"
            validation = json.loads(validation_path.read_text(encoding="utf-8")) if validation_path.is_file() else {}
            usage = production.get("identity_reference_usage", {})
            model_path = source / "model.png"
            complete = runtime_path.is_file()
            model_state = "COMPLETE" if complete else ("CORRECTION_BLOCKED" if production.get("identity_correction_required") else ("MODEL_READY" if model_path.is_file() else "RENDER_PENDING_USAGE_HOLD"))
            atlas_state = "12_CLIPS_68_CELS" if complete else "NOT_RENDERED"
            attempts = production.get("actual_source_render_count", 1 if model_path.is_file() else 0)
            note = ""
            identity_review = "NOT_RENDERED"
            visual_review = "NOT_RENDERED"
            if model_path.is_file():
                identity_review = "QUICK_CHECK_OK"
                visual_review = "IDENTITY_SAMPLE_SCREENED"
            if complete:
                visual_review = "ANIMATION_CONTACT_SHEET_SCREENED"
            if cid == "NIN-022":
                identity_review = "CORRECTED_FROM_DIRECT_CANON; MASTER_QUICK_CHECK_OK"
                visual_review = "12_CLIPS_68_CELS_SCREENED_AT_96X112"
                note = "TECHNICAL_PASS; GODOT_RUNTIME_NOT_TESTED"
            elif cid == "NIN-024":
                identity_review = "GOURD_AND_RED_HAIR_READ; LOVE_MARK_NOT_VISIBLE"
                note = "NO_ACTION_ATLASES_PENDING_SIGNATURE_MARK_FIX"
            if production.get("identity_correction_required"):
                if not note:
                    note = "TARGETED_IDENTITY_FIX_PENDING"
            elif cid == "NIN-008" and model_path.is_file() and not complete:
                note = "CHUBBY_FORM_LOCKED; ATLAS_PENDING"
            elif not complete:
                note = "ATLAS_PENDING" if model_path.is_file() else "RENDER_PENDING"
            writer.writerow({
                "id": cid,
                "name": ninja["name_vi"],
                "era": ninja["era"],
                "canon_reference": canon.get("source_page", ""),
                "reference_sha256": canon.get("sha256", ""),
                "source_renders": attempts,
                "master_canon_used": usage.get("master_direct_canon_reference_used", False if model_path.is_file() else "NOT_RENDERED"),
                "master_shikamaru_style": usage.get("master_used_shikamaru_style", False if model_path.is_file() else "NOT_RENDERED"),
                "identity_review_96x112": identity_review,
                "visual_review_96x112": visual_review,
                "model": model_state,
                "atlas": atlas_state,
                "pack": validation.get("technical_status", "PASS" if complete else "PENDING"),
                "runtime": "NOT_TESTED",
                "owner": "PENDING",
                "note": note,
            })
    print(f"UPDATED {OUT.relative_to(ROOT)} ({len(selected)} roster IDs)")


if __name__ == "__main__":
    main()
