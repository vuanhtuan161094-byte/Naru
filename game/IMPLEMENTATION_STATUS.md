# E3 GP-P2 — gameplay loop (DEV)
P1 registry smoke passed at 1fbc99e2. P2 changes: transactional team selection, stage-bound reward ledger, XP scroll training (proposed +200 XP), allocated foundation points, D4 realm pity and stars, growth UI, save reload, cast windup/interruption, realm damage factor, quality growth and proposed +4% per star on HP/attack, actor y-sort. Existing P1 permanent gain disabled until difficulty/anti-farm checks are implemented; existing earned stats retained. No art changes. Test script exercises actual first-stage simulation, reward, training, reload, duplicate reward rejection and 6v6 initialization/ticks. CI must run before claiming pass. Legacy started battle entries not recoverable; old completed entries retained. Not complete: full effects/statuses, summons/forms/reactions, all unlocked skill scheduling and skill levels, equipment, quality trials, economy, stamina regen, world, full save contract and exports. No merge.

## GP-P2B combat expansion
AI utility, projectile delay, line/circle targeting, damage hit/crit/affinity, target-local element reaction window (approximation, not spatial overlap), status durations/DOT/immunity/cleanse, temporary stance/counter, bounded summons, deadlock warning. Form activation remains blocked pending actual unlock. No full claim: taunt/mark/explicit control resistance, per-source shields, precise genjutsu math, environment map/weather, obstacles, all skill evolution/mastery, gear, world and exports remain incomplete. Seed +5% crit, hit baseline 85%, reaction window 2s are provisional. No art changes. CI extends GP-P2 tests.

## GP-P3A progression and equipment foundations
Skill level 1–20, D4 grade chance/guarantee, branch selection, typed effect multiplier and area modifier applied at runtime. Proposed book resource by damage type (RES-118/119/120); basic skill does not have grade policy. Additional skills remain locked pending real trials. Gear registry 128 templates, craft requires correct existing workshop, unique ownership, equip/unequip, enhancement pity, protective material, refine/evolve, socket/remove, combat base-stat modifiers. Workshop construction is not yet implemented, so gear crafting is gated in normal play; CI uses explicit fixture. Gear affixes/set bonuses, profession-based quality, all stat formulas, quality evolution trials, forms and advanced skill unlock remain pending. Existing save schema extended without reset. No exports, no merge.

GP-P3B partial: 48 typed formulas (no eval), talent migration, mastery, gated trial/quality/form transactions and runtime forms. Duel is auto only, no reward for unresolved. Not all 48 effects wired. QA pending. No merge.

GP-P4 / GP-P5A-B / GP-P6 partial: building/recipe/jobs/clock runtime, inventory screen and construction UI, real workshop path. 24h clock cap, no replay; source coverage incomplete and NPC not yet simulated. QA pending.

GP-P5 world partial: route/travel, diplomacy, finite stock trade, NPC tick, capture sequential defense, raid/repair. World offline now active. No multi-team deployment, full NPC-vs-NPC war, or complete balancing. CI pending.

GP-P6 content partial: boss phase dispatch, signature combos, quests, mission timers, resource duels, native bloodline, beasts, summon contracts. DEV proxy beast combat, no unauthorized compatibility. CI pending.

## Evidence update 25/11/2026
GP-P3B e42644ed CI 45550857956 PASS; GP-P4 3b69d0a CI 45550976926 PASS; GP-P5 64ce2478 CI 45551141063 PASS; GP-P6 a61b6e59a87c2f3c93cf37bb252ccb733e0d2714 CI 45551319990 PASS (97 scoped assertions). Prior pending statements superseded. Detailed remaining limitations in GAMEPLAY_STATUS.md. No GUI/exports or release acceptance.

Gameplay Completion A: combat stat and shield improvements, gear affixes/sets, permanent growth, save guard and import/export; CI pending. DEV no art.

Completion B: spatial cast overlap, timer splitting, Web DEV preset and browser probe/artifact workflow, CI pending.

Completion A CI 45552956564 PASS (109). Completion B CI 45553036319 PASS (110 + Chromium actual WASM gameplay probe). Web DEV artifact 14993879097, screenshot 14993799208. Scope and limitations in GAMEPLAY_STATUS.md.

