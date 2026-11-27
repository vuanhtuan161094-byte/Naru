# NARU HD acquisition R2 — visual acceptance / R3 render decision

Reviewed source: [CI #46032789981](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/46032789981) on `art/hd-premium-acquisition-r2-20261127`, commit `ab4811c`.

## Verified output

- SHA1-pinned raw sources: **896/896 FETCHED** (866 mobile files, 30 MUGEN files; zero download errors).
- Animation review: **98 actual GIF clips** in **5 contact sheets**, made from source PNGs using SpriteFrames timing (no rig, tween or generated stand-in frames).
- 23 source scenes: 6 character-type scenes (not 6 distinct playable characters) and 17 FX-type scenes.
- MUGEN: **15 SFF + 15 AIR**, binary/metadata available, but **not decoded into reviewed native-size gameplay frames**. No acceptance.
- [GIF review artifact](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/46032789981/artifacts/15215665520)
- [Metrics JSON artifact](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/46032789981/artifacts/15215735293)

## Visual verdict (owner-defined PREMIUM quality bar)

- Rage Obito: 9 character clips (idle/run/a1-a4 etc). Motion references useful; render scale/detail and side view **do not meet the requested new premium full character standard**. HOLD, do not integrate as replacement.
- Masked man: 31 character clips. Consistent costume, but flat anime outlines and insufficient direction coverage for full 6v6 game art. HOLD as character; retain eligible motion timing references.
- Sasuke: 37 character clips, best coverage of motion/skills from this batch; visual style remains flat small-format anime, side-oriented and **not accepted as premium game art**. HOLD as character, retain motion references.
- FX scenes: review blue lightning, white slash, fire, purple aura separately; **no automatic VFX approval**.
- 15 MUGEN SFF: source verified but no decoded visual evidence; HOLD pending proper preview.

**Decision: R3 = PREMIUM FRAME-BY-FRAME RENDER**, with Sasuke as the first character benchmark because the source provides the richest motion-reference sequence. Do not bulk-produce other characters until one full character is rendered, animated, checked at actual gameplay scale, and approved. Never present CI PASS as artistic approval.

## Sasuke first-character R3 production contract

- One cohesive, high-resolution, hand-rendered anime game style — **not** pixel-upscale, flat cutouts, SVG/procedural geometry or rigs.
- Render all four camera directions for **Idle (8), Walk (8), Attack (12), Cast (12), Hit (6), Death (10)** = **224 individually drawn RGBA cels** for one character, not isolated unrelated poses.
- Each cel should be produced on a consistent 512×512 RGBA canvas, character height target 240–360 native pixels, fixed ground anchor, consistent face/costume/weapon, no other character bleeding/crops, no fixed background, no effects baked over the character.
- Animate from actual rendered cels; build 24 GIF action/direction previews, one contact sheet and a Godot character-only battle presentation before promotion.
- Explicit acceptance gates: source image artistic detail, identity consistency, direction readability, correct hands and weapons, exact cel count, alpha, alignment, action readability and runtime-scale preview. Failing any artistic gate means HOLD and re-render, not interpolation or fake QA.
- No changes to Luna gameplay; no Codex Cloud, no merge, no rig. Do not replace main game sprites until approved.

This file records real R2 acceptance; it does **not** claim that any R3 cel has been rendered.
