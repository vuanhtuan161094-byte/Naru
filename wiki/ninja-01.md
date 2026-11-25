# Ninja 1–12
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-001
**Naruto Uzumaki (thiếu niên)** — Naruto, đấu sĩ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 14.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.63.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-001-S0 — Cận chiến phân thân | Đơn mục tiêu; 1.1m; tối đa 1 | 80% | 80% | 0 / 1.2s | 1 |
| NIN-001-S1 — Ảnh Phân Thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-001-S2 — Uzumaki liên đạn | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 16 / 9s | 3 |
| NIN-001-S3 — Phân thân đánh lạc hướng | Đơn mục tiêu; 3m; tối đa 1 | 45% | 45% | 18 / 11s | 1 |
| NIN-001-S4 — Chakra Cửu Vĩ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-001-S5 — Rasengan | Lướt tiếp xúc; 3m; tối đa 1 | 320% | 320% | 45 / 30s | 1 |
| NIN-001-S6 — Rasengan phối hợp | Lướt tiếp xúc; 3m; tối đa 1 | 200% | 200% | 20 / 14s | 2 |
| NIN-001-S7 — Phản công phân thân | Bản thân; 0m; tối đa 1 | 130% | 130% | 28 / 20s | 1 |

### NIN-001-S0 — Cận chiến phân thân
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 80% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-001-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-001-S1 — Ảnh Phân Thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-001-S1 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-001-S2 — Uzumaki liên đạn
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12,"requires_clone_or_basic_fallback":true}.
- P1: hệ số tổng 165% qua 3 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-001-S2 / clone_combo; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-001-S3 — Phân thân đánh lạc hướng
- Cơ chế: `decoy`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"taunt","status_s":1.5,"chance":0.9}.
- P1: hệ số tổng 45% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-001-S3 / clone; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-001-S4 — Chakra Cửu Vĩ
- Cơ chế: `chakra_regen`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"magnitude":0.25}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-001-S4 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-001-S5 — Rasengan
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.6,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 320% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-001-S5 / rasengan; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-001-S6 — Rasengan phối hợp
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"requires_clone":true,"consume_clone":1,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 200% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-001-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-001-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-001-S6 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-001-S7 — Phản công phân thân
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true,"decoy_evasion_once":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-001-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-001-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-001-S7 / clone_combo; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; NARUTO_EARLY, S3_NARUTO.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Chakra Cửu Vĩ sơ khai** (NIN-001-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; hp_threshold_or_manual.

### Combo
- COMBO-001 Rasengan và Chidori: Naruto Uzumaki (thiếu niên) + Sasuke Uchiha (thiếu niên); CD 30s.

---

## nin-002
**Sasuke Uchiha (thiếu niên)** — Naruto, sát thủ, phẩm chất 3/8.
- Nguyên tố: fire, lightning; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 15.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.68.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-002-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-002-S1 — Hào hỏa cầu | Đạn nổ vùng; 6m; tối đa 3 | 165% | 148% | 16 / 10s | 1 |
| NIN-002-S2 — Sư tử liên đạn | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 16 / 9s | 3 |
| NIN-002-S3 — Shuriken dây thép | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 18 / 11s | 1 |
| NIN-002-S4 — Sharingan quan sát | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-002-S5 — Chidori | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-002-S6 — Chidori đột kích | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 232% | 20 / 14s | 2 |
| NIN-002-S7 — Ấn chú: bộc phát | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-002-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-002-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-002-S1 — Hào hỏa cầu
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"burn","status_s":4,"chance":0.7,"dot_fraction_of_total":0.15}.
- P1: hệ số tổng 148% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-002-S1 / fire; charge → release → travel → impact.
- Nguồn: P2_TECHNIQUE_CONTEXT; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-002-S2 — Sư tử liên đạn
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-002-S2 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-002-S3 — Shuriken dây thép
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.62s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-002-S3 / wire; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-002-S4 — Sharingan quan sát
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-002-S4 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-002-S5 — Chidori
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 0.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-002-S5 / lightning; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; SASUKE_EARLY, EARLY_ARC, S3_SASUKE, S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-002-S6 — Chidori đột kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 232% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-002-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-002-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-002-S6 / lightning; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-002-S7 — Ấn chú: bộc phát
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-002-F2","requires_unlock":true,"shared_group":"NIN-002-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-002-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-002-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-002-F2"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-002-S7 / curse; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SASUKE_EARLY, EARLY_ARC, S3_SASUKE.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Sharingan** (NIN-002-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.
- **Ấn chú** (NIN-002-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; skill_or_existing_manual_route.

### Combo
- COMBO-001 Rasengan và Chidori: Naruto Uzumaki (thiếu niên) + Sasuke Uchiha (thiếu niên); CD 30s.

---

## nin-003
**Sakura Haruno (thiếu niên)** — Naruto, trị liệu, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn trị liệu; nghề gợi ý: dược.
- Chỉ số gốc: vitality 14; strength 10; spirit 19; agility 12; intellect 17; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.63; strength +0.45; spirit +0.86; agility +0.54; intellect +0.77; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-003-S0 — Đòn phòng vệ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-003-S1 — Giải ảo thuật | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-003-S2 — Sơ cứu hỗ trợ (mô phỏng) | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 165% | 165% | 16 / 9s | 1 |
| NIN-003-S3 — Điều hòa chakra | Bản thân; 0m; tối đa 1 | 0% | 0% | 18 / 11s | 1 |
| NIN-003-S4 — Bảo vệ đồng đội | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 20 / 14s | 1 |
| NIN-003-S5 — Ý chí Đội 7 | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 45 / 30s | 1 |
| NIN-003-S6 — Giải ảo đồng đội | Hỗ trợ một đồng minh; 4.5m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-003-S7 — Kunai hỗ trợ | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 96% | 96% | 28 / 20s | 1 |

### NIN-003-S0 — Đòn phòng vệ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-003-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-003-S1 — Giải ảo thuật
- Cơ chế: `cleanse`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":2,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-003-S1 / cleanse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-003-S2 — Sơ cứu hỗ trợ (mô phỏng)
- Cơ chế: `heal`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"no_enemy_targets":true,"overheal_grants_growth":false}.
- P1: hệ số tổng 165% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-003-S2 / heal; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-003-S3 — Điều hòa chakra
- Cơ chế: `chakra_regen`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"magnitude":0.25}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-003-S3 / chakra; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-003-S4 — Bảo vệ đồng đội
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-003-S4 / shield; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-003-S5 — Ý chí Đội 7
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stat":"attack","magnitude":0.12,"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-003-S5 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-003-S6 — Giải ảo đồng đội
- Cơ chế: `cleanse`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"max_statuses":2,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-003-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-003-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-003-S6 / cleanse; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-003-S7 — Kunai hỗ trợ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-003-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-003-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-003-S7 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, S3_SAKURA, S3_INO. Keep basic support and first aid as explicitly game-original; no medical chakra mastery/Byakugo. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-004
**Kakashi Hatake** — Naruto, sát thủ, phẩm chất 4/8.
- Nguyên tố: lightning, earth; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-004-S0 — Kunai liên kích | Đơn mục tiêu; 2m; tối đa 1 | 80% | 80% | 0 / 1.2s | 1 |
| NIN-004-S1 — Thổ Lưu Bích | Tường chắn; 4m; tối đa 1 | 0% | 0% | 18 / 14s | 1 |
| NIN-004-S2 — Thông linh nhẫn khuyển | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-004-S3 — Thủy Long Đạn | Đạn nổ vùng; 6m; tối đa 3 | 170% | 166% | 18 / 11s | 1 |
| NIN-004-S4 — Sharingan quan sát | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-004-S5 — Raikiri | Lướt tiếp xúc; 4m; tối đa 1 | 325% | 325% | 45 / 30s | 1 |
| NIN-004-S6 — Lôi truyền dẫn | Xuyên tuyến; 4m; tối đa 3 | 180% | 180% | 20 / 14s | 1 |
| NIN-004-S7 — Kamui | Vùng duy trì; 6m; tối đa 4 | 240% | 179% | 50 / 35s | 5 |

