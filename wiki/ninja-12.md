# Ninja 133–144
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-133
**Delta** — Boruto, công kích xa, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-133-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-133-S1 — Tia phá hủy | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 15 / 10s | 1 |
| NIN-133-S2 — Hấp thụ chakra | Cung bảo vệ; 0m; tối đa 1 | 0% | 0% | 15 / 18s | 1 |
| NIN-133-S3 — Tia mắt | Xuyên tuyến; 6m; tối đa 3 | 190% | 151% | 18 / 11s | 1 |
| NIN-133-S4 — Hấp chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 20 / 14s | 1 |
| NIN-133-S5 — Tia năng lượng | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 1 |
| NIN-133-S6 — Chân biến đổi | Lướt tiếp xúc; 3.5m; tối đa 1 | 198% | 198% | 20 / 14s | 1 |
| NIN-133-S7 — Tia phá hủy — xuyên tuyến | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 28 / 20s | 1 |

### NIN-133-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-133-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-133-S1 — Tia phá hủy
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-133-S1 / beam; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-133-S2 — Hấp thụ chakra
- Cơ chế: `absorb`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- P1: hệ số tổng 0% qua 1 hit; chakra 15; hồi chiêu 18s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-133-S2 / karma; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-133-S3 — Tia mắt
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-133-S3 / beam; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-133-S4 — Hấp chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-133-S4 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-133-S5 — Tia năng lượng
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 237% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-133-S5 / beam; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-133-S6 — Chân biến đổi
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 198% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-133-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-133-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-133-S6 / arm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-133-S7 — Tia phá hủy — xuyên tuyến
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-133-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-133-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-133-S7 / beam; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-134
**Code** — Boruto, sát thủ, phẩm chất 6/8.
- Nguyên tố: space; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-134-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-134-S1 — Dấu vuốt | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 12 / 7s | 1 |
| NIN-134-S2 — Di chuyển qua dấu | Dịch chuyển theo dấu; 7m; tối đa 1 | 150% | 150% | 16 / 9s | 1 |
| NIN-134-S3 — Dấu vuốt đánh dấu | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 18 / 11s | 1 |
| NIN-134-S4 — Dịch chuyển dấu | Dịch chuyển theo dấu; 7m; tối đa 1 | 150% | 150% | 20 / 14s | 1 |
| NIN-134-S5 — Liên kích dấu vuốt | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-134-S6 — Vuốt liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 186% | 186% | 20 / 14s | 3 |
| NIN-134-S7 — Dấu vuốt tập kích | Dịch chuyển theo dấu; 7m; tối đa 1 | 169% | 169% | 28 / 20s | 1 |

### NIN-134-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-134-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-134-S1 — Dấu vuốt
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-134-S1 / mark; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-134-S2 — Di chuyển qua dấu
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- P1: hệ số tổng 150% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-134-S2 / mark; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-134-S3 — Dấu vuốt đánh dấu
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.26s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-134-S3 / mark; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-134-S4 — Dịch chuyển dấu
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- P1: hệ số tổng 150% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-134-S4 / mark; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-134-S5 — Liên kích dấu vuốt
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-134-S5 / mark; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-134-S6 — Vuốt liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 186% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-134-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-134-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-134-S6 / claw; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-134-S7 — Dấu vuốt tập kích
- Cơ chế: `teleport`; mục tiêu: enemy_ai; Dịch chuyển theo dấu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"safe_landing":true,"owned_mark":true,"max_marks":3,"mark_ttl_s":10,"no_clip":true}.
- P1: hệ số tổng 169% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-134-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-134-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-134-S7 / mark; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-135
**Boro** — Boruto, đỡ đòn, phẩm chất 4/8.
- Nguyên tố: poison; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-135-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-135-S1 — Sương độc | Vùng duy trì; 5.5m; tối đa 4 | 165% | 98% | 15 / 12s | 5 |
| NIN-135-S2 — Tái sinh | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-135-S3 — Sương độc — quét rộng | Hình quạt; 4.5m; tối đa 4 | 155% | 117% | 18 / 11s | 1 |
| NIN-135-S4 — Tái tạo | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-135-S5 — Bộc phát cơ thể | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-135-S6 — Vụ nổ cơ thể | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 136% | 20 / 14s | 1 |
| NIN-135-S7 — Độc vụ lan rộng | Vùng duy trì; 5m; tối đa 4 | 169% | 130% | 28 / 20s | 5 |

