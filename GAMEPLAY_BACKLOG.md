# GAMEPLAY_BACKLOG — 25/11/2026
| ID | State | Scope |
|---|---|---|
| GP-P1 | DONE | Scoped registry/import foundation. |
| GP-P2 | DONE | Scoped first-stage loop and save/reload. |
| GP-P2B | DONE | Scoped combat expansion. |
| GP-P3A | DONE | Scoped skill/gear transaction foundation. |
| GP-P2C | READY | ABC implemented effects/guards; 1152 dispatch checks PASS. Remaining per-skill timed behavior, deterministic replay, pathing/spatial precision. |
| GP-P3B | READY | Positive trial/evolution/capture fixture; 9 separate beast kits; remaining growth tuning, compatibility authorization, full branch and training paths. |
| GP-P5A | DONE | HQ and workshop construction proof. |
| GP-P5B | READY | 15 profession talents/specialties and 90d real seeded sim PASS; surplus sale, capped reward inbox implemented; full resource chain playthrough and balance remain. |
| GP-P6 | READY | Save import/export, nested validation, cap/replay; remaining complete migration, corruption recovery and edge cases. |
| GP-P7 | READY | Two independent squads, defense roster, NPC development and strategic wars PASS scoped; neutral capture and hostile raid/protection fixture PASS; deeper strategic balance and defended conquest remain. |
| GP-P8 | READY | 120 stage wins/rewards high-power fixture, 24 boss phases, 81 objective/288 trial links PASS; real progression balancing and remaining individual content tests. |
| GP-P9A | DONE | Scoped 17-screen functional UI and actual mouse navigation V3; CI 45563300995. |
| GP-P9B | DONE | Scoped private review loader, native exact V4 PCK review and generic Web file import PASS; production art remains REVIEW. |
| GP-P9 | READY | Remaining UI polish, accessibility/touch device coverage, asset adapter and advanced sub-actions. |
| GP-P10A | DONE | Web DEV V1 CI 45553036319. |
| GP-P10D | DONE | Exact-SHA Web V4 181 assertions, 5/5 natural chapter, 90d sim, mouse/touch and generic import PASS; CI 45565338505, artifact 14999672939. |
| GP-P10C | DONE | Verified Web DEV V3, CI 45563300995, artifact 14998937461; D1-C 45563525233 PASS, mouse/touch. |
| GP-P10B | DONE | Web DEV V2 exact-SHA CI 45559078672; 150 checks, 90d sim, Chromium probe, artifact 14996917338. |
| GP-P10 | BACKLOG | Final Web/Android/PC same project and acceptance gates. |
Work independently on READY tasks; no merge, Codex Cloud, public release, or art wait. See GAMEPLAY_STATUS for evidence and proposed values.

## Combat V3
- REVIEW: runtime/map/save/UI/formation batch, exact-SHA Godot + browser CI.
- READY after green: verify natural balance, extend secondary squad configuration UI, collision/pathfinding and SKILL-P1 geometry audit; art coordinate synchronization.

- IN_PROGRESS: Combat V3-B terrain/body collision, tactical AI, D4 geometry/timing, Web V5. Pending exact-SHA CI.

- IN_PROGRESS: V3-C secondary squad formation and timed 1152-skill fixture, V5 actual input audit.

## Combat V3 handover
- DONE scoped: inherited map/formation foundation; tactical movement, collision, static terrain and detour; eight formation choices/upgrades/links; secondary squad formation data/UI; all 1152 timed cast/effect dispatch, 20 form conflict corrections, cumulative Godot and 90d economy gates.
- REVIEW: Web DEV V5 1b5c8da2 CI 45574564478; export PASS, browser/upload not fully verified at handover.
- READY: individual mechanics/canon review (64 anchor proposals plus 1088 remaining), exact effect semantics and balance, advanced terrain/pathing/role coordination, current art synchronization and runtime review. No merge.

- IN_PROGRESS GP-SKILL-P2: compiled A–I overlay, geometry/runtime scheduler and fallback ledger; separate adapter QA, combo/form route migration and specialized residuals READY. Web DEV V6 pending CI.

- IN_PROGRESS P2 batch 2: combo events, form compatibility, summon role implementation and export path; detailed per-ID runtime audit next.

- IN_PROGRESS: P2 per-ID runtime ledger and NPC war tuning. Resolve/revert unconfirmed adapters before acceptance.

- IN_PROGRESS P2 batch 4: additional specific parameter adapters (DOT, clone, charge, conditional geometry); verify timed outcomes and fallback IDs.

