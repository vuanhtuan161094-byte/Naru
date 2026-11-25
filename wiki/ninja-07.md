# Ninja 73–84
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-073
**Suigetsu Hozuki** — Shippuden, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: water; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-073-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-073-S1 — Thủy hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-073-S2 — Đại đao | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 16 / 9s | 3 |
| NIN-073-S3 — Thủy hóa né tránh | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-073-S4 — Thủy thiết pháo | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 20 / 14s | 1 |
| NIN-073-S5 — Thủy hóa liên trảm | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-073-S6 — Đại đao liên trảm | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-073-S7 — Thủy hóa hộ thể | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-073-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-073-S0 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-073-S1 — Thủy hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-073-S1 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-073-S2 — Đại đao
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-073-S2 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-073-S3 — Thủy hóa né tránh
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-073-S3 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-073-S4 — Thủy thiết pháo
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-073-S4 / water; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-073-S5 — Thủy hóa liên trảm
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-073-S5 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-073-S6 — Đại đao liên trảm
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-073-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-073-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-073-S6 / sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-073-S7 — Thủy hóa hộ thể
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-073-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-073-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-073-S7 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-074
**Karin** — Shippuden, trị liệu, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn trị liệu; nghề gợi ý: dược.
- Chỉ số gốc: vitality 14; strength 10; spirit 19; agility 12; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.63; strength +0.45; spirit +0.86; agility +0.54; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-074-S0 — Đòn phòng vệ | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-074-S1 — Cảm tri | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 12 / 6s | 1 |
| NIN-074-S2 — Hồi phục chakra | Bản thân; 0m; tối đa 1 | 0% | 0% | 8 / 8s | 1 |
| NIN-074-S3 — Cảm tri tầm rộng | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-074-S4 — Chakra hồi phục | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-074-S5 — Dây xích phong ấn | Đơn mục tiêu; 4.5m; tối đa 1 | 80% | 80% | 45 / 31s | 1 |
| NIN-074-S6 — Xích phong ấn | Xuyên tuyến; 5.5m; tối đa 3 | 96% | 96% | 20 / 14s | 1 |
| NIN-074-S7 — Cảm tri giải nhiễu | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-074-S0 — Đòn phòng vệ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-074-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-074-S1 — Cảm tri
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-074-S1 / sense; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-074-S2 — Hồi phục chakra
- Cơ chế: `chakra_regen`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"magnitude":0.25}.
- P1: hệ số tổng 0% qua 1 hit; chakra 8; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-074-S2 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-074-S3 — Cảm tri tầm rộng
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-074-S3 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-074-S4 — Chakra hồi phục
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-074-S4 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-074-S5 — Dây xích phong ấn
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 80% qua 1 hit; chakra 45; hồi chiêu 31s; khống chế 1.9s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-074-S5 / chain; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-074-S6 — Xích phong ấn
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":1.8,"chance":0.8}.
- P1: hệ số tổng 96% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-074-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-074-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-074-S6 / chain; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-074-S7 — Cảm tri giải nhiễu
- Cơ chế: `cleanse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":1,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-074-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-074-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-074-S7 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-075
**Jugo** — Shippuden, đỡ đòn, phẩm chất 3/8.
- Nguyên tố: sage; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-075-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-075-S1 — Biến đổi cơ thể | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-075-S2 — Hấp thụ tự nhiên | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-075-S3 — Chú ấn cường hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-075-S4 — Cánh tay biến đổi | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 20 / 14s | 3 |
| NIN-075-S5 — Chú ấn bộc phát | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-075-S6 — Hấp tự nhiên | Cung bảo vệ; 0m; tối đa 1 | 0% | 0% | 20 / 18s | 1 |
| NIN-075-S7 — Chakra pháo | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 169% | 28 / 20s | 1 |

### NIN-075-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-075-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-075-S1 — Biến đổi cơ thể
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-075-S1 / curse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-075-S2 — Hấp thụ tự nhiên
- Cơ chế: `chakra_regen`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"magnitude":0.25}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-075-S2 / sage; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-075-S3 — Chú ấn cường hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-075-S3 / curse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-075-S4 — Cánh tay biến đổi
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-075-S4 / curse; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-075-S5 — Chú ấn bộc phát
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-075-F1","requires_unlock":true,"shared_group":"NIN-075-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-075-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-075-S5 / curse; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-075-S6 — Hấp tự nhiên
- Cơ chế: `absorb`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 18s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-075-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-075-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-075-S6 / sage; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-075-S7 — Chakra pháo
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 169% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-075-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-075-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-075-S7 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Tiên nhân hóa** (NIN-075-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-076
**Killer B** — Shippuden, đấu sĩ, phẩm chất 5/8.
- Nguyên tố: lightning; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 20; strength 21; spirit 16; agility 18; intellect 16; potential 22.
- Tăng trưởng mỗi cấp: vitality +0.9; strength +0.95; spirit +0.72; agility +0.81; intellect +0.72; potential +0.99.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-076-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-076-S1 — Lôi lê nhiệt đao | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 162% | 14 / 10s | 1 |
| NIN-076-S2 — Thất kiếm | Đơn mục tiêu; 1.8m; tối đa 1 | 225% | 190% | 16 / 9s | 6 |
| NIN-076-S3 — Thất kiếm liên hoàn | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 18 / 11s | 1 |
| NIN-076-S4 — Lôi độn gia trì | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-076-S5 — Vĩ thú chakra | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-076-S6 — Lôi lê nhiệt đao — liên kích áp sát | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 20 / 14s | 2 |
| NIN-076-S7 — Bát Vĩ biến thân | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-076-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-076-S0 / sword; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-076-S1 — Lôi lê nhiệt đao
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 162% qua 1 hit; chakra 14; hồi chiêu 10s; khống chế 0.57s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-076-S1 / lightning; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-076-S2 — Thất kiếm
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 190% qua 6 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-076-S2 / sword; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-076-S3 — Thất kiếm liên hoàn
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-076-S3 / sword; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-076-S4 — Lôi độn gia trì
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-076-S4 / lightning; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-076-S5 — Vĩ thú chakra
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-076-F1","requires_unlock":true,"shared_group":"NIN-076-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-076-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-076-S5 / beast; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-076-S6 — Lôi lê nhiệt đao — liên kích áp sát
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-076-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-076-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-076-S6 / lightning; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-076-S7 — Bát Vĩ biến thân
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-076-F1","requires_unlock":true,"shared_group":"NIN-076-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-076-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-076-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-076-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-076-S7 / beast; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; IMMORTALS, BIJUU.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Chakra Bát Vĩ** (NIN-076-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-077
**A (Raikage IV)** — Shippuden, đấu sĩ, phẩm chất 5/8.
- Nguyên tố: lightning; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 20; strength 21; spirit 16; agility 18; intellect 16; potential 22.
- Tăng trưởng mỗi cấp: vitality +0.9; strength +0.95; spirit +0.72; agility +0.81; intellect +0.72; potential +0.99.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-077-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-077-S1 — Lôi độn giáp | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-077-S2 — Lôi lê nhiệt đao | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 162% | 16 / 10s | 1 |
| NIN-077-S3 — Lôi giáp | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-077-S4 — Lôi độn tốc độ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-077-S5 — Lôi ngã bạo | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 231% | 50 / 32s | 1 |
| NIN-077-S6 — Lôi ngã bạo — liên kích áp sát | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 20 / 14s | 2 |
| NIN-077-S7 — Lôi giáp cực hạn | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-077-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-077-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-077-S1 — Lôi độn giáp
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-077-S1 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-077-S2 — Lôi lê nhiệt đao
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 162% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế 0.57s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-077-S2 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-077-S3 — Lôi giáp
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-077-S3 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-077-S4 — Lôi độn tốc độ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-077-S4 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-077-S5 — Lôi ngã bạo
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 231% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế 0.57s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-077-S5 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-077-S6 — Lôi ngã bạo — liên kích áp sát
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-077-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-077-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-077-S6 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-077-S7 — Lôi giáp cực hạn
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-077-F1","requires_unlock":true,"shared_group":"NIN-077-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-077-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-077-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-077-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-077-S7 / lightning; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Lôi độn giáp** (NIN-077-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-078
**Darui** — Shippuden, công kích xa, phẩm chất 4/8.
- Nguyên tố: lightning, storm; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-078-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-078-S1 — Hắc ban sai | Đạn nổ vùng; 6m; tối đa 3 | 165% | 138% | 15 / 10s | 1 |
| NIN-078-S2 — Lôi độn | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 147% | 16 / 10s | 1 |
| NIN-078-S3 — Hắc lôi liên kích | Hình quạt; 4.5m; tối đa 4 | 155% | 135% | 18 / 11s | 1 |
| NIN-078-S4 — Thủy trận bích | Tường chắn; 4m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-078-S5 — Lam độn lệ tỏa hà tố | Xuyên tuyến; 5.5m; tối đa 4 | 247% | 247% | 50 / 32s | 1 |
| NIN-078-S6 — Lam độn truy kích | Xuyên tuyến; 6m; tối đa 3 | 215% | 200% | 20 / 14s | 1 |
| NIN-078-S7 — Hắc ban sai — chấn kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 165% | 28 / 20s | 1 |

### NIN-078-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-078-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-078-S1 — Hắc ban sai
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 138% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế 0.57s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-078-S1 / blacklight; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-078-S2 — Lôi độn
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 147% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế 0.57s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-078-S2 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-078-S3 — Hắc lôi liên kích
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 135% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 0.57s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-078-S3 / blacklight; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-078-S4 — Thủy trận bích
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-078-S4 / water; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-078-S5 — Lam độn lệ tỏa hà tố
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {}.
- P1: hệ số tổng 247% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-078-S5 / laser; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-078-S6 — Lam độn truy kích
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 200% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-078-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-078-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-078-S6 / laser; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-078-S7 — Hắc ban sai — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 165% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế 0.57s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-078-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-078-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-078-S7 / blacklight; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-079
**C** — Shippuden, hỗ trợ, phẩm chất 2/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-079-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-079-S1 — Cảm tri | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 12 / 6s | 1 |
| NIN-079-S2 — Ảo thuật | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 16 / 8s | 1 |
| NIN-079-S3 — Cảm tri diện rộng | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-079-S4 — Ảo giác chớp sáng | Vùng duy trì; 5.5m; tối đa 4 | 165% | 98% | 20 / 14s | 5 |
| NIN-079-S5 — Hỗ trợ cảm ứng | Vòng quanh bản thân; 0m; tối đa 6 | 123% | 123% | 50 / 32s | 1 |
| NIN-079-S6 — Hỗ trợ định vị | Đơn mục tiêu; 6m; tối đa 1 | 28% | 28% | 20 / 14s | 1 |
| NIN-079-S7 — Giải nhiễu | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-079-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-079-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-079-S1 — Cảm tri
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-079-S1 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-079-S2 — Ảo thuật
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.89s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-079-S2 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-079-S3 — Cảm tri diện rộng
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-079-S3 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-079-S4 — Ảo giác chớp sáng
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 98% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-079-S4 / mind; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-079-S5 — Hỗ trợ cảm ứng
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 123% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-079-S5 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-079-S6 — Hỗ trợ định vị
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 28% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-079-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-079-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-079-S6 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-079-S7 — Giải nhiễu
- Cơ chế: `cleanse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":1,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-079-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-079-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-079-S7 / cleanse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-080
**Samui** — Shippuden, sát thủ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-080-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-080-S1 — Kiếm thuật | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-080-S2 — Cận kích | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 175% | 16 / 10s | 1 |
| NIN-080-S3 — Kiếm đón đòn | Bản thân; 0m; tối đa 1 | 130% | 130% | 18 / 11s | 1 |
| NIN-080-S4 — Kiếm khí áp chế | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 157% | 20 / 14s | 1 |
| NIN-080-S5 — Kiếm liên trảm | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-080-S6 — Kiếm liên kích | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 232% | 20 / 14s | 2 |
| NIN-080-S7 — Kiếm thủ hộ vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-080-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-080-S0 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### NIN-080-S1 — Kiếm thuật
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-080-S1 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### NIN-080-S2 — Cận kích
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 175% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-080-S2 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### NIN-080-S3 — Kiếm đón đòn
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-080-S3 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### NIN-080-S4 — Kiếm khí áp chế
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 157% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-080-S4 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### NIN-080-S5 — Kiếm liên trảm
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-080-S5 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### NIN-080-S6 — Kiếm liên kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 232% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-080-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-080-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-080-S6 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### NIN-080-S7 — Kiếm thủ hộ vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-080-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-080-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-080-S7 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SAMUI.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-081
**Omoi** — Shippuden, sát thủ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-081-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-081-S1 — Kiếm thuật | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-081-S2 — Phản đòn | Bản thân; 0m; tối đa 1 | 130% | 130% | 16 / 8s | 1 |
| NIN-081-S3 — Kiếm phản đòn | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-081-S4 — Kiếm chặn đường | Tường chắn; 4m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-081-S5 — Kiếm trận | Vùng duy trì; 5.5m; tối đa 5 | 239% | 232% | 50 / 32s | 5 |
| NIN-081-S6 — Kiếm liên trảm | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-081-S7 — Kiếm đột kích | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 232% | 28 / 20s | 2 |

