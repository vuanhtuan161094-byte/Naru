# ART V4 FAST — NIN-024 Gaara production prompts

Canon reference: `canon_reference.json` (MyAnimeList, Naruto teen/base image; downloaded to `/tmp/naru-identity-refs/NIN-024.jpg`, SHA-256 `d4addbdb4744f0ea928eec46275708a35f566cd7ac68c7a524ce1bbd9a6a97d9`). Roster form/outfit reference: `identity_reference.png`. Style reference: `art/factory/production/NIN-007/source/model.png` (Shikamaru, style only).

## Corrected master prompt

Correct the supplied teen Gaara master. Create one transparent 1536×1024 sheet with two independently authored full-body three-quarter views, SE left and SW right. Use the supplied prior Gaara master only for the two-view layout, teen compact scale, maroon outfit, and large corked tan gourd placement; redesign the face. The direct anime Gaara portrait is the primary identity source. Keep pale skin, short spiky brick-red hair, narrow calm severe face, pale teal-green eyes with visible pupils and dark eye rims, and the crisp red 愛 mark above the eye in both orientations. Follow the roster sprite for the selected age and outfit. Preserve the maroon high-collar tunic, pale sash, dark cropped trousers, sandals, and clearly visible sand gourd strapped to the back. Shikamaru is a style reference only: clean dark hand-drawn outlines, restrained anime shading, clear readable eyes and moderate detail. Do not copy his body or face. At 96×112 the mark remains a distinct small red glyph; no solid black eyes, scenery, floor, shadow, frame grid, labels, effects, extra characters or limbs. Full silhouette, no clipping.

The first correction output was not packaged after the initial data-transfer command exceeded the shell argument limit. The next generated correction was used and its near-white edge-connected matte was removed with a connected-region alpha mask. No source pixels inside the character were redrawn or retouched by the mask. The final master was screened once at 96×112 and locked for atlas production.

## Action atlas prompt template

For each action, use the locked `source/model.png`, direct Gaara canon reference, database roster sprite, matching motion guide, and Shikamaru image for style only. Produce one transparent atlas with exactly two rows and the contract number of equal cells per row. Top row: independently authored SE; bottom row: independently authored SW. Do not mirror, interpolate, repeat, rig or tween frames. Keep Gaara's own teen proportions, pale skin, short spiky red hair, readable pale green eyes, dark eye rims, red 愛 forehead mark, maroon high-collar tunic, pale sash, dark cropped trousers, sandals, and prominent corked tan gourd in every pose. No costume reinterpretation, extra weapons, bystanders, labels, scenery, backgrounds, ground shadows or VFX. Full silhouettes, same character scale, chronological phase order from `art/factory/CONTRACT.json`. On Fall, preserve every complete body silhouette even when it extends horizontally beyond nominal cell width.

| Action | Frames per direction | Phases |
| --- | ---: | --- |
| idle | 6 | ready; inhale; rise; peak; exhale; settle |
| move | 8 | left foot contact; compression; right knee drives forward; airborne stride; right foot contact; compression; left knee drives forward; airborne stride |
| attack | 6 | ready; anticipation; windup; strike; follow-through; recover |
| cast | 6 | ready; hands raise; seal one; seal two; seal finish; recover |
| hit | 4 | impact reaction; recoil; stagger; recover |
| fall | 4 | balance lost; knees buckle; ground contact; down |

## Render accounting

Three master requests total (one original sample; two direct-canon correction outputs, with the first correction retained outside the repository and unused). Six action atlas requests remain. Target: seven source requests if action output succeeds without a severe error; owner acceptance remains pending. Corrected raw master SHA-256: `f104f3b1c663fa208d53389a95c8b71461ad38f2e148d0cc5272bb2f36467246`.
