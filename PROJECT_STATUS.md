# PROJECT_STATUS — F1 snapshot 25/11/2026
Naru One Game. Snapshot, not live status. Read current HEAD on next review.
Design 86f784ec251712ae780f7fc555bf2ca89ff074a0, PR #1 open draft not merged. Gameplay 53739d1d4925ccb97bba07fad0f09216b242cba8: GP-P3A CI 45549766017 success, skill level/grade and gear transactions (workshop fixture only); no export/full QA. Prior GP-P2B CI 45549608200 also passed. Art 59b2cced2f84c418ad651a51b95d3d711cae3045: six R5 candidates and four R3 style tests, manifests only, no approved production binaries. Main b44b99dc0e3749e816cdb6c82fb8ba15219465cd.
## Live documents
- [Gameplay status](https://github.com/vuanhtuan161094-byte/Naru/blob/implementation/e3-gameplay/GAMEPLAY_STATUS.md), [backlog](https://github.com/vuanhtuan161094-byte/Naru/blob/implementation/e3-gameplay/GAMEPLAY_BACKLOG.md).
- [Art status](https://github.com/vuanhtuan161094-byte/Naru/blob/art/e3-art01/ART_STATUS.md), [backlog](https://github.com/vuanhtuan161094-byte/Naru/blob/art/e3-art01/ART_BACKLOG.md), [registry](https://github.com/vuanhtuan161094-byte/Naru/blob/art/e3-art01/ASSET_REGISTRY.json).
- [Decisions](DECISION_LOG.md), [integration](INTEGRATION_LOG.md), [handover](HANDOVER.md).
## Next
01 GP-P3B, GP-P5A real workshop construction, remaining GP-P2C effect semantics, then remaining systems. 02 ART-P1R6 + independent VFX/environment. 00 review only on demand, owner decisions, integration/build.
Risks: R3/R5 binaries private chat only, need durable storage; CI not release acceptance; D4 proposals not all verified. No merge/no Codex Cloud. F1 management updates do not constitute game code or asset production.

## F1 management commits
Gameplay status/backlog: 844d15e5fa017a55be6dd6d666468a1197d5bd61; art status/backlog/registry: 04cd78b70fcb8909348afbf92a44ddee70534f4e. These are documentation/registry commits, not new gameplay or art production. GP-P3A landed during F1; expected-SHA check prevented overwriting it.