### NIN-135-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-135-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-135-S1 — Sương độc
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 98% qua 5 hit; chakra 15; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-135-S1 / poison; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-135-S2 — Tái sinh
- Cơ chế: `chakra_regen`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"magnitude":0.25}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-135-S2 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-135-S3 — Sương độc — quét rộng
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- P1: hệ số tổng 117% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-135-S3 / poison; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-135-S4 — Tái tạo
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-135-S4 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-135-S5 — Bộc phát cơ thể
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-135-S5 / body; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-135-S6 — Vụ nổ cơ thể
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 136% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-135-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-135-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-135-S6 / body; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-135-S7 — Độc vụ lan rộng
- Cơ chế: `zone_drain`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"chakra_per_tick":3,"transfer_fraction":0.3,"hit_budget":5}.
- P1: hệ số tổng 130% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-135-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-135-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-135-S7 / poison; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_CODE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-136
**Koji Kashin** — Boruto, công kích xa, phẩm chất 4/8.
- Nguyên tố: fire, sage; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-136-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-136-S1 — Hỏa độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 16 / 10s | 1 |
| NIN-136-S2 — Thông linh cóc | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-136-S3 — Hỏa độn liên kích | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 18 / 11s | 1 |
| NIN-136-S4 — Cóc trinh sát | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 20 / 14s | 1 |
| NIN-136-S5 — Tiên thuật | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-136-S6 — Tiên nhân chế độ | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-136-S7 — Ngọn lửa chân thực | Vùng duy trì; 5.5m; tối đa 4 | 186% | 153% | 28 / 20s | 5 |