Offensive A: combat AI, stats, status guards, 9 dedicated DEV beast kits, trial/evolution/capture positive-path and full authored effect dispatch tests. CI pending.

Offensive B: profession specialization and talents, repeat missions, offline day boundaries, real starter income test; CI pending.

Offensive C: multi-squad world, defense roster, strategic NPC development/war, nested validation, campaign groups and full content smoke, Web DEV V2. CI pending.

ABC fix: boss phase snapshot/overkill guard, full campaign fixture, 90-day seeded economy, expanded browser probe. Pending exact-SHA CI.

ABC cumulative exact-SHA a77ad31bbc8bb6d8a78a2a3592a4354fbef2c338: CI 45559078672 PASS (150 headless assertions, seed-only economy 90 days, browser extended gameplay probe, Web export). Artifact 14996917338, menu 14997276892. Previous red runs superseded by fix; remaining scope in GAMEPLAY_STATUS.md. No all-gate acceptance or public release.

D1-A: 17 screen functional navigation/UI, actual Godot UI, no art. Pending exact-SHA CI and click audit.

D1-B: training sinks, starter help, dynamic team count, backup safety, actual canvas click audit, Web V3. CI pending.

D1-C: formation geometry, UI control sizing, meaningful-action growth, adjacent conquest guard, seeded replay and browser touch audit. CI pending.

D1 Web DEV V3 verified SHA 8e78533790219620154dc14e8063a62036aeb999, CI 45563300995, 158 assertions, 17/17 actual browser screen navigation, 90d sim and export; artifact 14998937461, screenshots 14999215663. D1-C CI 45563525233 browser QA not yet confirmed. Scope and remaining tasks recorded in GAMEPLAY_STATUS.md.

D2 private visual adapter, actual combat event feedback and one-game local 6v6 review; no private art in GitHub. Pending CI.

D3 NPC economy/war, progression, authored native affinities, reward overflow, surplus sale, lifetime quest counters, capture/raid fixture and Web art import. Pending CI.

D2+D3 correction: review import backup and test preload.

D3-Fix: correct raid frontier setup, peace/war guard, organic campaign sample. CI pending.

D2+D3 verified SHA e74fd59d8f23721e80f0443de0e5a228eac3bc88, CI 45565338505 PASS (181 checks, natural chapter 1 5/5, 90d, Web 17 screens/touch/generic art import, artifact 14999672939). Private exact-SHA native PCK 6v6 review verified local 59 PNG, 90 capture frames, no script errors. Review only; private images absent from GitHub. See GAMEPLAY_STATUS.md for scopes, hashes, failures corrected, and remaining work.

## Combat V3 — DEC-012 (25/11/2026)
Implemented first runtime batch: 14×10 default, 12×8/18×12 authored examples and custom dimensions, bounded free movement, 3×3 slots, eight formations, persistent upgrades and distance/death-sensitive links, formation UI, dynamic projection, legacy save normalization, main squad world resolver. QA pending exact-SHA CI; no claim of completed 1,152-skill geometry audit or production art. No merge.

Combat V3-B: tactical/terrain/geometry runtime and DEV V5 export, pending CI.

Combat V3-C: secondary squads, cadence and timed skills audit, pending CI.

V3-C fix: 20 authored form conflicts and obstacle visibility routing; legacy cleanse test fixture corrected. Pending CI.

DEC-012 Combat V3 tested implementation 1b5c8da242fe9d00a257cf9a4f625574d7872e47, CI 45574564478. Godot registry, dedicated Combat V3, GP-P2, 90-day economy and Web export PASS. Chromium in_progress/not yet verified; artifact not yet confirmed. Do not mark V5 full acceptance until browser and upload pass. 1152 timed skill fixture passes, including actual form activation check; details in GAMEPLAY_STATUS. No art wait or merge.

GP-SKILL-P2 A–I batch 1: overlay with explicit fallback, P2 runtime gate and Web V6. Pending CI.

P2 batch 2: actual event signatures, summon roles, form overlay, Web data include.

P2 batch 3: per-ID audit, UI status, NPC war tuning and status/absorb bounds.

