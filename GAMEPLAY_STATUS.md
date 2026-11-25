# GAMEPLAY_STATUS — 25/11/2026
Latest tested implementation: `a61b6e59a87c2f3c93cf37bb252ccb733e0d2714`. Godot 4.4.1 headless; 97 scoped assertions PASS at [CI 45551319990](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/45551319990). Documentation-only HEAD may differ. No GUI smoke, export artifacts, or all-skill/21-gate acceptance claimed.
## Batch evidence
| Batch | Code SHA | CI | Scope |
|---|---|---|---|
| GP-P3B/P2C partial | e42644ed | [45550857956](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/45550857956) PASS | 48 typed stats, talent, mastery, form gates/activation and trial/quality gates |
| GP-P4/GP-P5A-B/GP-P6 partial | 3b69d0a | [45550976926](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/45550976926) PASS | HQ 1→9, actual workshop construction, jobs, recipe output, stamina, offline cap/replay |
| GP-P5/GP-P7 partial | 64ce2478 | [45551141063](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/45551141063) PASS | 60 territories, 71 routes, 9 faction stocks, trade and arrival, NPC tick |
| GP-P6/GP-P8 partial | a61b6e59 | [45551319990](https://github.com/vuanhtuan161094-byte/Naru/actions/runs/45551319990) PASS | 24 bosses, 81 quests, missions, 12 combos, 9 beasts, 11 summon contracts; scoped tests boss shield once, daily quest, dispatch/arrival, summon ownership/cooldown and gates |
## Remaining
- Combat: per-source shields, spatial reactions/weather, accurate effect dispatch, all unlocked skills, stat coverage, permanent anti-farm, gear affixes/sets/quality, tests for each authored effect family; full individual 1152-skill verification not done.
- Growth: trial and quality duel code exists, success-path tests beyond gate/fixture remain. Native bloodline only; Rinnegan and implants held pending compatibility. Beast encounter uses DEV host-template proxy, capture success not verified. Summon +30 chakra/40s CD, beast +3% sqrt(level) proposed.
- Economy: all definitions loaded, real workshop construction proven, crafting success earlier via CI fixture; full resource reachability and balance not established. Mission/trial/boss resource sources gated by qualifying events, not passive rewards; profession quality/talents/compatibility incomplete.
- Offline: capped persisted high-water clock, stamina and NPC production tested; crash recovery, save validation/export/import and precise time-event accounting (currently up to 60s steps; local-day boundary approximate) incomplete.
- World: NPC finite stock, deterministic production/shortage trade, neutral expansion, player raid/capture code; multi-deployment, NPC infrastructure development and NPC-vs-NPC defended conquest incomplete. Raid/capture combat not fully tested.
- Campaign: boss phase seed dispatch, quest claim, timed missions and combo code; not all 120 stages or 24 bosses completed in runtime tests. Additional skill unlock UI present. Art remains DEV; no production asset, no build Web/Android/PC.
## Next ready work
GP-P2C and GP-P3B residuals, GP-P5B resource reachability and GP-P6 save hardening, GP-P7 multi-team and NPC war, GP-P8 campaign/content verification in parallel where independent. GP-P9 functional UI and asset adapter, GP-P10 DEV exports after stability. No Codex Cloud, no merge.
