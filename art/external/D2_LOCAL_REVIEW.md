# D2 local review

Generate on the user's machine from the pinned public source:
```
python -m pip install Pillow==11.3.0
python art/external/devolution_pack.py --out D2-local
```
The directory contains local GIFs by character, normalized core sheets, JSON pack and detailed report. To use a previously downloaded original ZIP, add `--source-zip PATH`.

Run actual Godot 6v6 on your local checkout (first run `python tools/assemble_public_art.py`):
```
godot --path . -- --combat-video --private-capture --d2-pack=D2-local/LOCAL_NINJA_PACK.json
```

Only the right-facing SE screen direction is eligible; other directions and active forms fall back to original Naru art. Source centers are used with one idle-derived ground offset and a shared character scale. The identity map only opts in visually inspected idle identities; era/form uncertain and incomplete candidates remain HOLD. CHARGE is not assumed to be a hand seal. Frame timing is provisional. Public Web remains unchanged. Public CI uploads only reports and logs, not third-party source-derived GIFs, packs or video. No combat engine or save changes.
