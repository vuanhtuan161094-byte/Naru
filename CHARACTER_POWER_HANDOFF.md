# Character Power Integration Handoff

## Scope and refs

- Feature: `feature/character-power-overhaul`; task-start HEAD `0b3be051054a7cd05986b346485e79acf9e3c22e`.
- Shared base: `85426e5a8b48ed3653ea6b3870b9aa85a9f370d7`.
- One Game ref inspected: `integration/one-game` at `93f9f13e5145c5c8b71bc40beece27bc1566233e`.
- This document describes a scoped delta. No merge or deployment was performed.
- ART HOLD was respected: no source art, animation, VFX, public Web workflow, or environment settings were edited.

## Changes to carry forward

1. `game/stats_service.gd`, `game/combat_formula_service.gd`, `game/combat.gd`, and `game/power_system_test.gd`: exact stat breakdown reconstruction; raw rating versus capped effect display; absolute expected damage incorporating hit, critical, block, armor/penetration, realm, element/reaction, mitigation, passive DR, shield break, shield and arc/evade outcomes; seeded runtime comparisons.
2. `data/skill-depth-v4/branch-resolution.json` and `game/adapter_v10_test.gd`: record the locally exercised 31 DOT and 3 drain adapter rows with explicit DEV scope. Six P2 fallbacks and 186 passive source gates remain held.
3. `CHARACTER_POWER_COMPLETION_LEDGER.json`: per-ID scope, evidence, observed runtime receipts, and remaining blockers. It does not claim canon approval or complete balance acceptance.
4. `tools/build_power_wiki.py` and `wiki/power/`: generated offline Vietnamese reference with source status, exact inventory counts, acquisition/growth rules, and acceptance status. The final GitHub run must package it at its exact tested SHA.
5. `GAMEPLAY_STATUS.md`, `GAMEPLAY_BACKLOG.md`, and this handoff: current observations and integration preconditions.

## Shared-path conflict notes

These paths differ between the feature branch and the inspected One Game branch. Do not copy either file wholesale over the other.

| Path | Feature contribution | One Game contribution | Safe integration unit |
|---|---|---|---|
| `game/main.gd` | Growth screen uses `CombatStats.player`, shows 78 values in stat-specific units, and binds detailed source breakdowns to tooltips. | Larger UI, world, gear, R13/R14/R15 art adapters, combat/video controls, and navigation changes. | Keep One Game's entire current file. Port only the growth detail/stat title and required callback hunk, retaining One Game navigation and world/art code. Verify `Stats` and `CombatStats` names against the merged file. |
| `game/data_registry.gd` | Loads 78 stat catalog/formula rows and validates all 441 ordered affinity pairs. | Adds the 32 world equipment variants after the base 128 templates are loaded. | Retain both loaders and validation. Run both 78-stat/441-affinity checks and the 160-template world gear fixture. Keep gear IDs, variant parent links, and save compatibility. |
| `.github/workflows/godot-smoke.yml` | Runs the power formula suite and Wiki validation/export. | Adds world-content stock-target tests and its current One Game checks. | Combine steps by name; keep both power and world-content tests and all later capture/export steps. Keep one final exact-SHA artifact set. |

Other One Game-only files include the public Web workflow, export settings, world economy, save changes, visual adapters, and assets. They are outside this gameplay delta and must remain untouched during integration.

## Validation evidence and open gates

- Feature baseline CI `45948600168` passed on the older SHA `457e727d0a969c637bb8dc5163828e2e4193d32a`; it is historical and does not validate this batch.
- Exact feature-branch CI, Web DEV export/browser run, uploaded screenshots/video, and earned-only 90-day comparison are pending until the implementation commit is pushed and dispatched.
- Local Godot is 4.7.2; final CI uses the repository's Godot 4.4.1 compatibility path.
- On the inspected One Game SHA `93f9f13e5145c5c8b71bc40beece27bc1566233e`, integrated Godot DEV CI 45972381548 passed, native private review 45972381513 passed, and R12 native capture 45972381549 passed. The separate public Web preview CI 45972381547 failed because `SUMMON-SKILL-NIN-066-S1` had no static actor in `tests/public-web-art.cjs`; that workflow is outside this feature delta.
- Power runtime tests use fixed seeds. A short organic starter observation is a balance signal, not a pass/fail criterion. Full progression and 90-day output must come from the exact-SHA workflow.
- Source/canon review for 144 individual profiles is partial. Profile numerics remain DEV data; the 24 signature groups are reported, not a quota to randomize.
- Of 1,152 skills, 1,146 have an enabled adapter fixture and six remain fallback/era/reflection holds. Fixture resolution is not full per-skill semantic, canon, or balance certification.
- Of 864 passives, 678 remain opt-in DEV candidates and 186 remain source-gated; the global passive gate stays OFF. Roster receipts cover a subset only.
- Of 432 branches, 396 use exact depth fields, 34 have scoped local adapter evidence, and 2 era branches remain held.
- Forms and combos have seeded runtime observations for subsets. Unobserved IDs stay explicit in the ledger; mixed match outcomes are not balance certification.
- Gear/local save checks cover representative transactions only; 128 templates and 16 slots are documented but not individually acceptance-tested.

## Integration order and preconditions

1. Review the exact feature CI and artifacts on the pushed feature SHA. Review the current One Game integrated workflow; its DEV/native checks passed at the inspected SHA, while its separate public-art check has the missing static-actor failure recorded above. Resolve that One Game-owned release/publish failure with its owner before a release decision.
2. Start integration from the newest `integration/one-game` SHA. Apply only the feature gameplay commits/deltas listed above; retain all current world, save, art, and UI changes.
3. Resolve the three shared paths by function, preserving all One Game hunks and stable IDs. In particular, keep its 32 variants so the combined gear registry remains 160 templates.
4. Run the merged registry, power, combat, branch/passive, Web DEV, browser, save reload, world-content, and gear-variant checks at the resulting integration SHA. Validate an old save with world fields and variant gear.

## Rollback

If integration regresses, revert only the new integration commit(s) that carried this delta. Preserve One Game's prior assets, save/world changes, and branch history. Do not reset the shared branch, rebase shared history, force-push, or revert unrelated One Game commits.

## Handoff decision

No merge is authorized or performed by this task. The receiving integrator should wait for exact-SHA feature evidence, then apply the narrow functional hunks above on the live One Game head. Canon review, full per-ID semantics, balance review, and any visual/art approval remain separate gates.
