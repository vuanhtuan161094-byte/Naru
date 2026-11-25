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

## Combat V3 handoff — 2026-11-25
DEC-012 design SHA `1f6f6cf6c7b1bee5e308d1fa593459c9cefb9ad4`; gameplay SHA `df69717de7a71bc8687af7be3986c585c30e9772` on implementation/e3-gameplay. Exact-SHA CI: https://github.com/vuanhtuan161094-byte/Naru/actions/runs/45568457947 . Observed: Set up job: success; Run actions/checkout@v4: success; Install Godot 4.4.1 stable: success; Import and load registry: success; Combat V3 formation and arena: success; GP-P2 gameplay integration: success; Economy 90-day starter simulation: in_progress; Install matching Web templates: pending; Export Web DEV: pending; Install Chromium browser QA: pending; Browser runtime smoke: pending; Upload Web DEV archive: pending; Upload browser screenshot: pending; Post Run actions/checkout@v4: pending. New runtime 14×10, compact 12×8 (STG-002), large 18×12 (STG-120), custom dimensions, 3×3 slots, eight formations, upgrades, link break, legacy save migration and dynamic isometric projection. No merge. Full skill geometry audit and secondary squad placement UI remain separate; tuning DEV.

## Coordinator reassignment — SKILL-P2
Reviewed gameplay `1b5c8da2` and art `fb61fa48`. Exact gameplay CI 45574564478 partial PASS (registry/Combat V3/GP-P2), economy/Web pending. Prior timed 1132/1152, 20 form-route fixes pending final exact log. Art registry 6 static, 6 skill VFX candidates, 0/144 complete clips and 0/54 forms; R4 59 PNG repack only, current Godot R4 not run. See design/skill-p1/SKILL_P2_ASSIGNMENT.md and SKILL_P2_QUEUE.json. 00 design audit, 01 gameplay, 02 art. No production branch edits.

## SKILL-P2 A–I design draft — 25/11/2026
144 kits × 8 = 1,152 unique skill records, 54 forms, 12 combos, 145 VFX families; nine batch files, official source ledger and structural QA. 64 anchor proposals incorporated as draft; 10 limited direct technique context matches, 334 context-only, 808 lack source pointer, 176 skill records flagged by ninja era. No claim of 1,152 canon-confirmed skills or runtime approval. D4 baseline untouched. Chat 01 and 02 consume reviewed batches and family manifest; no gameplay/art branch edits.

## SKILL-P2 A–I second-pass handoff — 25/11/2026
Design evidence `e6e848b1cdc9334ab90289bfa63c018108d7e6d2`: 1,152 records / 144 kits, 54 forms, 12 combos, 146 VFX families / 18 production groups, 12 second-pass structural checks PASS. 38 official source pointers (8 pages opened); 10 limited technique context matches, 334 character context only, 808 without source pointer; 176 era-flagged skill records, 1 explicit HOLD. All values DEV. 3 proposed status extensions and 4 changed legacy form trigger routes need gameplay adapter. Runtime NOT_RUN on design branch; no production art claim. Read `design/skill-p2/HANDOFF_01_02.md`, `audit.json`, `production_groups.json`, `form_migration_review.json`, `status_extensions.json`. 01 and 02 work independently, no Codex Cloud, no merge. 00 next resolves source/era review and approves numerical tuning. 
