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

