# ART V4 FAST source prompt record — NIN-013 Neji Hyuga (teen)

Provider: OpenAI imagegen; model and seed are not exposed. Source generation count: 7 (one dual-view master and six action-atlas renders). `model.png` is the locked master derived from the preserved `model_generated_raw.png` with Python alpha cleanup.

## Identity and style lock

The model render used the direct canon image recorded in `canon_reference.json` together with `identity_reference.png` to preserve Neji’s teen roster era and cream outfit. The approved Shikamaru master at `art/factory/production/NIN-007/source/model.png` was used only for linework, eye rendering, pixel shading, and detail density; Neji’s body, face, clothing, and expression were authored from Neji references. The sample was screened at 96×112 and locked for production.

## Action render template

Each action atlas used the locked `model.png`, the same direct canon image, the roster `identity_reference.png`, `guides/<action>_motion_guide.png`, and Shikamaru style reference only. Generate two independently authored directions (SE then SW), not a mirrored view; preserve Neji’s pale Byakugan eyes, long dark hair, headband and teen cream tunic. Use the 2-row by action-frame-count atlas layout from `art/factory/CONTRACT.json`, chronological poses, transparent background, no labels, cell lines, shadows, additional characters, scenery, or VFX. Fall may be cropped with variable-width silhouette extraction to recover horizontal overhang.

## Render inventory

- Master: one two-view identity sheet.
- Action atlases: `idle`, `move`, `attack`, `cast`, `hit`, `fall` (six renders).
- Runtime contract: 12 clips / 68 authored cels / two directions. The compatible engine key `move` stores the run animation.
- No rig, tween, mirroring, interpolated or synthetic frames.
