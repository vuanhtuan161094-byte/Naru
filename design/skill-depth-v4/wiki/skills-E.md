# Lô E — 136 kỹ năng
Các giá trị chakra theo sao là preview chưa tính nhánh hoặc hiệu suất cấp độ. Hệ số hiệu ứng tính trên tổng mỗi mục tiêu; không mặc định là sát thương. Nguồn và HOLD không thay đổi.

## NIN-057

### NIN-057-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

### NIN-057-S1 — Rối Kuroari
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

### NIN-057-S2 — Rối Sanshouo
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

### NIN-057-S3 — Rối Sanshouo hộ vệ
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

### NIN-057-S4 — Rối Kuroari trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

### NIN-057-S5 — Hợp kích rối
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 326%; Giai 1/3/10 cấp 20: 449.88% / 775.88% / 1916.88%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

### NIN-057-S6 — Rối Sasori
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-057-S1 giai 2, thành thạo 500; CHALLENGE-NIN-057-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

### NIN-057-S7 — Tam rối hợp kích
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-057-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-057-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_SAND.

## NIN-058

### NIN-058-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO.

### NIN-058-S1 — Dây chakra
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-058-S2 — Khiên rối
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO.

### NIN-058-S3 — Khiên chakra
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO.

### NIN-058-S4 — Rối cứu viện
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO.

### NIN-058-S5 — Thập cơ cận tùng
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 326%; Giai 1/3/10 cấp 20: 449.88% / 775.88% / 1916.88%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO.

### NIN-058-S6 — Bạch bí kỹ liên kích
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-058-S1 giai 2, thành thạo 500; CHALLENGE-NIN-058-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO.

### NIN-058-S7 — Thập cơ phòng tuyến
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-058-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-058-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_CHIYO.

## NIN-059

### NIN-059-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-059-S1 — Phong nhận
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-059-S1-B1 Phong nhận — Uy lực; effect.total_coefficient ×1.12 | NIN-059-S1-B2 Phong nhận — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-059-S2 — Kiếm gió
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-059-S3 — Kiếm gió xuyên
- Sát thương (pierce); line, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 190%; Giai 1/3/10 cấp 20: 262.2% / 452.2% / 1117.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-059-S4 — Phong áp đẩy lùi
- Sát thương (displace); cone, tầm 4 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 110%; Giai 1/3/10 cấp 20: 151.8% / 261.8% / 646.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- Nhánh: NIN-059-S4-B1 Phong áp đẩy lùi — Uy lực; effect.total_coefficient ×1.12 | NIN-059-S4-B2 Phong áp đẩy lùi — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-059-S5 — Phong trảm
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-059-S5-B1 Phong trảm — Uy lực; effect.total_coefficient ×1.12 | NIN-059-S5-B2 Phong trảm — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-059-S6 — Phong nhận liên phát
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-059-S6-B1 Phong nhận liên phát — Uy lực; effect.total_coefficient ×1.12 | NIN-059-S6-B2 Phong nhận liên phát — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: cảnh 3, NIN-059-S1 giai 2, thành thạo 500; CHALLENGE-NIN-059-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

### NIN-059-S7 — Phong trảm — chấn kích
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: NIN-059-S7-B1 Phong trảm — chấn kích — Uy lực; effect.total_coefficient ×1.12 | NIN-059-S7-B2 Phong trảm — chấn kích — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 6, NIN-059-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-059-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_HAYATE.

## NIN-061

### NIN-061-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME.

### NIN-061-S1 — Thủy giao đạn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-061-S1-B1 Thủy giao đạn — Uy lực; effect.total_coefficient ×1.12 | NIN-061-S1-B2 Thủy giao đạn — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME.

### NIN-061-S2 — Hấp thụ chakra
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 8 / 7.84 / 7.68 / 7.52 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME. Cân bằng V4: RETAIN_DEV — net resource change not damage; enforce conservation.

### NIN-061-S3 — Thủy phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":9,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME.

