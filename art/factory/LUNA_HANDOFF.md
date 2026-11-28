# LUNA HANDOFF — ART R16 / V4 TWO-DIRECTION LEAN PRODUCTION
Owner decision 28 Nov 2026: V4 supersedes V3 production counts and QA cadence. Preserve V3 source/overlays unchanged. Work on art/r16-character-factory; no merge, no Codex Cloud, no gameplay or progression changes. One Game.
 
## 1. Deliver real art, not plans
Use actual Move_R3_6_Ninja.gif and source strips in references/generated as global style benchmark, Sasuke V3 as motion/reference. Read RESEARCH.md (methods, not overriding V4 requirements). Use actual image-generation tool with reference images; if unavailable report BLOCKED_GENERATOR, do not fabricate sprites with SVG, transforms, placeholders, rig, tween, mirrors, interpolation or duplicate padding. No external paid service without approval.
 
## 2. Locked identity and style
Compact 2D anime chibi, clean cel shading, approx 3-head proportions as observed in approved art, crisp silhouette, coherent lighting and palette. Keep character-specific anatomy/height, exact roster ID/era/form, face, hair, outfit, emblem, anatomical left/right accessory placement. Start NIN-003 Sakura Part I; protect approved existing art. For each character create one canonical model atlas: SE (front 3/4 facing screen right) and SW (front 3/4 facing screen left), independently drawn, same identity and camera. Extract both neutral anchors and freeze hashes. No rear view required. Do not redesign mid-production. Reuse the same model atlas AND corresponding directional anchors as actual image inputs for every action. Do not rely solely on a preceding generated frame or textual prompt. Keep global style, identity and motion references separate.
 
## 3. Render six action atlases
Two rows, SE then SW, left-to-right chronological sequence. One character at a time, target 7 source images including model; split into single rows only when output overlaps or identity drifts. All cels isolated, full body, safe padding, transparent background, no labels/grid/UI/shadows/scenery or VFX. No mirror. Use pose phases in CONTRACT.json.
 
| Action | Directions | Frames each | Total |
|---|---|---:|---:|
| Idle | SE SW | 6 | 12 |
| Move | SE SW | 8 | 16 |
| Attack | SE SW | 6 | 12 |
| Cast | SE SW | 6 | 12 |
| Hit | SE SW | 4 | 8 |
| Fall | SE SW | 4 | 8 |
| Total | 2 | | 68 |
12 clips, 2 model views. Attack physical action; cast hand seals only, no Rasengan or chakra VFX. Move alternating real steps, no sliding or blur. Retain native originals.
 
### Prompt template (attach actual images)
"Create a game-ready animation atlas, not an illustration. Image A is the locked two-view model of [ID, NAME, ERA, FORM]. Images B and C are the exact SE and SW identity anchors. Image D is the motion/layout guide ONLY. Keep the same face, hairstyle, anatomy, outfit, emblem, color palette, anatomical accessory sides, camera and character scale in every cel. Match approved Naru anime-chibi style. Draw [ACTION] in two rows of [N] poses each, SE front-right on row 1, SW front-left on row 2. Chronological pose phases: [PHASES]. Draw every pose independently; no mirroring, no redesign. Keep stable world root but natural body motion. Full isolated character in each cell with safe gutters and transparent background. No effects, labels, UI, grid lines, background, cropped limbs or overlapping cells."
 
## 4. Processing and LEAN QA
Use Python/Pillow to split by row and actual alpha bounds, reject overlapping/cropped cells. Preserve source PNGs and native cels; one scale per character, preserve natural crouch/fall/strike motion, foot/pelvis anchor. Runtime 96x112, anchor (48,104), exact frame rect and timing, 13 assets = 12 clips + static. Do not upscale low-res art. One technical validation with tools/validate_factory_overlay.py --revision v4; generate GIFs/contact sheet programmatically. One combined visual review per character covering both directions and all actions; inspect individual clips only if visible defect or actual blocker. Warnings advisory, no pixel-level perfection or endless correction loops. Fix only wrong identity/era, wrong direction, severe jitter, obvious anatomy, missing/duplicated/clipped/overlapping frames, alpha artifacts, wrong counts. Retry affected row, not whole character. Keep completed clips, continue when playable and consistent. After at most two failed targeted retries, mark specific clip HOLD, report and move to next independent kit; do not count incomplete kits as complete. Source and pack status separate from actual runtime. No repetitive benchmark loops, no long audit reports.
 
## 5. Runtime integration requirement (art only)
Current importer in game/review_art.gd still requires 15 assets/14 clips. Adapt it to accept exact V4 13 assets/12 clips, keeping exact V3 compatibility and protected IDs. Existing save/restore restrictions must be respected; extend art-only production loading for new IDs as necessary. V4 renderer maps NE->SE, NW->SW based on horizontal facing for presentation ONLY; actual authored V3 rear clips remain used for legacy kits. Never alter simulation path, positions, facing state, targeting, damage, skills or engine. No synthetic rear frames. Check actual 6v6 pilot before mass production, then one Godot runtime smoke/video per batch (e.g. 6–12 complete kits), not per clip. If rear-facing visual mismatch is tolerable, keep V4; if materially broken, report before changing contract. Do not count runtime PASS without actual run. Existing original art, references and source imports remain intact. VFX separate from characters.
 
## 6. Delivery cadence
Finish first pilot Sakura, then process large batches of complete characters (6–12), not repeated micro-plans. One writer per ID, reuse immutable anchors/cached assets. Eventual scope 144 ninja + 54 forms, new V4 theoretical 13,464 animation cels if all newly produced; reuse existing approved art. Forms need exact form bindings, not base substitutions. Deliver sources, native cels, runtime overlay, GIFs/contact sheet, concise manifest (IDs, counts, reference hashes, tool/model/settings if available, status, blockers), commit and batch runtime screenshot/video. No repetitive documentation or QA. Do not require owner approval for every frame; explicit owner approval remains separate from technical acceptance. 
