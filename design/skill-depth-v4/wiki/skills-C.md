# Lô C — 136 kỹ năng
Các giá trị chakra theo sao là preview chưa tính nhánh hoặc hiệu suất cấp độ. Hệ số hiệu ứng tính trên tổng mỗi mục tiêu; không mặc định là sát thương. Nguồn và HOLD không thay đổi.

## NIN-020

### NIN-020-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA.

### NIN-020-S1 — Dầu cóc
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-020-S2 — Thông linh cóc
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.4,"no_recursive":true,"role":"frontline","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA.

### NIN-020-S3 — Dầu cóc trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA.

### NIN-020-S4 — Kết giới cảm ứng
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA.

### NIN-020-S5 — Rasengan
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-020-S5-B1 Rasengan — Uy lực; effect.total_coefficient ×1.12 | NIN-020-S5-B2 Rasengan — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA.

### NIN-020-S6 — Tiên pháp hỏa độn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-020-S6-B1 Tiên pháp hỏa độn — Uy lực; effect.total_coefficient ×1.12 | NIN-020-S6-B2 Tiên pháp hỏa độn — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: cảnh 3, NIN-020-S1 giai 2, thành thạo 500; CHALLENGE-NIN-020-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA.

### NIN-020-S7 — Tiên nhân chế độ
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-020-F1","requires_unlock":true,"shared_group":"NIN-020-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-020-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-020-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; JIRAIYA.

## NIN-021

### NIN-021-S0 — Đòn phòng vệ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE.

### NIN-021-S1 — Chưởng tiên thuật
- Trị liệu (heal); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: NIN-021-S1-B1 Chưởng tiên thuật — Trị liệu sâu; effect.total_coefficient ×1.12 | NIN-021-S1-B2 Chưởng tiên thuật — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: ally_hp_below_75pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE.