### NIN-061-S4 — Samehada hấp chakra
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME.

### NIN-061-S5 — Thủy lao giao vũ
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-061-S5-B1 Thủy lao giao vũ — Uy lực; effect.total_coefficient ×1.12 | NIN-061-S5-B2 Thủy lao giao vũ — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME.

### NIN-061-S6 — Thiên thực giao
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-061-S1 giai 2, thành thạo 500; CHALLENGE-NIN-061-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME.

### NIN-061-S7 — Thủy lao giao vũ — chấn kích
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65,"status":"wet","status_s":4,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-061-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-061-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KISAME.

## NIN-062

### NIN-062-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

### NIN-062-S1 — C1
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

### NIN-062-S2 — C2
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

### NIN-062-S3 — C1 phi điểu
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

### NIN-062-S4 — C2 long đạn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

### NIN-062-S5 — C3
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.9s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

### NIN-062-S6 — C3 đại bộc
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-062-S1 giai 2, thành thạo 500; CHALLENGE-NIN-062-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

### NIN-062-S7 — C4 vi thể
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-062-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-062-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; DEIDARA, S3_DEIDARA, S3B_TAKA.

## NIN-063

### NIN-063-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

### NIN-063-S1 — Độc châm
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- Nhánh: NIN-063-S1-B1 Độc châm — Uy lực; effect.total_coefficient ×1.12 | NIN-063-S1-B2 Độc châm — Duy trì poison; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

### NIN-063-S2 — Thiết sa
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

### NIN-063-S3 — Rối tam đại Kazekage
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

### NIN-063-S4 — Thiết sa trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: NIN-063-S4-B1 Thiết sa trói — Uy lực; effect.total_coefficient ×1.12 | NIN-063-S4-B2 Thiết sa trói — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

### NIN-063-S5 — Bách cơ thao diễn
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

### NIN-063-S6 — Thiết sa giới pháp
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-063-S6-B1 Thiết sa giới pháp — Uy lực; effect.total_coefficient ×1.12 | NIN-063-S6-B2 Thiết sa giới pháp — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 3, NIN-063-S1 giai 2, thành thạo 500; CHALLENGE-NIN-063-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

### NIN-063-S7 — Bách cơ hộ trận
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-063-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-063-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASORI, S3_SASORI.

## NIN-064

### NIN-064-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

### NIN-064-S1 — Liêm đao
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

### NIN-064-S2 — Nghi thức nguyền rủa
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

### NIN-064-S3 — Liêm đao tầm xa
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

### NIN-064-S4 — Nghi thức đánh dấu
- Khống chế (ritual_zone); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4,"requires_owned_mark":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

### NIN-064-S5 — Tử ti bằng huyết
- Sát thương (linked_damage); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 305%; Giai 1/3/10 cấp 20: 420.9% / 725.9% / 1793.4%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"requires_owned_mark":true,"consume_mark":true,"requires_inside_own_zone":true,"reflect_fraction":0.35,"boss_cap":0.15}.
- Nhánh: không phân nhánh.
- Điều kiện: mark_and_ritual_zone_valid; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

### NIN-064-S6 — Liêm đao phản kích
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 147%; Giai 1/3/10 cấp 20: 202.86% / 349.86% / 864.36%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-064-S1 giai 2, thành thạo 500; CHALLENGE-NIN-064-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

### NIN-064-S7 — Nguyền rủa: cộng hưởng nghi thức
- Sát thương (linked_damage); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 237%; Giai 1/3/10 cấp 20: 327.06% / 564.06% / 1393.56%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"requires_owned_mark":true,"consume_mark":true,"requires_inside_own_zone":true,"reflect_fraction":0.35,"boss_cap":0.15}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-064-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-064-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN.

## NIN-065

### NIN-065-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME.

### NIN-065-S1 — Địa oán ngu
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-065-S2 — Hỏa đầu khắc
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-065-S2-B1 Hỏa đầu khắc — Uy lực; effect.total_coefficient ×1.12 | NIN-065-S2-B2 Hỏa đầu khắc — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME.

