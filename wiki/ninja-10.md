# Ninja 109–120
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-109
**Choza Akimichi** — Shippuden, đỡ đòn, phẩm chất 3/8.
- Nguyên tố: yang; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-109-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-109-S1 — Bội hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-109-S2 — Nhục đạn chiến xa | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 147% | 16 / 9s | 1 |
| NIN-109-S3 — Bội hóa cánh tay | Hình quạt; 4.5m; tối đa 4 | 155% | 117% | 18 / 11s | 1 |
| NIN-109-S4 — Siêu bội hóa | Vòng quanh bản thân; 0m; tối đa 4 | 135% | 109% | 20 / 14s | 1 |
| NIN-109-S5 — Siêu bội hóa — chấn kích | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-109-S6 — Nhục đạn chiến xa — liên kích áp sát | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 195% | 20 / 14s | 2 |
| NIN-109-S7 — Bội hóa hộ vệ | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-109-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-109-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-109-S1 — Bội hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-109-S1 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-109-S2 — Nhục đạn chiến xa
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-109-S2 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-109-S3 — Bội hóa cánh tay
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 117% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-109-S3 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-109-S4 — Siêu bội hóa
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh bản thân; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.6}.
- P1: hệ số tổng 109% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-109-S4 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-109-S5 — Siêu bội hóa — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-109-S5 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-109-S6 — Nhục đạn chiến xa — liên kích áp sát
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 195% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-109-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-109-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-109-S6 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-109-S7 — Bội hóa hộ vệ
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-109-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-109-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-109-S7 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOSHIKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-110
**Shizune** — Shippuden, trị liệu, phẩm chất 3/8.
- Nguyên tố: poison; thiên phú cố định: Chuyên môn trị liệu; nghề gợi ý: dược.
- Chỉ số gốc: vitality 14; strength 10; spirit 19; agility 12; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.63; strength +0.45; spirit +0.86; agility +0.54; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-110-S0 — Đòn phòng vệ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-110-S1 — Chưởng tiên thuật | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 165% | 165% | 14 / 9s | 1 |
| NIN-110-S2 — Độc châm | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 16 / 8s | 1 |
| NIN-110-S3 — Độc vụ | Vùng duy trì; 5.5m; tối đa 4 | 165% | 95% | 18 / 12s | 5 |
| NIN-110-S4 — Chưởng tiên thuật — hồi phục nhóm | Vòng quanh bản thân; 0m; tối đa 6 | 175% | 137% | 20 / 14s | 3 |
| NIN-110-S5 — Trị liệu khẩn | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 239% | 239% | 45 / 30s | 1 |
| NIN-110-S6 — Độc châm liên phát | Hình quạt; 4.5m; tối đa 4 | 175% | 150% | 20 / 14s | 1 |
| NIN-110-S7 — Trị liệu nhóm | Vòng quanh bản thân; 0m; tối đa 6 | 198% | 181% | 28 / 20s | 3 |

