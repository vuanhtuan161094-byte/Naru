# SKILL-DEPTH V2 — star option C and detailed progression
Owner 2026-11-25: selected C for ninja-star influence; remain on skills only.
Status: DESIGN_REVIEW / NOT_RUNTIME. Exact wording of previous A/B/C is not recoverable from repository; working interpretation C = indirect stats + bounded direct skill efficiency, NOT a blanket second damage multiplier. Confirm interpretation before runtime handoff. Existing V1 rules otherwise remain proposed, not owner-approved by implication.
Baseline design HEAD c94ebc7d2f830c7063d7aaf908dd1013d091d6df; 1152 unique skills, 144 ninjas, 1008 trainable, 792 linear, 216 branched, 288 extra unlocks. Keep every ID, 54 forms, 12 combos and all evidence/HOLD flags. No gameplay/art commits, no merge.

## 1 Star effect
S=1..15; M=1+0.04*(S-1). Multiply natural foundation + natural level growth once; then add allocations/training/permanent/gear and derive stats once. Never multiply final damage by M again. Derived CP pool, attack, healing, shield, summon may inherit relevant actual stats, no second inheritance from owner star. Existing 48 stat caps apply.
Direct skill efficiency proposal: milestones S>=5/10/15 give cumulative 2/4/6% CP discount on eligible trained paid active skills S1..S7; zero-cost/passive/S0 are excluded; no new free cast, no additional damage multiplier, no cooldown or crowd control extension. Use base cost >0 and preserve paid cost floor max(1,ceil(base_CP * existing_skill_cost_factor * branch_cost_factor * (1-discount))). Keep separate explicit minimum cost authored by combat if higher; apply once at skill cost calculation, including forms, not again during form maintenance, summons or secondary triggered hits. Do not allow loops, additional target count or extra invulnerability. If skill already has a stricter CP cap, keep it. Direct star bonuses should not imply automatic new jutsu, forms or clan abilities. S6/S7 unlock conditions unchanged; no new gate on levels/grade/branch. CP discounts are DEV tunables pending confirmation; no new canon claim.
S1/5/10/15 -> M=1/1.16/1.36/1.56; CP reduction 0/2/4/6%. Training cap remains 20 per grade, no grade ceiling.
Star-derived stats and power score must use same calculation; no old proxy double count. Display base stat vs gear/other contributions and CP preview separately.

## 2 Skill level, grade and cost
F=1+0.50*(G-1)+0.02*(L-1); integer G>=1, 1<=L<=20. Always success for levels; at L20 grade advance costs RES-130, success resets L to 1, retains mastery and branches; fail retains everything except consumed materials, increases target-grade pity; fifth attempt guaranteed after 4 consecutive failures. No downgrade or reroll; pity persisted per ninja+skill+target_grade and atomic debit/result/save. Level cost ceil(4*L^1.35*(1+.25*G)), L is current level; physical RES-118, ninjutsu RES-119, genjutsu RES-120, neutral RES-119; use existing per-ID book. Grade cost ceil(5*G^1.45); chance max(.1,.75/(1+.15*(G-1))). Keep V1 cost/chance pending economy review. Probability expected attempts sum(q^i,i=0..4) with q=1-p. F monotonic, no star grade cap. S0 no independent training. Use total base coefficient budget per target across all hits/ticks, not F multiplied on each nested stage. Keep P2 timing/geometry/limits.
G1L1=1; G1L20=1.38; G2L1=1.50; G2L20=1.88; G3L1=2; G3L20=2.38; G5L20=3.38; G10L20=5.88. Advance gain 0.12 coefficient points, not +12% relative every grade.

