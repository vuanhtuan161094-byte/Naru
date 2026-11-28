# ART V4 FAST source prompt record

Profile: `ART_V4_FAST_7R_V1`. Provider: OpenAI imagegen (model and seed not exposed). The image tool did not return creation timestamps or spend estimates.

## Locked identity/model sheet

Create a transparent, two-view pixel-art character sheet for Shikamaru Nara (thiếu niên). Use `identity_reference.png` to lock database identity, face, hair, outfit colors and silhouette; use `art/factory/production/NIN-007/source/model.png` as the direct approved visual reference for linework, eyes, proportions, shading and detail density. Move R3 is a secondary palette/style guide. Draw exactly two independently authored full-body three-quarter views, SE and SW, with matching outfit and scale. Neutral battle-ready pose; complete silhouette; no scenery, labels, extra characters, shadows or VFX.

## Action atlases

For each action, use the locked `model.png`, the matching `guides/<action>_motion_guide.png`, and `art/factory/production/NIN-007/source/model.png` as the direct style reference. Produce one transparent equal-cell grid with two rows and the contract frame count as columns. Top row is independently drawn SE; bottom row is independently drawn SW, never mirrored. Frames run chronologically through the phase names in `art/factory/CONTRACT.json`; preserve the character's model, scale and outfit. Keep full silhouettes in their cells, with no background, labels, cell lines, shadows, other characters or VFX. Fall may use variable-width alpha-run extraction to recover full source silhouettes from the atlas.

## Render inventory

Expected: one master and six action atlases (`idle`, `move`, `attack`, `cast`, `hit`, `fall`), 68 authored cels across 12 clips and two directions. Run is stored under the compatible `move` key. No rig, tween, mirroring, interpolation, synthetic frames, or repeated cosmetic rerendering.

## Existing render history

The master was rendered with its database identity sprite and Move R3 style reference. The six atlases were rendered from this locked master and motion guides, using Shikamaru as the approved style reference after the master was accepted. The later MAL reference lookup was acquired after this kit was complete and was not used to generate these files. No existing source atlases were rerendered.