### NIN-136-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-136-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-136-S1 — Hỏa độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-136-S1 / fire; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-136-S2 — Thông linh cóc
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.4,"no_recursive":true,"role":"frontline","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-136-S2 / toad; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-136-S3 — Hỏa độn liên kích
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 138% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-136-S3 / fire; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-136-S4 — Cóc trinh sát
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-136-S4 / toad; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-136-S5 — Tiên thuật
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-136-S5 / sage; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-136-S6 — Tiên nhân chế độ
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-136-F1","requires_unlock":true,"shared_group":"NIN-136-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-136-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-136-1; điều kiện đặc biệt {"requires_unlocked_form":"NIN-136-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-136-S6 / sage; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-136-S7 — Ngọn lửa chân thực
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 153% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-136-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-136-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-136-S7 / fire; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_KARA_GAME, S3B_PRESCIENCE, S3B_KARA_ARC.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Tiên nhân** (NIN-136-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-137
**Amado** — Boruto, hỗ trợ, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-137-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-137-S1 — Thiết bị khoa học | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-137-S2 — Phân tích | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 16 / 8s | 1 |
| NIN-137-S3 — Thiết bị phân tích | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-137-S4 — Thiết bị hỗ trợ chakra | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-137-S5 — Hỗ trợ kỹ thuật (mô phỏng) | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 45 / 30s | 1 |
| NIN-137-S6 — Thiết bị bảo hộ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 130% | 130% | 20 / 14s | 1 |
| NIN-137-S7 — Tín hiệu tác chiến | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-137-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-137-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-137-S1 — Thiết bị khoa học
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-137-S1 / tech; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-137-S2 — Phân tích
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-137-S2 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-137-S3 — Thiết bị phân tích
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-137-S3 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-137-S4 — Thiết bị hỗ trợ chakra
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-137-S4 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-137-S5 — Hỗ trợ kỹ thuật (mô phỏng)
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stat":"move_speed","magnitude":0.15,"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-137-S5 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-137-S6 — Thiết bị bảo hộ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-137-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-137-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-137-S6 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-137-S7 — Tín hiệu tác chiến
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-137-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-137-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-137-S7 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_PRESCIENCE. All battle moves game-original tools/support; no claim canon fighter kit. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-138
**Eida** — Boruto, khống chế, phẩm chất 7/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 16; strength 14; spirit 22; agility 17; intellect 23; potential 24.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.63; spirit +0.99; agility +0.77; intellect +1.03; potential +1.08.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-138-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-138-S1 — Senrigan | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 12 / 6s | 1 |
| NIN-138-S2 — Ảnh hưởng tinh thần | Vòng quanh đích; 4.5m; tối đa 3 | 0% | 0% | 16 / 8s | 1 |
| NIN-138-S3 — Senrigan cảm ứng | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-138-S4 — Mê hoặc mục tiêu | Đơn mục tiêu; 4.8m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-138-S5 — Mê hoặc chiến thuật (mô phỏng) | Đơn mục tiêu; 5m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-138-S6 — Ảnh hưởng tâm trí | Vùng duy trì; 5.5m; tối đa 4 | 0% | 0% | 20 / 14s | 1 |
| NIN-138-S7 — Hỗ trợ thông tin | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-138-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-138-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-138-S1 — Senrigan
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-138-S1 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-138-S2 — Ảnh hưởng tinh thần
- Cơ chế: `beguile_tactical`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"beguile_tactical","status_s":2,"magnitude":0.25,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-138-S2 / beguile; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-138-S3 — Senrigan cảm ứng
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-138-S3 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-138-S4 — Mê hoặc mục tiêu
- Cơ chế: `beguile_tactical`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"beguile_tactical","status_s":2,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-138-S4 / beguile; charge → release → impact.
- Nguồn: P2_TECHNIQUE_CONTEXT; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-138-S5 — Mê hoặc chiến thuật (mô phỏng)
- Cơ chế: `beguile_tactical`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"beguile_tactical","status_s":3,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 2.75s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-138-S5 / beguile; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-138-S6 — Ảnh hưởng tâm trí
- Cơ chế: `beguile_tactical`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5,"status":"beguile_tactical","status_s":2,"chance":0.85,"no_direct_control":true,"no_team_flip":true,"no_mind_rewrite":true,"requires_eligible_target":true,"boss_duration_cap_s":0.7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-138-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-138-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-138-S6 / beguile; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-138-S7 — Hỗ trợ thông tin
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-138-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-138-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-138-S7 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EIDA, CYBORGS, S3_TBV, S3_EIDA. Short target restriction DEV, not direct mind control, no forced allegiance. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-139
**Daemon** — Boruto, đỡ đòn, phẩm chất 7/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 25; strength 19; spirit 19; agility 13; intellect 15; potential 22.
- Tăng trưởng mỗi cấp: vitality +1.13; strength +0.86; spirit +0.86; agility +0.59; intellect +0.68; potential +0.99.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-139-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-139-S1 — Phản xạ | Bản thân; 0m; tối đa 1 | 130% | 130% | 13 / 8s | 1 |
| NIN-139-S2 — Phản đòn | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-139-S3 — Thể thuật phản đòn | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 18 / 11s | 3 |
| NIN-139-S4 — Phản chiếu hộ thể | Cung bảo vệ; 0m; tối đa 1 | 150% | 150% | 20 / 14s | 1 |
| NIN-139-S5 — Phản chiếu có điều kiện | Bản thân; 0m; tối đa 1 | 189% | 189% | 45 / 30s | 1 |
| NIN-139-S6 — Phản xạ — né tránh | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-139-S7 — Phản kích liên hoàn | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 195% | 28 / 20s | 2 |

### NIN-139-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-139-S0 / melee; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-139-S1 — Phản xạ
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true,"requires_contact_with_ally":true,"boss_cap":0.15,"condition":"physical_contact_with_ally","exclude_self_inflicted":true,"no_unbounded_reflection":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 13; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-139-S1 / reflect; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-139-S2 — Phản đòn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-139-S2 / reflect; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-139-S3 — Thể thuật phản đòn
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-139-S3 / melee; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-139-S4 — Phản chiếu hộ thể
- Cơ chế: `directional_shield`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"angle_deg":120}.
- P1: hệ số tổng 150% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-139-S4 / reflect; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-139-S5 — Phản chiếu có điều kiện
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true,"requires_contact_with_ally":true,"boss_cap":0.15,"condition":"physical_contact_with_ally","exclude_self_inflicted":true,"no_unbounded_reflection":true}.
- P1: hệ số tổng 189% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-139-S5 / reflect; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-139-S6 — Phản xạ — né tránh
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-139-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-139-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-139-S6 / reflect; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-139-S7 — Phản kích liên hoàn
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 195% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-139-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-139-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-139-S7 / melee; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; CYBORGS. Contact-condition reflection, capped, nonrecursive; details await primary source. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-140
**Shin Uchiha** — Boruto, sát thủ, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-140-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-140-S1 — Thao túng vũ khí | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 157% | 16 / 10s | 1 |
| NIN-140-S2 — Sharingan | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-140-S3 — Vũ khí điều khiển | Xuyên tuyến; 6m; tối đa 3 | 190% | 157% | 18 / 11s | 1 |
| NIN-140-S4 — Sharingan quan sát | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-140-S5 — Vũ khí liên kích | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-140-S6 — Phi đao trói | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 20 / 14s | 1 |
| NIN-140-S7 — Mưa vũ khí | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 167% | 28 / 20s | 4 |

