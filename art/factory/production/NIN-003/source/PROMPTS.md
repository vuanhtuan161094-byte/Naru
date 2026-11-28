# Generation record — NIN-003

Provider: OpenAI imagegen tool. The tool did not expose an exact model version or seed. Transparent output was requested for all source atlases. No video source or generated video was used. Each action generation attached the final two-view model atlas, both extracted direction anchors, its Sasuke V3 motion guide and the approved Move R3 style reference. The motion guides are composites of preserved V3 source strips; they were not used as output cels.

## Locked model

Create a two-view atlas for Sakura Haruno, NIN-003, teen Naruto Part I. Use Move R3 only as the shared rendering/style guide. Draw two independently authored full-body neutral views, SE facing screen right and SW facing screen left, on transparency. Preserve a short pink bob, green eyes, Leaf forehead protector, red sleeveless high-collar white-trim tunic with plain front, dark shorts/leg wraps, gloves and open-toe sandals. No Shippuden clothing, front emblem, weapons, props, VFX or background. Keep identity, camera, proportions and scale consistent. Two focused source edits removed a stray edge halo and corrected the hair/front-tunic details; final model hash is in `ledger.json`.

## Action phase prompts

- **Idle:** two rows (SE then SW), six distinct poses each: ready, inhale, rise, peak, exhale, settle. Subtle breathing and head/shoulder/hand movement, feet planted.
- **Move:** two rows, eight distinct poses each: left contact, left load, right passing, right lift, right contact, right load, left passing, left lift. Alternating steps and opposite arm swing, stable ground root, no sliding or blur.
- **Attack:** two rows, six distinct poses each: ready, anticipation, windup, strike, follow-through, recover. Physical hand-to-hand punch only, no weapon or effects.
- **Cast:** two rows, six distinct poses each: ready, hands raise, seal one, seal two, seal finish, recover. Hand seals only, no chakra or VFX.
- **Hit:** two rows, four distinct poses each: impact reaction, recoil, stagger, recover. Reaction to an unseen hit, non-graphic.
- **Fall:** two rows, four distinct poses each: balance lost, knees buckle, ground contact, down. First atlas version let the final bodies reach cell edges; it was discarded as a source attempt and replaced with a compact curled landing that remains inside the cell.

All prompts required the locked Sakura anchors, full-body isolated poses, transparent background, safe gutters, no labels/grid/scenery, no mirror, rig, tween, interpolation, duplicate padding, blur or baked VFX. The captured source atlases are authoritative if prose differs from prompt notes.
