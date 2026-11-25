# Ninja 85–96
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-085
**Ao** — Shippuden, hỗ trợ, phẩm chất 3/8.
- Nguyên tố: water; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-085-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-085-S1 — Cảm tri | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 12 / 6s | 1 |
| NIN-085-S2 — Bạch nhãn | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-085-S3 — Bạch nhãn trinh sát | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-085-S4 — Cảm tri chakra | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-085-S5 — Trinh sát chiến trường | Vòng quanh bản thân; 0m; tối đa 6 | 123% | 123% | 50 / 32s | 1 |
| NIN-085-S6 — Thủy độn hộ vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 130% | 130% | 20 / 14s | 1 |
| NIN-085-S7 — Cảm ứng phá ảo | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-085-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-085-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### NIN-085-S1 — Cảm tri
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-085-S1 / sense; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### NIN-085-S2 — Bạch nhãn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-085-S2 / eye; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### NIN-085-S3 — Bạch nhãn trinh sát
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-085-S3 / eye; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### NIN-085-S4 — Cảm tri chakra
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-085-S4 / sense; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### NIN-085-S5 — Trinh sát chiến trường
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 123% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-085-S5 / sense; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### NIN-085-S6 — Thủy độn hộ vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-085-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-085-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-085-S6 / water; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### NIN-085-S7 — Cảm ứng phá ảo
- Cơ chế: `cleanse`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":2,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-085-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-085-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-085-S7 / cleanse; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_AO.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-086
**Onoki** — Shippuden, công kích xa, phẩm chất 5/8.
- Nguyên tố: dust, earth; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 16; strength 15; spirit 19; agility 17; intellect 23; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.68; spirit +0.86; agility +0.77; intellect +1.03; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-086-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-086-S1 — Khinh trọng nham | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-086-S2 — Gia trọng nham | Vòng quanh đích; 4.5m; tối đa 3 | 60% | 60% | 16 / 8s | 1 |
| NIN-086-S3 — Khinh trọng nham — tăng tốc nhóm | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-086-S4 — Gia trọng nham — khóa đơn | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-086-S5 — Trần độn nguyên giới bác ly | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 1 |
| NIN-086-S6 — Trần độn hình lập phương | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 20 / 14s | 1 |
| NIN-086-S7 — Thổ độn hộ vệ | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-086-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-086-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-086-S1 — Khinh trọng nham
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-086-S1 / gravity; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-086-S2 — Gia trọng nham
- Cơ chế: `status`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- P1: hệ số tổng 60% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-086-S2 / gravity; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-086-S3 — Khinh trọng nham — tăng tốc nhóm
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.15,"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-086-S3 / gravity; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-086-S4 — Gia trọng nham — khóa đơn
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-086-S4 / gravity; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-086-S5 — Trần độn nguyên giới bác ly
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 237% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-086-S5 / dust; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-086-S6 — Trần độn hình lập phương
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-086-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-086-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-086-S6 / dust; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-086-S7 — Thổ độn hộ vệ
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-086-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-086-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-086-S7 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-087
**Kurotsuchi** — Shippuden, khống chế, phẩm chất 3/8.
- Nguyên tố: lava, earth; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-087-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-087-S1 — Thổ độn | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-087-S2 — Dung độn | Vùng duy trì; 5.5m; tối đa 4 | 165% | 102% | 16 / 12s | 5 |
| NIN-087-S3 — Dung độn vôi hóa | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 18 / 11s | 1 |
| NIN-087-S4 — Thổ độn trói | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-087-S5 — Vôi hóa | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 219% | 50 / 32s | 1 |
| NIN-087-S6 — Thủy độn hỗ trợ | Đạn nổ vùng; 6m; tối đa 3 | 186% | 166% | 20 / 14s | 1 |
| NIN-087-S7 — Dung độn phong tỏa | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 28 / 20s | 5 |