### NIN-065-S3 — Thổ độn cứng hóa
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: NIN-065-S3-B1 Thổ độn cứng hóa — Cường hóa defense; effect.params.magnitude ×1.1 | NIN-065-S3-B2 Thổ độn cứng hóa — Duy trì; effect.params.duration_s ×1.12.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME.

### NIN-065-S4 — Mặt nạ chakra
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":14,"hp_fraction":0.3,"attack_fraction":0.35,"no_recursive":true,"role":"element_ranged","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME.

### NIN-065-S5 — Mặt nạ hợp kích
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME.

### NIN-065-S6 — Hỏa phong hợp kích
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-065-S6-B1 Hỏa phong hợp kích — Uy lực; effect.total_coefficient ×1.12 | NIN-065-S6-B2 Hỏa phong hợp kích — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: cảnh 3, NIN-065-S1 giai 2, thành thạo 500; CHALLENGE-NIN-065-1 — 3 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME.

### NIN-065-S7 — Địa oán ngu hợp thể
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-065-F1","requires_unlock":true,"shared_group":"NIN-065-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-065-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-065-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, S3_ASUMA, S3_KISAME.

## NIN-066

### NIN-066-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

### NIN-066-S1 — Giấy phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

### NIN-066-S2 — Giấy phi tiêu
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

### NIN-066-S3 — Giấy cánh
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

### NIN-066-S4 — Giấy phân thân — né tránh
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

### NIN-066-S5 — Thức chỉ chi vũ
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

### NIN-066-S6 — Giấy vây khốn
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 62%; Giai 1/3/10 cấp 20: 85.56% / 147.56% / 364.56%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-066-S1 giai 2, thành thạo 500; CHALLENGE-NIN-066-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

### NIN-066-S7 — Giấy bộc liên hoàn
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-066-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-066-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; KONAN.

## NIN-067

### NIN-067-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-067-S1 — Vạn tượng thiên dẫn
- Sát thương (displace); single, tầm 5.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"direction":"towards_caster","distance_m":2.2}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-067-S2 — Thần la thiên chinh
- Sát thương (displace); cone, tầm 4 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 110%; Giai 1/3/10 cấp 20: 151.8% / 261.8% / 646.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-067-S3 — Thần la đẩy lùi
- Sát thương (area_damage); circle_self, tầm 0 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 135%; Giai 1/3/10 cấp 20: 186.3% / 321.3% / 793.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-067-S4 — Vạn tượng kéo
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-067-S5 — Địa bạo thiên tinh
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-067-S6 — Thần la diện rộng
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-067-S1 giai 2, thành thạo 500; CHALLENGE-NIN-067-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-067-S7 — Địa bạo phong tỏa
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-067-S7-B1 Địa bạo phong tỏa — Uy lực; effect.total_coefficient ×1.12 | NIN-067-S7-B2 Địa bạo phong tỏa — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 6, NIN-067-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-067-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

## NIN-068

### NIN-068-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-068-S1 — Hấp thụ chakra
- Đặc thù (absorb); arc_self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 8 / 7.84 / 7.68 / 7.52 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.duration_s base*(1+.15*r) (unchanged projectile cap and chakra return).
- Tham số cơ chế: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- Nhánh: không phân nhánh.
- Điều kiện: incoming_absorbable_projectile; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-068-S2 — Triệu hồi
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-068-S3 — Súc sinh đạo triệu hồi
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-068-S4 — Ngạ quỷ đạo hấp chakra
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-068-S5 — Luân hồi áp chế
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-068-S6 — Tu la đạo công kích
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 4 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.75s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-068-S1 giai 2, thành thạo 500; CHALLENGE-NIN-068-1 — 3 lần projectile_absorbed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

### NIN-068-S7 — Luân hồi liên kết
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-068-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-068-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; PAIN.

## NIN-069