### NIN-081-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-081-S0 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-081-S1 — Kiếm thuật
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-081-S1 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-081-S2 — Phản đòn
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-081-S2 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-081-S3 — Kiếm phản đòn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-081-S3 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-081-S4 — Kiếm chặn đường
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-081-S4 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-081-S5 — Kiếm trận
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 232% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-081-S5 / sword; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-081-S6 — Kiếm liên trảm
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-081-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-081-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-081-S6 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-081-S7 — Kiếm đột kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 232% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-081-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-081-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-081-S7 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-082
**Karui** — Shippuden, đấu sĩ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-082-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-082-S1 — Kiếm thuật | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-082-S2 — Áp sát | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 168% | 16 / 10s | 1 |
| NIN-082-S3 — Kiếm thuật tấn công | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 18 / 11s | 1 |
| NIN-082-S4 — Kiếm phòng vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-082-S5 — Liên trảm | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-082-S6 — Kiếm áp sát | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 20 / 14s | 2 |
| NIN-082-S7 — Liên trảm — chấn kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 164% | 28 / 20s | 1 |

### NIN-082-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-082-S0 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-082-S1 — Kiếm thuật
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-082-S1 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-082-S2 — Áp sát
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-082-S2 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-082-S3 — Kiếm thuật tấn công
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-082-S3 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-082-S4 — Kiếm phòng vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-082-S4 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-082-S5 — Liên trảm
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-082-S5 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-082-S6 — Kiếm áp sát
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-082-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-082-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-082-S6 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### NIN-082-S7 — Liên trảm — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 164% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-082-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-082-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-082-S7 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_CLOUD.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-083
**Mei Terumi** — Shippuden, công kích xa, phẩm chất 5/8.
- Nguyên tố: lava, boil; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 16; strength 15; spirit 19; agility 17; intellect 23; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.68; spirit +0.86; agility +0.77; intellect +1.03; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-083-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-083-S1 — Dung độn | Vùng duy trì; 5.5m; tối đa 4 | 165% | 116% | 15 / 12s | 5 |
| NIN-083-S2 — Phí độn | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 16 / 10s | 1 |
| NIN-083-S3 — Dung độn dòng chảy | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 18 / 11s | 1 |
| NIN-083-S4 — Phí độn sương axit | Vùng duy trì; 5.5m; tối đa 4 | 165% | 116% | 20 / 14s | 5 |
| NIN-083-S5 — Sương axit | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-083-S6 — Dung độn vây khốn | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 170% | 20 / 14s | 1 |
| NIN-083-S7 — Sương hòa tan | Đơn mục tiêu; 4.5m; tối đa 1 | 68% | 68% | 28 / 20s | 1 |