### NIN-087-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-087-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-087-S1 — Thổ độn
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-087-S1 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-087-S2 — Dung độn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 102% qua 5 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-087-S2 / lava; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-087-S3 — Dung độn vôi hóa
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-087-S3 / lime; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-087-S4 — Thổ độn trói
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-087-S4 / earth; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-087-S5 — Vôi hóa
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 219% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-087-S5 / lime; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-087-S6 — Thủy độn hỗ trợ
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 166% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-087-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-087-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-087-S6 / water; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-087-S7 — Dung độn phong tỏa
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-087-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-087-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-087-S7 / lava; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-088
**Akatsuchi** — Shippuden, đỡ đòn, phẩm chất 3/8.
- Nguyên tố: earth; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-088-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-088-S1 — Thổ thuẫn | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-088-S2 — Thổ nhân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-088-S3 — Thổ nhân hộ vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 18 / 11s | 1 |
| NIN-088-S4 — Thổ thuẫn — hộ vệ nhóm | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 20 / 14s | 1 |
| NIN-088-S5 — Cự thạch hộ vệ | Tường chắn; 4m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-088-S6 — Thổ nhân trọng kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 144% | 20 / 14s | 1 |
| NIN-088-S7 — Cự thạch phòng tuyến | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-088-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-088-S0 / melee; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-088-S1 — Thổ thuẫn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-088-S1 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-088-S2 — Thổ nhân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-088-S2 / golem; charge → release → spawn → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-088-S3 — Thổ nhân hộ vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-088-S3 / golem; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-088-S4 — Thổ thuẫn — hộ vệ nhóm
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-088-S4 / earth; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-088-S5 — Cự thạch hộ vệ
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-088-S5 / rock; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-088-S6 — Thổ nhân trọng kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 144% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-088-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-088-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-088-S6 / golem; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### NIN-088-S7 — Cự thạch phòng tuyến
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-088-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-088-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-088-S7 / rock; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_STONE.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-089
**Mifune** — Shippuden, sát thủ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-089-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-089-S1 — Iaido | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 175% | 14 / 10s | 1 |
| NIN-089-S2 — Kiếm khí | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 157% | 16 / 10s | 1 |
| NIN-089-S3 — Iaido liên trảm | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 18 / 11s | 3 |
| NIN-089-S4 — Kiếm đón đòn | Bản thân; 0m; tối đa 1 | 130% | 130% | 20 / 14s | 1 |
| NIN-089-S5 — Nhất thiểm | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-089-S6 — Kiếm áp chế | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-089-S7 — Nhất thiểm — xuyên phá | Xuyên tuyến; 6m; tối đa 3 | 215% | 208% | 28 / 20s | 1 |

### NIN-089-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-089-S0 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-089-S1 — Iaido
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 175% qua 1 hit; chakra 14; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-089-S1 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-089-S2 — Kiếm khí
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 157% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-089-S2 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-089-S3 — Iaido liên trảm
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-089-S3 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-089-S4 — Kiếm đón đòn
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-089-S4 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-089-S5 — Nhất thiểm
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-089-S5 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-089-S6 — Kiếm áp chế
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-089-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-089-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-089-S6 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-089-S7 — Nhất thiểm — xuyên phá
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 208% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-089-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-089-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-089-S7 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-090
**Hanzo** — Shippuden, khống chế, phẩm chất 4/8.
- Nguyên tố: poison; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-090-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-090-S1 — Độc vụ | Vùng duy trì; 5.5m; tối đa 4 | 165% | 102% | 15 / 12s | 5 |
| NIN-090-S2 — Thông linh kỳ nhông | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-090-S3 — Độc vụ lan rộng | Hình quạt; 4.5m; tối đa 4 | 155% | 122% | 18 / 11s | 1 |
| NIN-090-S4 — Kỳ nhông Ibuse | Vùng duy trì; 5.5m; tối đa 4 | 165% | 102% | 20 / 14s | 5 |
| NIN-090-S5 — Độc trận | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 210% | 50 / 32s | 4 |
| NIN-090-S6 — Liêm đao độc | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 96% | 96% | 20 / 14s | 1 |
| NIN-090-S7 — Độc trận — hút chakra vùng | Vùng duy trì; 5m; tối đa 4 | 169% | 135% | 28 / 20s | 5 |

