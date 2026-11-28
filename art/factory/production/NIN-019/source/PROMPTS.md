# ART V4 FAST prompt record — NIN-019 Hiruzen Sarutobi

Provider: OpenAI imagegen; model, seed, creation timestamp and spend are not exposed. Source render count: 7 (one two-view master and six action atlases). Raw master is retained as `model_generated_raw.png`; `model.png` is the alpha-thresholded game master.

## Identity and style

The master prompt used this character's direct canon image recorded in `canon_reference.json`, the database sprite `identity_reference.png` to lock roster form and outfit, and the approved Shikamaru master only for linework, eye rendering, pixel shading and detail density. It explicitly excluded copying Shikamaru's face, body or clothing. Identity anchors: Elder Hiruzen: wrinkles, gray hair, white facial hair, Hokage hat with red mark, white mantle and dark vest. The two-view sample was screened at 96x112 and locked before action rendering.

## Shared atlas directions

Each action prompt reused the direct canon image, roster sprite, locked master, matching `guides/<action>_motion_guide.png`, and Shikamaru style reference only. Every atlas requested independently authored SE and SW rows, no mirroring, a 2-row grid with the contract frame count, full uncropped silhouette, same model/outfit, transparent background and no labels, borders, ground shadows, scenery, extra characters or VFX. Action-specific motion: Deliberate palm attack and hand seals; age-appropriate motion; hat and mantle remain visible through fall.

- `idle` 2 x 6: ready, inhale, rise, peak, exhale, settle.
- `move` 2 x 8: alternating foot contacts, compression, knee drive and airborne stride; key remains `move`.
- `attack` 2 x 6: ready, anticipation, windup, strike, follow-through, recover; signature gear only, no VFX.
- `cast` 2 x 6: ready, raise hands, two seals, finish, recover; no VFX.
- `hit` 2 x 4: impact, recoil, stagger, recover; non-graphic.
- `fall` 2 x 4: balance loss, buckle, ground contact, prone; horizontal poses retain full silhouette and may overhang nominal cells for variable-width alpha extraction.

Runtime contract: 12 directional clips / 68 authored cels. No rig, tween, mirror, interpolation or synthetic frame.
