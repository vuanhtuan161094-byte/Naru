# Lô A — 64 kỹ năng
Các giá trị chakra theo sao là preview chưa tính nhánh hoặc hiệu suất cấp độ. Hệ số hiệu ứng tính trên tổng mỗi mục tiêu; không mặc định là sát thương. Nguồn và HOLD không thay đổi.

## NIN-001

### NIN-001-S0 — Cận chiến phân thân
- Đánh thường (damage); single, tầm 1.1 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 80% / 80% / 80%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

### NIN-001-S1 — Ảnh Phân Thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

### NIN-001-S2 — Uzumaki liên đạn
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12,"requires_clone_or_basic_fallback":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

### NIN-001-S3 — Phân thân đánh lạc hướng
- Khống chế (decoy); single, tầm 3 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 45%; Giai 1/3/10 cấp 20: 62.1% / 107.1% / 264.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"taunt","status_s":1.5,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_targeting_ally; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

### NIN-001-S4 — Chakra Cửu Vĩ
- Chakra (chakra_regen); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.magnitude base*(1+.20*r) (authored regen multiplier; actual missing CP).
- Tham số cơ chế: {"duration_s":6,"magnitude":0.25}.
- Nhánh: không phân nhánh.
- Điều kiện: chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

### NIN-001-S5 — Rasengan
- Sát thương (dash_damage); dash_contact, tầm 3 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 320%; Giai 1/3/10 cấp 20: 441.6% / 761.6% / 1881.6%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.6,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-001-S5-B1 Rasengan — Uy lực; effect.total_coefficient ×1.12 | NIN-001-S5-B2 Rasengan — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

### NIN-001-S6 — Rasengan phối hợp
- Sát thương (dash_multi_hit); dash_contact, tầm 3 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 200%; Giai 1/3/10 cấp 20: 276% / 476% / 1176%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"requires_clone":true,"consume_clone":1,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-001-S6-B1 Rasengan phối hợp — Uy lực; effect.total_coefficient ×1.12 | NIN-001-S6-B2 Rasengan phối hợp — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: cảnh 3, NIN-001-S1 giai 2, thành thạo 500; CHALLENGE-NIN-001-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

### NIN-001-S7 — Phản công phân thân
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true,"decoy_evasion_once":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-001-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-001-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_EARLY, S3_NARUTO.

## NIN-004

### NIN-004-S0 — Kunai liên kích
- Đánh thường (damage); single, tầm 2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 80% / 80% / 80%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

### NIN-004-S1 — Thổ Lưu Bích
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true,"placement":"valid_grid_edge","allow_allied_movement":false}.
- Nhánh: NIN-004-S1-B1 Thổ Lưu Bích — Kiên cố; effect.params.duration_s ×1.12 | NIN-004-S1-B2 Thổ Lưu Bích — Tường rộng; effect.params.width_m ×1.12.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

### NIN-004-S2 — Thông linh nhẫn khuyển
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.32,"attack_fraction":0.25,"no_recursive":true,"role":"track_bind","on_contact_status":"bind","on_contact_status_s":1.2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

### NIN-004-S3 — Thủy Long Đạn
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"status":"wet","status_s":4,"chance":0.85,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-004-S3-B1 Thủy Long Đạn — Uy lực; effect.total_coefficient ×1.12 | NIN-004-S3-B2 Thủy Long Đạn — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

### NIN-004-S4 — Sharingan quan sát
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

### NIN-004-S5 — Raikiri
- Khống chế (dash_damage); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 325%; Giai 1/3/10 cấp 20: 448.5% / 773.5% / 1911%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0,"status":"shock","status_s":0.9,"chance":0.85,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

### NIN-004-S6 — Lôi truyền dẫn
- Khống chế (line_damage); line, tầm 4 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 180%; Giai 1/3/10 cấp 20: 248.4% / 428.4% / 1058.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"requires_owned_clone_or_anchor":true,"adapter_gate":"LIGHTNING_CABLE_PENDING","status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-004-S6-B1 Lôi truyền dẫn — Uy lực; effect.total_coefficient ×1.12 | NIN-004-S6-B2 Lôi truyền dẫn — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: cảnh 3, NIN-004-S1 giai 2, thành thạo 500; CHALLENGE-NIN-004-1 — 3 lần wall_blocked, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