### NIN-090-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-090-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-090-S1 — Độc vụ
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 102% qua 5 hit; chakra 15; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-090-S1 / poison; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-090-S2 — Thông linh kỳ nhông
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-090-S2 / salamander; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-090-S3 — Độc vụ lan rộng
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- P1: hệ số tổng 122% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-090-S3 / poison; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-090-S4 — Kỳ nhông Ibuse
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 102% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-090-S4 / salamander; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-090-S5 — Độc trận
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 210% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-090-S5 / poison; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-090-S6 — Liêm đao độc
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-090-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-090-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-090-S6 / scythe; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-090-S7 — Độc trận — hút chakra vùng
- Cơ chế: `zone_drain`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"chakra_per_tick":3,"transfer_fraction":0.3,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-090-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-090-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-090-S7 / poison; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-091
**Danzo Shimura** — Shippuden, khống chế, phẩm chất 4/8.
- Nguyên tố: wind, yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-091-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-091-S1 — Phong độn | Hình quạt; 4.5m; tối đa 4 | 155% | 122% | 15 / 10s | 1 |
| NIN-091-S2 — Thông linh Baku | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-091-S3 — Phong độn chân không | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 134% | 18 / 11s | 1 |
| NIN-091-S4 — Baku | Đơn mục tiêu; 5.5m; tối đa 1 | 75% | 75% | 20 / 14s | 1 |
| NIN-091-S5 — Izanagi | Bản thân; 0m; tối đa 1 | 189% | 189% | 45 / 30s | 1 |
| NIN-091-S6 — Izanagi: thoát hiểm | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-091-S7 — Phong độn chân không đại ngọc | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 150% | 28 / 20s | 1 |

