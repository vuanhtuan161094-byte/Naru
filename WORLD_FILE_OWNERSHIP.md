# Chat 03 file ownership (proposed)
Exclusive: game/world_rewards.gd, game/world_progression_test.gd, .github/workflows/world-progression-smoke.yml, WORLD_STATUS.md, WORLD_BACKLOG.md, HANDOFF_00_01_02.md, WORLD_FILE_OWNERSHIP.md.
World domain: game/village_service.gd, game/content_service.gd (P1 edits); game/world_service.gd (unchanged).
Shared coordination: game/main.gd, game/save_store.gd, game/save_guard.gd; only targeted noncombat hunks in P1. Combat engine, passive_service, stats_service, skill_p2_adapter, art and registry not modified.

P2 exclusive: game/progression_quotes.gd. World service market guard added; shared main/save_store changes limited to noncombat UI/progression.