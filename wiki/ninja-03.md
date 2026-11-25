# Ninja 25–36
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-025
**Temari (thiếu niên)** — Naruto, công kích xa, phẩm chất 2/8.
- Nguyên tố: wind; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 15.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.68.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-025-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-025-S1 — Liêm dứu | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 16 / 10s | 1 |
| NIN-025-S2 — Phong áp | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 16 / 10s | 1 |
| NIN-025-S3 — Phong độn quạt gió | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 18 / 11s | 1 |
| NIN-025-S4 — Gió đẩy lùi | Hình quạt; 4m; tối đa 3 | 110% | 110% | 20 / 14s | 1 |
| NIN-025-S5 — Đại liêm dứu | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-025-S6 — Liêm dứu diện rộng | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 20 / 14s | 1 |
| NIN-025-S7 — Phong trận liên hoàn | Vùng duy trì; 5.5m; tối đa 4 | 186% | 153% | 28 / 20s | 5 |

### NIN-025-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-025-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-025-S1 — Liêm dứu
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-025-S1 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-025-S2 — Phong áp
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-025-S2 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-025-S3 — Phong độn quạt gió
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-025-S3 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-025-S4 — Gió đẩy lùi
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 110% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-025-S4 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-025-S5 — Đại liêm dứu
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-025-S5 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-025-S6 — Liêm dứu diện rộng
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-025-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-025-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-025-S6 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-025-S7 — Phong trận liên hoàn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 153% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-025-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-025-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-025-S7 / wind; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-026
**Kankuro (thiếu niên)** — Naruto, công kích xa, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 15.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.68.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-026-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-026-S1 — Rối Karasu | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-026-S2 — Độc châm | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 16 / 8s | 1 |
| NIN-026-S3 — Rối Karasu — phản kích | Bản thân; 0m; tối đa 1 | 130% | 130% | 18 / 11s | 1 |
| NIN-026-S4 — Khói độc | Vùng duy trì; 5.5m; tối đa 4 | 165% | 116% | 20 / 14s | 5 |
| NIN-026-S5 — Bẫy rối | Vùng khóa tọa độ; 4.5m; tối đa 4 | 87% | 87% | 50 / 32s | 1 |
| NIN-026-S6 — Hộp rối bẫy | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 20 / 14s | 1 |
| NIN-026-S7 — Karasu liên kết | Đơn mục tiêu; 1.6m; tối đa 1 | 186% | 186% | 28 / 20s | 3 |

### NIN-026-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-026-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-026-S1 — Rối Karasu
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-026-S1 / puppet; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-026-S2 — Độc châm
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- P1: hệ số tổng 85% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-026-S2 / poison; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-026-S3 — Rối Karasu — phản kích
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-026-S3 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-026-S4 — Khói độc
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 116% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-026-S4 / poison; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-026-S5 — Bẫy rối
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 87% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế 1.33s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-026-S5 / puppet; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-026-S6 — Hộp rối bẫy
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-026-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-026-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-026-S6 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-026-S7 — Karasu liên kết
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 186% qua 3 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-026-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-026-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-026-S7 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-027
**Zabuza Momochi** — Naruto, sát thủ, phẩm chất 3/8.
- Nguyên tố: water; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-027-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-027-S1 — Vụ ẩn thuật | Vùng duy trì; 5.5m; tối đa 4 | 165% | 120% | 16 / 12s | 5 |
| NIN-027-S2 — Thủy phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-027-S3 — Ẩn trong sương | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-027-S4 — Thủy phân thân — triệu hồi | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-027-S5 — Thủy long đạn | Đạn nổ vùng; 6m; tối đa 4 | 239% | 239% | 50 / 35s | 1 |
| NIN-027-S6 — Đại thác nước | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 167% | 20 / 14s | 1 |
| NIN-027-S7 — Vô thanh sát nhân | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 232% | 28 / 20s | 2 |

