# ART V4 FAST prompt record — NIN-027 Zabuza Momochi

Provider: OpenAI imagegen. Model, seed and creation timestamps are not exposed. Exactly seven source image requests were used: one direct-canon two-view master and six action atlases. No rerender requests were made.

## Identity and style lock

The master and each action atlas used the direct canon image recorded in `canon_reference.json` (https://myanimelist.net/character/728/Zabuza_Momochi) for this character’s identity. `identity_reference.png` locks the database roster age, form, costume and equipment. The locked `model.png` is the pose/continuity reference for all action atlases. `art/factory/production/NIN-007/source/model.png` was used only for approved Move R3 linework, eye rendering, shading and detail density. Shikamaru’s face, body and costume were explicitly excluded.

Identity anchors: Adult tall muscular Zabuza: spiky silver hair, bandaged lower face, slanted forehead protector, dark sleeveless outfit and oversized cleaver sword.

The two-view sample was screened at 96×112 and locked before atlas work. Small deviations were accepted under ART V4 FAST; owner acceptance remains pending.

## Atlas prompts and action

Every action prompt used direct canon + roster form + locked model + matching motion guide + Shikamaru style-only reference. Output: two independently authored directional rows, SE then SW; transparent background; complete silhouette; no mirroring, repeated/generated filler frames, rig, tween or VFX.

- `idle`: 2×6 breathing/ready loop.
- `move`: 2×8 running loop; runtime key remains `move`.
- `attack`: 2×6; Heavy cleaver sword strike; keep the same signature blade recognizable throughout.
- `cast`: 2×6; Hand seals while giant cleaver remains strapped to back.
- `hit`: 2×4 moderate recoil and recovery; Moderate recoil; keep cleaver on back; no attacker or injury.
- `fall`: 2×4 progression to ground; Four-stage fall to prone; preserve bandages and cleaver, full wide horizontal silhouette. Horizontal silhouettes remain intact and use alpha-run extraction.

## Production totals

12 directional clips, 68 authored cels and 13 runtime assets. Seven render requests total, within the per-character target. No rendering retries.