P2 batch 4: additional mechanics with explicit fallback retained, pending CI.

GP-SKILL-P2 handover: latest code b26ef37f198159f1f72a9c38892070d39168742f; Latest fully verified artifact: f5115f688b0d8fbd75d8e759512287924bf81116, CI 45580896224, https://github.com/vuanhtuan161094-byte/Naru/actions/runs/45580896224/artifacts/15006288549, 10140619 bytes, sha256:83b007955d1ca66ab9a23d76c185808379c26c284a3d1ce757d4a18881d95856. B3/B4 Godot gates scoped, full CI status in GAMEPLAY_STATUS. Residual D4 fallback and audit gaps retained; no blanket PASS.

P2 batch 5 strict per-ID confirmation gate; corrected fixture, not gameplay range. Pending CI.

P2 batch 6: strict gate exposed clone-dash collision; fixed launch consumption before movement. Rerun required.

A+B / V7 candidate: see GAMEPLAY_STATUS.md; six special candidates, P3 second HOLD, exact DEV campaign XP and global NPC war cadence. CI pending; no production acceptance.

## GP-PASSIVE-P1 + COMBAT-SYNERGY batch 2
Design 3916aad679eaeee0905f9f1e9aaba2ecbab5f7a2 published 72 pilot proposals/21 changed effects (DEV_PROPOSAL_NOT_AUTO_APPLY), 2016 structural index IDs, 387 explicit candidate links, 561 event candidate links, 6 design gaps. Exact blobs copied for read-only reference, no pilot numeric changes; registry checks IDs and links, UI exposes candidate links and pilot warning, disables spend on static HOLD and zero-payload form gap. Guard first eligible hostile target before dedup, detect shield and summon contact, passive debuff included in existing cleanse targeting, DEV AI prioritizes living aura owners (+6) and affinity (bounded +/-4), actual P2 geometry target count. No new events from index predictions. 12 extra 6v6 windows cover all 144 ninja at varied star milestones (20s observation only), separate continuous stat presence and distinct actual event receipts; no claim all effects validated or full balance. V8 batch 1 7f78d4ba CI 45631299248: registry, Combat V3, SKILL-P2, PASSIVE-P1, GP-P2 steps PASS observed; economy/Web pending at checkpoint. Batch 2 exact-SHA CI pending. No Codex Cloud/no merge.

## GP-CORE-FINALIZATION / Combat V9 (25/11/2026)
V8 exact SHA 28f25de5 CI 45631683495 PASS, artifact 15032221113 sha256 99daa97b5bcd9b802fa6218075f1a93448c0b690824b8a1acfdb4de36eeb3934; 1139 timed P2 confirmations, 216 event passive IDs + 113 P1 stat-presence IDs (not full correctness), 9/10 natural starter. Design snapshot 0309dfc1cb1c24bb904a47eb9bba46c16deb62ef. V9 candidate: 85 growth/34 branch reference/146 ult intent/12 designed-team contracts; monotonic F and typed growth, natural-star snapshot inside combat only, star CP discount, cent-rounded skill price (NOT complete integer CP ledger), manual exact-ID queued/cancelable intent, AI HP urgency/spacing, P2 pilot opt-in, 14 new passive adapter candidates with real wall/teleport/counter/absorb receipts and typed CC; 4 form intersections filter zero payload, two absorb receipts use actual CP increase. 2 new P2 candidates cable (DEV authored ninken anchor) and mark projectile before safe landing (DEV 12m/s). Preserve 186 passive source gates and 2 era holds. Remaining 9 P2 special fallbacks ritual x3/retrieve x4/ally-contact x2; 34 special branch adapters still HOLD; full V5 combo event contracts/trials, fixed-point ledger, complete AI and balance not done. PC/Android preset stubs only. CI pending. Chat03 now owns external gameplay/progression; no external service changes, no SaveStore/SaveGuard/StatsService changes. Shared registry/main edits are combat integration seams only; see game/COMBAT_API_HANDOFF_03.md. No Cloud, no merge, no cross-branch edits.