### NIN-004-S7 — Kamui
- Sát thương (zone_damage); zone_target, tầm 6 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 240%; Giai 1/3/10 cấp 20: 331.2% / 571.2% / 1411.2%.
- Chakra 1/5/10/15 sao: 50 / 49 / 48 / 47 CP; hồi chiêu 35s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5,"delay_s":0.8,"boss_instant_kill":false,"interrupt_on_hit":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-004-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-004-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-004-F2.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; EARLY_ARC, TEAM7, S3_KAKASHI.

## NIN-041

### NIN-041-S0 — Kunai và thể thuật
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 80% / 80% / 80%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO.

### NIN-041-S1 — Đa Trọng Ảnh Phân Thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":3,"ttl_s":10,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO.

### NIN-041-S2 — Rasengan
- Sát thương (dash_damage); dash_contact, tầm 3 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.6,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-041-S2-B1 Rasengan — Uy lực; effect.total_coefficient ×1.12 | NIN-041-S2-B2 Rasengan — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO.

### NIN-041-S3 — Đại Ngọc Rasengan
- Sát thương (area_damage); circle_target, tầm 2 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 200%; Giai 1/3/10 cấp 20: 276% / 476% / 1176%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.8}.
- Nhánh: NIN-041-S3-B1 Đại Ngọc Rasengan — Uy lực; effect.total_coefficient ×1.12 | NIN-041-S3-B2 Đại Ngọc Rasengan — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO.

### NIN-041-S4 — Liên kích ảnh phân thân
- Sát thương (multi_hit); single, tầm 2.5 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 180%; Giai 1/3/10 cấp 20: 248.4% / 428.4% / 1058.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":2,"interval_s":0.12,"requires_clone_or_basic_fallback":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO.

### NIN-041-S5 — Phong Độn: Rasen Shuriken
- Sát thương (projectile_damage); projectile_burst, tầm 7 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 320%; Giai 1/3/10 cấp 20: 441.6% / 761.6% / 1881.6%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"conditional_variant":{"default_shape":"dash_contact","default_range_m":3,"throw_if_active_forms":["NIN-041-F1","NIN-041-F3"]},"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-041-S5-B1 Phong Độn: Rasen Shuriken — Uy lực; effect.total_coefficient ×1.12 | NIN-041-S5-B2 Phong Độn: Rasen Shuriken — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO.

### NIN-041-S6 — Tiên Pháp: Đại Ngọc Rasengan
- Khống chế (area_damage); circle_target, tầm 3 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 235%; Giai 1/3/10 cấp 20: 324.3% / 559.3% / 1381.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"push_m":0.65,"status":"stun","status_s":0.7,"chance":0.75}.
- Nhánh: NIN-041-S6-B1 Tiên Pháp: Đại Ngọc Rasengan — Uy lực; effect.total_coefficient ×1.12 | NIN-041-S6-B2 Tiên Pháp: Đại Ngọc Rasengan — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: cảnh 3, NIN-041-S1 giai 2, thành thạo 500; CHALLENGE-NIN-041-1 — 3 lần summon_spawned, thắng và sống sót; hình thái NIN-041-F1, NIN-041-F3.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-041-S7 — Chakra Kurama hộ thể
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 135%; Giai 1/3/10 cấp 20: 186.3% / 321.3% / 793.8%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-041-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-041-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-041-F2, NIN-041-F3.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, TEAM7, S3_NARUTO.

## NIN-042

### NIN-042-S0 — Kiếm Kusanagi
- Đánh thường (damage); single, tầm 1.4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

### NIN-042-S1 — Chidori Lưu
- Khống chế (area_damage); circle_self, tầm 0 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 145%; Giai 1/3/10 cấp 20: 200.1% / 345.1% / 852.6%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"push_m":0.6,"status":"shock","status_s":0.8,"chance":0.8}.
- Nhánh: NIN-042-S1-B1 Chidori Lưu — Uy lực; effect.total_coefficient ×1.12 | NIN-042-S1-B2 Chidori Lưu — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