### NIN-027-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-027-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-027-S1 — Vụ ẩn thuật
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 120% qua 5 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-027-S1 / mist; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-027-S2 — Thủy phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":9,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-027-S2 / water; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-027-S3 — Ẩn trong sương
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-027-S3 / mist; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-027-S4 — Thủy phân thân — triệu hồi
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":9,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-027-S4 / water; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-027-S5 — Thủy long đạn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 239% qua 1 hit; chakra 50; hồi chiêu 35s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-027-S5 / water; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-027-S6 — Đại thác nước
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 167% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-027-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-027-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-027-S6 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-027-S7 — Vô thanh sát nhân
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 232% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-027-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-027-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-027-S7 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-028
**Haku** — Naruto, sát thủ, phẩm chất 3/8.
- Nguyên tố: water, wind, ice; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-028-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-028-S1 — Thiên bản | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 12 / 7s | 1 |
| NIN-028-S2 — Băng kính | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-028-S3 — Băng độn thiên bản | Hình quạt; 4.5m; tối đa 4 | 155% | 144% | 18 / 11s | 1 |
| NIN-028-S4 — Gương băng dịch chuyển | Dịch chuyển theo dấu; 7m; tối đa 1 | 150% | 150% | 20 / 14s | 1 |
| NIN-028-S5 — Ma kính băng tinh | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 257% | 50 / 32s | 1 |
| NIN-028-S6 — Băng kính vây khốn | Vùng duy trì; 5.5m; tối đa 4 | 186% | 159% | 20 / 14s | 5 |
| NIN-028-S7 — Mưa thiên bản | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 167% | 28 / 20s | 4 |

### NIN-028-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-028-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-028-S1 — Thiên bản
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-028-S1 / needle; charge → release → travel → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-028-S2 — Băng kính
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-028-S2 / ice; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-028-S3 — Băng độn thiên bản
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 144% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-028-S3 / ice; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-028-S4 — Gương băng dịch chuyển
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- P1: hệ số tổng 150% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-028-S4 / ice; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-028-S5 — Ma kính băng tinh
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 257% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-028-S5 / ice; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-028-S6 — Băng kính vây khốn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 159% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-028-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-028-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-028-S6 / ice; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-028-S7 — Mưa thiên bản
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 167% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-028-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-028-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-028-S7 / needle; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_HAKU, S3_HAKU2.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-029
**Anko Mitarashi** — Naruto, sát thủ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-029-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-029-S1 — Tiềm ảnh xà thủ | Hình quạt; 4.5m; tối đa 4 | 155% | 144% | 16 / 10s | 1 |
| NIN-029-S2 — Xà trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 16 / 8s | 1 |
| NIN-029-S3 — Xà thủ liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 18 / 11s | 3 |
| NIN-029-S4 — Xà dò tìm | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 20 / 14s | 1 |
| NIN-029-S5 — Xà tập kích | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-029-S6 — Bẫy rắn | Vùng khóa tọa độ; 4.5m; tối đa 3 | 68% | 68% | 20 / 14s | 1 |
| NIN-029-S7 — Chú ấn bộc phát | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-029-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-029-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-029-S1 — Tiềm ảnh xà thủ
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 144% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-029-S1 / snake; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-029-S2 — Xà trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.62s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-029-S2 / snake; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-029-S3 — Xà thủ liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-029-S3 / snake; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-029-S4 — Xà dò tìm
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-029-S4 / snake; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-029-S5 — Xà tập kích
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-029-S5 / snake; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-029-S6 — Bẫy rắn
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 68% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.26s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-029-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-029-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-029-S6 / snake; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-029-S7 — Chú ấn bộc phát
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-029-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-029-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-029-S7 / curse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-030
**Hayate Gekko** — Naruto, sát thủ, phẩm chất 1/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-030-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-030-S1 — Kiếm thuật | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-030-S2 — Ẩn thân | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-030-S3 — Thuấn thân kiếm kích | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 175% | 18 / 11s | 1 |
| NIN-030-S4 — Ẩn thân kiếm sĩ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-030-S5 — Tam nhật nguyệt chi vũ | Đơn mục tiêu; 1.6m; tối đa 1 | 239% | 239% | 45 / 30s | 3 |
| NIN-030-S6 — Tam nhật nguyệt liên trảm | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 232% | 20 / 14s | 2 |
| NIN-030-S7 — Kiếm thủ phản kích | Bản thân; 0m; tối đa 1 | 147% | 147% | 28 / 20s | 1 |

### NIN-030-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-030-S0 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-030-S1 — Kiếm thuật
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-030-S1 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-030-S2 — Ẩn thân
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-030-S2 / stealth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-030-S3 — Thuấn thân kiếm kích
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 175% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-030-S3 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-030-S4 — Ẩn thân kiếm sĩ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-030-S4 / stealth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-030-S5 — Tam nhật nguyệt chi vũ
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 239% qua 3 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-030-S5 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-030-S6 — Tam nhật nguyệt liên trảm
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 232% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-030-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-030-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-030-S6 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-030-S7 — Kiếm thủ phản kích
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-030-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-030-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-030-S7 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-031
**Ibiki Morino** — Naruto, khống chế, phẩm chất 2/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-031-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-031-S1 — Thẩm vấn | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 12 / 8s | 1 |
| NIN-031-S2 — Áp lực tinh thần | Vòng quanh đích; 4.5m; tối đa 3 | 60% | 60% | 16 / 8s | 1 |
| NIN-031-S3 — Áp lực thẩm vấn | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 18 / 11s | 1 |
| NIN-031-S4 — Bẫy dây trói | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-031-S5 — Kết giới thẩm vấn | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-031-S6 — Phong tỏa ý chí | Đơn mục tiêu; 5m; tối đa 1 | 45% | 45% | 20 / 14s | 1 |
| NIN-031-S7 — Kết giới truy vấn | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 28 / 20s | 5 |

