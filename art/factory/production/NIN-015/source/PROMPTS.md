# ART V4 FAST prompt record — NIN-015 Tenten (teen)

Provider: OpenAI imagegen; model, seed, creation timestamps and spend are not exposed by the image tool. Source generation count: 7 (one two-view master and six atlases). The raw generated master is preserved as `model_generated_raw.png`; `model.png` is its Python alpha-thresholded game asset.

## Identity/style lock

Master prompt used the direct Tenten canon image in `canon_reference.json`, the database-form sprite `identity_reference.png`, and the approved Shikamaru sheet only for pixel linework, eye technique, shading and detail density. It specified two independently drawn SE/SW full-body views; dark brown twin buns, short fringe, Leaf forehead protector, warm brown eyes, cream wrap tunic with muted red ties, navy cropped pants, sandals and a weapon scroll. Shikamaru's face, body and outfit were excluded. The result was screened at 96x112 and locked.

All six atlas prompts reused the same direct canon image, database sprite, locked `model.png`, action-specific guide and Shikamaru style-only image. Each atlas specified two independent directions with no mirroring, the same Tenten identity/outfit, transparent background, full silhouettes and no labels, borders, shadows, extra characters or scenery.

## Action notes

- `idle`: 2 x 6, breathing/weight shift through ready, inhale, rise, peak, exhale, settle.
- `move`: 2 x 8 run cycle through left/right foot contacts, compression, knee drive and airborne strides; engine key remains `move`.
- `attack`: 2 x 6 ready through recovery; one consistent kunai slash, no VFX.
- `cast`: 2 x 6 ready, hands rise, two hand seals, seal finish, recover; no VFX.
- `hit`: 2 x 4 impact, recoil, stagger, recover; no blood or injury detail.
- `fall`: 2 x 4 balance loss, knees buckle, ground contact and down; horizontal poses retain full silhouette and may overhang nominal cells for variable-width extraction.

Runtime contract: 12 directional clips / 68 authored cels. No rig, tween, mirroring, interpolation or synthetic frames.
