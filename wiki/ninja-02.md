# Ninja 13–24
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-013
**Neji Hyuga (thiếu niên)** — Naruto, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 14.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.63.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-013-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-013-S1 — Bạch nhãn | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-013-S2 — Bát quái chưởng hồi thiên | Vòng quanh bản thân; 0m; tối đa 4 | 135% | 124% | 16 / 10s | 1 |
| NIN-013-S3 — Hồi thiên phòng thủ | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-013-S4 — Điểm huyệt chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 20 / 14s | 1 |
| NIN-013-S5 — Bát quái lục thập tứ chưởng | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-013-S6 — Bát quái liên chưởng | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-013-S7 — Bạch nhãn toàn cảnh | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-013-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-013-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-013-S1 — Bạch nhãn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-013-S1 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-013-S2 — Bát quái chưởng hồi thiên
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh bản thân; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.6}.
- P1: hệ số tổng 124% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-013-S2 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-013-S3 — Hồi thiên phòng thủ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-013-S3 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-013-S4 — Điểm huyệt chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-013-S4 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-013-S5 — Bát quái lục thập tứ chưởng
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-013-S5 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-013-S6 — Bát quái liên chưởng
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-013-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-013-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-013-S6 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-013-S7 — Bạch nhãn toàn cảnh
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-013-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-013-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-013-S7 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NEJI, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-014
**Rock Lee (thiếu niên)** — Naruto, đấu sĩ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 14.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.63.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-014-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-014-S1 — Mộc diệp toàn phong | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 16 / 10s | 1 |
| NIN-014-S2 — Biểu liên hoa | Lướt tiếp xúc; 4m; tối đa 1 | 205% | 168% | 16 / 10s | 2 |
| NIN-014-S3 — Mộc diệp cước | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 18 / 11s | 3 |
| NIN-014-S4 — Tháo tạ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-014-S5 — Lý liên hoa | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-014-S6 — Liên hoa phản công | Bản thân; 0m; tối đa 1 | 147% | 147% | 20 / 14s | 1 |
| NIN-014-S7 — Bát môn sơ khai | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-014-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-014-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-014-S1 — Mộc diệp toàn phong
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-014-S1 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-014-S2 — Biểu liên hoa
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 2 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-014-S2 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-014-S3 — Mộc diệp cước
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-014-S3 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-014-S4 — Tháo tạ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-014-S4 / gate; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-014-S5 — Lý liên hoa
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"any_active_forms":["NIN-014-F1"],"max_gate_rank":"nonfatal_DEV"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-014-S5 / lotus; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-014-S6 — Liên hoa phản công
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-014-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-014-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-014-S6 / lotus; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-014-S7 — Bát môn sơ khai
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-014-F1","requires_unlock":true,"shared_group":"NIN-014-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-014-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-014-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-014-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-014-S7 / gate; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_SOUND, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Bát Môn** (NIN-014-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

## nin-015
**Tenten (thiếu niên)** — Naruto, công kích xa, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 15.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.68.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-015-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-015-S1 — Phóng nhẫn cụ | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 15 / 10s | 1 |
| NIN-015-S2 — Bẫy phi tiêu | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 16 / 9s | 1 |
| NIN-015-S3 — Cuộn phi tiêu | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 18 / 11s | 1 |
| NIN-015-S4 — Mưa shuriken | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 20 / 14s | 1 |
| NIN-015-S5 — Mưa nhẫn cụ | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-015-S6 — Kunai dây trói | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 20 / 14s | 1 |
| NIN-015-S7 — Đại cuộn nhẫn cụ | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 161% | 28 / 20s | 4 |

### NIN-015-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-015-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-015-S1 — Phóng nhẫn cụ
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-015-S1 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-015-S2 — Bẫy phi tiêu
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế 1.33s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-015-S2 / wire; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-015-S3 — Cuộn phi tiêu
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-015-S3 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-015-S4 — Mưa shuriken
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 142% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-015-S4 / weapon; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-015-S5 — Mưa nhẫn cụ
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-015-S5 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-015-S6 — Kunai dây trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-015-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-015-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-015-S6 / wire; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-015-S7 — Đại cuộn nhẫn cụ
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 161% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-015-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-015-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-015-S7 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_EXAM, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-016
**Might Guy** — Naruto, đấu sĩ, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-016-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-016-S1 — Mộc diệp đại toàn phong | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 16 / 10s | 1 |
| NIN-016-S2 — Mở Bát Môn | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-016-S3 — Mộc Diệp Đại Toàn Phong: đột kích | Lướt tiếp xúc; 4m; tối đa 1 | 205% | 168% | 18 / 11s | 2 |
| NIN-016-S4 — Bát Môn khai mở | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-016-S5 — Triều khổng tước | Hình quạt; 4.5m; tối đa 5 | 225% | 225% | 50 / 32s | 1 |
| NIN-016-S6 — Trú hổ | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 20 / 14s | 1 |
| NIN-016-S7 — Tịch tượng | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 155% | 28 / 20s | 4 |

### NIN-016-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-016-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-016-S1 — Mộc diệp đại toàn phong
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-016-S1 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-016-S2 — Mở Bát Môn
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-016-F1","requires_unlock":true,"shared_group":"NIN-016-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-016-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-016-S2 / gate; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-016-S3 — Mộc Diệp Đại Toàn Phong: đột kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 2 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-016-S3 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-016-S4 — Bát Môn khai mở
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-016-S4 / gate; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-016-S5 — Triều khổng tước
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 225% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"any_active_forms":["NIN-016-F1"],"max_gate_rank":"nonfatal_DEV"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-016-S5 / peacock; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-016-S6 — Trú hổ
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-016-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-016-1; điều kiện đặc biệt {"any_active_forms":["NIN-016-F1"],"max_gate_rank":"nonfatal_DEV"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-016-S6 / tiger; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-016-S7 — Tịch tượng
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 155% qua 4 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-016-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-016-2; điều kiện đặc biệt {"any_active_forms":["NIN-016-F1"],"max_gate_rank":"nonfatal_DEV","requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-016-S7 / elephant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_GUY. S5/S6 require ranked gate thresholds; S7 eighth-gate-only Tịch tượng held in normal repeatable combat; retain old ID and DEV fallback until nonfatal alternative reviewed. **HOLD_NEW_OVERLAY_RETAIN_LEGACY_ID**.

### Hình thái
- **Bát Môn** (NIN-016-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-006 Thể thuật đồng môn: Rock Lee (Shippuden) + Might Guy; CD 26s.

---

## nin-017
**Asuma Sarutobi** — Naruto, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: wind, fire; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-017-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-017-S1 — Phi yến | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 168% | 14 / 10s | 1 |
| NIN-017-S2 — Hôi tích thiêu | Vùng duy trì; 5.5m; tối đa 4 | 165% | 111% | 16 / 12s | 5 |
| NIN-017-S3 — Phong độn chakra đao | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 18 / 11s | 3 |
| NIN-017-S4 — Hỏa độn tro nóng | Đạn nổ vùng; 6m; tối đa 3 | 165% | 137% | 20 / 14s | 1 |
| NIN-017-S5 — Chakra đao liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 239% | 239% | 45 / 30s | 3 |
| NIN-017-S6 — Phi yến liên trảm | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 20 / 14s | 1 |
| NIN-017-S7 — Phong áp bảo vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 130% | 130% | 28 / 20s | 1 |

### NIN-017-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-017-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-017-S1 — Phi yến
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 1 hit; chakra 14; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-017-S1 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-017-S2 — Hôi tích thiêu
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 111% qua 5 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-017-S2 / ash; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-017-S3 — Phong độn chakra đao
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-017-S3 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-017-S4 — Hỏa độn tro nóng
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 137% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-017-S4 / ash; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-017-S5 — Chakra đao liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 239% qua 3 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-017-S5 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-017-S6 — Phi yến liên trảm
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-017-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-017-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-017-S6 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-017-S7 — Phong áp bảo vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-017-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-017-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-017-S7 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_ASUMA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-018
**Kurenai Yuhi** — Naruto, khống chế, phẩm chất 3/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-018-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-018-S1 — Ảo thuật trói cây | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 12 / 8s | 1 |
| NIN-018-S2 — Giải ảo | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-018-S3 — Ảo thuật hoa ảnh | Vùng duy trì; 5.5m; tối đa 4 | 165% | 102% | 18 / 12s | 5 |
| NIN-018-S4 — Phá ảo đồng đội | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-018-S5 — Mộng cảnh trói buộc | Đơn mục tiêu; 5m; tối đa 1 | 109% | 109% | 45 / 30s | 1 |
| NIN-018-S6 — Ảo thuật cây trói | Đơn mục tiêu; 4.5m; tối đa 1 | 62% | 62% | 20 / 14s | 1 |
| NIN-018-S7 — Màn sương ảo giác | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 28 / 20s | 5 |

### NIN-018-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-018-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-018-S1 — Ảo thuật trói cây
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-018-S1 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-018-S2 — Giải ảo
- Cơ chế: `cleanse`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":2,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-018-S2 / cleanse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-018-S3 — Ảo thuật hoa ảnh
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 102% qua 5 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-018-S3 / mind; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-018-S4 — Phá ảo đồng đội
- Cơ chế: `cleanse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":1,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-018-S4 / cleanse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-018-S5 — Mộng cảnh trói buộc
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 109% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-018-S5 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-018-S6 — Ảo thuật cây trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 62% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-018-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-018-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-018-S6 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-018-S7 — Màn sương ảo giác
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-018-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-018-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-018-S7 / mind; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_KURENAI.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-019
**Hiruzen Sarutobi** — Naruto, công kích xa, phẩm chất 4/8.
- Nguyên tố: fire, earth; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 16; strength 15; spirit 19; agility 17; intellect 23; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.68; spirit +0.86; agility +0.77; intellect +1.03; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-019-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-019-S1 — Hỏa độn | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 16 / 10s | 1 |
| NIN-019-S2 — Thông linh Enma | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-019-S3 — Thổ độn tường đất | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-019-S4 — Hỏa độn hỏa long | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 20 / 14s | 1 |
| NIN-019-S5 — Ngũ hành liên kích | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-019-S6 — Enma kim cương trụ | Bản thân; 0m; tối đa 1 | 147% | 147% | 20 / 14s | 1 |
| NIN-019-S7 — Ngũ hành phòng tuyến | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-019-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-019-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-019-S1 — Hỏa độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-019-S1 / fire; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-019-S2 — Thông linh Enma
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-019-S2 / monkey; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-019-S3 — Thổ độn tường đất
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-019-S3 / earth; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-019-S4 — Hỏa độn hỏa long
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 138% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-019-S4 / fire; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-019-S5 — Ngũ hành liên kích
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-019-S5 / element; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-019-S6 — Enma kim cương trụ
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-019-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-019-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-019-S6 / monkey; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-019-S7 — Ngũ hành phòng tuyến
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-019-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-019-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-019-S7 / element; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-020
**Jiraiya** — Naruto, công kích xa, phẩm chất 4/8.
- Nguyên tố: fire, earth; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 16; strength 15; spirit 19; agility 17; intellect 23; potential 23.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.68; spirit +0.86; agility +0.77; intellect +1.03; potential +1.03.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-020-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-020-S1 — Dầu cóc | Vùng duy trì; 5.5m; tối đa 4 | 165% | 116% | 15 / 12s | 5 |
| NIN-020-S2 — Thông linh cóc | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-020-S3 — Dầu cóc trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 18 / 11s | 1 |
| NIN-020-S4 — Kết giới cảm ứng | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-020-S5 — Rasengan | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-020-S6 — Tiên pháp hỏa độn | Đạn nổ vùng; 6m; tối đa 3 | 186% | 186% | 20 / 14s | 1 |
| NIN-020-S7 — Tiên nhân chế độ | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-020-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-020-S0 / kunai; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-020-S1 — Dầu cóc
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 116% qua 5 hit; chakra 15; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-020-S1 / oil; charge → release → impact → residual → expire.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-020-S2 — Thông linh cóc
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.45,"attack_fraction":0.4,"no_recursive":true,"role":"frontline","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-020-S2 / toad; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-020-S3 — Dầu cóc trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.71s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-020-S3 / oil; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-020-S4 — Kết giới cảm ứng
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-020-S4 / sense; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-020-S5 — Rasengan
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-020-S5 / rasengan; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-020-S6 — Tiên pháp hỏa độn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 186% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-020-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-020-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-020-S6 / fire; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-020-S7 — Tiên nhân chế độ
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-020-F1","requires_unlock":true,"shared_group":"NIN-020-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-020-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-020-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-020-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-020-S7 / sage; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; JIRAIYA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Tiên nhân** (NIN-020-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-009 Tam Nhẫn: Jiraiya + Tsunade + Orochimaru; CD 38s.

---

## nin-021
**Tsunade** — Naruto, trị liệu, phẩm chất 4/8.
- Nguyên tố: yang; thiên phú cố định: Chuyên môn trị liệu; nghề gợi ý: dược.
- Chỉ số gốc: vitality 18; strength 14; spirit 23; agility 16; intellect 21; potential 24.
- Tăng trưởng mỗi cấp: vitality +0.81; strength +0.63; spirit +1.03; agility +0.72; intellect +0.95; potential +1.08.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-021-S0 — Đòn phòng vệ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-021-S1 — Chưởng tiên thuật | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 165% | 165% | 14 / 9s | 1 |
| NIN-021-S2 — Quái lực | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 16 / 8s | 1 |
| NIN-021-S3 — Quái lực địa chấn | Vùng khóa tọa độ; 6.5m; tối đa 5 | 230% | 99% | 18 / 11s | 1 |
| NIN-021-S4 — Hồi phục khẩn | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 165% | 165% | 20 / 14s | 1 |
| NIN-021-S5 — Bách Hào | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-021-S6 — Katsuyu phân thể | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-021-S7 — Bách Hào tái sinh | Vòng quanh bản thân; 0m; tối đa 6 | 198% | 181% | 28 / 20s | 3 |

### NIN-021-S0 — Đòn phòng vệ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-021-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-021-S1 — Chưởng tiên thuật
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 165% qua 1 hit; chakra 14; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-021-S1 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-021-S2 — Quái lực
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-021-S2 / smash; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-021-S3 — Quái lực địa chấn
- Cơ chế: `ground_damage`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.3 radius_m.
- Thi triển 0.9s, hồi động tác 0.35s; ai; hiệu ứng: {"telegraph_s":0.9}.
- P1: hệ số tổng 99% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-021-S3 / smash; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-021-S4 — Hồi phục khẩn
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 165% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-021-S4 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-021-S5 — Bách Hào
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-021-F1","requires_unlock":true,"shared_group":"NIN-021-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-021-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-021-S5 / byakugo; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-021-S6 — Katsuyu phân thể
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":12,"hp_fraction":0.35,"attack_fraction":0,"no_recursive":true,"role":"heal_ally","heal_coefficient":0.35,"interval_s":2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-021-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-021-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-021-S6 / slug; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-021-S7 — Bách Hào tái sinh
- Cơ chế: `heal_pulse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 181% qua 3 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-021-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-021-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-021-S7 / byakugo; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; TSUNADE, S3_TSUNADE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Bách Hào** (NIN-021-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-009 Tam Nhẫn: Jiraiya + Tsunade + Orochimaru; CD 38s.

---

## nin-022
**Orochimaru** — Naruto, khống chế, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 16; strength 14; spirit 22; agility 17; intellect 23; potential 24.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.63; spirit +0.99; agility +0.77; intellect +1.03; potential +1.08.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-022-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-022-S1 — Tiềm ảnh xà thủ | Hình quạt; 4.5m; tối đa 4 | 155% | 122% | 15 / 10s | 1 |
| NIN-022-S2 — Thoát xác | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-022-S3 — Xà phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-022-S4 — Xà trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-022-S5 — Thông linh rắn | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 45 / 36s | 1 |
| NIN-022-S6 — Thoát xác — giải thuật | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-022-S7 — Bạch xà biến hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-022-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-022-S0 / kunai; charge → release → travel → impact.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-022-S1 — Tiềm ảnh xà thủ
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 122% qua 1 hit; chakra 15; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-022-S1 / snake; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-022-S2 — Thoát xác
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-022-S2 / snake; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-022-S3 — Xà phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-022-S3 / snake; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-022-S4 — Xà trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-022-S4 / snake; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-022-S5 — Thông linh rắn
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 36s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-022-S5 / snake; charge → release → spawn → expire.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-022-S6 — Thoát xác — giải thuật
- Cơ chế: `cleanse`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":2,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-022-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-022-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-022-S6 / snake; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-022-S7 — Bạch xà biến hóa
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-022-F1","requires_unlock":true,"shared_group":"NIN-022-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-022-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-022-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-022-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-022-S7 / white; charge → activate → sustain → exit.
- Nguồn: P2_CONTEXT_ONLY; OROCHI.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Bạch xà** (NIN-022-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-009 Tam Nhẫn: Jiraiya + Tsunade + Orochimaru; CD 38s.

---

## nin-023
**Kabuto Yakushi** — Naruto, trị liệu, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn trị liệu; nghề gợi ý: dược.
- Chỉ số gốc: vitality 14; strength 10; spirit 19; agility 12; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.63; strength +0.45; spirit +0.86; agility +0.54; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-023-S0 — Đòn phòng vệ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-023-S1 — Chakra no Mesu | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 12 / 7s | 1 |
| NIN-023-S2 — Trị liệu | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 165% | 165% | 16 / 9s | 1 |
| NIN-023-S3 — Chakra no Mesu liên kích | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 162% | 18 / 11s | 3 |
| NIN-023-S4 — Tái tạo vết thương | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-023-S5 — Tái tạo tế bào | Vòng quanh bản thân; 0m; tối đa 6 | 254% | 254% | 50 / 32s | 3 |
| NIN-023-S6 — Thuật ngủ mê | Vòng quanh đích; 4.5m; tối đa 3 | 34% | 34% | 20 / 14s | 1 |
| NIN-023-S7 — Hồi phục tế bào | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 186% | 186% | 28 / 20s | 1 |

### NIN-023-S0 — Đòn phòng vệ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-023-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-023-S1 — Chakra no Mesu
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-023-S1 / scalpel; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-023-S2 — Trị liệu
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 165% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-023-S2 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-023-S3 — Chakra no Mesu liên kích
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 162% qua 3 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-023-S3 / scalpel; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-023-S4 — Tái tạo vết thương
- Cơ chế: `chakra_regen`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"magnitude":0.25}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-023-S4 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-023-S5 — Tái tạo tế bào
- Cơ chế: `heal_pulse`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.2 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":3,"interval_s":1,"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 254% qua 3 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-023-S5 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-023-S6 — Thuật ngủ mê
- Cơ chế: `status`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"sleep","status_s":1.5,"chance":0.7,"wake_on_damage":true}.
- P1: hệ số tổng 34% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.42s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-023-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-023-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-023-S6 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-023-S7 — Hồi phục tế bào
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 186% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-023-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-023-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-023-S7 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_OROCHI, S3B_SANIN, S3B_MEDIC.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-024
**Gaara (thiếu niên)** — Naruto, đỡ đòn, phẩm chất 4/8.
- Nguyên tố: earth; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 14.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.63.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-024-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-024-S1 — Sa phược cữu | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-024-S2 — Sa thuẫn | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-024-S3 — Sa phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-024-S4 — Cát tự vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 20 / 14s | 1 |
| NIN-024-S5 — Sa bộc tống táng | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-024-S6 — Sa mạc tầng trói | Vùng duy trì; 5.5m; tối đa 4 | 186% | 130% | 20 / 14s | 5 |
| NIN-024-S7 — Chakra Nhất Vĩ | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-024-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-024-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-024-S1 — Sa phược cữu
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.8s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-024-S1 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-024-S2 — Sa thuẫn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-024-S2 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-024-S3 — Sa phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.35,"attack_fraction":0.25,"no_recursive":true,"role":"guard","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-024-S3 / sand; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-024-S4 — Cát tự vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-024-S4 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-024-S5 — Sa bộc tống táng
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-024-S5 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-024-S6 — Sa mạc tầng trói
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 130% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-024-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-024-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-024-S6 / sand; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-024-S7 — Chakra Nhất Vĩ
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-024-F1","requires_unlock":true,"shared_group":"NIN-024-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-024-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-024-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-024-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-024-S7 / beast; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_SOUND, S3_SAND. F1 only before extraction; do not transfer this gate to Kazekage ID. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Chakra Nhất Vĩ** (NIN-024-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo

---

