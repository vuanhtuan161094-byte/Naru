# Ninja 61–72
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-061
**Kisame Hoshigaki** — Shippuden, đỡ đòn, phẩm chất 4/8.
- Nguyên tố: water; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 25; strength 19; spirit 19; agility 13; intellect 15; potential 22.
- Tăng trưởng mỗi cấp: vitality +1.13; strength +0.86; spirit +0.86; agility +0.59; intellect +0.68; potential +0.99.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-061-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-061-S1 — Thủy giao đạn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 120% | 15 / 9s | 1 |
| NIN-061-S2 — Hấp thụ chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 11 / 8s | 1 |
| NIN-061-S3 — Thủy phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-061-S4 — Samehada hấp chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 20 / 14s | 1 |
| NIN-061-S5 — Thủy lao giao vũ | Vùng duy trì; 5.5m; tối đa 5 | 239% | 189% | 50 / 32s | 5 |
| NIN-061-S6 — Thiên thực giao | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 136% | 20 / 14s | 4 |
| NIN-061-S7 — Thủy lao giao vũ — chấn kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 144% | 28 / 20s | 1 |

### NIN-061-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-061-S0 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-061-S1 — Thủy giao đạn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 120% qua 1 hit; chakra 15; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-061-S1 / shark; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-061-S2 — Hấp thụ chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 11; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-061-S2 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-061-S3 — Thủy phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":9,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-061-S3 / water; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-061-S4 — Samehada hấp chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-061-S4 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-061-S5 — Thủy lao giao vũ
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 189% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-061-S5 / water; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-061-S6 — Thiên thực giao
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 136% qua 4 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-061-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-061-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-061-S6 / shark; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-061-S7 — Thủy lao giao vũ — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 144% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-061-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-061-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-061-S7 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Hợp thể Samehada** (NIN-061-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.

### Combo
- COMBO-007 Akatsuki phối hợp: Itachi Uchiha + Kisame Hoshigaki; CD 30s.

---

## nin-062
**Deidara** — Shippuden, công kích xa, phẩm chất 4/8.
- Nguyên tố: explosion; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-062-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-062-S1 — C1 | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 16 / 10s | 1 |
| NIN-062-S2 — C2 | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-062-S3 — C1 phi điểu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 18 / 11s | 1 |
| NIN-062-S4 — C2 long đạn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 20 / 14s | 1 |
| NIN-062-S5 — C3 | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 1 |
| NIN-062-S6 — C3 đại bộc | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 170% | 20 / 14s | 1 |
| NIN-062-S7 — C4 vi thể | Vùng duy trì; 5.5m; tối đa 4 | 186% | 153% | 28 / 20s | 5 |

### NIN-062-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-062-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-062-S1 — C1
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-062-S1 / clay; charge → release → travel → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-062-S2 — C2
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-062-S2 / clay; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-062-S3 — C1 phi điểu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-062-S3 / clay; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-062-S4 — C2 long đạn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 142% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-062-S4 / clay; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-062-S5 — C3
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 237% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-062-S5 / clay; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-062-S6 — C3 đại bộc
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 170% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-062-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-062-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-062-S6 / clay; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-062-S7 — C4 vi thể
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 153% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-062-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-062-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-062-S7 / clay; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DEIDARA, S3_DEIDARA, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-063
**Sasori** — Shippuden, khống chế, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-063-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-063-S1 — Độc châm | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 12 / 7s | 1 |
| NIN-063-S2 — Thiết sa | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 134% | 16 / 9s | 1 |
| NIN-063-S3 — Rối tam đại Kazekage | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-063-S4 — Thiết sa trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-063-S5 — Bách cơ thao diễn | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 210% | 50 / 32s | 4 |
| NIN-063-S6 — Thiết sa giới pháp | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 20 / 14s | 5 |
| NIN-063-S7 — Bách cơ hộ trận | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-063-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-063-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-063-S1 — Độc châm
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- P1: hệ số tổng 85% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-063-S1 / poison; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-063-S2 — Thiết sa
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-063-S2 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-063-S3 — Rối tam đại Kazekage
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-063-S3 / puppet; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-063-S4 — Thiết sa trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-063-S4 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-063-S5 — Bách cơ thao diễn
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 210% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-063-S5 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-063-S6 — Thiết sa giới pháp
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-063-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-063-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-063-S6 / iron; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-063-S7 — Bách cơ hộ trận
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-063-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-063-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-063-S7 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASORI, S3_SASORI.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-064
**Hidan** — Shippuden, đấu sĩ, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-064-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-064-S1 — Liêm đao | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 12 / 7s | 1 |
| NIN-064-S2 — Nghi thức nguyền rủa | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 16 / 8s | 1 |
| NIN-064-S3 — Liêm đao tầm xa | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 18 / 11s | 1 |
| NIN-064-S4 — Nghi thức đánh dấu | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-064-S5 — Tử ti bằng huyết | Đơn mục tiêu; 5m; tối đa 1 | 305% | 305% | 45 / 30s | 1 |
| NIN-064-S6 — Liêm đao phản kích | Bản thân; 0m; tối đa 1 | 147% | 147% | 20 / 14s | 1 |
| NIN-064-S7 — Nguyền rủa: cộng hưởng nghi thức | Đơn mục tiêu; 5m; tối đa 1 | 237% | 237% | 28 / 20s | 1 |

### NIN-064-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-064-S0 / scythe; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-064-S1 — Liêm đao
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-064-S1 / scythe; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-064-S2 — Nghi thức nguyền rủa
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-064-S2 / blood; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-064-S3 — Liêm đao tầm xa
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 145% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-064-S3 / scythe; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-064-S4 — Nghi thức đánh dấu
- Cơ chế: `ritual_zone`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4,"requires_owned_mark":true}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.33s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-064-S4 / blood; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-064-S5 — Tử ti bằng huyết
- Cơ chế: `linked_damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"requires_owned_mark":true,"consume_mark":true,"requires_inside_own_zone":true,"reflect_fraction":0.35,"boss_cap":0.15}.
- P1: hệ số tổng 305% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-064-S5 / curse; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-064-S6 — Liêm đao phản kích
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-064-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-064-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-064-S6 / scythe; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-064-S7 — Nguyền rủa: cộng hưởng nghi thức
- Cơ chế: `linked_damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"requires_owned_mark":true,"consume_mark":true,"requires_inside_own_zone":true,"reflect_fraction":0.35,"boss_cap":0.15}.
- P1: hệ số tổng 237% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-064-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-064-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-064-S7 / curse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; HIDAN, IMMORTALS, S3_ASUMA, S3_HIDAN. Owned blood mark plus ritual circle; linked injury once per trigger, no immortality in ordinary battle. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-065
**Kakuzu** — Shippuden, công kích xa, phẩm chất 4/8.
- Nguyên tố: fire, wind, lightning; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-065-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-065-S1 — Địa oán ngu | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-065-S2 — Hỏa đầu khắc | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 16 / 10s | 1 |
| NIN-065-S3 — Thổ độn cứng hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-065-S4 — Mặt nạ chakra | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-065-S5 — Mặt nạ hợp kích | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-065-S6 — Hỏa phong hợp kích | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-065-S7 — Địa oán ngu hợp thể | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-065-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-065-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-065-S1 — Địa oán ngu
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.71s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-065-S1 / thread; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-065-S2 — Hỏa đầu khắc
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-065-S2 / fire; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-065-S3 — Thổ độn cứng hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-065-S3 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-065-S4 — Mặt nạ chakra
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":14,"hp_fraction":0.3,"attack_fraction":0.35,"no_recursive":true,"role":"element_ranged","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-065-S4 / mask; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-065-S5 — Mặt nạ hợp kích
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-065-S5 / mask; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-065-S6 — Hỏa phong hợp kích
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-065-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-065-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-065-S6 / fire; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-065-S7 — Địa oán ngu hợp thể
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-065-F1","requires_unlock":true,"shared_group":"NIN-065-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-065-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-065-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-065-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-065-S7 / thread; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; IMMORTALS, S3_ASUMA, S3_KISAME.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Địa oán ngu** (NIN-065-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-066
**Konan** — Shippuden, công kích xa, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-066-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-066-S1 — Giấy phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-066-S2 — Giấy phi tiêu | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 16 / 10s | 1 |
| NIN-066-S3 — Giấy cánh | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-066-S4 — Giấy phân thân — né tránh | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-066-S5 — Thức chỉ chi vũ | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-066-S6 — Giấy vây khốn | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 20 / 14s | 1 |
| NIN-066-S7 — Giấy bộc liên hoàn | Vùng duy trì; 5.5m; tối đa 4 | 186% | 153% | 28 / 20s | 5 |

### NIN-066-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-066-S0 / kunai; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-066-S1 — Giấy phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-066-S1 / paper; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-066-S2 — Giấy phi tiêu
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-066-S2 / paper; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-066-S3 — Giấy cánh
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-066-S3 / paper; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-066-S4 — Giấy phân thân — né tránh
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-066-S4 / paper; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-066-S5 — Thức chỉ chi vũ
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-066-S5 / paper; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-066-S6 — Giấy vây khốn
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-066-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-066-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-066-S6 / paper; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-066-S7 — Giấy bộc liên hoàn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 153% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-066-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-066-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-066-S7 / paper; charge → release → impact → residual → expire.
- Nguồn: P2_CONTEXT_ONLY; KONAN.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-067
**Pain (Thiên Đạo)** — Shippuden, khống chế, phẩm chất 5/8.
- Nguyên tố: gravity; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 16; strength 14; spirit 22; agility 17; intellect 23; potential 24.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.63; spirit +0.99; agility +0.77; intellect +1.03; potential +1.08.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-067-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-067-S1 — Vạn tượng thiên dẫn | Đơn mục tiêu; 5.5m; tối đa 1 | 75% | 75% | 12 / 7s | 1 |
| NIN-067-S2 — Thần la thiên chinh | Hình quạt; 4m; tối đa 3 | 110% | 110% | 16 / 9s | 1 |
| NIN-067-S3 — Thần la đẩy lùi | Vòng quanh bản thân; 0m; tối đa 4 | 135% | 114% | 18 / 11s | 1 |
| NIN-067-S4 — Vạn tượng kéo | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 134% | 20 / 14s | 1 |
| NIN-067-S5 — Địa bạo thiên tinh | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 219% | 50 / 32s | 1 |
| NIN-067-S6 — Thần la diện rộng | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 142% | 20 / 14s | 1 |
| NIN-067-S7 — Địa bạo phong tỏa | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 28 / 20s | 5 |

### NIN-067-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-067-S0 / kunai; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-067-S1 — Vạn tượng thiên dẫn
- Cơ chế: `displace`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"towards_caster","distance_m":2.2}.
- P1: hệ số tổng 75% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-067-S1 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-067-S2 — Thần la thiên chinh
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 110% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-067-S2 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-067-S3 — Thần la đẩy lùi
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh bản thân; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.6}.
- P1: hệ số tổng 114% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-067-S3 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-067-S4 — Vạn tượng kéo
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-067-S4 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-067-S5 — Địa bạo thiên tinh
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 219% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-067-S5 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-067-S6 — Thần la diện rộng
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 142% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-067-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-067-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-067-S6 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-067-S7 — Địa bạo phong tỏa
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-067-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-067-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-067-S7 / gravity; charge → release → impact → residual → expire.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-068
**Nagato** — Shippuden, khống chế, phẩm chất 5/8.
- Nguyên tố: gravity; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 16; strength 14; spirit 22; agility 17; intellect 23; potential 24.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.63; spirit +0.99; agility +0.77; intellect +1.03; potential +1.08.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-068-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-068-S1 — Hấp thụ chakra | Cung bảo vệ; 0m; tối đa 1 | 0% | 0% | 15 / 18s | 1 |
| NIN-068-S2 — Triệu hồi | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-068-S3 — Súc sinh đạo triệu hồi | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-068-S4 — Ngạ quỷ đạo hấp chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 20 / 14s | 1 |
| NIN-068-S5 — Luân hồi áp chế | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-068-S6 — Tu la đạo công kích | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 142% | 20 / 14s | 4 |
| NIN-068-S7 — Luân hồi liên kết | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-068-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-068-S0 / kunai; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-068-S1 — Hấp thụ chakra
- Cơ chế: `absorb`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- P1: hệ số tổng 0% qua 1 hit; chakra 15; hồi chiêu 18s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-068-S1 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-068-S2 — Triệu hồi
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-068-S2 / summon; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-068-S3 — Súc sinh đạo triệu hồi
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-068-S3 / summon; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-068-S4 — Ngạ quỷ đạo hấp chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-068-S4 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-068-S5 — Luân hồi áp chế
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-068-S5 / gravity; charge → release → impact → residual → expire.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-068-S6 — Tu la đạo công kích
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 142% qua 4 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-068-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-068-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-068-S6 / missile; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-068-S7 — Luân hồi liên kết
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-068-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-068-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-068-S7 / gravity; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; PAIN.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-069
**Obito Uchiha** — Shippuden, sát thủ, phẩm chất 6/8.
- Nguyên tố: fire, space; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 15; strength 20; spirit 16; agility 23; intellect 18; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.68; strength +0.9; spirit +0.72; agility +1.03; intellect +0.81; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-069-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-069-S1 — Hỏa độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 148% | 16 / 10s | 1 |
| NIN-069-S2 — Kamui | Vùng duy trì; 5.5m; tối đa 4 | 165% | 120% | 16 / 12s | 5 |
| NIN-069-S3 — Kamui: thoát đòn | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-069-S4 — Hỏa độn bộc phong | Hình quạt; 4.5m; tối đa 4 | 155% | 144% | 20 / 14s | 1 |
| NIN-069-S5 — Không gian tập kích | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-069-S6 — Kamui dịch chuyển | Dịch chuyển theo dấu; 7m; tối đa 1 | 169% | 169% | 20 / 14s | 1 |
| NIN-069-S7 — Không gian trói | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 28 / 20s | 1 |