### NIN-069-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7.

### NIN-069-S1 — Hỏa độn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-069-S1-B1 Hỏa độn — Uy lực; effect.total_coefficient ×1.12 | NIN-069-S1-B2 Hỏa độn — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7.

### NIN-069-S2 — Kamui
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7. Cân bằng V4: RETAIN_DEV — retain pending full loadout comparison; mixed slot and mechanics proxy not decisive.

### NIN-069-S3 — Kamui: thoát đòn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7.

### NIN-069-S4 — Hỏa độn bộc phong
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-069-S4-B1 Hỏa độn bộc phong — Uy lực; effect.total_coefficient ×1.12 | NIN-069-S4-B2 Hỏa độn bộc phong — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7.

### NIN-069-S5 — Không gian tập kích
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 254%; Giai 1/3/10 cấp 20: 350.52% / 604.52% / 1493.52%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7.

### NIN-069-S6 — Kamui dịch chuyển
- Đặc thù (teleport); teleport_mark, tầm 7 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 169%; Giai 1/3/10 cấp 20: 233.22% / 402.22% / 993.72%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-069-S1 giai 2, thành thạo 500; CHALLENGE-NIN-069-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7.

### NIN-069-S7 — Không gian trói
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 62%; Giai 1/3/10 cấp 20: 85.56% / 147.56% / 364.56%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-069-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-069-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; OBITO, TEAM7.

## NIN-070

### NIN-070-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR.

### NIN-070-S1 — Hào hỏa diệt khước
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-070-S1-B1 Hào hỏa diệt khước — Uy lực; effect.total_coefficient ×1.12 | NIN-070-S1-B2 Hào hỏa diệt khước — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-070-S2 — Mộc phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.35,"no_recursive":true,"role":"guard","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR.

### NIN-070-S3 — Hỏa độn hỏa long
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- Nhánh: NIN-070-S3-B1 Hỏa độn hỏa long — Uy lực; effect.total_coefficient ×1.12 | NIN-070-S3-B2 Hỏa độn hỏa long — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR.

### NIN-070-S4 — Susanoo phòng vệ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: NIN-070-S4-B1 Susanoo phòng vệ — Cường hóa defense; effect.params.magnitude ×1.1 | NIN-070-S4-B2 Susanoo phòng vệ — Duy trì; effect.params.duration_s ×1.12.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR.

### NIN-070-S5 — Susanoo
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-070-F1","requires_unlock":true,"shared_group":"NIN-070-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR.

### NIN-070-S6 — Susanoo hoàn chỉnh
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-070-S1 giai 2, thành thạo 500; CHALLENGE-NIN-070-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-070-F1.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR.

### NIN-070-S7 — Thiên ngại chấn tinh
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 260%; Giai 1/3/10 cấp 20: 358.8% / 618.8% / 1528.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.9s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-070-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-070-2 — 5 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MADARA, WAR.

## NIN-071

### NIN-071-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU.

### NIN-071-S1 — Bào tử
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-071-S2 — Ẩn thân
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU.

### NIN-071-S3 — Bào tử bám
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU.

### NIN-071-S4 — Mộc hóa che chắn
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 115%; Giai 1/3/10 cấp 20: 158.7% / 273.7% / 676.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU.

### NIN-071-S5 — Phân thân hỗ trợ
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU.

### NIN-071-S6 — Bào tử phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-071-S1 giai 2, thành thạo 500; CHALLENGE-NIN-071-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU.

### NIN-071-S7 — Trinh sát ngụy trang
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 28%; Giai 1/3/10 cấp 20: 38.64% / 66.64% / 164.64%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-071-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-071-2 — 5 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_ZETSU.

## NIN-072

### NIN-072-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU.

### NIN-072-S1 — Ẩn thân
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU.

### NIN-072-S2 — Khống chế cơ thể
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-072-S3 — Ẩn thân ngầm
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU.

### NIN-072-S4 — Bám khống chế
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU.

