# Ninja 121–132
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-121
**Iwabe Yuino** — Boruto, đỡ đòn, phẩm chất 1/8.
- Nguyên tố: earth; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-121-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-121-S1 — Thổ thuẫn | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-121-S2 — Thổ trụ | Đạn nổ vùng; 6m; tối đa 3 | 165% | 120% | 16 / 9s | 1 |
| NIN-121-S3 — Thổ độn trụ đá | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-121-S4 — Thổ độn tường đất | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 20 / 14s | 1 |
| NIN-121-S5 — Thổ độn chiến trận | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-121-S6 — Thổ độn trói | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 20 / 14s | 1 |
| NIN-121-S7 — Gậy đá liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 186% | 186% | 28 / 20s | 3 |

### NIN-121-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-121-S0 / melee; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### NIN-121-S1 — Thổ thuẫn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-121-S1 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### NIN-121-S2 — Thổ trụ
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 120% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-121-S2 / rock; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### NIN-121-S3 — Thổ độn trụ đá
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-121-S3 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### NIN-121-S4 — Thổ độn tường đất
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-121-S4 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### NIN-121-S5 — Thổ độn chiến trận
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-121-S5 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### NIN-121-S6 — Thổ độn trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.8s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-121-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-121-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-121-S6 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### NIN-121-S7 — Gậy đá liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 186% qua 3 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-121-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-121-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-121-S7 / club; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_IWABE.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-122
**Sumire Kakei** — Boruto, hỗ trợ, phẩm chất 3/8.
- Nguyên tố: water; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-122-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-122-S1 — Thủy độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 120% | 15 / 9s | 1 |
| NIN-122-S2 — Nue | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-122-S3 — Thủy độn hộ vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 18 / 11s | 1 |
| NIN-122-S4 — Nue hộ vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-122-S5 — Nue liên kết | Vùng duy trì; 5.5m; tối đa 5 | 239% | 189% | 50 / 32s | 5 |
| NIN-122-S6 — Nue hút chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 90% | 90% | 20 / 14s | 1 |
| NIN-122-S7 — Liên kết Nue | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-122-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-122-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-122-S1 — Thủy độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 120% qua 1 hit; chakra 15; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-122-S1 / water; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-122-S2 — Nue
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-122-S2 / nue; charge → release → spawn → expire.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-122-S3 — Thủy độn hộ vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-122-S3 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-122-S4 — Nue hộ vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-122-S4 / nue; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-122-S5 — Nue liên kết
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 189% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-122-S5 / nue; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-122-S6 — Nue hút chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 90% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-122-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-122-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-122-S6 / nue; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-122-S7 — Liên kết Nue
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-122-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-122-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-122-S7 / nue; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SUMIRE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-123
**Konohamaru (trưởng thành)** — Boruto, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: fire, wind; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-123-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-123-S1 — Ảnh phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-123-S2 — Hỏa độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 137% | 16 / 10s | 1 |
| NIN-123-S3 — Phong độn áp lực | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 18 / 11s | 1 |
| NIN-123-S4 — Hỏa độn liên kích | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 20 / 14s | 1 |
| NIN-123-S5 — Rasengan | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-123-S6 — Đại Ngọc Rasengan | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 164% | 20 / 14s | 1 |
| NIN-123-S7 — Thông linh hỗ trợ | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-123-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-123-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-123-S1 — Ảnh phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-123-S1 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-123-S2 — Hỏa độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 137% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-123-S2 / fire; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-123-S3 — Phong độn áp lực
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-123-S3 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-123-S4 — Hỏa độn liên kích
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 145% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-123-S4 / fire; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-123-S5 — Rasengan
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-123-S5 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-123-S6 — Đại Ngọc Rasengan
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 164% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-123-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-123-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-123-S6 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-123-S7 — Thông linh hỗ trợ
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.4,"no_recursive":true,"role":"frontline","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-123-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-123-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-123-S7 / toad; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KONOHAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-124
**Moegi Kazamatsuri** — Boruto, hỗ trợ, phẩm chất 1/8.
- Nguyên tố: earth; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-124-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-124-S1 — Thổ độn | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-124-S2 — Hỗ trợ đội | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 16 / 8s | 1 |
| NIN-124-S3 — Thổ độn phòng vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-124-S4 — Định vị mục tiêu | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 20 / 14s | 1 |
| NIN-124-S5 — Hộ vệ đồng đội | Vòng quanh bản thân; 0m; tối đa 6 | 123% | 123% | 50 / 32s | 1 |
| NIN-124-S6 — Hỗ trợ đồng đội | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-124-S7 — Thổ độn hộ trận | Vùng duy trì; 5.5m; tối đa 4 | 186% | 130% | 28 / 20s | 5 |