### NIN-031-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-031-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### NIN-031-S1 — Thẩm vấn
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-031-S1 / mind; charge → release → impact.
- Nguồn: LIMITED_TECHNIQUE_OR_ROLE_LINK; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### NIN-031-S2 — Áp lực tinh thần
- Cơ chế: `status`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- P1: hệ số tổng 60% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-031-S2 / mind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### NIN-031-S3 — Áp lực thẩm vấn
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-031-S3 / mind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### NIN-031-S4 — Bẫy dây trói
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-031-S4 / wire; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### NIN-031-S5 — Kết giới thẩm vấn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-031-S5 / mind; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### NIN-031-S6 — Phong tỏa ý chí
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"silence","status_s":2,"chance":0.8}.
- P1: hệ số tổng 45% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-031-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-031-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-031-S6 / mind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### NIN-031-S7 — Kết giới truy vấn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-031-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-031-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-031-S7 / mind; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IBIKI.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-032
**Genma Shiranui** — Naruto, công kích xa, phẩm chất 1/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-032-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-032-S1 — Thiên bản | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 15 / 10s | 1 |
| NIN-032-S2 — Phản công | Bản thân; 0m; tối đa 1 | 130% | 130% | 16 / 8s | 1 |
| NIN-032-S3 — Thiên bản đánh lạc hướng | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 18 / 11s | 1 |
| NIN-032-S4 — Kunai đón đòn | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-032-S5 — Loạt thiên bản | Hình quạt; 4.5m; tối đa 5 | 225% | 225% | 50 / 32s | 1 |
| NIN-032-S6 — Thiên bản liên xạ | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 161% | 20 / 14s | 4 |
| NIN-032-S7 — Thế trận hộ vệ | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-032-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-032-S0 / needle; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### NIN-032-S1 — Thiên bản
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-032-S1 / needle; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### NIN-032-S2 — Phản công
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-032-S2 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### NIN-032-S3 — Thiên bản đánh lạc hướng
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-032-S3 / needle; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### NIN-032-S4 — Kunai đón đòn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-032-S4 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### NIN-032-S5 — Loạt thiên bản
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 225% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-032-S5 / needle; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### NIN-032-S6 — Thiên bản liên xạ
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 161% qua 4 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-032-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-032-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-032-S6 / needle; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### NIN-032-S7 — Thế trận hộ vệ
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-032-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-032-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-032-S7 / shield; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_GENMA.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-033
**Dosu Kinuta** — Naruto, khống chế, phẩm chất 1/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-033-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-033-S1 — Sóng âm | Hình quạt; 4.5m; tối đa 4 | 155% | 122% | 15 / 10s | 1 |
| NIN-033-S2 — Chấn động | Xuyên tuyến; 4.5m; tối đa 3 | 110% | 110% | 16 / 9s | 1 |
| NIN-033-S3 — Sóng âm phá nhịp | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 134% | 18 / 11s | 1 |
| NIN-033-S4 — Ống khuếch đại âm | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-033-S5 — Âm áp | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-033-S6 — Âm chấn liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 186% | 186% | 20 / 14s | 3 |
| NIN-033-S7 — Sóng âm diện rộng | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 142% | 28 / 20s | 4 |

### NIN-033-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-033-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### NIN-033-S1 — Sóng âm
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 122% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-033-S1 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### NIN-033-S2 — Chấn động
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 1 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"stun","status_s":0.8,"chance":0.8}.
- P1: hệ số tổng 110% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế 0.88s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-033-S2 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### NIN-033-S3 — Sóng âm phá nhịp
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-033-S3 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### NIN-033-S4 — Ống khuếch đại âm
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-033-S4 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### NIN-033-S5 — Âm áp
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-033-S5 / sound; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### NIN-033-S6 — Âm chấn liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 186% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-033-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-033-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-033-S6 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### NIN-033-S7 — Sóng âm diện rộng
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 142% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-033-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-033-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-033-S7 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_DOSU.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-034
**Zaku Abumi** — Naruto, công kích xa, phẩm chất 1/8.
- Nguyên tố: wind; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-034-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-034-S1 — Sóng khí | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 15 / 10s | 1 |
| NIN-034-S2 — Cắt gió | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 16 / 10s | 1 |
| NIN-034-S3 — Khí áp đẩy lùi | Hình quạt; 4m; tối đa 3 | 110% | 110% | 18 / 11s | 1 |
| NIN-034-S4 — Sóng khí nén | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-034-S5 — Trảm không cực ba | Xuyên tuyến; 5.5m; tối đa 4 | 247% | 247% | 50 / 32s | 1 |
| NIN-034-S6 — Trảm không liên phát | Đơn mục tiêu; 1.6m; tối đa 1 | 186% | 186% | 20 / 14s | 3 |
| NIN-034-S7 — Đại khí áp | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 161% | 28 / 20s | 4 |

