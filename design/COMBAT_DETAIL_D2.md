# D2 — Combat semantics and balance gaps
The initial 864 skills have been reclassified by name for consistency, plus six manually curated loadouts (NIN-001,004,041,042,043,060). Curated means designed for Naru, not proof that every skill is available in that era. All other names/effects use a heuristic pass; no canon validation guarantee. Status placeholders marked REVIEW are not production-ready. Susanoo and Bách Hào are transform effects, not generic control or heal. Skill payloads contain temporary coefficients; balancing and individual AoE shapes, timings, interrupts, DoT ticks, cooldown and cost still require a specific pass.

## Combat resolution
1. Choose target and skill via utility score; invalidate if target dead/out of range, chakra insufficient or cooldown active.
2. Reserve chakra and cooldown at cast start; cancellation policy: refund only if interrupted before release (proposal).
3. Resolve accuracy, then damage type (physical/ninjutsu/genjutsu); compute armor or resist after penetration, crit, affinity, realm suppression, shield then HP. Damage reduction clamp and hit floor per balance_rules.json.
4. Update movement and field effects, resolve a reaction only once per cast pair and 2s cooldown, then enqueue hit/kill/heal event.
5. After battle, heal ninja; record permanent stat contribution from eligible effective actions only. Do not count damage to friendly summons, overheal, idle loops or zero difficulty.
6. Summons bounded per skill/owner and lifetime; no nested summon loops; no extra player team slot. Each new skill has an AI utility rule and consumes normal time/chakra; do not silently discard unlocked skills. Transform may swap authored skills and add skills without removing progression state.

## Proposed finite chance caps
Hit 15–99%; crit chance rating/(rating+100) with 75% cap; evasion already enters hit calculation; damage reduction <=65%, CDR <=50%, control duration reduction <=70%, lifesteal <=35%. Permanent stat rating has no hard storage cap. Critical damage multiplier base 1.5 plus min(2,rating/(100+rating)*2). Heal = NATK*coefficient*(1+healing/(100+healing)); shield = NATK*coef, max stack per caster, never infinite renewal with no cost. Physical, ninjutsu, genjutsu must get explicit damage_type before runtime (not infer from element alone).

## Unresolved
- Per-skill canon evidence, damage type, AI utility, AoE, projectile/cast timings, status payloads; true skill trees across all grades; 48 complete derived-stat formulas; equipment set/affix pools; all NPC map adjacency and campaign encounters. No simulation engine yet.
- Need validate economy recipes and alternative acquisition against zero-stock deadlocks; direct food purchase/supply optional, no maintenance.
- 8 quality ranks are initial proposed taxonomy; raising max_quality beyond 8 is not yet decided. Stars fixed maximum 15.