### NIN-110-S0 — Đòn phòng vệ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-110-S0 / melee; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### NIN-110-S1 — Chưởng tiên thuật
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 165% qua 1 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-110-S1 / heal; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### NIN-110-S2 — Độc châm
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- P1: hệ số tổng 85% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-110-S2 / poison; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### NIN-110-S3 — Độc vụ
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 95% qua 5 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-110-S3 / poison; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### NIN-110-S4 — Chưởng tiên thuật — hồi phục nhóm
- Cơ chế: `heal_pulse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 137% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-110-S4 / heal; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### NIN-110-S5 — Trị liệu khẩn
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 239% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-110-S5 / heal; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### NIN-110-S6 — Độc châm liên phát
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- P1: hệ số tổng 150% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-110-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-110-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-110-S6 / poison; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### NIN-110-S7 — Trị liệu nhóm
- Cơ chế: `heal_pulse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 181% qua 3 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-110-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-110-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-110-S7 / heal; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_SHIZUNE.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-111
**Boruto Uzumaki** — Boruto, sát thủ, phẩm chất 4/8.
- Nguyên tố: wind, lightning; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-111-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-111-S1 — Ảnh phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-111-S2 — Rasengan biến mất | Đạn nổ vùng; 6m; tối đa 3 | 165% | 148% | 16 / 10s | 1 |
| NIN-111-S3 — Phong độn phong áp | Hình quạt; 4.5m; tối đa 4 | 155% | 144% | 18 / 11s | 1 |
| NIN-111-S4 — Phân thân phối hợp | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 20 / 14s | 3 |
| NIN-111-S5 — Rasengan | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-111-S6 — Rasengan biến mất — chấn kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 177% | 20 / 14s | 1 |
| NIN-111-S7 — Karma bộc phát | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-111-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-111-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-111-S1 — Ảnh phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-111-S1 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-111-S2 — Rasengan biến mất
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 148% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-111-S2 / rasengan; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-111-S3 — Phong độn phong áp
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 144% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-111-S3 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-111-S4 — Phân thân phối hợp
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-111-S4 / clone; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-111-S5 — Rasengan
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-111-S5 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-111-S6 — Rasengan biến mất — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 177% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-111-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-111-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-111-S6 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-111-S7 — Karma bộc phát
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-111-F1","requires_unlock":true,"shared_group":"NIN-111-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-111-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-111-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-111-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-111-S7 / karma; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; BORUTO, KARMA, S3_TBV. Karma gate; no Uzuhiko or TBV techniques injected silently. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Karma** (NIN-111-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-010 Đội 7 thế hệ mới: Boruto Uzumaki + Sarada Uchiha + Mitsuki; CD 34s.

---

## nin-112
**Sarada Uchiha** — Boruto, đấu sĩ, phẩm chất 4/8.
- Nguyên tố: fire, lightning; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-112-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-112-S1 — Hào hỏa cầu | Đạn nổ vùng; 6m; tối đa 3 | 165% | 137% | 15 / 10s | 1 |
| NIN-112-S2 — Sharingan | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-112-S3 — Sharingan quan sát | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-112-S4 — Quái lực | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 20 / 14s | 1 |
| NIN-112-S5 — Chidori | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-112-S6 — Hào hỏa cầu — quét rộng | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-112-S7 — Chidori liên kích | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 28 / 20s | 2 |

### NIN-112-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-112-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-112-S1 — Hào hỏa cầu
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 137% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-112-S1 / fire; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-112-S2 — Sharingan
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-112-S2 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-112-S3 — Sharingan quan sát
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-112-S3 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-112-S4 — Quái lực
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-112-S4 / smash; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-112-S5 — Chidori
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 0.57s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-112-S5 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-112-S6 — Hào hỏa cầu — quét rộng
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-112-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-112-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-112-S6 / fire; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-112-S7 — Chidori liên kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-112-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-112-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-112-S7 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TBV. Sharingan/Chidori; no TBV Ohirume under old ID. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Sharingan** (NIN-112-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.

### Combo
- COMBO-010 Đội 7 thế hệ mới: Boruto Uzumaki + Sarada Uchiha + Mitsuki; CD 34s.

---

## nin-113
**Mitsuki** — Boruto, sát thủ, phẩm chất 4/8.
- Nguyên tố: lightning, sage; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-113-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-113-S1 — Tiềm ảnh xà thủ | Hình quạt; 4.5m; tối đa 4 | 155% | 144% | 16 / 10s | 1 |
| NIN-113-S2 — Lôi độn | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 153% | 16 / 10s | 1 |
| NIN-113-S3 — Xà phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-113-S4 — Lôi độn liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 20 / 14s | 3 |
| NIN-113-S5 — Tiên nhân hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-113-S6 — Tiên nhân hóa — khai mở | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-113-S7 — Xà trói | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 28 / 20s | 1 |

### NIN-113-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-113-S0 / melee; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### NIN-113-S1 — Tiềm ảnh xà thủ
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 144% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-113-S1 / snake; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### NIN-113-S2 — Lôi độn
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 153% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế 0.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-113-S2 / lightning; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### NIN-113-S3 — Xà phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-113-S3 / snake; charge → release → spawn → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### NIN-113-S4 — Lôi độn liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-113-S4 / lightning; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### NIN-113-S5 — Tiên nhân hóa
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-113-F1","requires_unlock":true,"shared_group":"NIN-113-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-113-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-113-S5 / sage; charge → activate → sustain → exit.
- Nguồn: LIMITED_TECHNIQUE_OR_ROLE_LINK; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### NIN-113-S6 — Tiên nhân hóa — khai mở
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-113-F1","requires_unlock":true,"shared_group":"NIN-113-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-113-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-113-1; điều kiện đặc biệt {"requires_unlocked_form":"NIN-113-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-113-S6 / sage; charge → activate → sustain → exit.
- Nguồn: LIMITED_TECHNIQUE_OR_ROLE_LINK; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### NIN-113-S7 — Xà trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế 1.62s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-113-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-113-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-113-S7 / snake; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_MITSUKI.  **PRESERVE_P2_P3_GATE**.

### Hình thái
- **Tiên nhân** (NIN-113-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-010 Đội 7 thế hệ mới: Boruto Uzumaki + Sarada Uchiha + Mitsuki; CD 34s.

---

## nin-114
**Kawaki** — Boruto, đỡ đòn, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-114-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-114-S1 — Biến đổi cánh tay | Hình quạt; 4.5m; tối đa 4 | 155% | 117% | 15 / 10s | 1 |
| NIN-114-S2 — Hấp thụ chakra | Cung bảo vệ; 0m; tối đa 1 | 0% | 0% | 15 / 18s | 1 |
| NIN-114-S3 — Cánh tay hóa khiên | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-114-S4 — Karma hấp chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 20 / 14s | 1 |
| NIN-114-S5 — Karma bộc phát | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-114-S6 — Karma biến đổi | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-114-S7 — Chakra pháo | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 169% | 28 / 20s | 1 |

### NIN-114-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-114-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-114-S1 — Biến đổi cánh tay
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 117% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-114-S1 / arm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-114-S2 — Hấp thụ chakra
- Cơ chế: `absorb`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- P1: hệ số tổng 0% qua 1 hit; chakra 15; hồi chiêu 18s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-114-S2 / karma; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-114-S3 — Cánh tay hóa khiên
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-114-S3 / arm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-114-S4 — Karma hấp chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-114-S4 / karma; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-114-S5 — Karma bộc phát
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-114-F1","requires_unlock":true,"shared_group":"NIN-114-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-114-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-114-S5 / karma; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-114-S6 — Karma biến đổi
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-114-F1","requires_unlock":true,"shared_group":"NIN-114-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-114-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-114-1; điều kiện đặc biệt {"requires_unlocked_form":"NIN-114-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-114-S6 / karma; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-114-S7 — Chakra pháo
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 169% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-114-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-114-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-114-S7 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; KARMA, DAIKOKUTEN, SUKUNA, S3_TBV, S3_SUKUNA, S3_DAIKOKUTEN. No unrestricted Isshiki ocular techniques; later shinjutsu need separate snapshot. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Karma** (NIN-114-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-115
**Himawari Uzumaki** — Boruto, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-115-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-115-S1 — Bạch nhãn | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-115-S2 — Nhu quyền | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 16 / 8s | 1 |
| NIN-115-S3 — Bạch nhãn quan sát | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-115-S4 — Nhu quyền điểm huyệt | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 20 / 14s | 3 |
| NIN-115-S5 — Chakra bộc phát | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-115-S6 — Nhu quyền liên kích | Đơn mục tiêu; 1.8m; tối đa 1 | 254% | 252% | 20 / 14s | 6 |
| NIN-115-S7 — Chakra bộc phát — chấn kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 164% | 28 / 20s | 1 |

### NIN-115-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-115-S0 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-115-S1 — Bạch nhãn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-115-S1 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-115-S2 — Nhu quyền
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-115-S2 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-115-S3 — Bạch nhãn quan sát
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-115-S3 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-115-S4 — Nhu quyền điểm huyệt
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-115-S4 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-115-S5 — Chakra bộc phát
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-115-S5 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-115-S6 — Nhu quyền liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 252% qua 6 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-115-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-115-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-115-S6 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-115-S7 — Chakra bộc phát — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 164% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-115-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-115-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-115-S7 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURAMA, S3_TBV. No Kurama access for this ID. TBV Himawari explicitly separate future candidate, not silently added. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-116
**Shikadai Nara** — Boruto, khống chế, phẩm chất 2/8.
- Nguyên tố: yin, wind; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-116-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-116-S1 — Ảnh mô phỏng | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-116-S2 — Phong độn | Hình quạt; 4.5m; tối đa 4 | 155% | 122% | 16 / 10s | 1 |
| NIN-116-S3 — Phong độn phong áp | Hình quạt; 4m; tối đa 3 | 110% | 110% | 18 / 11s | 1 |
| NIN-116-S4 — Ảnh trói | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-116-S5 — Ảnh trói — khóa tuyến | Xuyên tuyến; 5.5m; tối đa 4 | 123% | 123% | 50 / 32s | 1 |
| NIN-116-S6 — Ảnh khâu hỗ trợ | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 177% | 20 / 14s | 1 |
| NIN-116-S7 — Phong bóng phối hợp | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 28 / 20s | 5 |

### NIN-116-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-116-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-116-S1 — Ảnh mô phỏng
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-116-S1 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-116-S2 — Phong độn
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 122% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-116-S2 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-116-S3 — Phong độn phong áp
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 110% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-116-S3 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-116-S4 — Ảnh trói
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-116-S4 / shadow; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-116-S5 — Ảnh trói — khóa tuyến
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"bind","status_s":1.8,"chance":0.8}.
- P1: hệ số tổng 123% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-116-S5 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-116-S6 — Ảnh khâu hỗ trợ
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 177% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-116-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-116-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-116-S6 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-116-S7 — Phong bóng phối hợp
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-116-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-116-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-116-S7 / wind; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN, S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-117
**Inojin Yamanaka** — Boruto, hỗ trợ, phẩm chất 2/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-117-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-117-S1 — Siêu thú ngụy họa | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-117-S2 — Tâm chuyển thân | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 16 / 8s | 1 |
| NIN-117-S3 — Chim mực trinh sát | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 18 / 11s | 1 |
| NIN-117-S4 — Xà mực trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-117-S5 — Mực phối hợp | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-117-S6 — Tâm chuyển thân — nhiễu tâm | Đơn mục tiêu; 4.8m; tối đa 1 | 45% | 45% | 20 / 14s | 1 |
| NIN-117-S7 — Đàn mực hỗ trợ | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-117-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-117-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-117-S1 — Siêu thú ngụy họa
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":9,"hp_fraction":0.2,"attack_fraction":0.3,"no_recursive":true,"role":"ranged","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-117-S1 / ink; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-117-S2 — Tâm chuyển thân
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.89s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-117-S2 / mind; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-117-S3 — Chim mực trinh sát
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-117-S3 / ink; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-117-S4 — Xà mực trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.89s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-117-S4 / ink; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-117-S5 — Mực phối hợp
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-117-S5 / ink; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-117-S6 — Tâm chuyển thân — nhiễu tâm
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"blind","status_s":3,"chance":0.9}.
- P1: hệ số tổng 45% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-117-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-117-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-117-S6 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-117-S7 — Đàn mực hỗ trợ
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-117-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-117-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-117-S7 / ink; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INOJIN.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-118
**Chocho Akimichi** — Boruto, đỡ đòn, phẩm chất 2/8.
- Nguyên tố: yang; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-118-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-118-S1 — Bội hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-118-S2 — Nhục đạn chiến xa | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 147% | 16 / 9s | 1 |
| NIN-118-S3 — Bội hóa cánh tay | Hình quạt; 4.5m; tối đa 4 | 155% | 117% | 18 / 11s | 1 |
| NIN-118-S4 — Nhục đạn phòng vệ | Bản thân; 0m; tối đa 1 | 130% | 130% | 20 / 14s | 1 |
| NIN-118-S5 — Điệp hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-118-S6 — Điệp hóa — khai mở | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-118-S7 — Bội hóa liên kích | Đơn mục tiêu; 1.8m; tối đa 1 | 254% | 222% | 28 / 20s | 6 |

### NIN-118-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-118-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-118-S1 — Bội hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-118-S1 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-118-S2 — Nhục đạn chiến xa
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-118-S2 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-118-S3 — Bội hóa cánh tay
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 117% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-118-S3 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-118-S4 — Nhục đạn phòng vệ
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-118-S4 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-118-S5 — Điệp hóa
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-118-F1","requires_unlock":true,"shared_group":"NIN-118-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-118-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-118-S5 / butterfly; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-118-S6 — Điệp hóa — khai mở
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-118-F1","requires_unlock":true,"shared_group":"NIN-118-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-118-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-118-1; điều kiện đặc biệt {"requires_unlocked_form":"NIN-118-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-118-S6 / butterfly; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-118-S7 — Bội hóa liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 222% qua 6 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-118-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-118-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-118-S7 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHUNIN.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Điệp hóa** (NIN-118-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-119
**Metal Lee** — Boruto, đấu sĩ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-119-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-119-S1 — Thể thuật | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 14 / 9s | 3 |
| NIN-119-S2 — Liên hoàn cước | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 16 / 10s | 1 |
| NIN-119-S3 — Thể thuật liên cước | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 168% | 18 / 11s | 1 |
| NIN-119-S4 — Tập trung tinh thần | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-119-S5 — Thể thuật bộc phát | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-119-S6 — Mộc diệp toàn phong | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 164% | 20 / 14s | 1 |
| NIN-119-S7 — Thể thuật bộc phát — liên kích áp sát | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 28 / 20s | 2 |

### NIN-119-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-119-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-119-S1 — Thể thuật
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-119-S1 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-119-S2 — Liên hoàn cước
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-119-S2 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-119-S3 — Thể thuật liên cước
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-119-S3 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-119-S4 — Tập trung tinh thần
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-119-S4 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-119-S5 — Thể thuật bộc phát
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-119-S5 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-119-S6 — Mộc diệp toàn phong
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 164% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-119-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-119-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-119-S6 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-119-S7 — Thể thuật bộc phát — liên kích áp sát
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-119-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-119-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-119-S7 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-120
**Denki Kaminarimon** — Boruto, hỗ trợ, phẩm chất 1/8.
- Nguyên tố: lightning; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-120-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-120-S1 — Cảm biến | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 12 / 6s | 1 |
| NIN-120-S2 — Thiết bị hỗ trợ | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-120-S3 — Thiết bị do thám | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 18 / 11s | 1 |
| NIN-120-S4 — Bẫy tín hiệu | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-120-S5 — Hỗ trợ chiến thuật | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 45 / 30s | 1 |
| NIN-120-S6 — Thiết bị chắn | Hỗ trợ một đồng minh; 4m; tối đa 1 | 130% | 130% | 20 / 14s | 1 |
| NIN-120-S7 — Tín hiệu phối hợp | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-120-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-120-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-120-S1 — Cảm biến
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-120-S1 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-120-S2 — Thiết bị hỗ trợ
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-120-S2 / tech; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-120-S3 — Thiết bị do thám
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-120-S3 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-120-S4 — Bẫy tín hiệu
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.47s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-120-S4 / tech; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-120-S5 — Hỗ trợ chiến thuật
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-120-S5 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-120-S6 — Thiết bị chắn
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-120-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-120-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-120-S6 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-120-S7 — Tín hiệu phối hợp
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.15,"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-120-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-120-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-120-S7 / tech; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_METAL, S3B_ACADEMY.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