## 3 Type-specific effects
Retain V1 profiles: damage/heal/shield base coeff*F; control damage if authored scales, duration capped base*(1+.20*(F-1)/F), chance unchanged. Stance numeric buff base*(1+.35*(F-1)/F); resource amount floor(base*(1+.50*(F-1)/F)); summon relevant owner stat times base fraction*(1+.50*(F-1)/F), no duplicate star; wall duration base*(1+.25*(F-1)/F) OR durability coeff*F if destructible; forms activation cost base*(1-.15*(F-1)/F), no automatic form stat scaling; utility authored damage*F else cost factor above. All non-damage skills must have meaningful progression; if zero CP and no numeric payload, HOLD for individually authored upgrade, never invent effects. No effect beyond existing caps. No damage/heal on non-authored payload. Preserve 16 P2 geometries.

## 4 Mastery and branches
Mastery 1 confirmed meaningful cast once per cast_id+actor+skill; do not count individual ticks, summon attacks, invalid/immune/overheal-only targets or trivial encounter farming. Fractional talent credit stored; settle once on legitimate win with battle_id dedupe. Preserve 500/1500 thresholds for S6/S7; use per-ID realm/prior grade/trial; no star auto-unlock. No raw damage multiplier from mastery.
216 branched skills use current B1/B2 IDs, grade>=3, mutually exclusive, persistent, no reset. B1 strengthens authored primary payload; B2 improves geometry once or efficiency where meaningful; no arbitrary target increases. If B2 CP discount, combine multiplicatively with star discount and apply cost floor once. No double radius bonus. 792 linear skills never acquire generic branch by default. 288 extra skills retain authored prerequisite ID and challenge; placeholders or evidence gaps stay HOLD.

## 5 Actual examples
NIN-041-S2 Rasengan base 1.65: G1L1 165%, G1L20 227.7%, G2L1 247.5%, G3L20 392.7%; B1 at G3 multiplies total by 1.12, G3L20 439.824%; B2 single-target CP x.90 instead. For illustrative natural NATK=1000 and other additions=200, G3L20 without branch yields raw 4712.4 at 1 star, 5340.72 at 5, 6126.12 at 10, 6911.52 at 15 before combat mitigation (actual coefficient 3.927); no direct star damage multiplier. Recompute exact from formula; final damage still uses combat adapter.
NIN-041-S5 Rasen Shuriken base 3.2: G3L20 761.6% total per target, B1 852.992%, distribute existing authored hit weights; B2 geometry x1.15 once if applicable.
NIN-043-S1 Chưởng Tiên Thuật base 1.65: heal 392.7% at G3L20, clamp actual healing to missing HP; star efficiency only if paid.
NIN-041-S1 multi-clone at G3L20: owner-fraction scaling factor 1+.5*(2.38-1)/2.38 ~=1.289916; existing cap/lifetime/role unchanged.
NIN-042-S1 Chidori Lưu base 1.45: G3L20 damage 345.1%, control duration factor at most 1.115966 before cap; star does not increase stun.
NIN-043-S5 Bách Hào: activation CP factor ~=.913025 at G3L20, star15 factor .94; no duplicate form damage or maintenance discount.

## 6 Acceptance gates
- 1152 unique IDs; 1008 trainable, 144 S0; all 216 branches/288 extra prerequisites preserved; source HOLD unchanged.
- Monotonic across L1..20 and grade boundary; no probability/level save corruption on reload; fifth guaranteed; no negative materials.
- Same gear at stars 1/5/10/15 proves natural stats increased once, non-natural additions unaffected; no stale power proxy.
- CP discount one application with existing form/branch factors, no cost below floor or free loop, no new CC/damage multiplier.
- Damage total across hits/ticks, heal actual, shields actual, summons owner stats once, utility zero-payload HOLD.
- Compare exact save before/after, no lost mastery/branch/grade, no new forced stars. P2/D4 fallback and evidence HOLD retained.
- Runtime and balance playtests NOT_RUN; keep Chat01/02 implementation independent. No handoff until owner confirms C interpretation and numeric rules.
## Next skill-only review
Individual P2 payload audit per skill (coefficients/CP/cooldown/timing/branches), 288 personal trial definitions and mastery pacing, then combat simulation and skill UI descriptions. Do not advance other systems.
