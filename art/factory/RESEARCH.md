# R16 research — method decisions, not a promise of generation quality
Reviewed 28 Nov 2026. Primary local source: art/ART_R13_V3_PRODUCTION_SOP.md, data/art-review/move-r3-contract.json, original P3 source pack (SHA-256 a0d34b650e4569ac22fe643d242e75296f5e79ecf29a45c259b8c2c0577a657e), recovered NIN-002 V3 overlay. Move R3 six strips are owner visual-approved. Other P3 actions are candidate references only. Sasuke V3 runtime derivative contains 84 cels; original high-res source atlases are not recovered here.
 
| Source and inspected material | Adopt | Reject / limit |
|---|---|---|
| [aldegad/sprite-gen](https://github.com/aldegad/sprite-gen), [run contract](https://github.com/aldegad/sprite-gen/blob/main/docs/run-contract.md), SKILL.md (blob e2011c73f7ac33cf9245129f9ae401751c7801ce) | Separate immutable identity, layout guides, each state row, atomic extraction, manifest, curation, correction loop. | No Breathe transform, mirror fix, RIFE/interpolation or synthetic motion. Do not install unreviewed scripts; verify license, dependencies and provider capability. |
| [chongdashu/ai-game-spritesheets](https://github.com/chongdashu/ai-game-spritesheets), [directional anchors](https://github.com/chongdashu/ai-game-spritesheets/blob/main/prompts/04-directional-anchors.md), [attack](https://github.com/chongdashu/ai-game-spritesheets/blob/main/prompts/06-attack-spritesheet.md), [normalization](https://github.com/chongdashu/ai-game-spritesheets/blob/main/prompts/08-normalization.md) | Neutral reference, matching orientation anchor for each clip, explicit pose phases, measured crops and stable ground anchor. | No mirrored direction, no baked attack effects, no per-frame forced height normalization, no low-res upscale. Video route is not the default Naru production path. |
| [envy-ai/sprite-generator](https://github.com/envy-ai/sprite-generator), [animation definitions](https://github.com/envy-ai/sprite-generator/blob/main/docs/animation-authoring.md) | Explicit dependency graph, immutable source+pose inputs, cache keys, reuse approved stages, consistent crop and frame selection. | Requires actual local ComfyUI/models for video workflow; not verified in Luna. Do not switch to video or external paid service without approval. |
| [cubiq/ComfyUI_IPAdapter_plus](https://github.com/cubiq/ComfyUI_IPAdapter_plus) README | Reference conditioning and optional pose ControlNet if compatible image backend is actually available. | It does not guarantee identity or direction; avoid FaceID as sole signal for chibi; no dependency on local GPU or unapproved service. |
| [hongyuanc/loom](https://github.com/hongyuanc/loom) README | Record provider, seed, hashes; evaluate alpha, palette, silhouette, bbox, loop and actual motion. | Experimental and explicitly not a complete multidirectional humanoid factory. Never replace real artwork with templates. |
| [Aseprite CLI](https://github.com/aseprite/docs/blob/main/cli.md) | Optional deterministic sheet and metadata export; Pillow is sufficient for current project. | No additional tool dependency unless justified. |
 
## Benchmarks measured from approved Move R3 (alpha threshold 32/255)
| Ninja | Visible height range px | Bounding-box X center range px | Bottom range px |
|---|---:|---:|---:|
| NIN-004 | 90–95 | 48.5–49 | 95–101 |
| NIN-041 | 87–92 | 50–51 | 93–101 |
| NIN-042 | 88–95 | 46–48.5 | 94–102 |
| NIN-043 | 90–95 | 48–50.5 | 95–103 |
| NIN-060 | 90–94 | 44–46 | 96–102 |
| NIN-093 | 92–98 | 42.5–44.5 | 97–104 |
These are runtime derivatives, not a rule that all ninja must be the same size. Proposed move warning thresholds: height span >10px, center span >3px, bottom span >10px; visually inspect exceptions. Ground/pelvis anchor and anatomy, not bbox alone, determine correctness. Attack/fall have intentional changes. No per-frame independent rescale to make metrics pass.
 
## Method choice
Primary: image-to-image/reference-conditioned frame sheet, one character at a time. First approve the character's four directional neutral anchors jointly. Freeze hashes. All action images must be generated with the actual anchor(s) for that direction plus the immutable model sheet, not solely the previous generated image. Global style reference is separate from identity and motion reference. If multirow sheet drifts, retry only that row, or split into smaller coherent batches; every retry uses same canonical anchors. No prompt-only independent characters. Seed/version if available; no seed claim when backend lacks it. No actual backend benchmark in this research turn.