### NIN-124-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-124-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-124-S1 — Thổ độn
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-124-S1 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-124-S2 — Hỗ trợ đội
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-124-S2 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-124-S3 — Thổ độn phòng vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-124-S3 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-124-S4 — Định vị mục tiêu
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-124-S4 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-124-S5 — Hộ vệ đồng đội
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 123% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-124-S5 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-124-S6 — Hỗ trợ đồng đội
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-124-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-124-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-124-S6 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-124-S7 — Thổ độn hộ trận
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 130% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-124-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-124-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-124-S7 / earth; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-125
**Udon Ise** — Boruto, hỗ trợ, phẩm chất 1/8.
- Nguyên tố: water; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-125-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-125-S1 — Thủy độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 120% | 15 / 9s | 1 |
| NIN-125-S2 — Bẫy hỗ trợ | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 16 / 9s | 1 |
| NIN-125-S3 — Thủy độn trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 18 / 11s | 1 |
| NIN-125-S4 — Bẫy dịch nhầy | Vùng duy trì; 5.5m; tối đa 4 | 165% | 98% | 20 / 14s | 5 |
| NIN-125-S5 — Khống chế khu vực | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-125-S6 — Trợ chiến đồng đội | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 20 / 14s | 1 |
| NIN-125-S7 — Thủy độn hộ trận | Tường chắn; 4m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-125-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-125-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-125-S1 — Thủy độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 120% qua 1 hit; chakra 15; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-125-S1 / water; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-125-S2 — Bẫy hỗ trợ
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế 1.47s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-125-S2 / trap; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-125-S3 — Thủy độn trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.89s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-125-S3 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-125-S4 — Bẫy dịch nhầy
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 98% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-125-S4 / mucus; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-125-S5 — Khống chế khu vực
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-125-S5 / mucus; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-125-S6 — Trợ chiến đồng đội
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-125-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-125-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-125-S6 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-125-S7 — Thủy độn hộ trận
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-125-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-125-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-125-S7 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_MOEGI_UDON.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-126
**Naruto Uzumaki (Hokage)** — Boruto, đấu sĩ, phẩm chất 5/8.
- Nguyên tố: wind; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 20; strength 21; spirit 16; agility 18; intellect 16; potential 22.
- Tăng trưởng mỗi cấp: vitality +0.9; strength +0.95; spirit +0.72; agility +0.81; intellect +0.72; potential +0.99.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-126-S0 — Thể thuật Hokage | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-126-S1 — Ảnh Phân Thân chiến thuật | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-126-S2 — Phong Độn: Rasen Shuriken | Đạn nổ vùng; 7m; tối đa 4 | 185% | 139% | 17 / 11s | 3 |
| NIN-126-S3 — Đại Ngọc Rasengan | Vòng quanh đích; 2.5m; tối đa 4 | 210% | 139% | 18 / 11s | 1 |
| NIN-126-S4 — Tiên Nhân Chế Độ | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-126-S5 — Vĩ Thú Ngọc | Đạn nổ vùng; 9m; tối đa 4 | 360% | 290% | 50 / 32s | 1 |
| NIN-126-S6 — Chakra Kurama | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-126-S7 — Tiên Pháp: Rasen Shuriken | Đạn nổ vùng; 8m; tối đa 3 | 245% | 204% | 28 / 20s | 1 |

