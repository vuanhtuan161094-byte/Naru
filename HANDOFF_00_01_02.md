# Chat 03 integration handoff P1
Chat 00: Review reward inbox routing for finite rewards/refunds, invalid legacy link recovery policy and branch ownership; numerical balance remains D4/DEV. No new canon decision.
Chat 01: shared changes are narrowly scoped in game/save_store.gd (reward routing only), game/save_guard.gd (validation), game/main.gd (noncombat UI methods). Integrate hunks, never wholesale overwrite newer main/save_store; preserve passive and combat edits. Existing Combat engine is unchanged. Keep progression IDs and schema 1; no new mandatory fields. Campaign/territory calls use existing engine.
Chat 02: no asset changes; UI text/layout changes need visual review after private art integration.
CI: World DEV separate workflow. Exact branch SHA and CI must be checked before any acceptance. No merge, force push or Codex Cloud.