### NIN-091-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-091-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-091-S1 — Phong độn
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 122% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-091-S1 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-091-S2 — Thông linh Baku
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-091-S2 / tapir; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-091-S3 — Phong độn chân không
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-091-S3 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-091-S4 — Baku
- Cơ chế: `displace`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"towards_caster","distance_m":2.2}.
- P1: hệ số tổng 75% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-091-S4 / tapir; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-091-S5 — Izanagi
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true,"charges":1,"finite_per_battle":true,"eye_cost":"DEV_1_charge","cannot_reverse_reward_or_save":true}.
- P1: hệ số tổng 189% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-091-S5 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-091-S6 — Izanagi: thoát hiểm
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1,"charges":1,"finite_per_battle":true,"eye_cost":"DEV_1_charge","cannot_reverse_reward_or_save":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-091-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-091-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-091-S6 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-091-S7 — Phong độn chân không đại ngọc
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 150% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-091-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-091-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-091-S7 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE. Izanagi finite charge with eye cost; no reversal of economic/save rewards. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-092
**Shisui Uchiha** — Shippuden, sát thủ, phẩm chất 4/8.
- Nguyên tố: fire, yin; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 15; strength 20; spirit 16; agility 23; intellect 18; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.68; strength +0.9; spirit +0.72; agility +1.03; intellect +0.81; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-092-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-092-S1 — Thuấn thân | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 175% | 14 / 10s | 1 |
| NIN-092-S2 — Hỏa độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 148% | 16 / 10s | 1 |
| NIN-092-S3 — Thuấn thân ảnh | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-092-S4 — Hỏa độn liên kích | Hình quạt; 4.5m; tối đa 4 | 155% | 144% | 20 / 14s | 1 |
| NIN-092-S5 — Kotoamatsukami | Đơn mục tiêu; 5m; tối đa 1 | 109% | 109% | 45 / 30s | 1 |
| NIN-092-S6 — Kotoamatsukami — nhiễu tâm | Đơn mục tiêu; 4.8m; tối đa 1 | 45% | 45% | 20 / 14s | 1 |
| NIN-092-S7 — Ảo thuật phối hợp | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-092-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-092-S0 / melee; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-092-S1 — Thuấn thân
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 175% qua 1 hit; chakra 14; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-092-S1 / space; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-092-S2 — Hỏa độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 148% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-092-S2 / fire; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-092-S3 — Thuấn thân ảnh
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-092-S3 / clone; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-092-S4 — Hỏa độn liên kích
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 144% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-092-S4 / fire; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-092-S5 — Kotoamatsukami
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85,"no_team_flip":true,"no_permanent_allegiance":true,"once_per_battle":true}.
- P1: hệ số tổng 109% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 1.62s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-092-S5 / mind; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-092-S6 — Kotoamatsukami — nhiễu tâm
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"blind","status_s":3,"chance":0.9,"no_team_flip":true,"no_permanent_allegiance":true,"once_per_battle":true}.
- P1: hệ số tổng 45% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-092-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-092-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-092-S6 / mind; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-092-S7 — Ảo thuật phối hợp
- Cơ chế: `cleanse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":1,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-092-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-092-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-092-S7 / mind; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; SHISUI. Kotoamatsukami tactical bounded control; no permanent team flip. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-093
**Minato Namikaze** — Shippuden, sát thủ, phẩm chất 5/8.
- Nguyên tố: space; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 15; strength 20; spirit 16; agility 23; intellect 18; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.68; strength +0.9; spirit +0.72; agility +1.03; intellect +0.81; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-093-S0 — Kunai nhanh | Đơn mục tiêu; 2.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-093-S1 — Phi Lôi Thần | Dịch chuyển theo dấu; 7m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-093-S2 — Rasengan | Lướt tiếp xúc; 3m; tối đa 1 | 170% | 170% | 16 / 10s | 1 |
| NIN-093-S3 — Phi Lôi Thần đánh dấu | Đạn chạm đầu tiên; 6m; tối đa 1 | 45% | 45% | 18 / 11s | 1 |
| NIN-093-S4 — Rasengan liên kích | Đơn mục tiêu; 2.5m; tối đa 1 | 185% | 185% | 20 / 14s | 2 |
| NIN-093-S5 — Phi Lôi Thần liên kích | Dịch chuyển theo dấu; 8m; tối đa 1 | 340% | 340% | 45 / 30s | 3 |
| NIN-093-S6 — Phi Lôi Thần cấp hai | Dịch chuyển theo dấu; 8m; tối đa 1 | 220% | 220% | 20 / 14s | 1 |
| NIN-093-S7 — Kết giới dịch chuyển | Tường chắn; 4m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-093-S0 — Kunai nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-093-S0 / kunai; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-093-S1 — Phi Lôi Thần
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"allow_no_damage":true,"no_clip":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-093-S1 / raijin; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-093-S2 — Rasengan
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 170% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-093-S2 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-093-S3 — Phi Lôi Thần đánh dấu
- Cơ chế: `projectile_mark`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.35 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_marks":3,"mark_ttl_s":10,"owner_scoped":true,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 45% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-093-S3 / raijin_mark; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-093-S4 — Rasengan liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":2,"interval_s":0.12,"requires_owned_mark":true,"consume_mark":true}.
- P1: hệ số tổng 185% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-093-S4 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-093-S5 — Phi Lôi Thần liên kích
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"hits":3,"interval_s":0.15,"no_clip":true}.
- P1: hệ số tổng 340% qua 3 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-093-S5 / raijin; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-093-S6 — Phi Lôi Thần cấp hai
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"mark_throw_before_teleport":true,"invulnerability_s":0.1,"no_clip":true}.
- P1: hệ số tổng 220% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-093-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-093-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-093-S6 / raijin; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-093-S7 — Kết giới dịch chuyển
- Cơ chế: `projectile_intercept`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2,"thickness_m":0.45,"blocks_movement":false,"blocks_projectile":true,"max_projectiles":1,"no_recursive":true,"redirect":"safe_non_recursive_intercept"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-093-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-093-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-093-S7 / space_barrier; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; MINATO, TOBIRAMA, S3_MINATO, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-011 Phong ấn và Phi lôi thần: Minato Namikaze + Kushina Uzumaki; CD 30s.

---

## nin-094
**Kushina Uzumaki** — Shippuden, đỡ đòn, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-094-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-094-S1 — Kim cương phong tỏa | Xuyên tuyến; 5.5m; tối đa 3 | 85% | 85% | 13 / 9s | 1 |
| NIN-094-S2 — Phong ấn | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 16 / 8s | 1 |
| NIN-094-S3 — Xích chakra bảo hộ | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 18 / 11s | 1 |
| NIN-094-S4 — Xích trói | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-094-S5 — Xích chakra | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-094-S6 — Phong ấn kết giới | Tường chắn; 4m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-094-S7 — Kim cương phong tỏa — trận vực | Vùng duy trì; 5.5m; tối đa 4 | 186% | 130% | 28 / 20s | 5 |

### NIN-094-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-094-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-094-S1 — Kim cương phong tỏa
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":1.8,"chance":0.8}.
- P1: hệ số tổng 85% qua 1 hit; chakra 13; hồi chiêu 9s; khống chế 1.8s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-094-S1 / chain; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-094-S2 — Phong ấn
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.8s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-094-S2 / seal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-094-S3 — Xích chakra bảo hộ
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-094-S3 / chain; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-094-S4 — Xích trói
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.4s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-094-S4 / chain; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-094-S5 — Xích chakra
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-094-S5 / chain; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-094-S6 — Phong ấn kết giới
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-094-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-094-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-094-S6 / seal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-094-S7 — Kim cương phong tỏa — trận vực
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 130% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-094-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-094-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-094-S7 / chain; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KUSHINA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-011 Phong ấn và Phi lôi thần: Minato Namikaze + Kushina Uzumaki; CD 30s.

---

## nin-095
**Hashirama Senju** — Shippuden, đỡ đòn, phẩm chất 6/8.
- Nguyên tố: wood; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 25; strength 19; spirit 19; agility 13; intellect 15; potential 22.
- Tăng trưởng mỗi cấp: vitality +1.13; strength +0.86; spirit +0.86; agility +0.59; intellect +0.68; potential +0.99.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-095-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-095-S1 — Mộc phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-095-S2 — Thụ giới giáng đản | Vùng duy trì; 5.5m; tối đa 4 | 165% | 98% | 16 / 12s | 5 |
| NIN-095-S3 — Mộc nhân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-095-S4 — Mộc long | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 20 / 14s | 1 |
| NIN-095-S5 — Chân số thiên thủ | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 6 |
| NIN-095-S6 — Tiên nhân chế độ | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-095-S7 — Chân số thiên thủ — liên hoàn diện rộng | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 136% | 28 / 20s | 4 |

### NIN-095-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-095-S0 / melee; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-095-S1 — Mộc phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.35,"no_recursive":true,"role":"guard","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-095-S1 / wood; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-095-S2 — Thụ giới giáng đản
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 98% qua 5 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-095-S2 / wood; charge → release → impact → residual → expire.
- Nguồn: P2_CONTEXT_ONLY; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-095-S3 — Mộc nhân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.35,"no_recursive":true,"role":"guard","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-095-S3 / wood; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-095-S4 — Mộc long
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-095-S4 / wood; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-095-S5 — Chân số thiên thủ
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65,"hits":6,"interval_s":0.22,"telegraph_s":1.3}.
- P1: hệ số tổng 209% qua 6 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"any_active_forms":["NIN-095-F1"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-095-S5 / wood; charge → release → impact.
- Nguồn: P2_TECHNIQUE_CONTEXT; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-095-S6 — Tiên nhân chế độ
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-095-F1","requires_unlock":true,"shared_group":"NIN-095-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-095-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-095-1; điều kiện đặc biệt {"requires_unlocked_form":"NIN-095-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-095-S6 / sage; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-095-S7 — Chân số thiên thủ — liên hoàn diện rộng
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 136% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-095-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-095-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-095-S7 / wood; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HASHIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Tiên nhân** (NIN-095-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-096
**Tobirama Senju** — Shippuden, công kích xa, phẩm chất 5/8.
- Nguyên tố: water, space; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 16; strength 15; spirit 19; agility 17; intellect 23; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.68; spirit +0.86; agility +0.77; intellect +1.03; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-096-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-096-S1 — Thủy độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 16 / 10s | 1 |
| NIN-096-S2 — Phi lôi thần | Dịch chuyển theo dấu; 7m; tối đa 1 | 150% | 150% | 16 / 9s | 1 |
| NIN-096-S3 — Thủy trận bích | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-096-S4 — Thủy đoạn ba | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 20 / 14s | 1 |
| NIN-096-S5 — Thủy long đạn | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 247% | 50 / 35s | 1 |
| NIN-096-S6 — Phi lôi thần liên kích | Dịch chuyển theo dấu; 7m; tối đa 1 | 169% | 169% | 20 / 14s | 1 |
| NIN-096-S7 — Thủy độn đại trận | Vùng duy trì; 5.5m; tối đa 4 | 186% | 153% | 28 / 20s | 5 |

### NIN-096-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-096-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-096-S1 — Thủy độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-096-S1 / water; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-096-S2 — Phi lôi thần
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- P1: hệ số tổng 150% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-096-S2 / mark; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-096-S3 — Thủy trận bích
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-096-S3 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-096-S4 — Thủy đoạn ba
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 151% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-096-S4 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-096-S5 — Thủy long đạn
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 247% qua 1 hit; chakra 50; hồi chiêu 35s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-096-S5 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-096-S6 — Phi lôi thần liên kích
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- P1: hệ số tổng 169% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-096-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-096-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-096-S6 / mark; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-096-S7 — Thủy độn đại trận
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 153% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-096-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-096-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-096-S7 / water; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TOBIRAMA, S3_TOBIRAMA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