### NIN-021-S2 — Quái lực
- Sát thương (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE.

### NIN-021-S3 — Quái lực địa chấn
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 230%; Giai 1/3/10 cấp 20: 317.4% / 547.4% / 1352.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE.

### NIN-021-S4 — Hồi phục khẩn
- Trị liệu (heal); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_hp_below_75pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE. Cân bằng V4: RETAIN_DEV — effective heal/absorb and target coverage, not raw DPS.

### NIN-021-S5 — Bách Hào
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-021-F1","requires_unlock":true,"shared_group":"NIN-021-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE.

### NIN-021-S6 — Katsuyu phân thể
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":12,"hp_fraction":0.35,"attack_fraction":0,"no_recursive":true,"role":"heal_ally","heal_coefficient":0.35,"interval_s":2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-021-S1 giai 2, thành thạo 500; CHALLENGE-NIN-021-1 — 3 lần effective_heal, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE.

### NIN-021-S7 — Bách Hào tái sinh
- Trị liệu (heal_pulse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 3 hit.
- Hệ số gốc 198%; Giai 1/3/10 cấp 20: 273.24% / 471.24% / 1164.24%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-021-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-021-2 — 5 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TSUNADE, S3_TSUNADE.

## NIN-022

### NIN-022-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI.

### NIN-022-S1 — Tiềm ảnh xà thủ
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-022-S2 — Thoát xác
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI.

### NIN-022-S3 — Xà phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI.

### NIN-022-S4 — Xà trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI.

### NIN-022-S5 — Thông linh rắn
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI.

### NIN-022-S6 — Thoát xác — giải thuật
- Cường hóa/giải thuật (cleanse); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":2,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-022-S1 giai 2, thành thạo 500; CHALLENGE-NIN-022-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI.

### NIN-022-S7 — Bạch xà biến hóa
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-022-F1","requires_unlock":true,"shared_group":"NIN-022-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-022-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-022-2 — 5 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OROCHI.

## NIN-023

### NIN-023-S0 — Đòn phòng vệ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.

### NIN-023-S1 — Chakra no Mesu
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC. Cân bằng V4: RETAIN_DEV — net resource change not damage; enforce conservation.

### NIN-023-S2 — Trị liệu
- Trị liệu (heal); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_hp_below_75pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.

### NIN-023-S3 — Chakra no Mesu liên kích
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.

### NIN-023-S4 — Tái tạo vết thương
- Chakra (chakra_regen); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.magnitude base*(1+.20*r) (authored regen multiplier; actual missing CP).
- Tham số cơ chế: {"duration_s":6,"magnitude":0.25}.
- Nhánh: không phân nhánh.
- Điều kiện: chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.

### NIN-023-S5 — Tái tạo tế bào
- Trị liệu (heal_pulse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 3 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: allies_missing_hp; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.

### NIN-023-S6 — Thuật ngủ mê
- Khống chế (status); circle_target, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 34%; Giai 1/3/10 cấp 20: 46.92% / 80.92% / 199.92%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"sleep","status_s":1.5,"chance":0.7,"wake_on_damage":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-023-S1 giai 2, thành thạo 500; CHALLENGE-NIN-023-1 — 3 lần resource_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-023-S7 — Hồi phục tế bào
- Trị liệu (heal); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-023-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-023-2 — 5 lần effective_heal, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN, S3B_MEDIC. Cân bằng V4: RETAIN_DEV — effective heal/absorb and target coverage, not raw DPS.

## NIN-024

### NIN-024-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND.

### NIN-024-S1 — Sa phược cữu
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: NIN-024-S1-B1 Sa phược cữu — Uy lực; effect.total_coefficient ×1.12 | NIN-024-S1-B2 Sa phược cữu — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-024-S2 — Sa thuẫn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: NIN-024-S2-B1 Sa thuẫn — Cường hóa defense; effect.params.magnitude ×1.1 | NIN-024-S2-B2 Sa thuẫn — Duy trì; effect.params.duration_s ×1.12.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND.

### NIN-024-S3 — Sa phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.35,"attack_fraction":0.25,"no_recursive":true,"role":"guard","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND.

### NIN-024-S4 — Cát tự vệ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 115%; Giai 1/3/10 cấp 20: 158.7% / 273.7% / 676.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-024-S4-B1 Cát tự vệ — Hộ thể; effect.total_coefficient ×1.12 | NIN-024-S4-B2 Cát tự vệ — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND.

### NIN-024-S5 — Sa bộc tống táng
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: NIN-024-S5-B1 Sa bộc tống táng — Uy lực; effect.total_coefficient ×1.12 | NIN-024-S5-B2 Sa bộc tống táng — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND.

### NIN-024-S6 — Sa mạc tầng trói
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-024-S6-B1 Sa mạc tầng trói — Uy lực; effect.total_coefficient ×1.12 | NIN-024-S6-B2 Sa mạc tầng trói — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 3, NIN-024-S1 giai 2, thành thạo 500; CHALLENGE-NIN-024-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND.

### NIN-024-S7 — Chakra Nhất Vĩ
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-024-F1","requires_unlock":true,"shared_group":"NIN-024-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-024-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-024-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; GAARA, SAND, S3_SOUND, S3_SAND.

## NIN-025

### NIN-025-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-025-S1 — Liêm dứu
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-025-S2 — Phong áp
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: NIN-025-S2-B1 Phong áp — Uy lực; effect.total_coefficient ×1.12 | NIN-025-S2-B2 Phong áp — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-025-S3 — Phong độn quạt gió
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-025-S3-B1 Phong độn quạt gió — Uy lực; effect.total_coefficient ×1.12 | NIN-025-S3-B2 Phong độn quạt gió — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-025-S4 — Gió đẩy lùi
- Sát thương (displace); cone, tầm 4 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 110%; Giai 1/3/10 cấp 20: 151.8% / 261.8% / 646.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-025-S5 — Đại liêm dứu
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-025-S6 — Liêm dứu diện rộng
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-025-S1 giai 2, thành thạo 500; CHALLENGE-NIN-025-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-025-S7 — Phong trận liên hoàn
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-025-S7-B1 Phong trận liên hoàn — Uy lực; effect.total_coefficient ×1.12 | NIN-025-S7-B2 Phong trận liên hoàn — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 6, NIN-025-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-025-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

## NIN-026

### NIN-026-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-026-S1 — Rối Karasu
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-026-S2 — Độc châm
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- Nhánh: NIN-026-S2-B1 Độc châm — Uy lực; effect.total_coefficient ×1.12 | NIN-026-S2-B2 Độc châm — Duy trì poison; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-026-S3 — Rối Karasu — phản kích
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-026-S4 — Khói độc
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-026-S4-B1 Khói độc — Uy lực; effect.total_coefficient ×1.12 | NIN-026-S4-B2 Khói độc — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-026-S5 — Bẫy rối
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 87%; Giai 1/3/10 cấp 20: 120.06% / 207.06% / 511.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-026-S6 — Hộp rối bẫy
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 62%; Giai 1/3/10 cấp 20: 85.56% / 147.56% / 364.56%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-026-S1 giai 2, thành thạo 500; CHALLENGE-NIN-026-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

### NIN-026-S7 — Karasu liên kết
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-026-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-026-2 — 5 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_SAND.

## NIN-027

### NIN-027-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU.

### NIN-027-S1 — Vụ ẩn thuật
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-027-S2 — Thủy phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":9,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU.

### NIN-027-S3 — Ẩn trong sương
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU.

### NIN-027-S4 — Thủy phân thân — triệu hồi
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":9,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU.

### NIN-027-S5 — Thủy long đạn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- Nhánh: NIN-027-S5-B1 Thủy long đạn — Uy lực; effect.total_coefficient ×1.12 | NIN-027-S5-B2 Thủy long đạn — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU.

### NIN-027-S6 — Đại thác nước
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-027-S1 giai 2, thành thạo 500; CHALLENGE-NIN-027-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU.

### NIN-027-S7 — Vô thanh sát nhân
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-027-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-027-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU.

## NIN-028

### NIN-028-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

### NIN-028-S1 — Thiên bản
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

### NIN-028-S2 — Băng kính
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- Nhánh: NIN-028-S2-B1 Băng kính — Kiên cố; effect.params.duration_s ×1.12 | NIN-028-S2-B2 Băng kính — Tường rộng; effect.params.width_m ×1.12.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

### NIN-028-S3 — Băng độn thiên bản
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-028-S3-B1 Băng độn thiên bản — Uy lực; effect.total_coefficient ×1.12 | NIN-028-S3-B2 Băng độn thiên bản — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

### NIN-028-S4 — Gương băng dịch chuyển
- Đặc thù (teleport); teleport_mark, tầm 7 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 150%; Giai 1/3/10 cấp 20: 207% / 357% / 882%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: owned_valid_mark_or_explicit_swap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

### NIN-028-S5 — Ma kính băng tinh
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: NIN-028-S5-B1 Ma kính băng tinh — Uy lực; effect.total_coefficient ×1.12 | NIN-028-S5-B2 Ma kính băng tinh — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

### NIN-028-S6 — Băng kính vây khốn
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-028-S6-B1 Băng kính vây khốn — Uy lực; effect.total_coefficient ×1.12 | NIN-028-S6-B2 Băng kính vây khốn — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 3, NIN-028-S1 giai 2, thành thạo 500; CHALLENGE-NIN-028-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

### NIN-028-S7 — Mưa thiên bản
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: NIN-028-S7-B1 Mưa thiên bản — Uy lực; effect.total_coefficient ×1.12 | NIN-028-S7-B2 Mưa thiên bản — Liên kích nhanh; effect.params.interval_s ×0.9.
- Điều kiện: cảnh 6, NIN-028-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-028-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_HAKU, S3_HAKU2.

## NIN-029

### NIN-029-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI.

### NIN-029-S1 — Tiềm ảnh xà thủ
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-029-S2 — Xà trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI.

### NIN-029-S3 — Xà thủ liên kích
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI.

### NIN-029-S4 — Xà dò tìm
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI.

### NIN-029-S5 — Xà tập kích
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI.

### NIN-029-S6 — Bẫy rắn
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 68%; Giai 1/3/10 cấp 20: 93.84% / 161.84% / 399.84%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-029-S1 giai 2, thành thạo 500; CHALLENGE-NIN-029-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI.

### NIN-029-S7 — Chú ấn bộc phát
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-029-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-029-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI.

## NIN-030

### NIN-030-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-030-S1 — Kiếm thuật
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-030-S2 — Ẩn thân
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-030-S3 — Thuấn thân kiếm kích
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-030-S4 — Ẩn thân kiếm sĩ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-030-S5 — Tam nhật nguyệt chi vũ
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-030-S6 — Tam nhật nguyệt liên trảm
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-030-S1 giai 2, thành thạo 500; CHALLENGE-NIN-030-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-030-S7 — Kiếm thủ phản kích
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 147%; Giai 1/3/10 cấp 20: 202.86% / 349.86% / 864.36%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-030-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-030-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

## NIN-031

### NIN-031-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI.

### NIN-031-S1 — Thẩm vấn
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-031-S2 — Áp lực tinh thần
- Khống chế (status); circle_target, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI.

### NIN-031-S3 — Áp lực thẩm vấn
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI.

### NIN-031-S4 — Bẫy dây trói
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI.

### NIN-031-S5 — Kết giới thẩm vấn
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI.

### NIN-031-S6 — Phong tỏa ý chí
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 45%; Giai 1/3/10 cấp 20: 62.1% / 107.1% / 264.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"silence","status_s":2,"chance":0.8}.
- Nhánh: NIN-031-S6-B1 Phong tỏa ý chí — Uy lực; effect.total_coefficient ×1.12 | NIN-031-S6-B2 Phong tỏa ý chí — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: cảnh 3, NIN-031-S1 giai 2, thành thạo 500; CHALLENGE-NIN-031-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI.

### NIN-031-S7 — Kết giới truy vấn
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-031-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-031-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_IBIKI.

## NIN-032

### NIN-032-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA.

### NIN-032-S1 — Thiên bản
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-032-S2 — Phản công
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA.

### NIN-032-S3 — Thiên bản đánh lạc hướng
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA.

### NIN-032-S4 — Kunai đón đòn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA.

### NIN-032-S5 — Loạt thiên bản
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 225%; Giai 1/3/10 cấp 20: 310.5% / 535.5% / 1323%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA.

### NIN-032-S6 — Thiên bản liên xạ
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-032-S1 giai 2, thành thạo 500; CHALLENGE-NIN-032-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA.

### NIN-032-S7 — Thế trận hộ vệ
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-032-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-032-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_GENMA.

## NIN-033

### NIN-033-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU.

### NIN-033-S1 — Sóng âm
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-033-S2 — Chấn động
- Khống chế (status); line, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 110%; Giai 1/3/10 cấp 20: 151.8% / 261.8% / 646.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"stun","status_s":0.8,"chance":0.8}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU.

### NIN-033-S3 — Sóng âm phá nhịp
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU.

### NIN-033-S4 — Ống khuếch đại âm
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU.

### NIN-033-S5 — Âm áp
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU.

### NIN-033-S6 — Âm chấn liên kích
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-033-S1 giai 2, thành thạo 500; CHALLENGE-NIN-033-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU.

### NIN-033-S7 — Sóng âm diện rộng
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-033-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-033-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_DOSU.

## NIN-034

### NIN-034-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU.

### NIN-034-S1 — Sóng khí
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-034-S2 — Cắt gió
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU.

### NIN-034-S3 — Khí áp đẩy lùi
- Sát thương (displace); cone, tầm 4 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 110%; Giai 1/3/10 cấp 20: 151.8% / 261.8% / 646.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU.

### NIN-034-S4 — Sóng khí nén
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU.

### NIN-034-S5 — Trảm không cực ba
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 247%; Giai 1/3/10 cấp 20: 340.86% / 587.86% / 1452.36%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU.

### NIN-034-S6 — Trảm không liên phát
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-034-S1 giai 2, thành thạo 500; CHALLENGE-NIN-034-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU.

### NIN-034-S7 — Đại khí áp
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-034-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-034-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZAKU.

## NIN-035

### NIN-035-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

### NIN-035-S1 — Chuông ảo thuật
- Khống chế (status); single, tầm 4.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 40%; Giai 1/3/10 cấp 20: 55.2% / 95.2% / 235.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"blind","status_s":3,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

### NIN-035-S2 — Thiên bản
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

### NIN-035-S3 — Chuông nhiễu giác
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

### NIN-035-S4 — Thiên bản dây chuông
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

### NIN-035-S5 — Nhiễu âm
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 109%; Giai 1/3/10 cấp 20: 150.42% / 259.42% / 640.92%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

### NIN-035-S6 — Ảo thanh phân tâm
- Khống chế (status); circle_target, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 68%; Giai 1/3/10 cấp 20: 93.84% / 161.84% / 399.84%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-035-S1 giai 2, thành thạo 500; CHALLENGE-NIN-035-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

### NIN-035-S7 — Liên xạ thiên bản
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-035-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-035-2 — 5 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_EXAM.

## NIN-036

### NIN-036-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-036-S1 — Cốt đao
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-036-S2 — Liễu chi vũ
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-036-S3 — Cốt giáp
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-036-S4 — Cốt thương
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-036-S5 — Tảo quyết chi vũ
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-036-S6 — Thiết tuyến hoa vũ
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-036-S1 giai 2, thành thạo 500; CHALLENGE-NIN-036-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-036-S7 — Tảo quyết chi vũ mở rộng
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-036-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-036-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.