## Combat V9 batch 2 — specialized adapters / fixed-point CP
Candidate +5 P2 (NIN-064-S4 ritual mark-filtered one-shot 8s zone; NIN-132-S2/S4/S5/S6 nonliving effect token, max 3, geometry-safe and no actor relocation). Remaining 4 mechanical fallbacks NIN-064-S5/S7 linked reflection and NIN-139-S1/S5 conditional ally-contact reflection: exact trigger/recipient/window not fully specified, ask 00 before enabling; 2 era holds retained. CP integer hundredths for combat mutations, signed telemetry, separate fractional continuous regen/drain remainder, ratio resize, actual hostile drain/return, 3 special aggregate drain refund caps; 31 DOT branch fixed-total budget split across ceil(duration) ticks and final remainder, same source+skill refresh and existing stack cap. New fixtures reconcile 34 authored branch records and test sample DOT, CP conservation, nonliving token cap; per-ID actual semantics still subject to CI. No persistent Save Schema update. V9 batch 1 f50f49c2 CI 45634938325 registry/V3/P2/P1/V9 12-team/GP-P2 PASS observed, economy/export pending at checkpoint. Batch 2 CI pending; no false PASS or full balance claim. Shared registry/UI seams unchanged in this batch. Chat03 ownership as COMBAT_API_HANDOFF_03.md.

## COMBAT V10 / Tactical V4 — candidate batch (25/11/2026)
V9 batch2 exact 23f80149 CI 45635711318 PASS, artifact 15032753625; 1146/1152 timed effect confirmation, 31 DOT +3 drain adapter records, 216 observed event passive IDs, 113 stat-presence IDs; organic starter 4/10 (regression vs V8 9/10, no balance PASS). V10: seven role target/goal heuristics, occupancy-aware approach slots, ranged/support standoff, danger steering, actual legal cast utility, soft CP budget, contribution and animation events, formation links, typed passive receipt ledger and V5 combo/form runtime contract candidates; 12 paired tactical fixtures, 54 form activation fixtures and native actual Godot capture workflow. No reflection/era/source gates removed. No full semantic or balance claim. Shared services unchanged. CI pending.

## V10 batch 2 — targeted adapter/runtime hardening
Batch 1 f41ca229 CI 45637604628 registry, Combat V3, SKILL-P2, Passive, V9 core, paired tactical and GP-P2 steps observed PASS; export/video pending at checkpoint. Batch 2 DEV: explicit mechanic dependency HOLD NIN-139-P2 until reflection contract (186 source gate unchanged), 13 executable isolated passive fixtures (8 status duration, 2 teleport, 3 wall collision), 34 per-ID effect fixtures (31 DOT, 3 CP drain); observational unresolved IDs logged, not blanket semantic pass. Shared paid parent CP refund cap for conversion and drain, cent epsilon, ratio resize exact carry, boss status caps after rating, actual arc absorb accounting, V5 tactical uses effective typed coefficient rather than base and soft CP budget without legacy nonpending ultimate reservation. Frame start tick and bounded non-loop attack/cast/hit/fall; scale generic DEV actor with projection. No external service edits; CI pending. No changes to six active fallback IDs.

## Combat V11 product candidate — 25/11/2026
V10 exact a8830459 CI 45638173068 full success: 1146 timed P2, 31 DOT+3 drain fixtures, 13 passive fixtures + Daemon HOLD, 9/10 organic starter, 1412/6205 baseline crowded pairs vs 437/8404 tactical (22.76%→5.20%); 51/54 form activation fixture used realm6, three remaining are realm7; organic combo receipts [] and forms 11 IDs, not product acceptance. V11 integrates design 0309dfc1 exact 432 branch choices with field-specific adapters and existing 34 special overrides, checks actual changed payload/holds, fixes realm fixture, target/goal hysteresis, legal survival override/anti-starvation, pressure tactics based on net HP (no timeout/damage injection), actual combo signature coordination/consumption, antiheal regen, timing/perf telemetry, shared pure stat snapshot, touch/PC inspector + HUD throttling. Art 4230302e owner-approved visual six Move R3 review clips private only, checksum-gated import adapter, no production approved binaries (rights/runtime pending). Web V11 + 24-second native capture CI configured; exact CI/artifact pending. 186 source, 2 era, 4 reflection and Daemon mechanic HOLD unchanged. No external service changes or merge.