### NIN-004-S0 — Kunai liên kích
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 80% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-004-S0 / kunai; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-004-S1 — Thổ Lưu Bích
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true,"placement":"valid_grid_edge","allow_allied_movement":false}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-004-S1 / earth_wall; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-004-S2 — Thông linh nhẫn khuyển
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.32,"attack_fraction":0.25,"no_recursive":true,"role":"track_bind","on_contact_status":"bind","on_contact_status_s":1.2,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-004-S2 / ninken; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-004-S3 — Thủy Long Đạn
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"wet","status_s":4,"chance":0.85,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 166% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-004-S3 / water_dragon; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-004-S4 — Sharingan quan sát
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-004-S4 / ocular; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-004-S5 — Raikiri
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0,"status":"shock","status_s":0.9,"chance":0.85,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 325% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 0.81s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-004-S5 / lightning_dash; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-004-S6 — Lôi truyền dẫn
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.7 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"requires_owned_clone_or_anchor":true,"adapter_gate":"LIGHTNING_CABLE_PENDING","status":"shock","status_s":0.6,"chance":0.6}.
- P1: hệ số tổng 180% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 0.54s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-004-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-004-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-004-S6 / lightning_lance; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-004-S7 — Kamui
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5,"delay_s":0.8,"boss_instant_kill":false,"interrupt_on_hit":true}.
- P1: hệ số tổng 179% qua 5 hit; chakra 50; hồi chiêu 35s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-004-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-004-2; điều kiện đặc biệt {"any_active_forms":["NIN-004-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-004-S7 / kamui; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; EARLY_ARC, TEAM7, S3_KAKASHI. Kamui requires F2 and later training gate; no double Mangekyo or post-loss Sharingan. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Sharingan** (NIN-004-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.
- **Mangekyo** (NIN-004-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; manual_stance.

### Combo
- COMBO-003 Phân thân phối hợp: Kakashi Hatake + Naruto Uzumaki (Shippuden); CD 24s.

---

## nin-005
**Iruka Umino** — Naruto, hỗ trợ, phẩm chất 1/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-005-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-005-S1 — Bẫy dây | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-005-S2 — Bảo vệ học viên | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 16 / 8s | 1 |
| NIN-005-S3 — Bẫy dây học viện | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 18 / 11s | 1 |
| NIN-005-S4 — Lá chắn học viên | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 20 / 14s | 1 |
| NIN-005-S5 — Ý chí người thầy | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 45 / 30s | 1 |
| NIN-005-S6 — Kunai cứu viện | Đạn nổ vùng; 6m; tối đa 3 | 186% | 159% | 20 / 14s | 1 |
| NIN-005-S7 — Bảo hộ đồng đội | Vòng quanh bản thân; 0m; tối đa 6 | 96% | 96% | 28 / 20s | 1 |

### NIN-005-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-005-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-005-S1 — Bẫy dây
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.89s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-005-S1 / wire; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-005-S2 — Bảo vệ học viên
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-005-S2 / shield; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-005-S3 — Bẫy dây học viện
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế 1.47s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-005-S3 / wire; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-005-S4 — Lá chắn học viên
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-005-S4 / shield; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-005-S5 — Ý chí người thầy
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stat":"attack","magnitude":0.12,"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-005-S5 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-005-S6 — Kunai cứu viện
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 159% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-005-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-005-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-005-S6 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-005-S7 — Bảo hộ đồng đội
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 96% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-005-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-005-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-005-S7 / shield; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_IRUKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-006
**Konohamaru (thiếu niên)** — Naruto, đấu sĩ, phẩm chất 1/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 14.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.63.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-006-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-006-S1 — Ảnh phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-006-S2 — Đòn đánh bất ngờ | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 168% | 16 / 10s | 1 |
| NIN-006-S3 — Biến hóa đánh lạc hướng | Đơn mục tiêu; 3m; tối đa 1 | 45% | 45% | 18 / 11s | 1 |
| NIN-006-S4 — Phân thân tập sự | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-006-S5 — Phân thân liên kích tập sự | Đơn mục tiêu; 1.6m; tối đa 1 | 239% | 239% | 45 / 30s | 3 |
| NIN-006-S6 — Shuriken liên kích | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 20 / 14s | 1 |
| NIN-006-S7 — Rasengan tập sự (kiểm tra thời kỳ) | Lướt tiếp xúc; 3.5m; tối đa 1 | 198% | 198% | 28 / 20s | 1 |

### NIN-006-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-006-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-006-S1 — Ảnh phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-006-S1 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-006-S2 — Đòn đánh bất ngờ
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-006-S2 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-006-S3 — Biến hóa đánh lạc hướng
- Cơ chế: `decoy`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"taunt","status_s":1.5,"chance":0.9}.
- P1: hệ số tổng 45% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-006-S3 / disguise; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-006-S4 — Phân thân tập sự
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-006-S4 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-006-S5 — Phân thân liên kích tập sự
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 239% qua 3 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-006-S5 / clone; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-006-S6 — Shuriken liên kích
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-006-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-006-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-006-S6 / kunai; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-006-S7 — Rasengan tập sự (kiểm tra thời kỳ)
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 198% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-006-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-006-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-006-S7 / rasengan; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND. S7 Rasengan remains HOLD; later acquisition belongs to later era or separate unlocked memory scenario. **HOLD_NEW_OVERLAY_RETAIN_LEGACY_ID**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-007
**Shikamaru Nara (thiếu niên)** — Naruto, khống chế, phẩm chất 2/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-007-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-007-S1 — Ảnh mô phỏng | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-007-S2 — Bẫy bóng | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 16 / 9s | 1 |
| NIN-007-S3 — Bẫy bóng lan rộng | Vùng duy trì; 5.5m; tối đa 4 | 165% | 102% | 18 / 12s | 5 |
| NIN-007-S4 — Bóng che đồng đội | Hỗ trợ một đồng minh; 4m; tối đa 1 | 115% | 115% | 20 / 14s | 1 |
| NIN-007-S5 — Ảnh trói | Xuyên tuyến; 5.5m; tối đa 4 | 123% | 123% | 50 / 32s | 1 |
| NIN-007-S6 — Bóng khóa chân | Đơn mục tiêu; 3.8m; tối đa 1 | 90% | 90% | 20 / 14s | 1 |
| NIN-007-S7 — Kế phản công | Bản thân; 0m; tối đa 1 | 147% | 147% | 28 / 20s | 1 |

### NIN-007-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-007-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-007-S1 — Ảnh mô phỏng
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-007-S1 / shadow; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-007-S2 — Bẫy bóng
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế 1.54s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-007-S2 / shadow; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-007-S3 — Bẫy bóng lan rộng
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 102% qua 5 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-007-S3 / shadow; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-007-S4 — Bóng che đồng đội
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 115% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-007-S4 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-007-S5 — Ảnh trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"bind","status_s":1.8,"chance":0.8}.
- P1: hệ số tổng 123% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-007-S5 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-007-S6 — Bóng khóa chân
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 90% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-007-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-007-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-007-S6 / shadow; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-007-S7 — Kế phản công
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-007-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-007-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-007-S7 / team; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; SHIKAMARU, S3_SOUND, S3_SHIKAMARU.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-008
**Choji Akimichi (thiếu niên)** — Naruto, đỡ đòn, phẩm chất 2/8.
- Nguyên tố: yang; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 14.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.63.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-008-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-008-S1 — Bội hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 25 / 30s | 1 |
| NIN-008-S2 — Nhục đạn chiến xa | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 147% | 16 / 9s | 1 |
| NIN-008-S3 — Bội hóa cánh tay | Hình quạt; 4.5m; tối đa 4 | 155% | 117% | 18 / 11s | 1 |
| NIN-008-S4 — Phòng thủ bội hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-008-S5 — Siêu bội hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-008-S6 — Nhục đạn gai | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 195% | 20 / 14s | 2 |
| NIN-008-S7 — Điệp hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 28 / 30s | 1 |

### NIN-008-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-008-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-008-S1 — Bội hóa
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-008-F1","requires_unlock":true,"shared_group":"NIN-008-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 25; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-008-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-008-S1 / giant; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-008-S2 — Nhục đạn chiến xa
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 16; hồi chiêu 9s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-008-S2 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-008-S3 — Bội hóa cánh tay
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 117% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-008-S3 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-008-S4 — Phòng thủ bội hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-008-S4 / giant; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-008-S5 — Siêu bội hóa
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-008-F1","requires_unlock":true,"shared_group":"NIN-008-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-008-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-008-S5 / giant; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-008-S6 — Nhục đạn gai
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 195% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-008-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-008-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-008-S6 / roll; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-008-S7 — Điệp hóa
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"form_id":"NIN-008-F2","requires_unlock":true,"shared_group":"NIN-008-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-008-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-008-2; điều kiện đặc biệt {"requires_unlocked_form":"NIN-008-F2"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-008-S7 / butterfly; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Bội hóa** (NIN-008-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.
- **Điệp hóa** (NIN-008-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; skill_or_existing_manual_route.

### Combo

---

## nin-009
**Ino Yamanaka (thiếu niên)** — Naruto, khống chế, phẩm chất 2/8.
- Nguyên tố: yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-009-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-009-S1 — Tâm chuyển thân | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 12 / 8s | 1 |
| NIN-009-S2 — Cảm ứng đối thủ | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 16 / 8s | 1 |
| NIN-009-S3 — Tâm chuyển thân đánh lạc hướng | Đơn mục tiêu; 4.8m; tối đa 1 | 40% | 40% | 18 / 11s | 1 |
| NIN-009-S4 — Cảm ứng chakra | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-009-S5 — Khống chế tâm trí | Đơn mục tiêu; 5m; tối đa 1 | 109% | 109% | 45 / 30s | 1 |
| NIN-009-S6 — Tâm liên kết | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-009-S7 — Nhiễu tinh thần | Vòng quanh đích; 4.5m; tối đa 3 | 68% | 68% | 28 / 20s | 1 |

### NIN-009-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-009-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-009-S1 — Tâm chuyển thân
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 75% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-009-S1 / mind; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-009-S2 — Cảm ứng đối thủ
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-009-S2 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-009-S3 — Tâm chuyển thân đánh lạc hướng
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"blind","status_s":3,"chance":0.9}.
- P1: hệ số tổng 40% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-009-S3 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-009-S4 — Cảm ứng chakra
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-009-S4 / sense; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-009-S5 — Khống chế tâm trí
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"status":"fear","status_s":1.8,"chance":0.85}.
- P1: hệ số tổng 109% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-009-S5 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-009-S6 — Tâm liên kết
- Cơ chế: `chakra_restore`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-009-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-009-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-009-S6 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-009-S7 — Nhiễu tinh thần
- Cơ chế: `status`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- P1: hệ số tổng 68% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-009-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-009-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-009-S7 / mind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_INO.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-010
**Hinata Hyuga (thiếu niên)** — Naruto, đấu sĩ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 14.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.63.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-010-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-010-S1 — Bạch nhãn | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-010-S2 — Nhu quyền | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 16 / 8s | 1 |
| NIN-010-S3 — Nhu quyền điểm huyệt | Đơn mục tiêu; 1.6m; tối đa 1 | 165% | 165% | 18 / 11s | 3 |
| NIN-010-S4 — Bạch nhãn quan sát | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 20 / 14s | 1 |
| NIN-010-S5 — Liên kích nhu quyền | Đơn mục tiêu; 1.6m; tối đa 1 | 239% | 239% | 45 / 30s | 3 |
| NIN-010-S6 — Bát quái liên chưởng | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-010-S7 — Nhu quyền phòng vệ | Bản thân; 0m; tối đa 1 | 147% | 147% | 28 / 20s | 1 |