### NIN-140-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-140-S0 / melee; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### NIN-140-S1 — Thao túng vũ khí
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 157% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-140-S1 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### NIN-140-S2 — Sharingan
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-140-S2 / eye; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### NIN-140-S3 — Vũ khí điều khiển
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 157% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-140-S3 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### NIN-140-S4 — Sharingan quan sát
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-140-S4 / eye; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### NIN-140-S5 — Vũ khí liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-140-S5 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### NIN-140-S6 — Phi đao trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.62s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-140-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-140-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-140-S6 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### NIN-140-S7 — Mưa vũ khí
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 167% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-140-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-140-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-140-S7 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIN.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-141
**Kagura Karatachi** — Boruto, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: water; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-141-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-141-S1 — Kiếm thuật | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-141-S2 — Thủy độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 137% | 16 / 10s | 1 |
| NIN-141-S3 — Hiramekarei chakra | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 18 / 11s | 1 |
| NIN-141-S4 — Thủy độn hỗ trợ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 20 / 14s | 1 |
| NIN-141-S5 — Hiramekarei | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 238% | 50 / 32s | 1 |
| NIN-141-S6 — Kiếm phòng thủ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-141-S7 — Kiếm liên trảm | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 28 / 20s | 2 |

### NIN-141-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-141-S0 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### NIN-141-S1 — Kiếm thuật
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-141-S1 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### NIN-141-S2 — Thủy độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 137% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-141-S2 / water; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### NIN-141-S3 — Hiramekarei chakra
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 145% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-141-S3 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### NIN-141-S4 — Thủy độn hỗ trợ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-141-S4 / water; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### NIN-141-S5 — Hiramekarei
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 238% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-141-S5 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### NIN-141-S6 — Kiếm phòng thủ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-141-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-141-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-141-S6 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### NIN-141-S7 — Kiếm liên trảm
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-141-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-141-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-141-S7 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST, P4_KAGURA.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-142
**Shinki** — Boruto, đỡ đòn, phẩm chất 3/8.
- Nguyên tố: magnet; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-142-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-142-S1 — Thiết sa | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 128% | 14 / 9s | 1 |
| NIN-142-S2 — Thiết sa thuẫn | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-142-S3 — Thiết sa khiên | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 18 / 11s | 1 |
| NIN-142-S4 — Thiết sa trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-142-S5 — Thiết sa trận | Vùng duy trì; 5.5m; tối đa 5 | 239% | 189% | 50 / 32s | 5 |
| NIN-142-S6 — Thiết sa phi tiêu | Hình quạt; 4.5m; tối đa 4 | 175% | 155% | 20 / 14s | 1 |
| NIN-142-S7 — Thiết sa đại trận | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 144% | 28 / 20s | 1 |

