# NIN-003 Godot runtime evidence

Date: 2026-11-28 UTC. Engine: Godot 4.7.2.stable.official.ed1daf0bf.

- V4 importer smoke passed with the current variable-width Fall pack: 13 assets, 12 clips, 68 cels; one complete kit.
- Actual `draw_actor` calls exercised NE→SE and NW→SW presentation mapping.
- Actual `Main.tscn` 6v6 no-reward review passed after the current pack build: 12 actors and 52 authored Sakura animation draws across the recorded idle/move clips.
- `tools/validate_factory_overlay.py --revision v4` reports technical PASS. Move center-span warnings (6 px SE / 7 px SW) are advisory and accepted at 96×112.

No screenshot/video is included or claimed: Godot ran with the headless dummy renderer and `Viewport.get_texture()` returned null.
