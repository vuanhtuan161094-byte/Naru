# LUNA — Character Power Completion & Integration Handoff (2026-11-27)

## Mission

Continue the existing character-power overhaul as the gameplay implementation owner. Deliver playable, evidence-backed improvements, not another design-only report. Complete A–D below in large implementation batches, using shared mechanics and data-driven rules; fix failures as they appear. Do not stop after merely planning or producing a first passing fixture.

## Repository and permission boundary

- Repository: `vuanhtuan161094-byte/Naru`.
- Work only on `feature/character-power-overhaul`. Last validated implementation: `457e727d0a969c637bb8dc5163828e2e4193d32a`; exact-SHA CI run 45948600168.
- Last observed One Game HEAD: `6ab4037e854d1d0e5aae25345131c1f77dbd0ebd`. Fetch current refs before work; do not assume either ref is still unchanged.
- Owner explicitly requests this Codex/Luna gameplay assignment on the named feature branch. The historical AGENTS.md F1 blanket direct-ChatGPT-only wording predates this assignment; do not treat that as authority to operate other branches or activate/publish a Cloud environment. If the execution environment or higher-priority instructions prohibit the task, report the blocker rather than bypass it.
- Authorized: local implementation, scoped tests, commits and normal fast-forward push to the feature branch when permitted by the execution environment. No merge, rebase of shared history, force push, branch deletion, Pages deployment, secrets, or changes to onboarding/environment settings. Do not overwrite concurrent work.
- Preserve the single Godot game, stable IDs, existing save compatibility, Vietnamese UI, and D4 overlay precedence. Keep Godot 4.4.1 CI compatibility even if local Godot is 4.7.2. No dependency upgrade merely for convenience.
- ART HOLD: do not edit assets, animation, VFX, village layout, camera, public Web publishing workflow, or visual QA. One Game owner is working on these in parallel, including R14 131 interim static sprites and R15 30 building sprites. Main.gd edits limited to stat/gameplay information and necessary callbacks.

## Preflight and source of truth

Read applicable AGENTS.md, live design/d2-d HANDOVER.md and DECISION_LOG.md, branch-local status/backlog, CHARACTER_POWER_INTEGRATION_MANIFEST.json, and the relevant design and runtime contracts. Inspect CI 45948600168 and the diff against both the original base 85426e5a and the live One Game ref. Determine actual current counts from code/data/logs, not from stale descriptions. Record a compact milestone ledger before editing and maintain it in `CHARACTER_POWER_COMPLETION_LEDGER.json`; update the existing manifest and branch-local status/backlog when done. No need to read the whole repo repeatedly.

## A — Correctness and 144 individual power profiles

1. Review all 144 IDs, era, character identity, role, known abilities, chakra elements, six base/growth stats, quality/tier, fixed talent and evolution. Current 24 repeated numerical signatures are a baseline warning, not a quota to mechanically randomize. Make differentiated profiles consistent with design and canon where evidenced; distinguish intended similarity from accidental clones. Label inferred numeric values SIMULATED/DEV, cite verifiable source references when actually available; never invent canonical claims.
2. Keep exactly 78 existing stat IDs unless a verified contract explicitly requires a correction. Validate every stat's source, unit, scaling, cap, opposition, runtime consumer and relevant acquisition path. For noncombat stats demonstrate their actual progression effect; do not count catalog presence as implementation.
3. Fix Stats.breakdown reconciliation: calculate components from the same intermediate values/order as derive, including talent, fixed talent, nature, bloodline, caps and gear. Show raw rating separately from converted effectiveness. Test additive and multiplicative sources, negative/clamped edge cases and dependent stats. Avoid double application and hidden order dependence.
4. Review the AI damage estimate against actual hit resolution. Use expected absolute effect when comparing skills/targets, including coefficients, armor/penetration, accuracy/evasion, crit, realm, elemental/reaction context, block, mitigation, shields and shield break where applicable. Preserve tactical role and chakra tradeoffs. Verify genjutsu is independent of ninjutsu attack. Document semantics of shield break and test low/high shield cases rather than changing it blindly.
5. Review 21×21 affinity, including neutral Storm defaults and all seven existing reactions. Keep full matrix, symmetric/asymmetric relationships as intended by design; use marked DEV assumptions when source is absent. Do not invent unsupported new reactions or change canon to get a green test.
6. Check progression at representative early/mid/late levels, quality, stars, realms, gear and investment. Preserve intended power disparity; do not force all ninja into equal strength. Flag outliers and repair actual pathological scaling, not cosmetic numerical variance.

Done A: 144/144 profile review ledger with decisions, 78/78 stat trace ledger with executable effect evidence or explicit HOLD, complete affinity validation, targeted regression tests for breakdown and AI. Distinct signature count is reported, not itself a pass condition.

## B — Skill, passive, branch, form and combo completion

Baseline inventory (verify): 1,152 active skills (1,146 adapted, 6 fallback); 864 passives (678 DEV candidates, 186 source HOLD; default gate OFF); 432 branches (396 resolved, 34 adapter HOLD, 2 era HOLD); 54 forms; 12 combos.

