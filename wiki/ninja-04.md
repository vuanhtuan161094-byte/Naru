# Ninja 37–48
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-037
**Jirobo** — Naruto, đỡ đòn, phẩm chất 3/8.
- Nguyên tố: earth; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-037-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-037-S1 — Thổ lao | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-037-S2 — Hấp thụ chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 11 / 8s | 1 |
| NIN-037-S3 — Thổ độn tường đất | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 18 / 11s | 1 |
| NIN-037-S4 — Cường lực bội kích | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 20 / 14s | 3 |
| NIN-037-S5 — Thổ lăng đoàn tử | Đạn nổ vùng; 6m; tối đa 4 | 239% | 227% | 50 / 32s | 1 |
| NIN-037-S6 — Thổ lao hấp chakra | Vùng duy trì; 5m; tối đa 4 | 169% | 130% | 20 / 14s | 5 |
| NIN-037-S7 — Thổ lăng đoàn tử — điểm rơi | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 136% | 28 / 20s | 1 |

### NIN-037-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-037-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-037-S1 — Thổ lao
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-037-S1 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-037-S2 — Hấp thụ chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 11; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-037-S2 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-037-S3 — Thổ độn tường đất
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-037-S3 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-037-S4 — Cường lực bội kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-037-S4 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-037-S5 — Thổ lăng đoàn tử
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 227% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-037-S5 / earth; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-037-S6 — Thổ lao hấp chakra
- Cơ chế: `zone_drain`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"chakra_per_tick":3,"transfer_fraction":0.3,"hit_budget":5}.
- P1: hệ số tổng 130% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-037-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-037-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-037-S6 / earth; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-037-S7 — Thổ lăng đoàn tử — điểm rơi
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 136% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-037-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-037-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-037-S7 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-038
**Kidomaru** — Naruto, công kích xa, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-038-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-038-S1 — Tơ nhện | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-038-S2 — Cung nhện | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 16 / 8s | 1 |
| NIN-038-S3 — Tơ nhện bẫy | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 18 / 11s | 1 |
| NIN-038-S4 — Giáp tơ vàng | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-038-S5 — Mũi tên hoàng kim | Xuyên tuyến; 5.5m; tối đa 4 | 247% | 247% | 50 / 32s | 1 |
| NIN-038-S6 — Mũi tên xuyên giáp | Xuyên tuyến; 6m; tối đa 3 | 215% | 200% | 20 / 14s | 1 |
| NIN-038-S7 — Nhện triệu hồi | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-038-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-038-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-038-S1 — Tơ nhện
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.71s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-038-S1 / web; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-038-S2 — Cung nhện
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-038-S2 / arrow; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-038-S3 — Tơ nhện bẫy
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.33s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-038-S3 / web; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-038-S4 — Giáp tơ vàng
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-038-S4 / web; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-038-S5 — Mũi tên hoàng kim
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {}.
- P1: hệ số tổng 247% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-038-S5 / arrow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-038-S6 — Mũi tên xuyên giáp
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 200% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-038-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-038-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-038-S6 / arrow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-038-S7 — Nhện triệu hồi
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-038-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-038-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-038-S7 / spider; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-039
**Tayuya** — Naruto, khống chế, phẩm chất 3/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-039-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-039-S1 — Sáo ảo thuật | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 12 / 8s | 1 |
| NIN-039-S2 — Triệu hồi Doki | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-039-S3 — Sáo nhiễu giác | Vòng quanh đích; 4.5m; tối đa 3 | 60% | 60% | 18 / 11s | 1 |
| NIN-039-S4 — Doki hộ vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 20 / 14s | 1 |
| NIN-039-S5 — Ma âm | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-039-S6 — Ma âm trói | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 20 / 14s | 1 |
| NIN-039-S7 — Sáo ma trận | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 142% | 28 / 20s | 4 |

