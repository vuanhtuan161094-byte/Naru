# PRODUCT P4 — P3 regression correction

P3 CI 45749302419 and 45749231642 failed new passive fixture: all 144 registry pilot-row lists exist by design, only 12 have P2 patches. Correct membership based on actual 72 patched IDs, retain mixed fallback by default when pilot enabled, explicit false isolates 12, P1/holds unchanged. Test checks 12/144 membership and both modes. New exact CI required. P3 art remains private review only.