### NIN-083-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-083-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-083-S1 — Dung độn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 116% qua 5 hit; chakra 15; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-083-S1 / lava; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-083-S2 — Phí độn
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-083-S2 / steam; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-083-S3 — Dung độn dòng chảy
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-083-S3 / lava; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-083-S4 — Phí độn sương axit
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 116% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-083-S4 / steam; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-083-S5 — Sương axit
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-083-S5 / steam; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-083-S6 — Dung độn vây khốn
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 170% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-083-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-083-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-083-S6 / lava; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-083-S7 — Sương hòa tan
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"attack_down","status_s":4,"magnitude":0.18,"chance":0.9}.
- P1: hệ số tổng 68% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-083-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-083-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-083-S7 / steam; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KAGE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-084
**Chojuro** — Shippuden, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-084-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-084-S1 — Hiramekarei | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-084-S2 — Chakra lưỡi kiếm | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 16 / 10s | 1 |
| NIN-084-S3 — Hiramekarei song đao | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 18 / 11s | 1 |
| NIN-084-S4 — Chakra đại kiếm | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-084-S5 — Đại kiếm chakra | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 238% | 50 / 32s | 1 |
| NIN-084-S6 — Kiếm hộ vệ | Cung bảo vệ; 0m; tối đa 1 | 169% | 169% | 20 / 14s | 1 |
| NIN-084-S7 — Đại kiếm liên trảm | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 28 / 20s | 2 |

### NIN-084-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-084-S0 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### NIN-084-S1 — Hiramekarei
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-084-S1 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### NIN-084-S2 — Chakra lưỡi kiếm
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 145% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-084-S2 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### NIN-084-S3 — Hiramekarei song đao
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-084-S3 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### NIN-084-S4 — Chakra đại kiếm
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-084-S4 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### NIN-084-S5 — Đại kiếm chakra
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 238% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-084-S5 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### NIN-084-S6 — Kiếm hộ vệ
- Cơ chế: `directional_shield`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"angle_deg":120}.
- P1: hệ số tổng 169% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-084-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-084-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-084-S6 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### NIN-084-S7 — Đại kiếm liên trảm
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-084-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-084-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-084-S7 / chakra; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MIST.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