### NIN-039-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-039-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-039-S1 — Sáo ảo thuật
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-039-S1 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-039-S2 — Triệu hồi Doki
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-039-S2 / demon; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-039-S3 — Sáo nhiễu giác
- Cơ chế: `status`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- P1: hệ số tổng 60% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-039-S3 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-039-S4 — Doki hộ vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-039-S4 / demon; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-039-S5 — Ma âm
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-039-S5 / sound; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-039-S6 — Ma âm trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-039-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-039-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-039-S6 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-039-S7 — Sáo ma trận
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 142% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-039-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-039-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-039-S7 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-040
**Sakon và Ukon** — Naruto, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-040-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-040-S1 — Liên kích song thân | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-040-S2 — Xâm nhập cơ thể | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 16 / 8s | 1 |
| NIN-040-S3 — Song thân hộ vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 18 / 11s | 1 |
| NIN-040-S4 — Xâm nhập làm suy yếu | Đơn mục tiêu; 4.5m; tối đa 1 | 60% | 60% | 20 / 14s | 1 |
| NIN-040-S5 — Song thân hợp kích | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-040-S6 — Hợp thể | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-040-S7 — Liên kích song thân — liên hoàn | Đơn mục tiêu; 1.8m; tối đa 1 | 254% | 252% | 28 / 20s | 6 |

### NIN-040-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-040-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-040-S1 — Liên kích song thân
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-040-S1 / twin; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-040-S2 — Xâm nhập cơ thể
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-040-S2 / parasite; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-040-S3 — Song thân hộ vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-040-S3 / twin; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-040-S4 — Xâm nhập làm suy yếu
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"attack_down","status_s":4,"magnitude":0.18,"chance":0.9}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-040-S4 / parasite; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-040-S5 — Song thân hợp kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-040-S5 / twin; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-040-S6 — Hợp thể
- Cơ chế: `chakra_regen`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"magnitude":0.25}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-040-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-040-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-040-S6 / twin; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-040-S7 — Liên kích song thân — liên hoàn
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 252% qua 6 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-040-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-040-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-040-S7 / twin; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SOUND4.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-041
**Naruto Uzumaki (Shippuden)** — Shippuden, đấu sĩ, phẩm chất 4/8.
- Nguyên tố: wind; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-041-S0 — Kunai và thể thuật | Đơn mục tiêu; 1.2m; tối đa 1 | 80% | 80% | 0 / 1.2s | 1 |
| NIN-041-S1 — Đa Trọng Ảnh Phân Thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-041-S2 — Rasengan | Lướt tiếp xúc; 3m; tối đa 1 | 165% | 165% | 16 / 10s | 1 |
| NIN-041-S3 — Đại Ngọc Rasengan | Vòng quanh đích; 2m; tối đa 3 | 200% | 154% | 18 / 11s | 1 |
| NIN-041-S4 — Liên kích ảnh phân thân | Đơn mục tiêu; 2.5m; tối đa 1 | 180% | 180% | 20 / 14s | 2 |
| NIN-041-S5 — Phong Độn: Rasen Shuriken | Đạn nổ vùng; 7m; tối đa 6 | 320% | 250% | 50 / 32s | 4 |
| NIN-041-S6 — Tiên Pháp: Đại Ngọc Rasengan | Vòng quanh đích; 3m; tối đa 4 | 235% | 177% | 20 / 14s | 1 |
| NIN-041-S7 — Chakra Kurama hộ thể | Vòng quanh bản thân; 0m; tối đa 6 | 135% | 135% | 28 / 20s | 1 |

