# ART V4 FAST source prompt record

Profile: `ART_V4_FAST_IDENTITY_LOCK_V2`. Provider: OpenAI imagegen (model, seed, and provider timestamps are not exposed). The original master was owner-rejected and preserved as `model_attempt1_rejected.png`; no atlas uses it. One correction request was blocked by HTTP 429 before producing an image. The corrected master and six atlases below are generated outputs.

## Corrected master prompt

Create ONE production-ready Naruto game character master sheet for Orochimaru, two full-body 3/4 game-facing views side-by-side, SE on the left and SW on the right, each independently drawn (do not mirror one figure), transparent background, no ground/shadow/text/grid. Full figure clear with silhouette; sized for later display at 96 x 112 pixels. Directly follow the attached canon Orochimaru anime still for identity: very pale almost white skin, long narrow mature face, sharp amber-yellow eyes with clear vertical snake-slit pupils, subtle purple eye rims/under-eye marks, long straight black hair framing the face and falling to the shoulders/back, eerie composed Orochimaru expression. Preserve Orochimaru's own lean adult proportions and distinctive identity; do not copy Shikamaru's face, eyes, hair, or body. Keep the canonical early Naruto base outfit anchored by the attached roster sprite: loose pale cream kimono-style top with wide sleeves, deep purple thick rope belt tied around the waist/back, dark trousers and ninja sandals. At the small game scale, make both eyes visibly pale with yellow irises and readable vertical slit pupils; never solid black eyes. Maintain the approved Shikamaru image ONLY as a render-style guide for clean dark outlines, restrained hand-painted anime shading, muted colors, and readable shapes. Do not make a generic chibi or pixel-art figure. Preserve the distinct frontal face traits in both orientations, no props or extra characters.

Reference order: direct anime still (`canon_reference.json` temporary path), database roster sprite (`identity_reference.png`) for form/outfit, Shikamaru master for style only. Corrected master was screened once at 96×112; owner acceptance remains pending.

## Action atlas prompt template

Using the supplied direct Naruto anime still as Orochimaru's canon face/eye/hair identity, and the supplied Orochimaru master as the locked character and outfit, produce ONE transparent V4 action atlas for `{action}`. Keep the same adult lean body, pale skin, long narrow face, straight black hair, gold snake-slit eye, purple eye rim, cream tunic, dark trousers and thick purple rope belt in every cel. The Shikamaru image is STYLE ONLY (dark clean outlines, restrained anime shading and detail density), never face, body, hair or costume. The matching action guide controls the motion. Exact grid: two rows by `{frames}` columns, equal cells, top row independently authored SE direction, bottom row independently authored SW direction; do not mirror. `{phases}` Preserve full unobstructed silhouettes and consistent game scale across all cells. Transparent background; no labels, cell borders, scenery, extra characters, shadows, weapons, or VFX. No interpolation, repeated frames, or synthetic poses.

| Action | Frames per direction | Phase order |
| --- | ---: | --- |
| idle | 6 | ready; inhale; rise; peak; exhale; settle |
| move | 8 | left foot contact; compression; right knee drives forward; airborne stride; right foot contact; compression; left knee drives forward; airborne stride |
| attack | 6 | ready; anticipation; windup; strike; follow-through; recover |
| cast | 6 | ready; hands raise; seal one; seal two; seal finish; recover |
| hit | 4 | impact reaction; recoil; stagger; recover |
| fall | 4 | balance lost; knees buckle; ground contact; down |

## Render accounting

- Requests: 9 total (initial rejected master, one blocked correction request, one corrected master, six action atlases).
- Generated outputs: 8 total (two master images, including the rejected sample, plus six action atlases). The rejected master remains archived; only the corrected master and six atlases are packaged.
- Result: 12 clips / 68 authored cels / 13 runtime assets. No mirror, tween, interpolation, rig, or fabricated frames.