## GP-SKILL-P2 handover
- DONE scoped: ingest exact A–I/54 forms/12 combos, 16 geometry handlers, stable IDs, D4 explicit fallback, V6 batch 2 full CI and actual browser flow.
- REVIEW: B3/B4 P2 timed per-ID audit, advanced parameters, NPC tuning, newer Web artifact. See exact CI statuses and audit counts in GAMEPLAY_STATUS.
- READY: inspect cast-only/rejected IDs and gate unconfirmed adapters, finish residual special mechanics, actual combo chains/form migrations, effect budget precision, source/era review, full organic progression and final balance. No blanket P2 PASS.

- REVIEW P2 batch 5 strict candidate confirmation gate and fixture range correction; exact CI pending.

- REVIEW P2 batch 6: 1133 confirmed/1134 enabled, 18 explicit fallback; fixed NIN-001-S6 clone consumption order. Strict gate rerun required. Remaining unsupported residual special effects and individual semantic tests remain READY.

## A+B / V7 batch
- REVIEW: 6 new candidate adapters, second P3 HOLD, global NPC war cadence + pair save fields, 120 stage XP values, natural P2 campaign observational test, Web DEV V7 CI/export. Exact-SHA checks required.
- READY: remaining special fallback (ritual/link/cable/retrieve/mark throw/reflection), full skill-depth/star C and BALANCE-P1 overlays, organic progression beyond chapter 2, final migration/recovery, full UI and PC/Android. No blanket completion.

## PASSIVE-P1 / synergy batch 1
- REVIEW: 864 registry, runtime DEV ledger, opt-in engine and progression, UI, scoped actual event/6v6 smoke, V8 export. CI pending.
- READY: per-ID actual contribution audit; source/adapter gate resolution; typed control duration/conditional secondary/remaining authoritative events; continuous mastery; full synergy-P1 after published database; fixed-point CP and V5 manual ultimate; prior V7 remaining special fallbacks/organic progression/Android-PC.

- REVIEW batch 2: 2016 synergy structural registry, 72 read-only pilot, source/target gate and AI/cleanse improvements, 12 roster windows. Full actual interaction audit, P2 remaining 792 records, 4 form-zero and 2 event mapping gaps, all special mechanics still READY.

## Scope split — Chat03
- TRANSFER Chat03: GP-P3B external progression/trials, GP-P5B village/economy/job, GP-P6 shared save ownership, GP-P7 world/territory, GP-P8 campaign progression, GP-P9 external screens and equipment/forge/recruit. Retain existing V8 behavior.
- Chat01 REVIEW: V9 combat candidates, 12 designed-team observations, new 14 passive adapters/2 P2 adapters, exact-ID ultimate, growth DEV, PC/Android presets.
- Chat01 READY: residual 9 special P2 + 2 era HOLD, 34 branch contracts, full fixed-point CP, V5 combo and form route tests, per-ID passive actual effect audit, art event contract and tactical quality. CI not yet verified.

- REVIEW V9 batch 2: 5 more P2 special candidates, CP fixed-point combat ledger, 34 typed branch adapter records and fixtures. READY: 4 reflection mechanics clarification, 2 era holds, exact full V5 combo/form semantics, per-ID passive audit and balance, visual event integration.

- REVIEW Combat V10 tactical/animation/HUD/typed passive/12 combo/54 route integration and exact CI. READY: per-ID typed actual effects, detailed special combo negatives, role balance and visual overlap, source/fallback decisions. Organic campaign regression shared with Chat03, do not inflate stats.

- REVIEW V10 batch 2 exact passive/branch effect fixtures, CP parent cap, animation phase timing. NIN-139-P2 mechanic HOLD while reflection adapter is unresolved; 186 source gate unchanged.

- V11 REVIEW: actual per-ID 432 branch typed effects; 12 real rotation windows and all 54 correct-realm forms; measure spacing, focus/avoidance, tick duration, starter regression. No claim of organic all 12 combos or 54 forms until evidence. Trial runtime and all passive conditions/mastery still require full per-ID acceptance. Reflection + rights gates remain.

- V11 follow-up: review combo B2 secondary duration contract with Chat00; interval effects with identical 50ms tick quantization require design tuning, no artificial timing claims.

- V12 FINAL: reconcile actual per-ID ledger (stat marginal, typed, event-only separately); remaining organic combo/form failures are not hidden by fixture. Review STG060+ with earned ONE GAME roster. Source/era/reflection and combo B2 duration HOLD; art production approval remains 0. Private pack loader metadata fixed; full directional/action coverage pending Chat02. Coordinator applies exact final delta, not full branch overwrite.

- V13 REVIEW: authored form stat corrections, combo readiness and HUD, exact CI. Remaining COMBO-001/010/012, 11 not observed forms, empowered and passive coverage require actual new ledger. STG060/080/120 diagnostic losses handed to Chat03; no unilateral world tuning or hold clearance.
