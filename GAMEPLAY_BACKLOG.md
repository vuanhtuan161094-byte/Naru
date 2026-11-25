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