### NIN-034-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-034-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### NIN-034-S1 — Sóng khí
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-034-S1 / air; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### NIN-034-S2 — Cắt gió
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-034-S2 / air; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### NIN-034-S3 — Khí áp đẩy lùi
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 110% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-034-S3 / air; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### NIN-034-S4 — Sóng khí nén
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-034-S4 / air; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### NIN-034-S5 — Trảm không cực ba
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {}.
- P1: hệ số tổng 247% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-034-S5 / air; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### NIN-034-S6 — Trảm không liên phát
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 186% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-034-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-034-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-034-S6 / air; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### NIN-034-S7 — Đại khí áp
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 161% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-034-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-034-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-034-S7 / air; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZAKU.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-035
**Kin Tsuchi** — Naruto, khống chế, phẩm chất 1/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-035-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-035-S1 — Chuông ảo thuật | Đơn mục tiêu; 4.8m; tối đa 1 | 40% | 40% | 12 / 6s | 1 |
| NIN-035-S2 — Thiên bản | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 16 / 8s | 1 |
| NIN-035-S3 — Chuông nhiễu giác | Vùng duy trì; 5.5m; tối đa 4 | 165% | 102% | 18 / 12s | 5 |
| NIN-035-S4 — Thiên bản dây chuông | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-035-S5 — Nhiễu âm | Đơn mục tiêu; 5m; tối đa 1 | 109% | 109% | 45 / 30s | 1 |
| NIN-035-S6 — Ảo thanh phân tâm | Vòng quanh đích; 4.5m; tối đa 3 | 68% | 68% | 20 / 14s | 1 |
| NIN-035-S7 — Liên xạ thiên bản | Hình quạt; 4.5m; tối đa 4 | 175% | 162% | 28 / 20s | 1 |

### NIN-035-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-035-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### NIN-035-S1 — Chuông ảo thuật
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"blind","status_s":3,"chance":0.9}.
- P1: hệ số tổng 40% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-035-S1 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### NIN-035-S2 — Thiên bản
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-035-S2 / needle; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### NIN-035-S3 — Chuông nhiễu giác
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 102% qua 5 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-035-S3 / sound; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### NIN-035-S4 — Thiên bản dây chuông
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-035-S4 / wire; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### NIN-035-S5 — Nhiễu âm
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 109% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-035-S5 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### NIN-035-S6 — Ảo thanh phân tâm
- Cơ chế: `status`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- P1: hệ số tổng 68% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-035-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-035-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-035-S6 / sound; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### NIN-035-S7 — Liên xạ thiên bản
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 162% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-035-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-035-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-035-S7 / needle; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_EXAM.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-036
**Kimimaro** — Naruto, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: bone; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-036-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-036-S1 — Cốt đao | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-036-S2 — Liễu chi vũ | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 16 / 10s | 1 |
| NIN-036-S3 — Cốt giáp | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-036-S4 — Cốt thương | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 20 / 14s | 1 |
| NIN-036-S5 — Tảo quyết chi vũ | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 238% | 50 / 32s | 1 |
| NIN-036-S6 — Thiết tuyến hoa vũ | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 20 / 14s | 2 |
| NIN-036-S7 — Tảo quyết chi vũ mở rộng | Vùng duy trì; 5.5m; tối đa 4 | 186% | 147% | 28 / 20s | 5 |

### NIN-036-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-036-S0 / bone; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-036-S1 — Cốt đao
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-036-S1 / bone; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-036-S2 — Liễu chi vũ
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-036-S2 / bone; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-036-S3 — Cốt giáp
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-036-S3 / bone; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-036-S4 — Cốt thương
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 145% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-036-S4 / bone; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-036-S5 — Tảo quyết chi vũ
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 238% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-036-S5 / bone; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-036-S6 — Thiết tuyến hoa vũ
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-036-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-036-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-036-S6 / bone; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-036-S7 — Tảo quyết chi vũ mở rộng
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 147% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-036-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-036-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-036-S7 / bone; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Ấn chú** (NIN-036-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.

### Combo

---