### NIN-010-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-010-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-010-S1 — Bạch nhãn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-010-S1 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-010-S2 — Nhu quyền
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-010-S2 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-010-S3 — Nhu quyền điểm huyệt
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 165% qua 3 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-010-S3 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-010-S4 — Bạch nhãn quan sát
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-010-S4 / eye; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-010-S5 — Liên kích nhu quyền
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":3,"interval_s":0.12}.
- P1: hệ số tổng 239% qua 3 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-010-S5 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-010-S6 — Bát quái liên chưởng
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-010-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-010-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-010-S6 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-010-S7 — Nhu quyền phòng vệ
- Cơ chế: `counter`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- P1: hệ số tổng 147% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-010-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-010-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-010-S7 / palm; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-011
**Kiba Inuzuka (thiếu niên)** — Naruto, sát thủ, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 15.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.68.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-011-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-011-S1 — Tứ cước thuật | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-011-S2 — Nhân thú phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-011-S3 — Akamaru phối hợp | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 175% | 18 / 11s | 1 |
| NIN-011-S4 — Thú hóa | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-011-S5 — Nha thông nha | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-011-S6 — Nha thông nha đột kích | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 232% | 20 / 14s | 2 |
| NIN-011-S7 — Dấu mùi truy kích | Đơn mục tiêu; 6m; tối đa 1 | 28% | 28% | 28 / 20s | 1 |

