# INTEGRATION_LOG — F1
2026-11-25: no approved production assets integrated; gameplay DEV placeholders only; D2 legacy review PNGs not production. Evidence gameplay 591e6c64404b9ebf69a96fcd78c97b79af8f5d34; art 59b2cced2f84c418ad651a51b95d3d711cae3045. No merge.
## Request format
ID, source branch/SHA, exact asset files+IDs, SHA-256, actual binary location, usage/distribution rights, owner approval, interface version, destination gameplay HEAD, smoke and rollback plan.
## Gate
1. Owner approval and permission to integrate; verify actual files/hash and rights separately; private packs stay private, public game uses DEV fallback where necessary.
2. Check RGBA, cell/anchor, actual distinct frames, directions, durations, VFX timings and stable IDs.
3. Copy only approved files/metadata into existing game with expected HEAD; do not merge branches. Coordinate concurrent work.
4. Godot smoke plus screenshot/video; record destination SHA, tested scope, rollback. Mark INTEGRATED only after runtime evidence.
5. Web DEV build can use labeled placeholders; no release claim until mandatory gates pass.

## 2026-11-25 coordinator review — ART-P8 R2 / Web DEV V2
- Art review request read at f36081d; private R7 and runtime evidence ZIPs recovered from Library, both exact SHA256 match, ZIP integrity PASS. R7 manifest 52/52 hashes; six RGBA 96x112. R2 screenshot, MP4 and runtime-log hashes match. R4 reference recovered privately.
- Local evidence is actual Godot Combat fixture on gameplay a7ecee6, not normal campaign and not current gameplay 5919893. Static actor movement, six mirrored identities, DEV summon fallback, no limb clips. CI 45559348599 only safe DEV textures. No approval of individual assets or distribution rights inferred.
- Current Web DEV V2 (CI 45559516356, artifact 14997755844) has no private R7 art. Reconcile adapter against current HEAD, validate one existing game in disposable private checkout and actual campaign path before asking for production integration permission. No cross-branch write, no merge, no private assets pushed. Integration remains REVIEW / not integrated.
