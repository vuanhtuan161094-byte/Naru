# Lô B — 136 kỹ năng
Các giá trị chakra theo sao là preview chưa tính nhánh hoặc hiệu suất cấp độ. Hệ số hiệu ứng tính trên tổng mỗi mục tiêu; không mặc định là sát thương. Nguồn và HOLD không thay đổi.

## NIN-002

### NIN-002-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.

### NIN-002-S1 — Hào hỏa cầu
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-002-S1-B1 Hào hỏa cầu — Uy lực; effect.total_coefficient ×1.12 | NIN-002-S1-B2 Hào hỏa cầu — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.

### NIN-002-S2 — Sư tử liên đạn
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.

### NIN-002-S3 — Shuriken dây thép
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.

### NIN-002-S4 — Sharingan quan sát
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.

### NIN-002-S5 — Chidori
- Khống chế (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-002-S5-B1 Chidori — Uy lực; effect.total_coefficient ×1.12 | NIN-002-S5-B2 Chidori — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE, S3_SOUND.

### NIN-002-S6 — Chidori đột kích
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-002-S6-B1 Chidori đột kích — Uy lực; effect.total_coefficient ×1.12 | NIN-002-S6-B2 Chidori đột kích — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: cảnh 3, NIN-002-S1 giai 2, thành thạo 500; CHALLENGE-NIN-002-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.

### NIN-002-S7 — Ấn chú: bộc phát
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-002-F2","requires_unlock":true,"shared_group":"NIN-002-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-002-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-002-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.

## NIN-003

### NIN-003-S0 — Đòn phòng vệ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO.

### NIN-003-S1 — Giải ảo thuật
- Cường hóa/giải thuật (cleanse); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":2,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_has_dispellable_status; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO.

### NIN-003-S2 — Sơ cứu hỗ trợ (mô phỏng)
- Trị liệu (heal); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_hp_below_75pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO.

### NIN-003-S3 — Điều hòa chakra
- Chakra (chakra_regen); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.magnitude base*(1+.20*r) (authored regen multiplier; actual missing CP).
- Tham số cơ chế: {"duration_s":6,"magnitude":0.25}.
- Nhánh: không phân nhánh.
- Điều kiện: chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO.

### NIN-003-S4 — Bảo vệ đồng đội
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 115%; Giai 1/3/10 cấp 20: 158.7% / 273.7% / 676.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO.

### NIN-003-S5 — Ý chí Đội 7
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"attack","magnitude":0.12,"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO.

### NIN-003-S6 — Giải ảo đồng đội
- Cường hóa/giải thuật (cleanse); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":2,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-003-S1 giai 2, thành thạo 500; CHALLENGE-NIN-003-1 — 3 lần cleanse_effective, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO.

### NIN-003-S7 — Kunai hỗ trợ
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-003-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-003-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, S3_SAKURA, S3_INO. Cân bằng V4: RETAIN_DEV — late unlock and conditional utility require full loadout.

## NIN-005

### NIN-005-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA.

### NIN-005-S1 — Bẫy dây
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-005-S2 — Bảo vệ học viên
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 115%; Giai 1/3/10 cấp 20: 158.7% / 273.7% / 676.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA.

### NIN-005-S3 — Bẫy dây học viện
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA.

### NIN-005-S4 — Lá chắn học viên
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA.

### NIN-005-S5 — Ý chí người thầy
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"attack","magnitude":0.12,"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA.

### NIN-005-S6 — Kunai cứu viện
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-005-S1 giai 2, thành thạo 500; CHALLENGE-NIN-005-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA.

### NIN-005-S7 — Bảo hộ đồng đội
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-005-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-005-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_IRUKA.

## NIN-006

### NIN-006-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-006-S1 — Ảnh phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-006-S2 — Đòn đánh bất ngờ
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-006-S3 — Biến hóa đánh lạc hướng
- Khống chế (decoy); single, tầm 3 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 45%; Giai 1/3/10 cấp 20: 62.1% / 107.1% / 264.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"taunt","status_s":1.5,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_targeting_ally; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-006-S4 — Phân thân tập sự
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-006-S5 — Phân thân liên kích tập sự
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-006-S6 — Shuriken liên kích
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-006-S1 giai 2, thành thạo 500; CHALLENGE-NIN-006-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-006-S7 — Rasengan tập sự (kiểm tra thời kỳ)
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 198%; Giai 1/3/10 cấp 20: 273.24% / 471.24% / 1164.24%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-006-S7-B1 Rasengan tập sự (kiểm tra thời kỳ) — Uy lực; effect.total_coefficient ×1.12 | NIN-006-S7-B2 Rasengan tập sự (kiểm tra thời kỳ) — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: cảnh 6, NIN-006-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-006-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; HOLD_NEW_OVERLAY_RETAIN_LEGACY_ID; S3_SOUND.

## NIN-007

### NIN-007-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.

### NIN-007-S1 — Ảnh mô phỏng
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-007-S2 — Bẫy bóng
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.

### NIN-007-S3 — Bẫy bóng lan rộng
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.

### NIN-007-S4 — Bóng che đồng đội
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 115%; Giai 1/3/10 cấp 20: 158.7% / 273.7% / 676.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.

### NIN-007-S5 — Ảnh trói
- Khống chế (status); line, tầm 5.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 123%; Giai 1/3/10 cấp 20: 169.74% / 292.74% / 723.24%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":1.8,"chance":0.8}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.

### NIN-007-S6 — Bóng khóa chân
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 90%; Giai 1/3/10 cấp 20: 124.2% / 214.2% / 529.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-007-S1 giai 2, thành thạo 500; CHALLENGE-NIN-007-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.

### NIN-007-S7 — Kế phản công
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 147%; Giai 1/3/10 cấp 20: 202.86% / 349.86% / 864.36%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-007-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-007-2 — 5 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.

## NIN-008

### NIN-008-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-008-S1 — Bội hóa
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-008-F1","requires_unlock":true,"shared_group":"NIN-008-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-008-S2 — Nhục đạn chiến xa
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-008-S3 — Bội hóa cánh tay
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-008-S4 — Phòng thủ bội hóa
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-008-S5 — Siêu bội hóa
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-008-F1","requires_unlock":true,"shared_group":"NIN-008-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-008-S6 — Nhục đạn gai
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-008-S1 giai 2, thành thạo 500; CHALLENGE-NIN-008-1 — 3 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

### NIN-008-S7 — Điệp hóa
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-008-F2","requires_unlock":true,"shared_group":"NIN-008-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-008-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-008-2 — 5 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND.

## NIN-009

### NIN-009-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO.

### NIN-009-S1 — Tâm chuyển thân
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-009-S2 — Cảm ứng đối thủ
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO.

### NIN-009-S3 — Tâm chuyển thân đánh lạc hướng
- Khống chế (status); single, tầm 4.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 40%; Giai 1/3/10 cấp 20: 55.2% / 95.2% / 235.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"blind","status_s":3,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO.

### NIN-009-S4 — Cảm ứng chakra
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO.

### NIN-009-S5 — Khống chế tâm trí
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 109%; Giai 1/3/10 cấp 20: 150.42% / 259.42% / 640.92%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO.

### NIN-009-S6 — Tâm liên kết
- Chakra (chakra_restore); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.chakra_amount base*(1+.25*r) (actual missing CP; no self return above paid CP).
- Tham số cơ chế: {"chakra_amount":12,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-009-S1 giai 2, thành thạo 500; CHALLENGE-NIN-009-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO.

### NIN-009-S7 — Nhiễu tinh thần
- Khống chế (status); circle_target, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 68%; Giai 1/3/10 cấp 20: 93.84% / 161.84% / 399.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-009-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-009-2 — 5 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_INO. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

## NIN-010

### NIN-010-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-010-S1 — Bạch nhãn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-010-S2 — Nhu quyền
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-010-S3 — Nhu quyền điểm huyệt
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-010-S4 — Bạch nhãn quan sát
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-010-S5 — Liên kích nhu quyền
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-010-S6 — Bát quái liên chưởng
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-010-S6-B1 Bát quái liên chưởng — Uy lực; effect.total_coefficient ×1.12 | NIN-010-S6-B2 Bát quái liên chưởng — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: cảnh 3, NIN-010-S1 giai 2, thành thạo 500; CHALLENGE-NIN-010-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-010-S7 — Nhu quyền phòng vệ
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 147%; Giai 1/3/10 cấp 20: 202.86% / 349.86% / 864.36%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-010-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-010-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

## NIN-011

### NIN-011-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

### NIN-011-S1 — Tứ cước thuật
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

### NIN-011-S2 — Nhân thú phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.32,"attack_fraction":0.25,"no_recursive":true,"role":"track_bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

### NIN-011-S3 — Akamaru phối hợp
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

### NIN-011-S4 — Thú hóa
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

### NIN-011-S5 — Nha thông nha
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

### NIN-011-S6 — Nha thông nha đột kích
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-011-S1 giai 2, thành thạo 500; CHALLENGE-NIN-011-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

### NIN-011-S7 — Dấu mùi truy kích
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 28%; Giai 1/3/10 cấp 20: 38.64% / 66.64% / 164.64%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-011-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-011-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SOUND, S3_TEAM8, S3_TEAM8B.

## NIN-012

### NIN-012-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-012-S1 — Ký hoại trùng
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B. Cân bằng V4: RETAIN_DEV — net resource change not damage; enforce conservation.

### NIN-012-S2 — Trùng phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-012-S3 — Trùng dò đường
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-012-S4 — Trùng bám chakra
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-012-S5 — Trùng thực chakra
- Chakra (chakra_drain); line, tầm 5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 145%; Giai 1/3/10 cấp 20: 200.1% / 345.1% / 852.6%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":8,"transfer_fraction":0.3}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-012-S6 — Trùng hộ vệ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-012-S1 giai 2, thành thạo 500; CHALLENGE-NIN-012-1 — 3 lần resource_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

### NIN-012-S7 — Trùng bao vây
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-012-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-012-2 — 5 lần resource_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_TEAM8, S3_TEAM8B.

## NIN-013

### NIN-013-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

### NIN-013-S1 — Bạch nhãn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

### NIN-013-S2 — Bát quái chưởng hồi thiên
- Sát thương (area_damage); circle_self, tầm 0 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 135%; Giai 1/3/10 cấp 20: 186.3% / 321.3% / 793.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.6}.
- Nhánh: NIN-013-S2-B1 Bát quái chưởng hồi thiên — Uy lực; effect.total_coefficient ×1.12 | NIN-013-S2-B2 Bát quái chưởng hồi thiên — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

### NIN-013-S3 — Hồi thiên phòng thủ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

### NIN-013-S4 — Điểm huyệt chakra
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

### NIN-013-S5 — Bát quái lục thập tứ chưởng
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 326%; Giai 1/3/10 cấp 20: 449.88% / 775.88% / 1916.88%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: NIN-013-S5-B1 Bát quái lục thập tứ chưởng — Uy lực; effect.total_coefficient ×1.12 | NIN-013-S5-B2 Bát quái lục thập tứ chưởng — Liên kích nhanh; effect.params.interval_s ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

### NIN-013-S6 — Bát quái liên chưởng
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-013-S6-B1 Bát quái liên chưởng — Uy lực; effect.total_coefficient ×1.12 | NIN-013-S6-B2 Bát quái liên chưởng — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: cảnh 3, NIN-013-S1 giai 2, thành thạo 500; CHALLENGE-NIN-013-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

### NIN-013-S7 — Bạch nhãn toàn cảnh
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-013-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-013-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NEJI, S3_SOUND.

## NIN-014

### NIN-014-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY.

### NIN-014-S1 — Mộc diệp toàn phong
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-014-S1-B1 Mộc diệp toàn phong — Uy lực; effect.total_coefficient ×1.12 | NIN-014-S1-B2 Mộc diệp toàn phong — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-014-S2 — Biểu liên hoa
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 205%; Giai 1/3/10 cấp 20: 282.9% / 487.9% / 1205.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY.

### NIN-014-S3 — Mộc diệp cước
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY.

### NIN-014-S4 — Tháo tạ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY.

### NIN-014-S5 — Lý liên hoa
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 297%; Giai 1/3/10 cấp 20: 409.86% / 706.86% / 1746.36%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0; hình thái NIN-014-F1.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY.

### NIN-014-S6 — Liên hoa phản công
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 147%; Giai 1/3/10 cấp 20: 202.86% / 349.86% / 864.36%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-014-S1 giai 2, thành thạo 500; CHALLENGE-NIN-014-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY.

### NIN-014-S7 — Bát môn sơ khai
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-014-F1","requires_unlock":true,"shared_group":"NIN-014-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-014-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-014-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; LEE, S3_SOUND, S3_GUY.

## NIN-015

### NIN-015-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.

### NIN-015-S1 — Phóng nhẫn cụ
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-015-S2 — Bẫy phi tiêu
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.

### NIN-015-S3 — Cuộn phi tiêu
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.

### NIN-015-S4 — Mưa shuriken
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-015-S4-B1 Mưa shuriken — Uy lực; effect.total_coefficient ×1.12 | NIN-015-S4-B2 Mưa shuriken — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.

### NIN-015-S5 — Mưa nhẫn cụ
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: NIN-015-S5-B1 Mưa nhẫn cụ — Uy lực; effect.total_coefficient ×1.12 | NIN-015-S5-B2 Mưa nhẫn cụ — Liên kích nhanh; effect.params.interval_s ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.

### NIN-015-S6 — Kunai dây trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 62%; Giai 1/3/10 cấp 20: 85.56% / 147.56% / 364.56%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-015-S1 giai 2, thành thạo 500; CHALLENGE-NIN-015-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.

### NIN-015-S7 — Đại cuộn nhẫn cụ
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-015-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-015-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.

## NIN-016

### NIN-016-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_GUY.

### NIN-016-S1 — Mộc diệp đại toàn phong
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-016-S1-B1 Mộc diệp đại toàn phong — Uy lực; effect.total_coefficient ×1.12 | NIN-016-S1-B2 Mộc diệp đại toàn phong — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_GUY. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-016-S2 — Mở Bát Môn
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-016-F1","requires_unlock":true,"shared_group":"NIN-016-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_GUY.

### NIN-016-S3 — Mộc Diệp Đại Toàn Phong: đột kích
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 205%; Giai 1/3/10 cấp 20: 282.9% / 487.9% / 1205.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-016-S3-B1 Mộc Diệp Đại Toàn Phong: đột kích — Uy lực; effect.total_coefficient ×1.12 | NIN-016-S3-B2 Mộc Diệp Đại Toàn Phong: đột kích — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_GUY.

### NIN-016-S4 — Bát Môn khai mở
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_GUY.

### NIN-016-S5 — Triều khổng tước
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 225%; Giai 1/3/10 cấp 20: 310.5% / 535.5% / 1323%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0; hình thái NIN-016-F1.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_GUY.

### NIN-016-S6 — Trú hổ
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-016-S1 giai 2, thành thạo 500; CHALLENGE-NIN-016-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-016-F1.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_GUY.

### NIN-016-S7 — Tịch tượng
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-016-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-016-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-016-F1.
- Nguồn: PARTIAL_NOT_FULL_CANON; HOLD_NEW_OVERLAY_RETAIN_LEGACY_ID; S3_GUY.

## NIN-017

### NIN-017-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA.

### NIN-017-S1 — Phi yến
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA. Cân bằng V4: RETAIN_DEV — early slot designed for frequent use; full rotation needed.

### NIN-017-S2 — Hôi tích thiêu
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA. Cân bằng V4: RETAIN_DEV — retain pending full loadout comparison; mixed slot and mechanics proxy not decisive.

### NIN-017-S3 — Phong độn chakra đao
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: NIN-017-S3-B1 Phong độn chakra đao — Uy lực; effect.total_coefficient ×1.12 | NIN-017-S3-B2 Phong độn chakra đao — Liên kích nhanh; effect.params.interval_s ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA.

### NIN-017-S4 — Hỏa độn tro nóng
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-017-S4-B1 Hỏa độn tro nóng — Uy lực; effect.total_coefficient ×1.12 | NIN-017-S4-B2 Hỏa độn tro nóng — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA.

### NIN-017-S5 — Chakra đao liên kích
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA.

### NIN-017-S6 — Phi yến liên trảm
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-017-S1 giai 2, thành thạo 500; CHALLENGE-NIN-017-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA.

### NIN-017-S7 — Phong áp bảo vệ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-017-S7-B1 Phong áp bảo vệ — Hộ thể; effect.total_coefficient ×1.12 | NIN-017-S7-B2 Phong áp bảo vệ — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: cảnh 6, NIN-017-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-017-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_ASUMA.

## NIN-018

### NIN-018-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI.

### NIN-018-S1 — Ảo thuật trói cây
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-018-S2 — Giải ảo
- Cường hóa/giải thuật (cleanse); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":2,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_has_dispellable_status; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI.

### NIN-018-S3 — Ảo thuật hoa ảnh
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI.

### NIN-018-S4 — Phá ảo đồng đội
- Cường hóa/giải thuật (cleanse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":1,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_has_dispellable_status; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI.

### NIN-018-S5 — Mộng cảnh trói buộc
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 109%; Giai 1/3/10 cấp 20: 150.42% / 259.42% / 640.92%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI.

### NIN-018-S6 — Ảo thuật cây trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 62%; Giai 1/3/10 cấp 20: 85.56% / 147.56% / 364.56%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-018-S1 giai 2, thành thạo 500; CHALLENGE-NIN-018-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI.

### NIN-018-S7 — Màn sương ảo giác
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-018-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-018-2 — 5 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KURENAI.

## NIN-019

### NIN-019-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.

### NIN-019-S1 — Hỏa độn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-019-S1-B1 Hỏa độn — Uy lực; effect.total_coefficient ×1.12 | NIN-019-S1-B2 Hỏa độn — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.

### NIN-019-S2 — Thông linh Enma
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.

### NIN-019-S3 — Thổ độn tường đất
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- Nhánh: NIN-019-S3-B1 Thổ độn tường đất — Kiên cố; effect.params.duration_s ×1.12 | NIN-019-S3-B2 Thổ độn tường đất — Tường rộng; effect.params.width_m ×1.12.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.

### NIN-019-S4 — Hỏa độn hỏa long
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-019-S4-B1 Hỏa độn hỏa long — Uy lực; effect.total_coefficient ×1.12 | NIN-019-S4-B2 Hỏa độn hỏa long — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.

### NIN-019-S5 — Ngũ hành liên kích
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.

### NIN-019-S6 — Enma kim cương trụ
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 147%; Giai 1/3/10 cấp 20: 202.86% / 349.86% / 864.36%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-019-S1 giai 2, thành thạo 500; CHALLENGE-NIN-019-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.

### NIN-019-S7 — Ngũ hành phòng tuyến
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-019-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-019-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_OROCHI, S3B_SANIN.