### NIN-042-S2 — Hào Long Hỏa
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"status":"burn","status_s":4,"chance":0.85,"dot_fraction_of_total":0.18,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-042-S2-B1 Hào Long Hỏa — Uy lực; effect.total_coefficient ×1.12 | NIN-042-S2-B2 Hào Long Hỏa — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

### NIN-042-S3 — Chidori Senbon
- Khống chế (cone_damage); cone, tầm 5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 140%; Giai 1/3/10 cấp 20: 193.2% / 333.2% / 823.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"total_projectile_hit_budget_per_target":1,"angle_deg":45,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-042-S3-B1 Chidori Senbon — Uy lực; effect.total_coefficient ×1.12 | NIN-042-S3-B2 Chidori Senbon — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

### NIN-042-S4 — Sharingan
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7,"secondary_stance":{"stat":"evasion","magnitude":0.1}}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

### NIN-042-S5 — Kirin
- Sát thương (ground_damage); circle_ground, tầm 8 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 340%; Giai 1/3/10 cấp 20: 469.2% / 809.2% / 1999.2%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 1.2s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":1.2,"field_modifier":{"when":"storm_or_heated_field","coefficient_multiplier":1.15},"lock":"ground_at_cast"}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

### NIN-042-S6 — Chidori dạng thương
- Khống chế (line_damage); line, tầm 5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 195%; Giai 1/3/10 cấp 20: 269.1% / 464.1% / 1146.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-042-S6-B1 Chidori dạng thương — Uy lực; effect.total_coefficient ×1.12 | NIN-042-S6-B2 Chidori dạng thương — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: cảnh 3, NIN-042-S1 giai 2, thành thạo 500; CHALLENGE-NIN-042-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

### NIN-042-S7 — Amaterasu
- Sát thương (zone_damage); zone_target, tầm 6 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 180%; Giai 1/3/10 cấp 20: 248.4% / 428.4% / 1058.4%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5,"eye_strain":true,"do_not_add_duplicate_dot":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-042-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-042-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-042-F1, NIN-042-F2, NIN-042-F3.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; SASUKE_LATE, TEAM7, S3B_TAKA.

## NIN-043

### NIN-043-S0 — Quái lực
- Đánh thường (damage); single, tầm 1.1 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 95%; Giai 1/3/10 cấp 20: 95% / 95% / 95%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

### NIN-043-S1 — Chưởng Tiên Thuật
- Trị liệu (heal); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: NIN-043-S1-B1 Chưởng Tiên Thuật — Trị liệu sâu; effect.total_coefficient ×1.12 | NIN-043-S1-B2 Chưởng Tiên Thuật — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: ally_hp_below_75pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

### NIN-043-S2 — Địa Chấn Quyền
- Sát thương (area_damage); circle_target, tầm 1.6 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 180%; Giai 1/3/10 cấp 20: 248.4% / 428.4% / 1058.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

### NIN-043-S3 — Quái Lực Liên Kích
- Sát thương (dash_multi_hit); dash_contact, tầm 2.5 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

### NIN-043-S4 — Giải thuật
- Cường hóa/giải thuật (cleanse); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":2,"priority":"hard_control_first","no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_has_dispellable_status; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

### NIN-043-S5 — Bách Hào
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-043-F1","requires_unlock":true,"shared_group":"NIN-043-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

### NIN-043-S6 — Thông linh Katsuyu
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":12,"hp_fraction":0.35,"attack_fraction":0,"no_recursive":true,"role":"heal_ally","heal_coefficient":0.35,"interval_s":2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-043-S1 giai 2, thành thạo 500; CHALLENGE-NIN-043-1 — 3 lần effective_heal, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

