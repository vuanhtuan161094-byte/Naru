# ART V4 FAST — NIN-014 Rock Lee production prompts

Canon source: `canon_reference.json` (Naruto associated Rock Lee image downloaded as `/tmp/naru-identity-refs/NIN-014.jpg`); roster form/outfit: `identity_reference.png`; Shikamaru style: `art/factory/production/NIN-007/source/model.png` (style only).

## Corrected master

Correct the existing two-view teen Rock Lee master. Keep the compact athletic teen body, bowl-cut black hair, thick straight eyebrows, green one-piece training jumpsuit, orange leg warmers, bandaged hands and dark sandals. Direct canon Rock Lee image is primary identity reference. Shikamaru is style only for clean dark linework, restrained anime shading, eye-drawing approach and detail density. Draw two independently authored full-body three-quarter views (SE and SW), no mirroring. Critical game-size eye treatment: narrow natural anime eyes with pale sclera visible around a small dark pupil at 96×112; never solid black dots or large black ovals. Keep the stern youthful face. No pixel-art chibi, extra characters, scenery, floor, shadow, labels, VFX, crop or props.

One original master plus one style correction were rendered. The corrected output alpha was thresholded at 32 to remove faint image-matte residue. The corrected model was screened once at 96×112 and locked.

## Action atlas prompt template

Every atlas used the corrected `model.png`, direct canon image, roster sprite, matching motion guide and Shikamaru style reference only. Equal grid with two independent directions (SE top, SW bottom), exact contract frame counts/phases, no mirroring/interpolation/rig/tween/repeated frames. Preserve Lee's identity/outfit and visible sclera around each small dark pupil at game size. Two earlier idle/move attempts were rejected before runtime because the eyes read as solid black; the corrected idle and move outputs are the final assets. Attack and cast use the specified six-phase order; hit and fall use four phases. Fall silhouettes are preserved with row alpha-run extraction.

## Render accounting

Ten total source requests: original master, one corrected master, two rejected preliminary atlases, and six final action atlases. Target was seven; it was exceeded only to correct the visible eye-style error and replace the two unaccepted atlas outputs. Owner acceptance remains pending.