### NIN-142-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-142-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-142-S1 — Thiết sa
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 128% qua 1 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-142-S1 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-142-S2 — Thiết sa thuẫn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-142-S2 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-142-S3 — Thiết sa khiên
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-142-S3 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-142-S4 — Thiết sa trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.8s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-142-S4 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-142-S5 — Thiết sa trận
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 189% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-142-S5 / iron; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-142-S6 — Thiết sa phi tiêu
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 155% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-142-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-142-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-142-S6 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-142-S7 — Thiết sa đại trận
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 144% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-142-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-142-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-142-S7 / iron; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-143
**Yodo** — Boruto, khống chế, phẩm chất 2/8.
- Nguyên tố: wind; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-143-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-143-S1 — Cảm âm | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 12 / 6s | 1 |
| NIN-143-S2 — Sóng âm | Hình quạt; 4.5m; tối đa 4 | 155% | 122% | 16 / 10s | 1 |
| NIN-143-S3 — Cảm âm — cảm ứng nhóm | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-143-S4 — Sóng âm áp chế | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 134% | 20 / 14s | 1 |
| NIN-143-S5 — Nhiễu âm | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-143-S6 — Sóng gió | Hình quạt; 4m; tối đa 3 | 124% | 124% | 20 / 14s | 1 |
| NIN-143-S7 — Nhiễu âm diện rộng | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 142% | 28 / 20s | 4 |

### NIN-143-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-143-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-143-S1 — Cảm âm
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-143-S1 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-143-S2 — Sóng âm
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 122% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-143-S2 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-143-S3 — Cảm âm — cảm ứng nhóm
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-143-S3 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-143-S4 — Sóng âm áp chế
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 134% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-143-S4 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-143-S5 — Nhiễu âm
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-143-S5 / sound; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-143-S6 — Sóng gió
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 124% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-143-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-143-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-143-S6 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-143-S7 — Nhiễu âm diện rộng
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 142% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-143-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-143-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-143-S7 / sound; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-144
**Araya** — Boruto, công kích xa, phẩm chất 1/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-144-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-144-S1 — Rối chiến đấu | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-144-S2 — Kiếm thuật | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 16 / 9s | 3 |
| NIN-144-S3 — Rối ngụy trang | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-144-S4 — Rối hộ vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-144-S5 — Rối liên kích | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-144-S6 — Kiếm rối liên kích | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 231% | 20 / 14s | 2 |
| NIN-144-S7 — Rối chiến trận | Vùng duy trì; 5.5m; tối đa 4 | 186% | 153% | 28 / 20s | 5 |

### NIN-144-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-144-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-144-S1 — Rối chiến đấu
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-144-S1 / puppet; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-144-S2 — Kiếm thuật
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-144-S2 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-144-S3 — Rối ngụy trang
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-144-S3 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-144-S4 — Rối hộ vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-144-S4 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-144-S5 — Rối liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-144-S5 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-144-S6 — Kiếm rối liên kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 231% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-144-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-144-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-144-S6 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-144-S7 — Rối chiến trận
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 153% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-144-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-144-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-144-S7 / puppet; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_SAND_NNG, S3B_SAND_TBV.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