### NIN-043-S7 — Bách Hào hồi phục
- Trị liệu (heal_pulse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 3 hit.
- Hệ số gốc 180%; Giai 1/3/10 cấp 20: 248.4% / 428.4% / 1058.4%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-043-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-043-2 — 5 lần form_effect_confirmed, thắng và sống sót; hình thái NIN-043-F1.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; TEAM7, S3_SAKURA.

## NIN-060

### NIN-060-S0 — Kunai liên kích
- Đánh thường (damage); single, tầm 2.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 80%; Giai 1/3/10 cấp 20: 80% / 80% / 80%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.

### NIN-060-S1 — Hào Hỏa Cầu
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"status":"burn","status_s":4,"chance":0.85,"dot_fraction_of_total":0.18,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-060-S1-B1 Hào Hỏa Cầu — Uy lực; effect.total_coefficient ×1.12 | NIN-060-S1-B2 Hào Hỏa Cầu — Duy trì burn; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.

### NIN-060-S2 — Tsukuyomi
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":2,"chance":0.85,"boss_control_duration_cap_s":0.7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-060-S3 — Ảnh phân thân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.

### NIN-060-S4 — Amaterasu
- Sát thương (zone_damage); zone_target, tầm 6 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 200%; Giai 1/3/10 cấp 20: 276% / 476% / 1176%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5,"eye_strain":true,"do_not_add_duplicate_dot":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0; hình thái NIN-060-F1, NIN-060-F2.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.

### NIN-060-S5 — Susanoo
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-060-F2","requires_unlock":true,"shared_group":"NIN-060-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.

### NIN-060-S6 — Susanoo: Khiên Yata
- Hộ thuẫn (directional_shield); arc_self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 150%; Giai 1/3/10 cấp 20: 207% / 357% / 882%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"angle_deg":120,"frontal_only":true,"max_absorb_coefficient":1.5}.
- Nhánh: NIN-060-S6-B1 Susanoo: Khiên Yata — Hộ thể; effect.total_coefficient ×1.12 | NIN-060-S6-B2 Susanoo: Khiên Yata — Góc chắn; effect.params.angle_deg ×1.1.
- Điều kiện: cảnh 3, NIN-060-S1 giai 2, thành thạo 500; CHALLENGE-NIN-060-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-060-F2.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.

### NIN-060-S7 — Susanoo: Kiếm Totsuka
- Khống chế (line_damage); line, tầm 4 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 320%; Giai 1/3/10 cấp 20: 441.6% / 761.6% / 1881.6%.
- Chakra 1/5/10/15 sao: 50 / 49 / 48 / 47 CP; hồi chiêu 35s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":1.5,"boss_cap":0.35,"boss_instant_kill":false,"normal_control_only":true}.
- Nhánh: NIN-060-S7-B1 Susanoo: Kiếm Totsuka — Uy lực; effect.total_coefficient ×1.12 | NIN-060-S7-B2 Susanoo: Kiếm Totsuka — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: cảnh 6, NIN-060-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-060-2 — 5 lần form_effect_confirmed, thắng và sống sót; hình thái NIN-060-F2.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.

## NIN-093

### NIN-093-S0 — Kunai nhanh
- Đánh thường (damage); single, tầm 2.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

### NIN-093-S1 — Phi Lôi Thần
- Đặc thù (teleport); teleport_mark, tầm 7 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.mark_ttl_s base*(1+.15*r) (owned marks only; no refresh on teleport).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"allow_no_damage":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: owned_valid_mark_or_explicit_swap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

### NIN-093-S2 — Rasengan
- Sát thương (dash_damage); dash_contact, tầm 3 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-093-S2-B1 Rasengan — Uy lực; effect.total_coefficient ×1.12 | NIN-093-S2-B2 Rasengan — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

### NIN-093-S3 — Phi Lôi Thần đánh dấu
- Đặc thù (projectile_mark); projectile_first, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 45%; Giai 1/3/10 cấp 20: 62.1% / 107.1% / 264.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"max_marks":3,"mark_ttl_s":10,"owner_scoped":true,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