- Build a single machine-readable per-ID acceptance ledger. For each entry record ID, mechanic family, source/status, actual runtime adapter, prerequisites, expected outcome, observed outcome/test reference and remaining blocker.
- Use family-level parameterized tests where genuinely equivalent; test each ID's resolved parameters, eligibility, targeting, chakra, timing, stacking and effects. Do not write 1,152 near-identical scripts. Cover multi-hit/AOE/zone, movement, summons, walls, DOT, healing, shields, cleanse, control, elements, form and combo interactions using existing contracts.
- Prioritize six fallbacks and 34 branch adapter holds; implement missing runtime adapters only when contract is supported. Preserve two era holds unless evidence resolves them.
- Review all 864 passive records and resolve 186 source gates using available design/canon or clearly labeled owner-authorized DEV inference. Do not silently fabricate source evidence or globally enable default-off passives. Certify eligibility, trigger, actual effect, stacking, duration, team aura and debuff interactions; test opt-in candidates, report default-gate decision for owner.
- Verify 54 forms and 12 combos using eligible teams and natural battle scenarios. Record triggers and actual combat outcomes; a loaded registry or artificially injected event is not natural activation. For difficult cases include reproducible seeded matches and explicit unmet conditions.
- If source or mechanism cannot be established, retain HOLD/fallback honestly, state exact ID and reason, and proceed to other items. No feature expansion beyond existing inventory.

Done B: full ID ledger without silent omissions, concrete implemented fixes, regression tests of resolved mechanics, explicit residual HOLD counts. Do not use PASS for registry-only or fixture-only evidence; distinguish implemented, runtime observed, source verified, balance reviewed.

## C — Gameplay acceptance and player-facing information

- Update the Power Wiki from actual source data, covering all 144 profiles, 78 stats, 1,152 active skills, 864 passives, 432 branches, 54 forms, 12 combos, 128 equipment templates and 16 slots, plus acquisition/growth formulas. Show costs, effects, caps, prerequisite and source/status; use Vietnamese labels. Keep searchable offline reference in the Web artifact.
- Keep gameplay-related UI changes narrow: accurate stat breakdown, skill/passive/form/gear information and meaningful player feedback. Do not redesign the shared UI/theme.
- Use representative real battles: early starter, mid-game, end-game and boss, varied roles and formations, resistance/healing/control/shield/counter interactions. Check the gameplay path with actual save/load and user controls; retain native Godot 6v6 video and browser screenshots.
- Reuse existing earned-only 90-day test, compare against baseline 120/120 wins, 150/150 resources, 63/63 recipes and 22 reload fields. Report actual progression, 141 ninja/6 beasts baseline and any changes. Do not tune tests or grant free resources merely to reproduce prior numbers. Report game balance issues separately from functional regressions.
- Test incrementally; repair failures before extending affected mechanics. Run targeted tests during development, one final integrated Godot CI/Web/browser/native capture/earned-only suite on final implementation SHA. Keep QA proportional: no repetitive full 90-day runs per small edit and no fake artifacts.

## D — Safe One Game handoff (no merge)

- Compare both branches against the shared base, detect concurrent edits, especially `game/main.gd`, `game/data_registry.gd`, `.github/workflows/godot-smoke.yml` (and any newly overlapping files). Never replace these files wholesale with older feature versions.
- Prepare a scoped delta and conflict resolution notes separating gameplay hunks from current One Game art/UI/world changes. A disposable local worktree may be used for non-published compatibility checking only if supported; no shared ref changes or merge commit.
- Preserve One Game assets/R14/R15, animation overlays, world economy and save changes, existing IDs and callbacks. If a conflict cannot be safely resolved, report exact file/hunk and recommendation, not a destructive overwrite.
- Provide explicit order of integration, regression tests, expected preconditions, rollback method and dependencies in `CHARACTER_POWER_HANDOFF.md`. State the exact One Game SHA against which compatibility was checked.

## Execution and completion

Use a short preflight, then A → B → C → D, or parallelize independent work where available without conflicting writes. Checkpoint meaningful changes in normal commits; maintain the ledger so a resumed session continues from verified state. Do not ask for approval for each non-destructive implementation step already authorized. Stop at the defined handoff, not at planning, not at an unrelated feature, and not at a false claim of completion. If access/time/tool limits interrupt work, leave a reproducible checkpoint with remaining IDs and exact blocker.

Final handoff in Vietnamese:
1. Feature branch, starting/final SHA, exact diff/commits, clean working-tree status if verified.
2. Before/after table with all inventories and separate IMPLEMENTED / OBSERVED / HOLD status; residual exact IDs and reasons.
3. Exact CI run URL, tested SHA, job/test results and actual observed log markers. If CI is pending or unavailable, say so, do not mark PASS.
4. Web DEV + Wiki, actual native Godot combat video, browser screenshots, QA logs links (or exact local paths and limitations). If artifact is not generated/uploaded, say so.
5. One Game integration delta, overlapping hunks, validation status, risks and recommended next action. Do not merge or publish.
6. Any assumptions, design decisions, unresolved gates and failures. No claims of manual art/canon approval unless actually obtained.

Acceptance: actual runnable code/data and honest evidence. Green CI alone is necessary but not sufficient for full gameplay acceptance. Preserve completed functionality rather than rebuilding it.
