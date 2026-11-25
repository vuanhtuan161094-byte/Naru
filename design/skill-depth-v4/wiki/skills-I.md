# Lô I — 136 kỹ năng
Các giá trị chakra theo sao là preview chưa tính nhánh hoặc hiệu suất cấp độ. Hệ số hiệu ứng tính trên tổng mỗi mục tiêu; không mặc định là sát thương. Nguồn và HOLD không thay đổi.

## NIN-128

### NIN-128-S0 — Đòn phòng vệ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

### NIN-128-S1 — Chưởng tiên thuật
- Trị liệu (heal); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: NIN-128-S1-B1 Chưởng tiên thuật — Trị liệu sâu; effect.total_coefficient ×1.12 | NIN-128-S1-B2 Chưởng tiên thuật — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: ally_hp_below_75pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

### NIN-128-S2 — Quái lực
- Sát thương (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

### NIN-128-S3 — Chưởng tiên thuật nhóm
- Trị liệu (heal_pulse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 3 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: NIN-128-S3-B1 Chưởng tiên thuật nhóm — Trị liệu sâu; effect.total_coefficient ×1.12 | NIN-128-S3-B2 Chưởng tiên thuật nhóm — Nhịp trị liệu; effect.params.interval_s ×0.9.
- Điều kiện: allies_missing_hp; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

### NIN-128-S4 — Quái lực địa chấn
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 230%; Giai 1/3/10 cấp 20: 317.4% / 547.4% / 1352.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

### NIN-128-S5 — Bách Hào
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-128-F1","requires_unlock":true,"shared_group":"NIN-128-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

### NIN-128-S6 — Katsuyu
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":12,"hp_fraction":0.35,"attack_fraction":0,"no_recursive":true,"role":"heal_ally","heal_coefficient":0.35,"interval_s":2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-128-S1 giai 2, thành thạo 500; CHALLENGE-NIN-128-1 — 3 lần effective_heal, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

### NIN-128-S7 — Bách Hào hồi phục
- Trị liệu (heal_pulse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 3 hit.
- Hệ số gốc 198%; Giai 1/3/10 cấp 20: 273.24% / 471.24% / 1164.24%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-128-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-128-2 — 5 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAKURA.

## NIN-129

### NIN-129-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU.

### NIN-129-S1 — Ảnh mô phỏng
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-129-S2 — Ảnh khâu
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU.

### NIN-129-S3 — Ảnh khâu — xuyên phá
- Sát thương (pierce); line, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 190%; Giai 1/3/10 cấp 20: 262.2% / 452.2% / 1117.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU.

### NIN-129-S4 — Ảnh trói diện rộng
- Khống chế (status); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":1.8,"chance":0.8}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-129-S5 — Ảnh trận chiến thuật
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU.

### NIN-129-S6 — Bóng hộ vệ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-129-S1 giai 2, thành thạo 500; CHALLENGE-NIN-129-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU.

### NIN-129-S7 — Chỉ huy chiến thuật
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-129-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-129-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SHIKAMARU.

## NIN-130

### NIN-130-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

### NIN-130-S1 — Hấp thụ nhẫn thuật
- Đặc thù (absorb); arc_self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.duration_s base*(1+.15*r) (unchanged projectile cap and chakra return).
- Tham số cơ chế: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- Nhánh: không phân nhánh.
- Điều kiện: incoming_absorbable_projectile; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

### NIN-130-S2 — Phản trả nhẫn thuật
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

### NIN-130-S3 — Hấp thu nhẫn thuật
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

### NIN-130-S4 — Phản trả chakra
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

### NIN-130-S5 — Chakra hợp nhất
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-130-F1","requires_unlock":true,"shared_group":"NIN-130-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

### NIN-130-S6 — Chakra hợp nhất — khai mở
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-130-F1","requires_unlock":true,"shared_group":"NIN-130-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-130-S1 giai 2, thành thạo 500; CHALLENGE-NIN-130-1 — 3 lần projectile_absorbed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

### NIN-130-S7 — Chakra bộc kích
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-130-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-130-2 — 5 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MOMO, KARMA.

## NIN-131

### NIN-131-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME.

### NIN-131-S1 — Vũ khí chakra
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-131-S2 — Chém chakra
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME.

### NIN-131-S3 — Đao chakra
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME.

### NIN-131-S4 — Rìu chakra
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME.

### NIN-131-S5 — Vũ khí khổng lồ
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME.

### NIN-131-S6 — Vũ khí chakra liên kích
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-131-S1 giai 2, thành thạo 500; CHALLENGE-NIN-131-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME.

### NIN-131-S7 — Đại vũ khí
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-131-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-131-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_KINSHIKI, P4_KINSHIKI_GAME.

## NIN-132

### NIN-132-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

### NIN-132-S1 — Sukunahikona
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1,"shrink_target":"caster_or_nonliving_object","never_shrink_other_living_target":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

### NIN-132-S2 — Daikokuten
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

### NIN-132-S3 — Sukunahikona né tránh
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5,"shrink_target":"caster_or_nonliving_object","never_shrink_other_living_target":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

### NIN-132-S4 — Daikokuten triệu vật
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

### NIN-132-S5 — Khối lập phương
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.9s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

### NIN-132-S6 — Khối lập phương áp chế
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-132-S1 giai 2, thành thạo 500; CHALLENGE-NIN-132-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

### NIN-132-S7 — Thu nhỏ đột kích
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 198%; Giai 1/3/10 cấp 20: 273.24% / 471.24% / 1164.24%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-132-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-132-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.

## NIN-133

### NIN-133-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME.

### NIN-133-S1 — Tia phá hủy
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-133-S2 — Hấp thụ chakra
- Đặc thù (absorb); arc_self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 8 / 7.84 / 7.68 / 7.52 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.duration_s base*(1+.15*r) (unchanged projectile cap and chakra return).
- Tham số cơ chế: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- Nhánh: không phân nhánh.
- Điều kiện: incoming_absorbable_projectile; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME.

### NIN-133-S3 — Tia mắt
- Sát thương (pierce); line, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 190%; Giai 1/3/10 cấp 20: 262.2% / 452.2% / 1117.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME.

### NIN-133-S4 — Hấp chakra
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME.

### NIN-133-S5 — Tia năng lượng
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.9s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME.

### NIN-133-S6 — Chân biến đổi
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 198%; Giai 1/3/10 cấp 20: 273.24% / 471.24% / 1164.24%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-133-S1 giai 2, thành thạo 500; CHALLENGE-NIN-133-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME.

### NIN-133-S7 — Tia phá hủy — xuyên tuyến
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-133-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-133-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME.

## NIN-134

### NIN-134-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

### NIN-134-S1 — Dấu vuốt
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

### NIN-134-S2 — Di chuyển qua dấu
- Đặc thù (teleport); teleport_mark, tầm 7 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 150%; Giai 1/3/10 cấp 20: 207% / 357% / 882%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: owned_valid_mark_or_explicit_swap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

### NIN-134-S3 — Dấu vuốt đánh dấu
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

### NIN-134-S4 — Dịch chuyển dấu
- Đặc thù (teleport); teleport_mark, tầm 7 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 150%; Giai 1/3/10 cấp 20: 207% / 357% / 882%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: owned_valid_mark_or_explicit_swap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

### NIN-134-S5 — Liên kích dấu vuốt
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 297%; Giai 1/3/10 cấp 20: 409.86% / 706.86% / 1746.36%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

### NIN-134-S6 — Vuốt liên kích
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-134-S1 giai 2, thành thạo 500; CHALLENGE-NIN-134-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

### NIN-134-S7 — Dấu vuốt tập kích
- Đặc thù (teleport); teleport_mark, tầm 7 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 169%; Giai 1/3/10 cấp 20: 233.22% / 402.22% / 993.72%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-134-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-134-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CODE.

## NIN-135

### NIN-135-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE.

### NIN-135-S1 — Sương độc
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-135-S1-B1 Sương độc — Uy lực; effect.total_coefficient ×1.12 | NIN-135-S1-B2 Sương độc — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-135-S2 — Tái sinh
- Chakra (chakra_regen); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.magnitude base*(1+.20*r) (authored regen multiplier; actual missing CP).
- Tham số cơ chế: {"duration_s":6,"magnitude":0.25}.
- Nhánh: không phân nhánh.
- Điều kiện: chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE.

### NIN-135-S3 — Sương độc — quét rộng
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- Nhánh: NIN-135-S3-B1 Sương độc — quét rộng — Uy lực; effect.total_coefficient ×1.12 | NIN-135-S3-B2 Sương độc — quét rộng — Duy trì poison; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE.

### NIN-135-S4 — Tái tạo
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE.

### NIN-135-S5 — Bộc phát cơ thể
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE.

### NIN-135-S6 — Vụ nổ cơ thể
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-135-S1 giai 2, thành thạo 500; CHALLENGE-NIN-135-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE.

### NIN-135-S7 — Độc vụ lan rộng
- Chakra (zone_drain); zone_target, tầm 5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 169%; Giai 1/3/10 cấp 20: 233.22% / 402.22% / 993.72%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.chakra_per_tick: base*(1+.50*r) actual net.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"chakra_per_tick":3,"transfer_fraction":0.3,"hit_budget":5}.
- Nhánh: NIN-135-S7-B1 Độc vụ lan rộng — Hấp thu; effect.params.chakra_per_tick ×1.1 (V4 có hợp đồng adapter, runtime HOLD) | NIN-135-S7-B2 Độc vụ lan rộng — Vùng hút; geometry.extent ×1.1.
- Điều kiện: cảnh 6, NIN-135-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-135-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_CODE.

## NIN-136

### NIN-136-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

### NIN-136-S1 — Hỏa độn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-136-S1-B1 Hỏa độn — Uy lực; effect.total_coefficient ×1.12 | NIN-136-S1-B2 Hỏa độn — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

### NIN-136-S2 — Thông linh cóc
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.4,"no_recursive":true,"role":"frontline","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

### NIN-136-S3 — Hỏa độn liên kích
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-136-S3-B1 Hỏa độn liên kích — Uy lực; effect.total_coefficient ×1.12 | NIN-136-S3-B2 Hỏa độn liên kích — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

### NIN-136-S4 — Cóc trinh sát
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

### NIN-136-S5 — Tiên thuật
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

### NIN-136-S6 — Tiên nhân chế độ
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-136-F1","requires_unlock":true,"shared_group":"NIN-136-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-136-S1 giai 2, thành thạo 500; CHALLENGE-NIN-136-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

### NIN-136-S7 — Ngọn lửa chân thực
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-136-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-136-2 — 5 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.

## NIN-137

### NIN-137-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

### NIN-137-S1 — Thiết bị khoa học
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

### NIN-137-S2 — Phân tích
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

### NIN-137-S3 — Thiết bị phân tích
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

### NIN-137-S4 — Thiết bị hỗ trợ chakra
- Chakra (chakra_restore); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.chakra_amount base*(1+.25*r) (actual missing CP; no self return above paid CP).
- Tham số cơ chế: {"chakra_amount":12,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

### NIN-137-S5 — Hỗ trợ kỹ thuật (mô phỏng)
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.15,"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

### NIN-137-S6 — Thiết bị bảo hộ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-137-S1 giai 2, thành thạo 500; CHALLENGE-NIN-137-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

### NIN-137-S7 — Tín hiệu tác chiến
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-137-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-137-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_PRESCIENCE.

## NIN-138

### NIN-138-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA.

### NIN-138-S1 — Senrigan
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA. Cân bằng V4: RETAIN_DEV — mobility/mark conditional value.

### NIN-138-S2 — Ảnh hưởng tinh thần
- Khống chế (beguile_tactical); circle_target, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"beguile_tactical","status_s":2,"magnitude":0.25,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- Nhánh: không phân nhánh.
- Điều kiện: eligible_enemy_threatening_caster; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA.

### NIN-138-S3 — Senrigan cảm ứng
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA.

### NIN-138-S4 — Mê hoặc mục tiêu
- Khống chế (beguile_tactical); single, tầm 4.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"beguile_tactical","status_s":2,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- Nhánh: không phân nhánh.
- Điều kiện: eligible_enemy_threatening_caster; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA.

### NIN-138-S5 — Mê hoặc chiến thuật (mô phỏng)
- Khống chế (beguile_tactical); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"beguile_tactical","status_s":3,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- Nhánh: không phân nhánh.
- Điều kiện: eligible_enemy_threatening_caster; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA.

### NIN-138-S6 — Ảnh hưởng tâm trí
- Khống chế (beguile_tactical); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5,"status":"beguile_tactical","status_s":2,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-138-S1 giai 2, thành thạo 500; CHALLENGE-NIN-138-1 — 3 lần mark_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA.

### NIN-138-S7 — Hỗ trợ thông tin
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-138-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-138-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EIDA, CYBORGS, S3_TBV, S3_EIDA.

## NIN-139

### NIN-139-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS.

### NIN-139-S1 — Phản xạ
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true,"requires_contact_with_ally":true,"boss_cap":0.15,"condition":"physical_contact_with_ally","exclude_self_inflicted":true,"no_unbounded_reflection":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS. Cân bằng V4: RETAIN_DEV — conditional trigger or displacement not raw DPS.

### NIN-139-S2 — Phản đòn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS.

### NIN-139-S3 — Thể thuật phản đòn
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS.

### NIN-139-S4 — Phản chiếu hộ thể
- Hộ thuẫn (directional_shield); arc_self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 150%; Giai 1/3/10 cấp 20: 207% / 357% / 882%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"angle_deg":120}.
- Nhánh: không phân nhánh.
- Điều kiện: incoming_frontal_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS.

### NIN-139-S5 — Phản chiếu có điều kiện
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 189%; Giai 1/3/10 cấp 20: 260.82% / 449.82% / 1111.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true,"requires_contact_with_ally":true,"boss_cap":0.15,"condition":"physical_contact_with_ally","exclude_self_inflicted":true,"no_unbounded_reflection":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS.

### NIN-139-S6 — Phản xạ — né tránh
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-139-S1 giai 2, thành thạo 500; CHALLENGE-NIN-139-1 — 3 lần counter_triggered, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS.

### NIN-139-S7 — Phản kích liên hoàn
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-139-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-139-2 — 5 lần counter_triggered, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; CYBORGS.

## NIN-140

### NIN-140-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN.

### NIN-140-S1 — Thao túng vũ khí
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-140-S2 — Sharingan
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN.

### NIN-140-S3 — Vũ khí điều khiển
- Sát thương (pierce); line, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 190%; Giai 1/3/10 cấp 20: 262.2% / 452.2% / 1117.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN.

### NIN-140-S4 — Sharingan quan sát
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN.

### NIN-140-S5 — Vũ khí liên kích
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 326%; Giai 1/3/10 cấp 20: 449.88% / 775.88% / 1916.88%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN.

### NIN-140-S6 — Phi đao trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 62%; Giai 1/3/10 cấp 20: 85.56% / 147.56% / 364.56%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-140-S1 giai 2, thành thạo 500; CHALLENGE-NIN-140-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN.

### NIN-140-S7 — Mưa vũ khí
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: NIN-140-S7-B1 Mưa vũ khí — Uy lực; effect.total_coefficient ×1.12 | NIN-140-S7-B2 Mưa vũ khí — Liên kích nhanh; effect.params.interval_s ×0.9.
- Điều kiện: cảnh 6, NIN-140-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-140-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SHIN.

## NIN-141

### NIN-141-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA.

### NIN-141-S1 — Kiếm thuật
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-141-S2 — Thủy độn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- Nhánh: NIN-141-S2-B1 Thủy độn — Uy lực; effect.total_coefficient ×1.12 | NIN-141-S2-B2 Thủy độn — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA.

### NIN-141-S3 — Hiramekarei chakra
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA.

### NIN-141-S4 — Thủy độn hỗ trợ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 115%; Giai 1/3/10 cấp 20: 158.7% / 273.7% / 676.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-141-S4-B1 Thủy độn hỗ trợ — Hộ thể; effect.total_coefficient ×1.12 | NIN-141-S4-B2 Thủy độn hỗ trợ — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA.

### NIN-141-S5 — Hiramekarei
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA.

### NIN-141-S6 — Kiếm phòng thủ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-141-S1 giai 2, thành thạo 500; CHALLENGE-NIN-141-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA.

### NIN-141-S7 — Kiếm liên trảm
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-141-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-141-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST, P4_KAGURA.

## NIN-142

### NIN-142-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-142-S1 — Thiết sa
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-142-S2 — Thiết sa thuẫn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: NIN-142-S2-B1 Thiết sa thuẫn — Cường hóa defense; effect.params.magnitude ×1.1 | NIN-142-S2-B2 Thiết sa thuẫn — Duy trì; effect.params.duration_s ×1.12.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-142-S3 — Thiết sa khiên
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-142-S3-B1 Thiết sa khiên — Hộ thể; effect.total_coefficient ×1.12 | NIN-142-S3-B2 Thiết sa khiên — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-142-S4 — Thiết sa trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: NIN-142-S4-B1 Thiết sa trói — Uy lực; effect.total_coefficient ×1.12 | NIN-142-S4-B2 Thiết sa trói — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-142-S5 — Thiết sa trận
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-142-S5-B1 Thiết sa trận — Uy lực; effect.total_coefficient ×1.12 | NIN-142-S5-B2 Thiết sa trận — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-142-S6 — Thiết sa phi tiêu
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-142-S6-B1 Thiết sa phi tiêu — Uy lực; effect.total_coefficient ×1.12 | NIN-142-S6-B2 Thiết sa phi tiêu — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: cảnh 3, NIN-142-S1 giai 2, thành thạo 500; CHALLENGE-NIN-142-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-142-S7 — Thiết sa đại trận
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: NIN-142-S7-B1 Thiết sa đại trận — Uy lực; effect.total_coefficient ×1.12 | NIN-142-S7-B2 Thiết sa đại trận — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 6, NIN-142-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-142-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.

## NIN-143

### NIN-143-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-143-S1 — Cảm âm
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV. Cân bằng V4: RETAIN_DEV — mobility/mark conditional value.

### NIN-143-S2 — Sóng âm
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-143-S3 — Cảm âm — cảm ứng nhóm
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-143-S4 — Sóng âm áp chế
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-143-S5 — Nhiễu âm
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-143-S6 — Sóng gió
- Sát thương (displace); cone, tầm 4 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 124%; Giai 1/3/10 cấp 20: 171.12% / 295.12% / 729.12%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-143-S1 giai 2, thành thạo 500; CHALLENGE-NIN-143-1 — 3 lần mark_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-143-S7 — Nhiễu âm diện rộng
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-143-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-143-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

## NIN-144

### NIN-144-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-144-S1 — Rối chiến đấu
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-144-S2 — Kiếm thuật
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-144-S3 — Rối ngụy trang
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-144-S4 — Rối hộ vệ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-144-S5 — Rối liên kích
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 326%; Giai 1/3/10 cấp 20: 449.88% / 775.88% / 1916.88%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-144-S6 — Kiếm rối liên kích
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-144-S1 giai 2, thành thạo 500; CHALLENGE-NIN-144-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.

### NIN-144-S7 — Rối chiến trận
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-144-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-144-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SAND_NNG, S3B_SAND_TBV.