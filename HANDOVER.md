# HANDOVER — F1 / 25-11-2026
## Branch ownership and recovery
00 coordinator: design/d2-d; PROJECT_STATUS.md, DECISION_LOG.md, INTEGRATION_LOG.md, HANDOVER.md.
01 gameplay: implementation/e3-gameplay; GAMEPLAY_STATUS.md, GAMEPLAY_BACKLOG.md, game/IMPLEMENTATION_STATUS.md.
02 art: art/e3-art01; ART_STATUS.md, ART_BACKLOG.md, ASSET_REGISTRY.json.
All work direct ChatGPT; no Codex Cloud; no merge, force-push, branch deletion or second game. GitHub is canonical for code/design/status; private art files require separate durable storage. No automatic cross-chat messages or unattended work. User opens each chat independently.
## Start every batch
Read live HEAD of own branch and live design/d2-d HANDOVER.md, DECISION_LOG.md, ASSET_INTERFACE.md. Read local STATUS/BACKLOG. Check actual files, CI and asset binaries; choose READY backlog tasks, implement coherent large batch, keep working on independent tasks when blocked. No waiting for other stream. Preserve V0.1–V1.0 and D4 contract precedence. Record proposed tuning separately from owner-approved decisions.
## End every batch
Update status and backlog in same commit or immediately afterward. Include date, batch ID, branch, evidence code/art SHA, implemented/partial/missing, actual tests + run URLs and scope, artifact paths/hash/availability, blocker, decision changes and next READY IDs. Distinguish current documentation HEAD from tested implementation SHA. Verify current HEAD and use expected_sha for ref updates; if changed, reread and reconcile, never force. Do not copy entire transcript.
Task states: BACKLOG, READY, IN_PROGRESS, BLOCKED, REVIEW, DONE. DONE only for scoped evidence. QA: NOT_RUN/PASS/FAIL/BLOCKED. Asset: MISSING/DEV/REVIEW_ONLY/APPROVED/INTEGRATED; approval is not upload or rights clearance. 
## When a chat gets full
Create another chat in same Project Naruto and give role, repo, branch. Read these files and live HEAD; resume first READY tasks; do not redo prior work. Old chat need not be deleted. User can continue the faster stream without waiting. Coordinator review only for owner decisions, asset approvals, integration, build, conflicts or status requests.
## Asset persistence
Keep private originals/ZIP in durable user-controlled storage, record exact SHA-256 and location. Chat attachment filename alone is not durable proof. If missing, mark BLOCKED and request exact reference only when needed; continue unrelated work. Public repo must not receive unlicensed art. Do not claim manifest means actual files uploaded.
## Integration
Follow INTEGRATION_LOG.md. No cross-branch edits except explicit coordination/integration permission. Actual approved files plus rights, hashes, metadata and runtime smoke required. One game only; public DEV fallback if private assets cannot be distributed.


## PRODUCT-AUDIT / Wiki / SKILL-P4 (25/11/2026)
Wiki `wiki/README.md`: 144 ninja/1152 skills, 54 forms/12 combos, progression, 150 resources, 63 recipes, 30 buildings, 128 gear, 15 jobs, 120 stages, 24 chapters, 60 territories,81 quests,288 trials. SKILL-P4 reviewed 248 prior missing-pointer rows with 30 source records (22 official,4 licensed,4 secondary); all 1152 now have context pointers, not individual canon proof. Prior source ledgers inherited, 6 new limited technique/role links. Product audit pinned 197bd5d1 CI 45582064721 PASS, 1134 confirmed/18 fallback; 17 UI navigation, V6 artifact 15007960377, art 100f1b1d CI 45576264528 safe DEV only, 12 static/14 VFX candidates, 0 complete clips/approved. P3/P4/P1 not present in checked gameplay tree. 21 baseline gates + 9 completion gates; no final acceptance. Read `design/product-audit/HANDOFF_01_02.md`. No gameplay/art writes or merge.
