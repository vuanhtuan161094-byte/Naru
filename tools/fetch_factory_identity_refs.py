#!/usr/bin/env python3
"""Fetch one temporary Naruto-canon identity reference per V4 roster ID.

Downloaded reference images stay outside the checkout. A source URL, form note,
hash and temp path are recorded beside each production kit for provenance.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import time
import urllib.parse
import urllib.request
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
ROSTER = ROOT / "data/ninjas.json"
PRODUCTION = ROOT / "art/factory/production"
ALIASES = {
    "NIN-005": "Iruka", "NIN-006": "Konohamaru", "NIN-007": "Shikamaru",
    "NIN-008": "Chouji Akimichi", "NIN-009": "Ino Yamanaka", "NIN-010": "Hinata Hyuga",
    "NIN-011": "Kiba Inuzuka", "NIN-012": "Shino Aburame", "NIN-013": "Neji Hyuga",
    "NIN-014": "Rock Lee", "NIN-015": "Tenten", "NIN-016": "Maito Gai",
    "NIN-017": "Asuma Sarutobi", "NIN-018": "Yuuhi Kurenai", "NIN-019": "Hiruzen Sarutobi",
    "NIN-020": "Jiraiya", "NIN-021": "Tsunade", "NIN-022": "Orochimaru",
    "NIN-023": "Kabuto Yakushi", "NIN-024": "Gaara", "NIN-025": "Temari",
    "NIN-026": "Kankurou", "NIN-027": "Zabuza Momochi", "NIN-028": "Haku",
}


def get(url: str, accept: str = "*/*") -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0 (compatible; Naru V4 private art reference lookup)", "Accept": accept})
    with urllib.request.urlopen(req, timeout=25) as response:
        return response.read()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("ids", nargs="+", help="NIN roster IDs")
    parser.add_argument("--temp-root", type=Path, default=Path("/tmp/naru-identity-refs"))
    args = parser.parse_args()
    roster = {n["id"]: n for n in json.loads(ROSTER.read_text(encoding="utf-8"))}
    args.temp_root.mkdir(parents=True, exist_ok=True)
    for character_id in args.ids:
        if character_id not in ALIASES or character_id not in roster:
            raise SystemExit(f"unsupported roster ID: {character_id}")
        query = ALIASES[character_id]
        endpoint = "https://myanimelist.net/search/prefix.json?type=character&keyword=" + urllib.parse.quote(query) + "&v=1"
        response = json.loads(get(endpoint, "application/json").decode("utf-8"))
        items = response.get("categories", [{}])[0].get("items", [])
        naruto_items = [item for item in items if any("naruto" in work.lower() for work in item.get("payload", {}).get("related_works", []))]
        if not naruto_items:
            raise SystemExit(f"no Naruto-associated source result for {character_id} ({query})")
        item = naruto_items[0]
        image_url = item.get("image_url", "")
        if not image_url.startswith("https://cdn.myanimelist.net/images/characters/") or "questionmark" in image_url:
            raise SystemExit(f"no usable Naruto character reference for {character_id}: {image_url}")
        raw = get(image_url)
        suffix = ".png" if image_url.lower().split("?")[0].endswith(".png") else ".jpg"
        image_path = args.temp_root / f"{character_id}{suffix}"
        image_path.write_bytes(raw)
        im = Image.open(image_path)
        im.verify()
        source = roster[character_id]
        record = {
            "character_id": character_id,
            "name": source["name_vi"],
            "era": source["era"],
            "form": "base roster form; use the local database sprite as the exact outfit/age anchor",
            "reference_role": "Naruto-associated character image for face, eye, hair and accessories; it does not override the database era/form sprite",
            "provider": "MyAnimeList character index (Naruto-associated entry)",
            "source_page": item.get("url"),
            "source_image_url": image_url,
            "sha256": hashlib.sha256(raw).hexdigest(),
            "dimensions_px": list(Image.open(image_path).size),
            "temporary_image_path": str(image_path),
            "storage": "Reference image remains in /tmp and is not bundled into public/game assets",
        }
        out_path = PRODUCTION / character_id / "source/canon_reference.json"
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(json.dumps(record, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(f"REFERENCE_READY {character_id} {record['source_page']} {record['dimensions_px']} {record['sha256']}", flush=True)
        time.sleep(0.3)


if __name__ == "__main__":
    main()