### NIN-072-S5 — Ký sinh
- Chakra (chakra_drain); single, tầm 3.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 116%; Giai 1/3/10 cấp 20: 160.08% / 276.08% / 682.08%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"chakra_amount":12,"transfer_fraction":0.4}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU.

### NIN-072-S6 — Ký sinh làm suy yếu
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 68%; Giai 1/3/10 cấp 20: 93.84% / 161.84% / 399.84%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"attack_down","status_s":4,"magnitude":0.18,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-072-S1 giai 2, thành thạo 500; CHALLENGE-NIN-072-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU.

### NIN-072-S7 — Thao túng mục tiêu
- Khống chế (status); single, tầm 4.8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 45%; Giai 1/3/10 cấp 20: 62.1% / 107.1% / 264.6%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"blind","status_s":3,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-072-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-072-2 — 5 lần resource_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_BLACK_ZETSU. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

## NIN-073

### NIN-073-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-073-S1 — Thủy hóa
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- Nhánh: NIN-073-S1-B1 Thủy hóa — Cường hóa evasion; effect.params.magnitude ×1.1 | NIN-073-S1-B2 Thủy hóa — Duy trì; effect.params.duration_s ×1.12.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-073-S2 — Đại đao
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-073-S3 — Thủy hóa né tránh
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-073-S4 — Thủy thiết pháo
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- Nhánh: NIN-073-S4-B1 Thủy thiết pháo — Uy lực; effect.total_coefficient ×1.12 | NIN-073-S4-B2 Thủy thiết pháo — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-073-S5 — Thủy hóa liên trảm
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 297%; Giai 1/3/10 cấp 20: 409.86% / 706.86% / 1746.36%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-073-S5-B1 Thủy hóa liên trảm — Uy lực; effect.total_coefficient ×1.12 | NIN-073-S5-B2 Thủy hóa liên trảm — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-073-S6 — Đại đao liên trảm
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-073-S1 giai 2, thành thạo 500; CHALLENGE-NIN-073-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-073-S7 — Thủy hóa hộ thể
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-073-S7-B1 Thủy hóa hộ thể — Hộ thể; effect.total_coefficient ×1.12 | NIN-073-S7-B2 Thủy hóa hộ thể — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: cảnh 6, NIN-073-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-073-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

## NIN-074

### NIN-074-S0 — Đòn phòng vệ
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-074-S1 — Cảm tri
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA. Cân bằng V4: RETAIN_DEV — mobility/mark conditional value.

### NIN-074-S2 — Hồi phục chakra
- Chakra (chakra_regen); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 8 / 7.84 / 7.68 / 7.52 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.magnitude base*(1+.20*r) (authored regen multiplier; actual missing CP).
- Tham số cơ chế: {"duration_s":6,"magnitude":0.25}.
- Nhánh: không phân nhánh.
- Điều kiện: chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-074-S3 — Cảm tri tầm rộng
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-074-S4 — Chakra hồi phục
- Chakra (chakra_restore); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.chakra_amount base*(1+.25*r) (actual missing CP; no self return above paid CP).
- Tham số cơ chế: {"chakra_amount":12,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-074-S5 — Dây xích phong ấn
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 110.4% / 190.4% / 470.4%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: NIN-074-S5-B1 Dây xích phong ấn — Uy lực; effect.total_coefficient ×1.12 | NIN-074-S5-B2 Dây xích phong ấn — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-074-S6 — Xích phong ấn
- Khống chế (status); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":1.8,"chance":0.8}.
- Nhánh: NIN-074-S6-B1 Xích phong ấn — Uy lực; effect.total_coefficient ×1.12 | NIN-074-S6-B2 Xích phong ấn — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: cảnh 3, NIN-074-S1 giai 2, thành thạo 500; CHALLENGE-NIN-074-1 — 3 lần mark_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-074-S7 — Cảm tri giải nhiễu
- Cường hóa/giải thuật (cleanse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":1,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-074-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-074-2 — 5 lần status_applied, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.