### NIN-069-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-069-S0 / melee; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-069-S1 — Hỏa độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 148% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-069-S1 / fire; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-069-S2 — Kamui
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 120% qua 5 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"forbidden_active_forms":["NIN-069-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-069-S2 / space; charge → release → impact → residual → expire.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-069-S3 — Kamui: thoát đòn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"forbidden_active_forms":["NIN-069-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-069-S3 / space; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-069-S4 — Hỏa độn bộc phong
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 144% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-069-S4 / fire; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-069-S5 — Không gian tập kích
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"forbidden_active_forms":["NIN-069-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-069-S5 / space; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-069-S6 — Kamui dịch chuyển
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- P1: hệ số tổng 169% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-069-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-069-1; điều kiện đặc biệt {"forbidden_active_forms":["NIN-069-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-069-S6 / space; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-069-S7 — Không gian trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế 1.62s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-069-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-069-2; điều kiện đặc biệt {"forbidden_active_forms":["NIN-069-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-069-S7 / space; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OBITO, TEAM7. Ten-Tails form excludes Kamui/phase skills; no simultaneous modes. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Mangekyo** (NIN-069-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.
- **Jinchuriki Thập Vĩ** (NIN-069-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; hp_threshold_or_manual.

### Combo

---

## nin-070
**Madara Uchiha** — Shippuden, công kích xa, phẩm chất 6/8.
- Nguyên tố: fire; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 16; strength 15; spirit 19; agility 17; intellect 23; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.68; spirit +0.86; agility +0.77; intellect +1.03; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-070-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-070-S1 — Hào hỏa diệt khước | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 16 / 10s | 1 |
| NIN-070-S2 — Mộc phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-070-S3 — Hỏa độn hỏa long | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 18 / 11s | 1 |
| NIN-070-S4 — Susanoo phòng vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-070-S5 — Susanoo | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-070-S6 — Susanoo hoàn chỉnh | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 20 / 14s | 1 |
| NIN-070-S7 — Thiên ngại chấn tinh | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 161% | 28 / 20s | 1 |

### NIN-070-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-070-S0 / kunai; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-070-S1 — Hào hỏa diệt khước
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 138% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-070-S1 / fire; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-070-S2 — Mộc phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.35,"no_recursive":true,"role":"guard","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-070-S2 / wood; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-070-S3 — Hỏa độn hỏa long
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 142% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-070-S3 / fire; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-070-S4 — Susanoo phòng vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-070-S4 / susanoo; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-070-S5 — Susanoo
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-070-F1","requires_unlock":true,"shared_group":"NIN-070-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-070-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-070-S5 / susanoo; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-070-S6 — Susanoo hoàn chỉnh
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-070-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-070-1; điều kiện đặc biệt {"any_active_forms":["NIN-070-F1"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-070-S6 / susanoo; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-070-S7 — Thiên ngại chấn tinh
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 161% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-070-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-070-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-070-S7 / meteor; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MADARA, WAR. Susanoo/ocular/Ten-Tails mutually exclusive; meteor requires war memory; no unrestricted resurrection. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Susanoo** (NIN-070-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.
- **Rinnegan** (NIN-070-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; manual_stance.
- **Jinchuriki Thập Vĩ** (NIN-070-F3): cảnh giới 7, 15 RES-127; thời lượng 20s; CD 60s; chakra 55; hp_threshold_or_manual.

### Combo

---

## nin-071
**Zetsu Trắng** — Shippuden, hỗ trợ, phẩm chất 4/8.
- Nguyên tố: wood; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-071-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-071-S1 — Bào tử | Vùng duy trì; 5.5m; tối đa 4 | 165% | 98% | 15 / 12s | 5 |
| NIN-071-S2 — Ẩn thân | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-071-S3 — Bào tử bám | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 18 / 11s | 1 |
| NIN-071-S4 — Mộc hóa che chắn | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 20 / 14s | 1 |
| NIN-071-S5 — Phân thân hỗ trợ | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 45 / 36s | 1 |
| NIN-071-S6 — Bào tử phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-071-S7 — Trinh sát ngụy trang | Đơn mục tiêu; 6m; tối đa 1 | 28% | 28% | 28 / 20s | 1 |

### NIN-071-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-071-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### NIN-071-S1 — Bào tử
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 98% qua 5 hit; chakra 15; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-071-S1 / spore; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### NIN-071-S2 — Ẩn thân
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-071-S2 / stealth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### NIN-071-S3 — Bào tử bám
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-071-S3 / spore; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### NIN-071-S4 — Mộc hóa che chắn
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-071-S4 / wood; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### NIN-071-S5 — Phân thân hỗ trợ
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 36s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-071-S5 / spore; charge → release → spawn → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### NIN-071-S6 — Bào tử phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-071-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-071-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-071-S6 / spore; charge → release → spawn → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### NIN-071-S7 — Trinh sát ngụy trang
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 28% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-071-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-071-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-071-S7 / stealth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_ZETSU.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-072
**Zetsu Đen** — Shippuden, khống chế, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-072-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-072-S1 — Ẩn thân | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-072-S2 — Khống chế cơ thể | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 16 / 8s | 1 |
| NIN-072-S3 — Ẩn thân ngầm | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-072-S4 — Bám khống chế | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-072-S5 — Ký sinh | Đơn mục tiêu; 3.8m; tối đa 1 | 116% | 116% | 45 / 30s | 1 |
| NIN-072-S6 — Ký sinh làm suy yếu | Đơn mục tiêu; 4.5m; tối đa 1 | 68% | 68% | 20 / 14s | 1 |
| NIN-072-S7 — Thao túng mục tiêu | Đơn mục tiêu; 4.8m; tối đa 1 | 45% | 45% | 28 / 20s | 1 |

### NIN-072-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-072-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-072-S1 — Ẩn thân
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-072-S1 / stealth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-072-S2 — Khống chế cơ thể
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-072-S2 / parasite; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-072-S3 — Ẩn thân ngầm
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-072-S3 / stealth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-072-S4 — Bám khống chế
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-072-S4 / parasite; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-072-S5 — Ký sinh
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 116% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-072-S5 / parasite; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-072-S6 — Ký sinh làm suy yếu
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"attack_down","status_s":4,"magnitude":0.18,"chance":0.9}.
- P1: hệ số tổng 68% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-072-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-072-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-072-S6 / parasite; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-072-S7 — Thao túng mục tiêu
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"blind","status_s":3,"chance":0.9}.
- P1: hệ số tổng 45% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-072-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-072-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-072-S7 / parasite; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_BLACK_ZETSU.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