### NIN-126-S0 — Thể thuật Hokage
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-126-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-126-S1 — Ảnh Phân Thân chiến thuật
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":3,"ttl_s":12,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-126-S1 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-126-S2 — Phong Độn: Rasen Shuriken
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.25,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 139% qua 3 hit; chakra 17; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-126-S2 / rasenshuriken; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-126-S3 — Đại Ngọc Rasengan
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.8}.
- P1: hệ số tổng 139% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-126-S3 / rasengan_big; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-126-S4 — Tiên Nhân Chế Độ
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-126-F1","requires_unlock":true,"shared_group":"NIN-126-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-126-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-126-S4 / sage; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-126-S5 — Vĩ Thú Ngọc
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 290% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"any_active_forms":["NIN-126-F2"],"snapshot":"pre_Kurama_loss"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-126-S5 / bijuu_bomb; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-126-S6 — Chakra Kurama
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-126-F2","requires_unlock":true,"shared_group":"NIN-126-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-126-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-126-1; điều kiện đặc biệt {"snapshot":"pre_Kurama_loss","requires_unlocked_form":"NIN-126-F2"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-126-S6 / chakra_cloak; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-126-S7 — Tiên Pháp: Rasen Shuriken
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 2.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 204% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-126-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-126-2; điều kiện đặc biệt {"any_active_forms":["NIN-126-F1","NIN-126-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-126-S7 / rasenshuriken; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_LATE, CYBORGS, S3_KURAMA, S3_TBV. F2 Kurama and S5 Bijuu bomb are valid only this snapshot. Post-loss and Baryon separate/HOLD. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Tiên nhân** (NIN-126-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.
- **Chakra Kurama** (NIN-126-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; skill_or_existing_manual_route.

### Combo
- COMBO-012 Song hùng: Naruto Uzumaki (Hokage) + Sasuke Uchiha (trưởng thành); CD 40s.

---

## nin-127
**Sasuke Uchiha (trưởng thành)** — Boruto, sát thủ, phẩm chất 5/8.
- Nguyên tố: lightning, space; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 15; strength 20; spirit 16; agility 23; intellect 18; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.68; strength +0.9; spirit +0.72; agility +1.03; intellect +0.81; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-127-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-127-S1 — Chidori | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 175% | 14 / 10s | 1 |
| NIN-127-S2 — Thiên thủ lực | Dịch chuyển theo dấu; 7m; tối đa 1 | 150% | 150% | 16 / 9s | 1 |
| NIN-127-S3 — Chidori liên kích | Lướt tiếp xúc; 4m; tối đa 1 | 205% | 181% | 18 / 11s | 2 |
| NIN-127-S4 — Thiên thủ lực — dịch chuyển | Dịch chuyển theo dấu; 7m; tối đa 1 | 150% | 150% | 20 / 14s | 1 |
| NIN-127-S5 — Susanoo | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-127-S6 — Susanoo phòng vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-127-S7 — Amaterasu | Vùng duy trì; 5.5m; tối đa 4 | 186% | 159% | 28 / 20s | 5 |

### NIN-127-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-127-S0 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-127-S1 — Chidori
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 175% qua 1 hit; chakra 14; hồi chiêu 10s; khống chế 0.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-127-S1 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-127-S2 — Thiên thủ lực
- Cơ chế: `position_swap`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":false,"max_marks":3,"mark_ttl_s":10,"swap_both_entities":true,"boss_immovable":true,"no_clip":true}.
- P1: hệ số tổng 150% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"any_active_forms":["NIN-127-F1"],"snapshot":"pre_Rinnegan_loss"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-127-S2 / space; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-127-S3 — Chidori liên kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 181% qua 2 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-127-S3 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-127-S4 — Thiên thủ lực — dịch chuyển
- Cơ chế: `position_swap`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":false,"max_marks":3,"mark_ttl_s":10,"swap_both_entities":true,"boss_immovable":true,"no_clip":true}.
- P1: hệ số tổng 150% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"any_active_forms":["NIN-127-F1"],"snapshot":"pre_Rinnegan_loss"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-127-S4 / space; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-127-S5 — Susanoo
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-127-F2","requires_unlock":true,"shared_group":"NIN-127-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-127-F2"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-127-S5 / susanoo; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-127-S6 — Susanoo phòng vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-127-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-127-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-127-S6 / susanoo; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-127-S7 — Amaterasu
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 159% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-127-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-127-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-127-S7 / blackfire; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_LATE, CYBORGS, S3_TBV. Amenotejikara requires F1; post-loss variant no Rinnegan abilities. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Rinnegan** (NIN-127-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.
- **Susanoo** (NIN-127-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; skill_or_existing_manual_route.

### Combo
- COMBO-012 Song hùng: Naruto Uzumaki (Hokage) + Sasuke Uchiha (trưởng thành); CD 40s.

---

## nin-128
**Sakura Haruno (trưởng thành)** — Boruto, trị liệu, phẩm chất 4/8.
- Nguyên tố: yang; thiên phú cố định: Chuyên môn trị liệu; nghề gợi ý: dược.
- Chỉ số gốc: vitality 14; strength 10; spirit 19; agility 12; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.63; strength +0.45; spirit +0.86; agility +0.54; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-128-S0 — Đòn phòng vệ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-128-S1 — Chưởng tiên thuật | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 165% | 165% | 14 / 9s | 1 |
| NIN-128-S2 — Quái lực | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 16 / 8s | 1 |
| NIN-128-S3 — Chưởng tiên thuật nhóm | Vòng quanh bản thân; 0m; tối đa 6 | 175% | 137% | 19 / 12s | 3 |
| NIN-128-S4 — Quái lực địa chấn | Vùng khóa tọa độ; 6.5m; tối đa 5 | 230% | 99% | 20 / 14s | 1 |
| NIN-128-S5 — Bách Hào | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-128-S6 — Katsuyu | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-128-S7 — Bách Hào hồi phục | Vòng quanh bản thân; 0m; tối đa 6 | 198% | 181% | 28 / 20s | 3 |

### NIN-128-S0 — Đòn phòng vệ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-128-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-128-S1 — Chưởng tiên thuật
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 165% qua 1 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-128-S1 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-128-S2 — Quái lực
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-128-S2 / smash; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-128-S3 — Chưởng tiên thuật nhóm
- Cơ chế: `heal_pulse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 137% qua 3 hit; chakra 19; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-128-S3 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-128-S4 — Quái lực địa chấn
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 99% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-128-S4 / smash; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-128-S5 — Bách Hào
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-128-F1","requires_unlock":true,"shared_group":"NIN-128-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-128-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-128-S5 / byakugo; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-128-S6 — Katsuyu
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.35,"attack_fraction":0,"no_recursive":true,"role":"heal_ally","heal_coefficient":0.35,"interval_s":2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-128-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-128-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-128-S6 / slug; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-128-S7 — Bách Hào hồi phục
- Cơ chế: `heal_pulse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 181% qua 3 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-128-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-128-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-128-S7 / byakugo; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAKURA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Bách Hào** (NIN-128-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-129
**Shikamaru Nara (trưởng thành)** — Boruto, khống chế, phẩm chất 4/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-129-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-129-S1 — Ảnh mô phỏng | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-129-S2 — Ảnh khâu | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 134% | 16 / 9s | 1 |
| NIN-129-S3 — Ảnh khâu — xuyên phá | Xuyên tuyến; 6m; tối đa 3 | 190% | 134% | 18 / 11s | 1 |
| NIN-129-S4 — Ảnh trói diện rộng | Xuyên tuyến; 5.5m; tối đa 3 | 85% | 85% | 20 / 14s | 1 |
| NIN-129-S5 — Ảnh trận chiến thuật | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-129-S6 — Bóng hộ vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 130% | 130% | 20 / 14s | 1 |
| NIN-129-S7 — Chỉ huy chiến thuật | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-129-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-129-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-129-S1 — Ảnh mô phỏng
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-129-S1 / shadow; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-129-S2 — Ảnh khâu
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-129-S2 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-129-S3 — Ảnh khâu — xuyên phá
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-129-S3 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-129-S4 — Ảnh trói diện rộng
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":1.8,"chance":0.8}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-129-S4 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-129-S5 — Ảnh trận chiến thuật
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-129-S5 / shadow; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-129-S6 — Bóng hộ vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-129-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-129-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-129-S6 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-129-S7 — Chỉ huy chiến thuật
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-129-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-129-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-129-S7 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-130
**Momoshiki Otsutsuki** — Boruto, công kích xa, phẩm chất 6/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 16; strength 15; spirit 19; agility 17; intellect 23; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.68; spirit +0.86; agility +0.77; intellect +1.03; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-130-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-130-S1 — Hấp thụ nhẫn thuật | Cung bảo vệ; 0m; tối đa 1 | 0% | 0% | 15 / 18s | 1 |
| NIN-130-S2 — Phản trả nhẫn thuật | Bản thân; 0m; tối đa 1 | 130% | 130% | 16 / 8s | 1 |
| NIN-130-S3 — Hấp thu nhẫn thuật | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 18 / 11s | 1 |
| NIN-130-S4 — Phản trả chakra | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 20 / 14s | 1 |
| NIN-130-S5 — Chakra hợp nhất | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-130-S6 — Chakra hợp nhất — khai mở | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-130-S7 — Chakra bộc kích | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 161% | 28 / 20s | 1 |

### NIN-130-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-130-S0 / kunai; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-130-S1 — Hấp thụ nhẫn thuật
- Cơ chế: `absorb`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- P1: hệ số tổng 0% qua 1 hit; chakra 15; hồi chiêu 18s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-130-S1 / karma; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-130-S2 — Phản trả nhẫn thuật
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-130-S2 / karma; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-130-S3 — Hấp thu nhẫn thuật
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-130-S3 / karma; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-130-S4 — Phản trả chakra
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-130-S4 / chakra; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-130-S5 — Chakra hợp nhất
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-130-F1","requires_unlock":true,"shared_group":"NIN-130-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-130-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-130-S5 / chakra; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-130-S6 — Chakra hợp nhất — khai mở
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-130-F1","requires_unlock":true,"shared_group":"NIN-130-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-130-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-130-1; điều kiện đặc biệt {"requires_unlocked_form":"NIN-130-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-130-S6 / chakra; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-130-S7 — Chakra bộc kích
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 161% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-130-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-130-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-130-S7 / chakra; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; MOMO, KARMA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Hợp nhất chakra** (NIN-130-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-131
**Kinshiki Otsutsuki** — Boruto, đấu sĩ, phẩm chất 5/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 20; strength 21; spirit 16; agility 18; intellect 16; potential 22.
- Tăng trưởng mỗi cấp: vitality +0.9; strength +0.95; spirit +0.72; agility +0.81; intellect +0.72; potential +0.99.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-131-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-131-S1 — Vũ khí chakra | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-131-S2 — Chém chakra | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 16 / 10s | 1 |
| NIN-131-S3 — Đao chakra | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 18 / 11s | 1 |
| NIN-131-S4 — Rìu chakra | Đạn nổ vùng; 6m; tối đa 3 | 165% | 137% | 20 / 14s | 1 |
| NIN-131-S5 — Vũ khí khổng lồ | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 238% | 50 / 32s | 1 |
| NIN-131-S6 — Vũ khí chakra liên kích | Đơn mục tiêu; 1.8m; tối đa 1 | 254% | 252% | 20 / 14s | 6 |
| NIN-131-S7 — Đại vũ khí | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 155% | 28 / 20s | 1 |

### NIN-131-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-131-S0 / melee; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-131-S1 — Vũ khí chakra
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-131-S1 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-131-S2 — Chém chakra
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 145% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-131-S2 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-131-S3 — Đao chakra
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-131-S3 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-131-S4 — Rìu chakra
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 137% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-131-S4 / chakra; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-131-S5 — Vũ khí khổng lồ
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 238% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-131-S5 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-131-S6 — Vũ khí chakra liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 252% qua 6 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-131-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-131-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-131-S6 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-131-S7 — Đại vũ khí
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 155% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-131-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-131-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-131-S7 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_KINSHIKI, P4_KINSHIKI_GAME.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-132
**Isshiki Otsutsuki** — Boruto, khống chế, phẩm chất 8/8.
- Nguyên tố: space; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 16; strength 14; spirit 22; agility 17; intellect 23; potential 26.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.63; spirit +0.99; agility +0.77; intellect +1.03; potential +1.17.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-132-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-132-S1 — Sukunahikona | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-132-S2 — Daikokuten | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 16 / 9s | 1 |
| NIN-132-S3 — Sukunahikona né tránh | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-132-S4 — Daikokuten triệu vật | Tường chắn; 4m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-132-S5 — Khối lập phương | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 210% | 50 / 32s | 1 |
| NIN-132-S6 — Khối lập phương áp chế | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 20 / 14s | 5 |
| NIN-132-S7 — Thu nhỏ đột kích | Lướt tiếp xúc; 3.5m; tối đa 1 | 198% | 198% | 28 / 20s | 1 |

### NIN-132-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-132-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-132-S1 — Sukunahikona
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1,"shrink_target":"caster_or_nonliving_object","never_shrink_other_living_target":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-132-S1 / shrink; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-132-S2 — Daikokuten
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- P1: hệ số tổng 60% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế 1.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-132-S2 / cube; charge → release → impact → residual → expire.
- Nguồn: TECHNIQUE_LINK_LIMITED; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-132-S3 — Sukunahikona né tránh
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5,"shrink_target":"caster_or_nonliving_object","never_shrink_other_living_target":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-132-S3 / shrink; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-132-S4 — Daikokuten triệu vật
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-132-S4 / cube; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-132-S5 — Khối lập phương
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"telegraph_s":0.9,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- P1: hệ số tổng 210% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-132-S5 / cube; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-132-S6 — Khối lập phương áp chế
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5,"retrieve":"preauthored_nonliving_object","max_objects":3,"safe_placement":true,"never_teleport_living_enemy_into_storage":true}.
- P1: hệ số tổng 135% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-132-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-132-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-132-S6 / cube; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-132-S7 — Thu nhỏ đột kích
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 198% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-132-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-132-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-132-S7 / shrink; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