### NIN-041-S0 — Kunai và thể thuật
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 80% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-041-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-041-S1 — Đa Trọng Ảnh Phân Thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":3,"ttl_s":10,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-041-S1 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-041-S2 — Rasengan
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.6,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 165% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-041-S2 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-041-S3 — Đại Ngọc Rasengan
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.8}.
- P1: hệ số tổng 154% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-041-S3 / rasengan_big; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-041-S4 — Liên kích ảnh phân thân
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":2,"interval_s":0.12,"requires_clone_or_basic_fallback":true}.
- P1: hệ số tổng 180% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-041-S4 / clone_combo; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-041-S5 — Phong Độn: Rasen Shuriken
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 2.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"conditional_variant":{"default_shape":"dash_contact","default_range_m":3,"throw_if_active_forms":["NIN-041-F1","NIN-041-F3"]},"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 250% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-041-S5 / rasenshuriken; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-041-S6 — Tiên Pháp: Đại Ngọc Rasengan
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 2.2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65,"status":"stun","status_s":0.7,"chance":0.75}.
- P1: hệ số tổng 177% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 0.66s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-041-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-041-1; điều kiện đặc biệt {"any_active_forms":["NIN-041-F1","NIN-041-F3"]}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-041-S6 / rasengan_big; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-041-S7 — Chakra Kurama hộ thể
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 135% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-041-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-041-2; điều kiện đặc biệt {"any_active_forms":["NIN-041-F2","NIN-041-F3"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-041-S7 / chakra_cloak; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, TEAM7, S3_NARUTO. S5 contact before Sage, thrown only F1/F3; S6 Sage/Six Paths; S7 Kurama-compatible cloak. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Tiên nhân** (NIN-041-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.
- **Chakra Kurama** (NIN-041-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; hp_threshold_or_manual.
- **Lục Đạo** (NIN-041-F3): cảnh giới 7, 15 RES-127; thời lượng 20s; CD 60s; chakra 55; manual_stance.

### Combo
- COMBO-002 Phong Lôi hợp kích: Naruto Uzumaki (Shippuden) + Sasuke Uchiha (Shippuden); CD 36s.
- COMBO-003 Phân thân phối hợp: Kakashi Hatake + Naruto Uzumaki (Shippuden); CD 24s.

---

## nin-042
**Sasuke Uchiha (Shippuden)** — Shippuden, sát thủ, phẩm chất 4/8.
- Nguyên tố: fire, lightning; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-042-S0 — Kiếm Kusanagi | Đơn mục tiêu; 1.4m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-042-S1 — Chidori Lưu | Vòng quanh bản thân; 0m; tối đa 4 | 145% | 143% | 17 / 11s | 1 |
| NIN-042-S2 — Hào Long Hỏa | Đạn nổ vùng; 6m; tối đa 3 | 165% | 165% | 16 / 10s | 1 |
| NIN-042-S3 — Chidori Senbon | Hình quạt; 5m; tối đa 4 | 140% | 140% | 18 / 11s | 1 |
| NIN-042-S4 — Sharingan | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-042-S5 — Kirin | Vùng khóa tọa độ; 8m; tối đa 6 | 340% | 277% | 50 / 32s | 1 |
| NIN-042-S6 — Chidori dạng thương | Xuyên tuyến; 5m; tối đa 3 | 195% | 195% | 20 / 14s | 1 |
| NIN-042-S7 — Amaterasu | Vùng duy trì; 6m; tối đa 4 | 180% | 179% | 28 / 20s | 5 |

### NIN-042-S0 — Kiếm Kusanagi
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-042-S0 / sword; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-042-S1 — Chidori Lưu
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh bản thân; phạm vi phụ 1.8 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.6,"status":"shock","status_s":0.8,"chance":0.8}.
- P1: hệ số tổng 143% qua 1 hit; chakra 17; hồi chiêu 11s; khống chế 0.72s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-042-S1 / lightning_aura; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-042-S2 — Hào Long Hỏa
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.6 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"burn","status_s":4,"chance":0.85,"dot_fraction_of_total":0.18,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 165% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-042-S2 / fire_dragon; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-042-S3 — Chidori Senbon
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 45 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"total_projectile_hit_budget_per_target":1,"angle_deg":45,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 140% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 0.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-042-S3 / lightning_needle; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-042-S4 — Sharingan
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7,"secondary_stance":{"stat":"evasion","magnitude":0.1}}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-042-S4 / ocular; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-042-S5 — Kirin
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.5 radius_m.
- Thi triển 1.2s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"telegraph_s":1.2,"field_modifier":{"when":"storm_or_heated_field","coefficient_multiplier":1.15},"lock":"ground_at_cast"}.
- P1: hệ số tổng 277% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-042-S5 / kirin; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-042-S6 — Chidori dạng thương
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.7 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 195% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 0.54s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-042-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-042-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-042-S6 / lightning_lance; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-042-S7 — Amaterasu
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.1 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5,"eye_strain":true,"do_not_add_duplicate_dot":true}.
- P1: hệ số tổng 179% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-042-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-042-2; điều kiện đặc biệt {"any_active_forms":["NIN-042-F1","NIN-042-F2","NIN-042-F3"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-042-S7 / black_flame; charge → release → impact → residual → expire.
- Nguồn: TECHNIQUE_LINK_LIMITED; SASUKE_LATE, TEAM7, S3B_TAKA. Sharingan stance, Mangekyo/EMS/Susanoo mutually exclusive forms; Kirin before/after Mangekyo; Amaterasu only unlocked ocular mode. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Mangekyo** (NIN-042-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.
- **Vĩnh Hằng Mangekyo** (NIN-042-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; manual_stance.
- **Susanoo** (NIN-042-F3): cảnh giới 7, 15 RES-127; thời lượng 20s; CD 60s; chakra 55; manual_stance.

### Combo
- COMBO-002 Phong Lôi hợp kích: Naruto Uzumaki (Shippuden) + Sasuke Uchiha (Shippuden); CD 36s.

---

## nin-043
**Sakura Haruno (Shippuden)** — Shippuden, trị liệu, phẩm chất 4/8.
- Nguyên tố: yang; thiên phú cố định: Chuyên môn trị liệu; nghề gợi ý: dược.
- Chỉ số gốc: vitality 14; strength 10; spirit 19; agility 12; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.63; strength +0.45; spirit +0.86; agility +0.54; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-043-S0 — Quái lực | Đơn mục tiêu; 1.1m; tối đa 1 | 95% | 95% | 0 / 1.2s | 1 |
| NIN-043-S1 — Chưởng Tiên Thuật | Hỗ trợ một đồng minh; 4m; tối đa 1 | 165% | 165% | 14 / 9s | 1 |
| NIN-043-S2 — Địa Chấn Quyền | Vòng quanh đích; 1.6m; tối đa 4 | 180% | 118% | 16 / 10s | 1 |
| NIN-043-S3 — Quái Lực Liên Kích | Lướt tiếp xúc; 2.5m; tối đa 1 | 155% | 155% | 18 / 11s | 2 |
| NIN-043-S4 — Giải thuật | Hỗ trợ một đồng minh; 4m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-043-S5 — Bách Hào | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-043-S6 — Thông linh Katsuyu | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-043-S7 — Bách Hào hồi phục | Vòng quanh bản thân; 0m; tối đa 6 | 180% | 180% | 28 / 20s | 3 |

### NIN-043-S0 — Quái lực
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 95% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-043-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-043-S1 — Chưởng Tiên Thuật
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 165% qua 1 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-043-S1 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-043-S2 — Địa Chấn Quyền
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.6}.
- P1: hệ số tổng 118% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-043-S2 / ground_smash; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-043-S3 — Quái Lực Liên Kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 155% qua 2 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-043-S3 / melee_combo; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-043-S4 — Giải thuật
- Cơ chế: `cleanse`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":2,"priority":"hard_control_first","no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-043-S4 / cleanse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-043-S5 — Bách Hào
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-043-F1","requires_unlock":true,"shared_group":"NIN-043-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-043-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-043-S5 / byakugou; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-043-S6 — Thông linh Katsuyu
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.35,"attack_fraction":0,"no_recursive":true,"role":"heal_ally","heal_coefficient":0.35,"interval_s":2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-043-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-043-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-043-S6 / katsuyu; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-043-S7 — Bách Hào hồi phục
- Cơ chế: `heal_pulse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 180% qua 3 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-043-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-043-2; điều kiện đặc biệt {"any_active_forms":["NIN-043-F1"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-043-S7 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TEAM7, S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Bách Hào** (NIN-043-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-044
**Sai** — Shippuden, công kích xa, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-044-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-044-S1 — Siêu thú ngụy họa | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-044-S2 — Chim mực | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 16 / 10s | 1 |
| NIN-044-S3 — Chim mực trinh sát | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 18 / 11s | 1 |
| NIN-044-S4 — Xà mực trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-044-S5 — Hổ mực liên kích | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-044-S6 — Hổ mực liên kích — liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 186% | 186% | 20 / 14s | 3 |
| NIN-044-S7 — Đàn chim mực | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 161% | 28 / 20s | 4 |

### NIN-044-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-044-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### NIN-044-S1 — Siêu thú ngụy họa
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":9,"hp_fraction":0.2,"attack_fraction":0.3,"no_recursive":true,"role":"ranged","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-044-S1 / ink; charge → release → spawn → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### NIN-044-S2 — Chim mực
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-044-S2 / ink; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### NIN-044-S3 — Chim mực trinh sát
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-044-S3 / ink; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### NIN-044-S4 — Xà mực trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-044-S4 / ink; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### NIN-044-S5 — Hổ mực liên kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-044-S5 / ink; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### NIN-044-S6 — Hổ mực liên kích — liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 186% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-044-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-044-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-044-S6 / ink; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### NIN-044-S7 — Đàn chim mực
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 161% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-044-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-044-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-044-S7 / ink; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAI.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-045
**Yamato** — Shippuden, đỡ đòn, phẩm chất 4/8.
- Nguyên tố: wood; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-045-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-045-S1 — Mộc phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-045-S2 — Mộc lao | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 16 / 8s | 1 |
| NIN-045-S3 — Mộc độn tường gỗ | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-045-S4 — Mộc phân thân — hộ vệ đơn | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 20 / 14s | 1 |
| NIN-045-S5 — Mộc độn đại thụ | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-045-S6 — Mộc lao trói | Xuyên tuyến; 5.5m; tối đa 3 | 96% | 96% | 20 / 14s | 1 |
| NIN-045-S7 — Rừng gỗ hộ vệ | Vùng duy trì; 5.5m; tối đa 4 | 186% | 130% | 28 / 20s | 5 |

### NIN-045-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-045-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-045-S1 — Mộc phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.35,"no_recursive":true,"role":"guard","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-045-S1 / wood; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-045-S2 — Mộc lao
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.8s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-045-S2 / wood; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-045-S3 — Mộc độn tường gỗ
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-045-S3 / wood; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-045-S4 — Mộc phân thân — hộ vệ đơn
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-045-S4 / wood; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-045-S5 — Mộc độn đại thụ
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-045-S5 / wood; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-045-S6 — Mộc lao trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":1.8,"chance":0.8}.
- P1: hệ số tổng 96% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.8s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-045-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-045-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-045-S6 / wood; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-045-S7 — Rừng gỗ hộ vệ
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 130% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-045-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-045-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-045-S7 / wood; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-046
**Shikamaru Nara (Shippuden)** — Shippuden, khống chế, phẩm chất 3/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-046-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-046-S1 — Ảnh mô phỏng | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-046-S2 — Ảnh khâu | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 134% | 16 / 9s | 1 |
| NIN-046-S3 — Ảnh khâu xuyên | Xuyên tuyến; 6m; tối đa 3 | 190% | 134% | 18 / 11s | 1 |
| NIN-046-S4 — Bóng trói nhiều mục tiêu | Xuyên tuyến; 5.5m; tối đa 3 | 85% | 85% | 20 / 14s | 1 |
| NIN-046-S5 — Ảnh thủ phược | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-046-S6 — Ảnh thủ phược — khống tâm | Đơn mục tiêu; 5m; tối đa 1 | 85% | 85% | 20 / 14s | 1 |
| NIN-046-S7 — Ảnh trận phản kích | Bản thân; 0m; tối đa 1 | 147% | 147% | 28 / 20s | 1 |

### NIN-046-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-046-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-046-S1 — Ảnh mô phỏng
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-046-S1 / shadow; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-046-S2 — Ảnh khâu
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-046-S2 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-046-S3 — Ảnh khâu xuyên
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-046-S3 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-046-S4 — Bóng trói nhiều mục tiêu
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":1.8,"chance":0.8}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-046-S4 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-046-S5 — Ảnh thủ phược
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-046-S5 / shadow; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-046-S6 — Ảnh thủ phược — khống tâm
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-046-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-046-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-046-S6 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-046-S7 — Ảnh trận phản kích
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-046-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-046-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-046-S7 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_INOSHIKA, S3_ASUMA, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-004 Ino Shika Cho: Shikamaru Nara (Shippuden) + Choji Akimichi (Shippuden) + Ino Yamanaka (Shippuden); CD 32s.

---

## nin-047
**Choji Akimichi (Shippuden)** — Shippuden, đỡ đòn, phẩm chất 3/8.
- Nguyên tố: yang; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-047-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-047-S1 — Bội hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-047-S2 — Nhục đạn chiến xa | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 147% | 16 / 9s | 1 |
| NIN-047-S3 — Bội hóa cánh tay | Hình quạt; 4.5m; tối đa 4 | 155% | 117% | 18 / 11s | 1 |
| NIN-047-S4 — Siêu bội hóa | Vòng quanh bản thân; 0m; tối đa 4 | 135% | 109% | 20 / 14s | 1 |
| NIN-047-S5 — Điệp hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-047-S6 — Nhục đạn chiến xa — liên kích áp sát | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 195% | 20 / 14s | 2 |
| NIN-047-S7 — Điệp hóa công kích | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 195% | 28 / 20s | 2 |

### NIN-047-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-047-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-047-S1 — Bội hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-047-S1 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-047-S2 — Nhục đạn chiến xa
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-047-S2 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-047-S3 — Bội hóa cánh tay
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 117% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-047-S3 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-047-S4 — Siêu bội hóa
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh bản thân; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.6}.
- P1: hệ số tổng 109% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-047-S4 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-047-S5 — Điệp hóa
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-047-F1","requires_unlock":true,"shared_group":"NIN-047-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-047-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-047-S5 / butterfly; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-047-S6 — Nhục đạn chiến xa — liên kích áp sát
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 195% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-047-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-047-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-047-S6 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-047-S7 — Điệp hóa công kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 195% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-047-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-047-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-047-S7 / butterfly; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Điệp hóa** (NIN-047-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-004 Ino Shika Cho: Shikamaru Nara (Shippuden) + Choji Akimichi (Shippuden) + Ino Yamanaka (Shippuden); CD 32s.

---

## nin-048
**Ino Yamanaka (Shippuden)** — Shippuden, hỗ trợ, phẩm chất 3/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-048-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-048-S1 — Tâm chuyển thân | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 12 / 8s | 1 |
| NIN-048-S2 — Cảm tri | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 16 / 8s | 1 |
| NIN-048-S3 — Cảm tri liên kết | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-048-S4 — Tâm truyền thân | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-048-S5 — Tâm truyền thân: giải nhiễu | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 45 / 30s | 1 |
| NIN-048-S6 — Tâm chuyển thân cường hóa | Đơn mục tiêu; 4.8m; tối đa 1 | 45% | 45% | 20 / 14s | 1 |
| NIN-048-S7 — Liên kết cảm tri | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-048-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-048-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-048-S1 — Tâm chuyển thân
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.89s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-048-S1 / mind; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-048-S2 — Cảm tri
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-048-S2 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-048-S3 — Cảm tri liên kết
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-048-S3 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-048-S4 — Tâm truyền thân
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-048-S4 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-048-S5 — Tâm truyền thân: giải nhiễu
- Cơ chế: `cleanse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"max_statuses":1,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-048-S5 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-048-S6 — Tâm chuyển thân cường hóa
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"blind","status_s":3,"chance":0.9}.
- P1: hệ số tổng 45% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-048-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-048-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-048-S6 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-048-S7 — Liên kết cảm tri
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-048-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-048-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-048-S7 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA, S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-004 Ino Shika Cho: Shikamaru Nara (Shippuden) + Choji Akimichi (Shippuden) + Ino Yamanaka (Shippuden); CD 32s.

---