### NIN-011-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-011-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-011-S1 — Tứ cước thuật
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-011-S1 / beast; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-011-S2 — Nhân thú phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.32,"attack_fraction":0.25,"no_recursive":true,"role":"track_bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-011-S2 / dog; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-011-S3 — Akamaru phối hợp
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 175% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-011-S3 / dog; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-011-S4 — Thú hóa
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-011-S4 / beast; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-011-S5 — Nha thông nha
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-011-S5 / fang; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-011-S6 — Nha thông nha đột kích
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 232% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-011-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-011-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-011-S6 / fang; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-011-S7 — Dấu mùi truy kích
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 28% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-011-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-011-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-011-S7 / scent; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SOUND, S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-012
**Shino Aburame (thiếu niên)** — Naruto, khống chế, phẩm chất 2/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-012-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-012-S1 — Ký hoại trùng | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 12 / 7s | 1 |
| NIN-012-S2 — Trùng phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-012-S3 — Trùng dò đường | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 18 / 11s | 1 |
| NIN-012-S4 — Trùng bám chakra | Vùng duy trì; 5.5m; tối đa 4 | 165% | 102% | 20 / 14s | 5 |
| NIN-012-S5 — Trùng thực chakra | Xuyên tuyến; 5m; tối đa 4 | 145% | 145% | 50 / 32s | 1 |
| NIN-012-S6 — Trùng hộ vệ | Hỗ trợ một đồng minh; 4m; tối đa 1 | 130% | 130% | 20 / 14s | 1 |
| NIN-012-S7 — Trùng bao vây | Vùng duy trì; 5.5m; tối đa 4 | 186% | 135% | 28 / 20s | 5 |

### NIN-012-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-012-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-012-S1 — Ký hoại trùng
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-012-S1 / insect; charge → release → impact.
- Nguồn: TECHNIQUE_LINK_LIMITED; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-012-S2 — Trùng phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-012-S2 / insect; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-012-S3 — Trùng dò đường
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-012-S3 / insect; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-012-S4 — Trùng bám chakra
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 102% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-012-S4 / insect; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-012-S5 — Trùng thực chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"chakra_amount":8,"transfer_fraction":0.3}.
- P1: hệ số tổng 145% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-012-S5 / insect; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-012-S6 — Trùng hộ vệ
- Cơ chế: `shield`; mục tiêu: ally_lowest_effective_hp; Hỗ trợ một đồng minh; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 130% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-012-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-012-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-012-S6 / insect; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-012-S7 — Trùng bao vây
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-012-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-012-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-012-S7 / insect; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_TEAM8, S3_TEAM8B.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

