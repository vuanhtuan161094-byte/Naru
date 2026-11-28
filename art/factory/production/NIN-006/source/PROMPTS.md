# ART V4 FAST source prompt record

Profile: `ART_V4_FAST_IDENTITY_LOCK_V2`. Provider: OpenAI imagegen (model and seed not exposed). The image tool did not return creation timestamps or spend estimates.

## Locked identity/model sheet

Create a transparent, two-view pixel-art character sheet for Konohamaru (thiếu niên). Use the Naruto-associated canon image recorded in `canon_reference.json` directly for face, eyes, hair and signature accessories. Use `identity_reference.png` (or `identity_traits.txt`) to lock this database roster's era, form and outfit. Use `art/factory/production/NIN-007/source/model.png` only for linework, eye-rendering technique, pixel shading and detail density; never borrow Shikamaru's face, body or costume. Move R3 is secondary palette guidance. Draw exactly two independently authored full-body three-quarter views, SE and SW, with matching outfit and scale. Neutral battle-ready pose; complete silhouette; no scenery, labels, extra characters, shadows or VFX.

The current master predates direct canon-image conditioning; the canon image is acquired for the next action-atlas prompts and any specifically required identity correction.

The current master used the approved Shikamaru rendering style.

## Action atlases

For each action, use the locked `model.png`, the same canon image, the database form reference and `guides/<action>_motion_guide.png`. Use `art/factory/production/NIN-007/source/model.png` only for style, never for character face or build. Produce one transparent equal-cell grid with two rows and the contract frame count as columns. Top row is independently drawn SE; bottom row is independently drawn SW, never mirrored. Frames run chronologically through the phase names in `art/factory/CONTRACT.json`; preserve the character's model, scale and outfit. Keep full silhouettes in their cells, with no background, labels, cell lines, shadows, other characters or VFX. Fall may use variable-width alpha-run extraction to recover full source silhouettes from the atlas.

## Render inventory

Expected: one master and six action atlases (`idle`, `move`, `attack`, `cast`, `hit`, `fall`), 68 authored cels across 12 clips and two directions. Run is stored under the compatible `move` key. No rig, tween, mirroring, interpolation, synthetic frames, or repeated cosmetic rerendering.