### NIN-093-S4 — Rasengan liên kích
- Sát thương (multi_hit); single, tầm 2.5 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 185%; Giai 1/3/10 cấp 20: 255.3% / 440.3% / 1087.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":2,"interval_s":0.12,"requires_owned_mark":true,"consume_mark":true}.
- Nhánh: NIN-093-S4-B1 Rasengan liên kích — Uy lực; effect.total_coefficient ×1.12 | NIN-093-S4-B2 Rasengan liên kích — Liên kích nhanh; effect.params.interval_s ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

### NIN-093-S5 — Phi Lôi Thần liên kích
- Đặc thù (teleport); teleport_mark, tầm 8 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 340%; Giai 1/3/10 cấp 20: 469.2% / 809.2% / 1999.2%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"hits":3,"interval_s":0.15,"no_clip":true}.
- Nhánh: NIN-093-S5-B1 Phi Lôi Thần liên kích — Uy lực; effect.total_coefficient ×1.12 | NIN-093-S5-B2 Phi Lôi Thần liên kích — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: owned_valid_mark_or_explicit_swap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

### NIN-093-S6 — Phi Lôi Thần cấp hai
- Đặc thù (teleport); teleport_mark, tầm 8 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 220%; Giai 1/3/10 cấp 20: 303.6% / 523.6% / 1293.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"mark_throw_before_teleport":true,"invulnerability_s":0.1,"no_clip":true}.
- Nhánh: NIN-093-S6-B1 Phi Lôi Thần cấp hai — Uy lực; effect.total_coefficient ×1.12 | NIN-093-S6-B2 Phi Lôi Thần cấp hai — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: cảnh 3, NIN-093-S1 giai 2, thành thạo 500; CHALLENGE-NIN-093-1 — 3 lần teleport_arrived, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

### NIN-093-S7 — Kết giới dịch chuyển
- Đặc thù (projectile_intercept); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.duration_s base*(1+.15*r) (unchanged projectile cap).
- Tham số cơ chế: {"duration_s":6,"width_m":2,"thickness_m":0.45,"blocks_movement":false,"blocks_projectile":true,"max_projectiles":1,"no_recursive":true,"redirect":"safe_non_recursive_intercept"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-093-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-093-2 — 5 lần teleport_arrived, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.

## NIN-126

### NIN-126-S0 — Thể thuật Hokage
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.

### NIN-126-S1 — Ảnh Phân Thân chiến thuật
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":3,"ttl_s":12,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.

### NIN-126-S2 — Phong Độn: Rasen Shuriken
- Sát thương (projectile_damage); projectile_burst, tầm 7 m, tối đa 4 mục tiêu; 3 hit.
- Hệ số gốc 185%; Giai 1/3/10 cấp 20: 255.3% / 440.3% / 1087.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.25,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.

### NIN-126-S3 — Đại Ngọc Rasengan
- Sát thương (area_damage); circle_target, tầm 2.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 210%; Giai 1/3/10 cấp 20: 289.8% / 499.8% / 1234.8%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.8}.
- Nhánh: NIN-126-S3-B1 Đại Ngọc Rasengan — Uy lực; effect.total_coefficient ×1.12 | NIN-126-S3-B2 Đại Ngọc Rasengan — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.

### NIN-126-S4 — Tiên Nhân Chế Độ
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-126-F1","requires_unlock":true,"shared_group":"NIN-126-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.

### NIN-126-S5 — Vĩ Thú Ngọc
- Sát thương (projectile_damage); projectile_burst, tầm 9 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 360%; Giai 1/3/10 cấp 20: 496.8% / 856.8% / 2116.8%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy_in_los; cảnh 0; hình thái NIN-126-F2.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.

### NIN-126-S6 — Chakra Kurama
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-126-F2","requires_unlock":true,"shared_group":"NIN-126-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-126-S1 giai 2, thành thạo 500; CHALLENGE-NIN-126-1 — 3 lần summon_spawned, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.

### NIN-126-S7 — Tiên Pháp: Rasen Shuriken
- Sát thương (projectile_damage); projectile_burst, tầm 8 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 245%; Giai 1/3/10 cấp 20: 338.1% / 583.1% / 1440.6%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-126-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-126-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót; hình thái NIN-126-F1, NIN-126-F2.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV.