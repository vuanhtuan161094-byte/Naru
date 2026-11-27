# ART R13 V3 — character-first source production (owner approved 27 Nov 2026)
## Mandatory production sequence
One ninja only. Do not start the next ninja until the prior source kit is reviewed. Preserve approved Minato, Itachi, Nagato, Kakashi originals. Use 4 isolated full-body model views on true alpha: SE (front right), SW (front left), NE (rear right), NW (rear left). Lock costume/era, hair, facial features, proportions, palette, accessory handedness. Use this exact reference throughout the six action atlases. Avoid report language, UI, diagrams, titles, grids with visible borders, or metadata in image requests. Never generate a poster. Budget target 7 source images (model + six actions), not a promise. Stop on wrong output rather than repeatedly retrying.
## V3 source count
| Action | Directions | Cels/direction | Total |
|---|---|---:|---:|
| idle | SE SW | 6 | 12 |
| move | SE SW NE NW | 8 | 32 |
| attack | SE SW | 6 | 12 |
| cast | SE SW | 6 | 12 |
| hit | SE SW | 4 | 8 |
| fall | SE SW | 4 | 8 |
Total 14 clips, 84 independent cels. Cast only hand seals; no baked VFX. No rig, tween, mirror, repeated padding or fabricated directions. Original extra directions retained.
## Extraction and handoff
Check actual file format, not filename. Inspect identity, era, direction and action. Inspect alpha and connected-component counts; expected 4 model components, 12/32/12/12/8/8 action components. Reject intersecting sprites, edge clipping, incorrect direction, wrong character, poster. Extract isolated native-resolution PNGs with padding; do not resize upward. Normalize body size against the locked model, preserve pose height changes; verify foot/pelvis anchors for airborne and fall. Connected components are a technical check, not proof of art quality. Keep original source and native cels. Export preview-resolution sheets and separate runtime derivative at 96x112, anchor 48,104 for current renderer. Generate GIF and contact sheet programmatically from extracted cels; never spend image generation quota on a review board. Record original paths, hashes, counts, timing, visual approval and runtime status. Run Godot before production integration. Do not count source approval as runtime PASS.
## Sasuke checkpoint
Owner approved latest seven source atlases. Local extraction recovered exactly 84 distinct cels/14 clips, 4 model views, native crops, review sheets and legacy runtime derivative. Review archive Sasuke_V3_84_RGBA.zip; runtime not tested and binaries not in repository. Remaining art consistency/anchor review needed, particularly across source atlases. Next source identity NIN-003 Sakura Haruno (Part I). Keep prior archives intact.
