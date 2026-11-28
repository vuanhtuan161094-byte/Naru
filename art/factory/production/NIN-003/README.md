# NIN-003 Sakura Haruno — ART R16 / V4

Production kit for Sakura Haruno (teen, Naruto Part I). The runtime overlay contains 2 front three-quarter views, 12 clips, 68 cels and one static sprite. V3 assets and protected characters are untouched.

## Deliverables

- `source/`: original generated model/action atlases and motion guides.
- `native/`: locked SE/SW model anchors and unscaled extracted cels.
- `runtime/NIN-003.json`: importable review overlay with exact V4 metadata.
- `runtime/animation/NIN-003/`: 96×112 PNG strips plus individual runtime cels.
- `runtime/characters/NIN-003.png`: 96×112 static SE sprite.
- `previews/`: 12 GIFs, a 96×112 contact sheet and Godot runtime evidence.
- `ledger.json`: per-ID provenance, hashes, counts and independent acceptance states.

Rebuild runtime assets from the preserved source atlases with:

```sh
python3 tools/build_factory_v4_kit.py art/factory/production/NIN-003
python3 tools/validate_factory_overlay.py art/factory/production/NIN-003/runtime/NIN-003.json --revision v4 --out art/factory/production/NIN-003/runtime/validation.json
```

The Move R3 width/center warnings are advisory and reflect the authored walk stride. Visual review was performed from the combined 96×112 contact sheet. The registry currently marks Sakura's canon source as unverified; art is `SOURCE_REVIEW`, not canon-verified or owner-accepted.
