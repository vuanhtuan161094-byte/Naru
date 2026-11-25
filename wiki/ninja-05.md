# Ninja 49–60
[Mục lục ninja](ninja-index.md) · [Hướng dẫn](README.md)

Các chỉ số và kỹ năng là đề xuất thiết kế; xem cột BALANCE-P1 để so sánh, không mặc định là giá trị runtime.

## nin-049
**Hinata Hyuga (Shippuden)** — Shippuden, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-049-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-049-S1 — Bạch nhãn | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-049-S2 — Nhu quyền | Đơn mục tiêu; 3.8m; tối đa 1 | 80% | 80% | 16 / 8s | 1 |
| NIN-049-S3 — Bát quái không chưởng | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 18 / 11s | 1 |
| NIN-049-S4 — Nhu quyền hộ vệ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-049-S5 — Nhu bộ song sư quyền | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-049-S6 — Nhu bộ song sư quyền — liên hoàn | Đơn mục tiêu; 1.8m; tối đa 1 | 254% | 252% | 20 / 14s | 6 |
| NIN-049-S7 — Bạch nhãn tăng cường | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-049-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-049-S0 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-049-S1 — Bạch nhãn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-049-S1 / eye; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-049-S2 — Nhu quyền
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 80% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-049-S2 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-049-S3 — Bát quái không chưởng
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 145% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-049-S3 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-049-S4 — Nhu quyền hộ vệ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-049-S4 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-049-S5 — Nhu bộ song sư quyền
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-049-S5 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-049-S6 — Nhu bộ song sư quyền — liên hoàn
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 252% qua 6 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-049-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-049-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-049-S6 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-049-S7 — Bạch nhãn tăng cường
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-049-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-049-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-049-S7 / eye; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; HINATA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-005 Nhu quyền Hyuga: Hinata Hyuga (Shippuden) + Neji Hyuga (Shippuden); CD 24s.

---

## nin-050
**Kiba Inuzuka (Shippuden)** — Shippuden, sát thủ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-050-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-050-S1 — Nhân thú hợp thể | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-050-S2 — Nha thông nha | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 175% | 16 / 10s | 1 |
| NIN-050-S3 — Akamaru hợp thể | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-050-S4 — Dấu mùi truy đuổi | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 20 / 14s | 1 |
| NIN-050-S5 — Nha nha chuyển nha | Lướt tiếp xúc; 4m; tối đa 1 | 297% | 297% | 45 / 30s | 2 |
| NIN-050-S6 — Nha thông nha kép | Xuyên tuyến; 5.5m; tối đa 3 | 192% | 192% | 20 / 14s | 1 |
| NIN-050-S7 — Nha nha chuyển nha — chấn kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 177% | 28 / 20s | 1 |

### NIN-050-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-050-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-050-S1 — Nhân thú hợp thể
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-050-S1 / beast; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-050-S2 — Nha thông nha
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 175% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-050-S2 / fang; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-050-S3 — Akamaru hợp thể
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.32,"attack_fraction":0.25,"no_recursive":true,"role":"track_bind","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-050-S3 / dog; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-050-S4 — Dấu mùi truy đuổi
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-050-S4 / scent; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-050-S5 — Nha nha chuyển nha
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 297% qua 2 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-050-S5 / fang; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-050-S6 — Nha thông nha kép
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 192% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-050-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-050-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-050-S6 / fang; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-050-S7 — Nha nha chuyển nha — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 177% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-050-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-050-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-050-S7 / fang; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-051
**Shino Aburame (Shippuden)** — Shippuden, khống chế, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 12; strength 10; spirit 18; agility 13; intellect 19; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.45; spirit +0.81; agility +0.59; intellect +0.86; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-051-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-051-S1 — Trùng phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-051-S2 — Trùng bộc | Đạn nổ vùng; 6m; tối đa 3 | 165% | 126% | 16 / 10s | 1 |
| NIN-051-S3 — Trùng cảm ứng | Đơn mục tiêu; 6m; tối đa 1 | 25% | 25% | 18 / 11s | 1 |
| NIN-051-S4 — Trùng phân thân — phòng thủ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-051-S5 — Đàn trùng vây khốn | Vùng duy trì; 5.5m; tối đa 5 | 239% | 197% | 50 / 32s | 5 |
| NIN-051-S6 — Trùng hút chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 90% | 90% | 20 / 14s | 1 |
| NIN-051-S7 — Trùng thực diện rộng | Vùng duy trì; 5m; tối đa 4 | 169% | 135% | 28 / 20s | 5 |

### NIN-051-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-051-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-051-S1 — Trùng phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-051-S1 / insect; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-051-S2 — Trùng bộc
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 126% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-051-S2 / insect; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-051-S3 — Trùng cảm ứng
- Cơ chế: `mark`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- P1: hệ số tổng 25% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-051-S3 / insect; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-051-S4 — Trùng phân thân — phòng thủ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-051-S4 / insect; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-051-S5 — Đàn trùng vây khốn
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 197% qua 5 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-051-S5 / insect; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-051-S6 — Trùng hút chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 90% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-051-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-051-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-051-S6 / insect; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-051-S7 — Trùng thực diện rộng
- Cơ chế: `zone_drain`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"chakra_per_tick":3,"transfer_fraction":0.3,"hit_budget":5}.
- P1: hệ số tổng 135% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-051-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-051-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-051-S7 / insect; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_TEAM8_WAR.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-052
**Neji Hyuga (Shippuden)** — Shippuden, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-052-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-052-S1 — Hồi thiên | Vòng quanh bản thân; 0m; tối đa 4 | 135% | 124% | 16 / 10s | 1 |
| NIN-052-S2 — Bát quái không chưởng | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 145% | 16 / 10s | 1 |
| NIN-052-S3 — Bát quái không chưởng — đẩy | Hình quạt; 4m; tối đa 3 | 110% | 110% | 18 / 11s | 1 |
| NIN-052-S4 — Hồi thiên — phòng thủ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-052-S5 — Bát quái lục thập tứ chưởng | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-052-S6 — Bát quái phá chakra | Đơn mục tiêu; 3.8m; tối đa 1 | 90% | 90% | 20 / 14s | 1 |
| NIN-052-S7 — Bạch nhãn tăng cường | Vòng quanh bản thân; 0m; tối đa 6 | 0% | 0% | 28 / 20s | 1 |

### NIN-052-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-052-S0 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-052-S1 — Hồi thiên
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh bản thân; phạm vi phụ 1.7 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.6}.
- P1: hệ số tổng 124% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-052-S1 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-052-S2 — Bát quái không chưởng
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 145% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-052-S2 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-052-S3 — Bát quái không chưởng — đẩy
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 110% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-052-S3 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-052-S4 — Hồi thiên — phòng thủ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-052-S4 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-052-S5 — Bát quái lục thập tứ chưởng
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-052-S5 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-052-S6 — Bát quái phá chakra
- Cơ chế: `chakra_drain`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"chakra_amount":12,"transfer_fraction":0.4}.
- P1: hệ số tổng 90% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-052-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-052-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-052-S6 / palm; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-052-S7 — Bạch nhãn tăng cường
- Cơ chế: `team_buff`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-052-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-052-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-052-S7 / eye; charge → release → impact.
- Nguồn: P2_CONTEXT_ONLY; NEJI.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-005 Nhu quyền Hyuga: Hinata Hyuga (Shippuden) + Neji Hyuga (Shippuden); CD 24s.

---

## nin-053
**Rock Lee (Shippuden)** — Shippuden, đấu sĩ, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn đấu sĩ; nghề gợi ý: huấn luyện thể thuật.
- Chỉ số gốc: vitality 16; strength 17; spirit 12; agility 14; intellect 12; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.77; spirit +0.54; agility +0.63; intellect +0.54; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-053-S0 — Đòn cận chiến | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-053-S1 — Mộc diệp đại toàn phong | Hình quạt; 4.5m; tối đa 4 | 155% | 133% | 16 / 10s | 1 |
| NIN-053-S2 — Biểu liên hoa | Lướt tiếp xúc; 3.5m; tối đa 1 | 175% | 168% | 16 / 10s | 1 |
| NIN-053-S3 — Mộc diệp toàn phong | Lướt tiếp xúc; 4m; tối đa 1 | 205% | 168% | 18 / 11s | 2 |
| NIN-053-S4 — Tháo tạ | Bản thân; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-053-S5 — Bát Môn liên kích | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-053-S6 — Biểu liên hoa — liên kích áp sát | Lướt tiếp xúc; 4m; tối đa 1 | 232% | 222% | 20 / 14s | 2 |
| NIN-053-S7 — Bát Môn liên kích — liên hoàn | Đơn mục tiêu; 1.8m; tối đa 1 | 254% | 252% | 28 / 20s | 6 |

### NIN-053-S0 — Đòn cận chiến
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-053-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-053-S1 — Mộc diệp đại toàn phong
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 133% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-053-S1 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-053-S2 — Biểu liên hoa
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-053-S2 / lotus; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-053-S3 — Mộc diệp toàn phong
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 168% qua 2 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-053-S3 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-053-S4 — Tháo tạ
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-053-S4 / gate; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-053-S5 — Bát Môn liên kích
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-053-F1","requires_unlock":true,"shared_group":"NIN-053-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-053-F1"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-053-S5 / gate; charge → activate → sustain → exit.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-053-S6 — Biểu liên hoa — liên kích áp sát
- Cơ chế: `dash_multi_hit`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 222% qua 2 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-053-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-053-1; điều kiện đặc biệt {"any_active_forms":["NIN-053-F1"],"max_gate_rank":"nonfatal_DEV"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-053-S6 / lotus; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-053-S7 — Bát Môn liên kích — liên hoàn
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 252% qua 6 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-053-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-053-2; điều kiện đặc biệt {"any_active_forms":["NIN-053-F1"],"max_gate_rank":"nonfatal_DEV"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-053-S7 / kick; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; LEE, S3_GUY.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Bát Môn** (NIN-053-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; skill_or_existing_manual_route.

### Combo
- COMBO-006 Thể thuật đồng môn: Rock Lee (Shippuden) + Might Guy; CD 26s.

---

## nin-054
**Tenten (Shippuden)** — Shippuden, công kích xa, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-054-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-054-S1 — Cuộn nhẫn cụ | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 16 / 10s | 1 |
| NIN-054-S2 — Mưa phi tiêu | Đạn nổ vùng; 6m; tối đa 3 | 165% | 142% | 16 / 10s | 1 |
| NIN-054-S3 — Cuộn nhẫn cụ kép | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 18 / 11s | 1 |
| NIN-054-S4 — Kunai dây trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-054-S5 — Bão nhẫn cụ | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-054-S6 — Mưa vũ khí | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 170% | 20 / 14s | 1 |
| NIN-054-S7 — Cuộn nhẫn cụ đại trận | Vùng duy trì; 5.5m; tối đa 4 | 186% | 153% | 28 / 20s | 5 |

### NIN-054-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-054-S0 / kunai; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-054-S1 — Cuộn nhẫn cụ
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-054-S1 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-054-S2 — Mưa phi tiêu
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.45 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-054-S2 / weapon; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-054-S3 — Cuộn nhẫn cụ kép
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-054-S3 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-054-S4 — Kunai dây trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-054-S4 / wire; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-054-S5 — Bão nhẫn cụ
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-054-S5 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-054-S6 — Mưa vũ khí
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 170% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-054-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-054-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-054-S6 / weapon; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### NIN-054-S7 — Cuộn nhẫn cụ đại trận
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 153% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-054-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-054-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-054-S7 / weapon; charge → release → impact → residual → expire.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_TENTEN, P4_TENTEN_GAME.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-055
**Gaara (Kazekage)** — Shippuden, đỡ đòn, phẩm chất 4/8.
- Nguyên tố: earth; thiên phú cố định: Chuyên môn đỡ đòn; nghề gợi ý: khai thác.
- Chỉ số gốc: vitality 21; strength 15; spirit 15; agility 9; intellect 11; potential 16.
- Tăng trưởng mỗi cấp: vitality +0.95; strength +0.68; spirit +0.68; agility +0.41; intellect +0.5; potential +0.72.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-055-S0 — Đòn phòng thủ | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-055-S1 — Sa thuẫn | Bản thân; 0m; tối đa 1 | 0% | 0% | 12 / 6s | 1 |
| NIN-055-S2 — Sa trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 16 / 8s | 1 |
| NIN-055-S3 — Cát hộ vệ đồng đội | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 18 / 11s | 1 |
| NIN-055-S4 — Sa lao trói | Vùng khóa tọa độ; 4.5m; tối đa 3 | 60% | 60% | 20 / 14s | 1 |
| NIN-055-S5 — Sa mạc đại táng | Vòng quanh đích; 3.8m; tối đa 5 | 312% | 209% | 50 / 32s | 1 |
| NIN-055-S6 — Sa mạc phòng tuyến | Tường chắn; 4m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-055-S7 — Sa mạc đại táng — trận vực | Vùng duy trì; 5.5m; tối đa 4 | 186% | 130% | 28 / 20s | 5 |

### NIN-055-S0 — Đòn phòng thủ
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-055-S0 / melee; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-055-S1 — Sa thuẫn
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 12; hồi chiêu 6s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-055-S1 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-055-S2 — Sa trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.8s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-055-S2 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-055-S3 — Cát hộ vệ đồng đội
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-055-S3 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-055-S4 — Sa lao trói
- Cơ chế: `trap`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 1.35 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- P1: hệ số tổng 60% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.4s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-055-S4 / sand; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-055-S5 — Sa mạc đại táng
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 209% qua 1 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-055-S5 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-055-S6 — Sa mạc phòng tuyến
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-055-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-055-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-055-S6 / sand; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### NIN-055-S7 — Sa mạc đại táng — trận vực
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.65 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- P1: hệ số tổng 130% qua 5 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-055-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-055-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-055-S7 / sand; charge → release → impact → residual → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; GAARA, SAND, S3_KAGE. Sand shield, bind and terrain remain; no Shukaku form prerequisite. **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-008 Đội Cát: Gaara (Kazekage) + Temari (Shippuden) + Kankuro (Shippuden); CD 32s.

---

## nin-056
**Temari (Shippuden)** — Shippuden, công kích xa, phẩm chất 3/8.
- Nguyên tố: wind; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-056-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-056-S1 — Liêm dứu | Hình quạt; 4.5m; tối đa 4 | 155% | 138% | 16 / 10s | 1 |
| NIN-056-S2 — Thông linh Kamatari | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-056-S3 — Phong nhận liên hoàn | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 151% | 18 / 11s | 1 |
| NIN-056-S4 — Gió đẩy lùi | Hình quạt; 4m; tối đa 3 | 110% | 110% | 20 / 14s | 1 |
| NIN-056-S5 — Phong nhận diện rộng | Vùng khóa tọa độ; 6.5m; tối đa 6 | 333% | 237% | 50 / 32s | 4 |
| NIN-056-S6 — Kamatari | Lướt tiếp xúc; 3.5m; tối đa 1 | 198% | 198% | 20 / 14s | 1 |
| NIN-056-S7 — Đại liêm dứu | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 170% | 28 / 20s | 1 |

### NIN-056-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-056-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-056-S1 — Liêm dứu
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 138% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-056-S1 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-056-S2 — Thông linh Kamatari
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-056-S2 / weasel; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-056-S3 — Phong nhận liên hoàn
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 151% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-056-S3 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-056-S4 — Gió đẩy lùi
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 110% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-056-S4 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-056-S5 — Phong nhận diện rộng
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 237% qua 4 hit; chakra 50; hồi chiêu 32s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-056-S5 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-056-S6 — Kamatari
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.42s; ai; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 198% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-056-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-056-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-056-S6 / weasel; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-056-S7 — Đại liêm dứu
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 170% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-056-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-056-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-056-S7 / wind; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-008 Đội Cát: Gaara (Kazekage) + Temari (Shippuden) + Kankuro (Shippuden); CD 32s.

---

## nin-057
**Kankuro (Shippuden)** — Shippuden, công kích xa, phẩm chất 3/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn công kích xa; nghề gợi ý: chế tạo nhẫn cụ.
- Chỉ số gốc: vitality 12; strength 11; spirit 15; agility 13; intellect 19; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.54; strength +0.5; spirit +0.68; agility +0.59; intellect +0.86; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-057-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-057-S1 — Rối Kuroari | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 16 / 12s | 1 |
| NIN-057-S2 — Rối Sanshouo | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-057-S3 — Rối Sanshouo hộ vệ | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 18 / 11s | 1 |
| NIN-057-S4 — Rối Kuroari trói | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 20 / 14s | 1 |
| NIN-057-S5 — Hợp kích rối | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-057-S6 — Rối Sasori | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-057-S7 — Tam rối hợp kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 170% | 28 / 20s | 1 |

### NIN-057-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-057-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-057-S1 — Rối Kuroari
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-057-S1 / puppet; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-057-S2 — Rối Sanshouo
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-057-S2 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-057-S3 — Rối Sanshouo hộ vệ
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-057-S3 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-057-S4 — Rối Kuroari trói
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế 1.71s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-057-S4 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-057-S5 — Hợp kích rối
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-057-S5 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-057-S6 — Rối Sasori
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-057-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-057-1; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-057-S6 / puppet; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-057-S7 — Tam rối hợp kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 170% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-057-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-057-2; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-057-S7 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3_SAND.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo
- COMBO-008 Đội Cát: Gaara (Kazekage) + Temari (Shippuden) + Kankuro (Shippuden); CD 32s.

---

## nin-058
**Chiyo** — Shippuden, hỗ trợ, phẩm chất 4/8.
- Nguyên tố: neutral; thiên phú cố định: Chuyên môn hỗ trợ; nghề gợi ý: nghiên cứu.
- Chỉ số gốc: vitality 13; strength 10; spirit 17; agility 14; intellect 17; potential 18.
- Tăng trưởng mỗi cấp: vitality +0.59; strength +0.45; spirit +0.77; agility +0.63; intellect +0.77; potential +0.81.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-058-S0 — Phi tiêu | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-058-S1 — Dây chakra | Đơn mục tiêu; 4.5m; tối đa 1 | 55% | 55% | 12 / 8s | 1 |
| NIN-058-S2 — Khiên rối | Bản thân; 0m; tối đa 1 | 0% | 0% | 16 / 8s | 1 |
| NIN-058-S3 — Khiên chakra | Vòng quanh bản thân; 0m; tối đa 6 | 85% | 85% | 18 / 11s | 1 |
| NIN-058-S4 — Rối cứu viện | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 20 / 14s | 1 |
| NIN-058-S5 — Thập cơ cận tùng | Đơn mục tiêu; 1.8m; tối đa 1 | 326% | 326% | 45 / 30s | 6 |
| NIN-058-S6 — Bạch bí kỹ liên kích | Vùng khóa tọa độ; 6.5m; tối đa 5 | 260% | 136% | 20 / 14s | 4 |
| NIN-058-S7 — Thập cơ phòng tuyến | Tường chắn; 4m; tối đa 1 | 0% | 0% | 28 / 20s | 1 |

### NIN-058-S0 — Phi tiêu
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-058-S0 / kunai; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-058-S1 — Dây chakra
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":2,"chance":0.85}.
- P1: hệ số tổng 55% qua 1 hit; chakra 12; hồi chiêu 8s; khống chế 1.89s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-058-S1 / thread; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-058-S2 — Khiên rối
- Cơ chế: `stance`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- P1: hệ số tổng 0% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-058-S2 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-058-S3 — Khiên chakra
- Cơ chế: `shield`; mục tiêu: allies_in_radius; Vòng quanh bản thân; phạm vi phụ 3.3 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"no_enemy_targets":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-058-S3 / shield; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-058-S4 — Rối cứu viện
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":2,"ttl_s":14,"hp_fraction":0.35,"attack_fraction":0.35,"no_recursive":true,"role":"ranged_puppet","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-058-S4 / puppet; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-058-S5 — Thập cơ cận tùng
- Cơ chế: `multi_hit`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"hits":6,"interval_s":0.12}.
- P1: hệ số tổng 326% qua 6 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-058-S5 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-058-S6 — Bạch bí kỹ liên kích
- Cơ chế: `multi_hit`; mục tiêu: ground_point; Vùng khóa tọa độ; phạm vi phụ 2.4 radius_m.
- Thi triển 0.75s, hồi động tác 0.35s; ai; hiệu ứng: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- P1: hệ số tổng 136% qua 4 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-058-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-058-1; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-058-S6 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-058-S7 — Thập cơ phòng tuyến
- Cơ chế: `wall`; mục tiêu: ground_point; Tường chắn; phạm vi phụ 2.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-058-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-058-2; điều kiện đặc biệt {"requires_valid_ground":true,"requires_los":true}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_width_with_cap.
- VFX: VFX-NIN-058-S7 / puppet; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; S3B_CHIYO.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-059
**Baki** — Shippuden, sát thủ, phẩm chất 2/8.
- Nguyên tố: wind; thiên phú cố định: Chuyên môn sát thủ; nghề gợi ý: trinh sát.
- Chỉ số gốc: vitality 11; strength 16; spirit 12; agility 19; intellect 14; potential 17.
- Tăng trưởng mỗi cấp: vitality +0.5; strength +0.72; spirit +0.54; agility +0.86; intellect +0.63; potential +0.77.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-059-S0 — Đòn nhanh | Đơn mục tiêu; 1.2m; tối đa 1 | 85% | 85% | 0 / 1.2s | 1 |
| NIN-059-S1 — Phong nhận | Đạn chạm đầu tiên; 4.5m; tối đa 1 | 85% | 85% | 12 / 7s | 1 |
| NIN-059-S2 — Kiếm gió | Xuyên tuyến; 5.5m; tối đa 3 | 170% | 157% | 16 / 10s | 1 |
| NIN-059-S3 — Kiếm gió xuyên | Xuyên tuyến; 6m; tối đa 3 | 190% | 157% | 18 / 11s | 1 |
| NIN-059-S4 — Phong áp đẩy lùi | Hình quạt; 4m; tối đa 3 | 110% | 110% | 20 / 14s | 1 |
| NIN-059-S5 — Phong trảm | Lướt tiếp xúc; 3.5m; tối đa 1 | 254% | 254% | 45 / 30s | 1 |
| NIN-059-S6 — Phong nhận liên phát | Hình quạt; 4.5m; tối đa 4 | 175% | 175% | 20 / 14s | 1 |
| NIN-059-S7 — Phong trảm — chấn kích | Vòng quanh đích; 3.8m; tối đa 4 | 243% | 177% | 28 / 20s | 1 |

### NIN-059-S0 — Đòn nhanh
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 85% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-059-S0 / sword; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-059-S1 — Phong nhận
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đạn chạm đầu tiên; phạm vi phụ 0.32 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 85% qua 1 hit; chakra 12; hồi chiêu 7s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-059-S1 / wind; charge → release → travel → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-059-S2 — Kiếm gió
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.8 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 157% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-059-S2 / wind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-059-S3 — Kiếm gió xuyên
- Cơ chế: `pierce`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 0.55 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {}.
- P1: hệ số tổng 157% qua 1 hit; chakra 18; hồi chiêu 11s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-059-S3 / wind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-059-S4 — Phong áp đẩy lùi
- Cơ chế: `displace`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 70 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"direction":"away","distance_m":1.3,"angle_deg":70}.
- P1: hệ số tổng 110% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-059-S4 / wind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-059-S5 — Phong trảm
- Cơ chế: `dash_damage`; mục tiêu: enemy_ai; Lướt tiếp xúc; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- P1: hệ số tổng 254% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-059-S5 / wind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-059-S6 — Phong nhận liên phát
- Cơ chế: `cone_damage`; mục tiêu: enemy_ai; Hình quạt; phạm vi phụ 65 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"angle_deg":65}.
- P1: hệ số tổng 175% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-059-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-059-1; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-059-S6 / wind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### NIN-059-S7 — Phong trảm — chấn kích
- Cơ chế: `area_damage`; mục tiêu: enemy_ai; Vòng quanh đích; phạm vi phụ 1.9 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"push_m":0.65}.
- P1: hệ số tổng 177% qua 1 hit; chakra 28; hồi chiêu 20s; khống chế —s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-059-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-059-2; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-059-S7 / wind; charge → release → impact.
- Nguồn: IDENTITY_OR_ARC_CONTEXT_ONLY; P4_HAYATE.  **PRESERVE_P2_P3_GATE**.

### Hình thái
Không có hình thái riêng trong database hiện tại.

### Combo

---

## nin-060
**Itachi Uchiha** — Shippuden, khống chế, phẩm chất 5/8.
- Nguyên tố: fire, yin; thiên phú cố định: Chuyên môn khống chế; nghề gợi ý: tình báo.
- Chỉ số gốc: vitality 16; strength 14; spirit 22; agility 17; intellect 23; potential 24.
- Tăng trưởng mỗi cấp: vitality +0.72; strength +0.63; spirit +0.99; agility +0.77; intellect +1.03; potential +1.08.

| ID / chiêu thức | Hình học / tầm / đích | P2 hệ số | P1 hệ số | P1 chakra / CD | Hit |
|---|---|---:|---:|---|---:|
| NIN-060-S0 — Kunai liên kích | Đơn mục tiêu; 2.2m; tối đa 1 | 80% | 80% | 0 / 1.2s | 1 |
| NIN-060-S1 — Hào Hỏa Cầu | Đạn nổ vùng; 6m; tối đa 3 | 155% | 142% | 16 / 10s | 1 |
| NIN-060-S2 — Tsukuyomi | Đơn mục tiêu; 5m; tối đa 1 | 75% | 75% | 16 / 8s | 1 |
| NIN-060-S3 — Ảnh phân thân | Triệu hồi; 0m; tối đa 1 | 0% | 0% | 18 / 12s | 1 |
| NIN-060-S4 — Amaterasu | Vùng duy trì; 6m; tối đa 4 | 200% | 115% | 20 / 14s | 5 |
| NIN-060-S5 — Susanoo | Bản thân; 0m; tối đa 1 | 0% | 0% | 45 / 30s | 1 |
| NIN-060-S6 — Susanoo: Khiên Yata | Cung bảo vệ; 0m; tối đa 1 | 150% | 150% | 20 / 14s | 1 |
| NIN-060-S7 — Susanoo: Kiếm Totsuka | Xuyên tuyến; 4m; tối đa 3 | 320% | 177% | 50 / 35s | 1 |

### NIN-060-S0 — Kunai liên kích
- Cơ chế: `damage`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.18s, hồi động tác 0.28s; ai; hiệu ứng: {}.
- P1: hệ số tổng 80% qua 1 hit; chakra 0; hồi chiêu 1.2s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: đánh thường, không tiến giai riêng.
- VFX: VFX-NIN-060-S0 / kunai; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-060-S1 — Hào Hỏa Cầu
- Cơ chế: `projectile_damage`; mục tiêu: enemy_ai; Đạn nổ vùng; phạm vi phụ 1.5 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"burn","status_s":4,"chance":0.85,"dot_fraction_of_total":0.18,"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- P1: hệ số tổng 142% qua 1 hit; chakra 16; hồi chiêu 10s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-060-S1 / fireball; charge → release → travel → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-060-S2 — Tsukuyomi
- Cơ chế: `status`; mục tiêu: enemy_ai; Đơn mục tiêu; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"fear","status_s":2,"chance":0.85,"boss_control_duration_cap_s":0.7}.
- P1: hệ số tổng 75% qua 1 hit; chakra 16; hồi chiêu 8s; khống chế 1.98s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; control_or_resource_efficiency_with_cap.
- VFX: VFX-NIN-060-S2 / genjutsu; charge → release → impact.
- Nguồn: P2_TECHNIQUE_CONTEXT; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-060-S3 — Ảnh phân thân
- Cơ chế: `summon`; mục tiêu: self; Triệu hồi; phạm vi phụ 0 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"cap":1,"ttl_s":8,"hp_fraction":0.25,"attack_fraction":0.3,"no_recursive":true,"role":"melee_decoy","spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- P1: hệ số tổng 0% qua 1 hit; chakra 18; hồi chiêu 12s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; ttl_or_hp_fraction_with_cap.
- VFX: VFX-NIN-060-S3 / clone; charge → release → spawn → expire.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-060-S4 — Amaterasu
- Cơ chế: `zone_damage`; mục tiêu: enemy_ai; Vùng duy trì; phạm vi phụ 1.2 radius_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":5,"tick_s":1,"hit_budget":5,"eye_strain":true,"do_not_add_duplicate_dot":true}.
- P1: hệ số tổng 115% qua 5 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"any_active_forms":["NIN-060-F1","NIN-060-F2"]}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-060-S4 / black_flame; charge → release → impact → residual → expire.
- Nguồn: TECHNIQUE_LINK_LIMITED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-060-S5 — Susanoo
- Cơ chế: `activate_form`; mục tiêu: self; Bản thân; phạm vi phụ 0 radius_m.
- Thi triển 0.8s, hồi động tác 0.65s; manual_player_ai_enemy; hiệu ứng: {"form_id":"NIN-060-F2","requires_unlock":true,"shared_group":"NIN-060-FORM"}.
- P1: hệ số tổng 0% qua 1 hit; chakra 45; hồi chiêu 30s; khống chế —s.
- Mở khóa: cảnh giới 0; điều kiện đặc biệt {"requires_unlocked_form":"NIN-060-F2"}.
- Tiến hóa: linear, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; duration_or_cooldown_with_cap.
- VFX: VFX-NIN-060-S5 / susanoo; charge → activate → sustain → exit.
- Nguồn: TECHNIQUE_LINK_LIMITED; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-060-S6 — Susanoo: Khiên Yata
- Cơ chế: `directional_shield`; mục tiêu: self; Cung bảo vệ; phạm vi phụ 120 degrees.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"duration_s":4,"angle_deg":120,"frontal_only":true,"max_absorb_coefficient":1.5}.
- P1: hệ số tổng 150% qua 1 hit; chakra 20; hồi chiêu 14s; khống chế —s.
- Mở khóa: cảnh giới 3; kỹ năng trước NIN-060-S1, giai 2, thành thạo 500, thử thách CHALLENGE-NIN-060-1; điều kiện đặc biệt {"any_active_forms":["NIN-060-F2"]}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-060-S6 / susanoo_shield; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### NIN-060-S7 — Susanoo: Kiếm Totsuka
- Cơ chế: `line_damage`; mục tiêu: enemy_ai; Xuyên tuyến; phạm vi phụ 1.2 width_m.
- Thi triển 0.28s, hồi động tác 0.35s; ai; hiệu ứng: {"status":"bind","status_s":1.5,"boss_cap":0.35,"boss_instant_kill":false,"normal_control_only":true}.
- P1: hệ số tổng 177% qua 1 hit; chakra 50; hồi chiêu 35s; khống chế 1.65s.
- Mở khóa: cảnh giới 6; kỹ năng trước NIN-060-S5, giai 4, thành thạo 1500, thử thách CHALLENGE-NIN-060-2; điều kiện đặc biệt {"any_active_forms":["NIN-060-F2"]}.
- Tiến hóa: branch, tối đa 20 cấp/giai; coefficient_or_shield_heal_strength; geometry_or_hit_budget_without_damage_double_count.
- VFX: VFX-NIN-060-S7 / susanoo_sword; charge → release → impact.
- Nguồn: CHARACTER_OR_ARC_CONTEXT; ITACHI, ITACHI_WAR, S3_ITACHI, S3B_TAKA.  **REVIEWED_ADAPTER_REQUIRED**.

### Hình thái
- **Mangekyo** (NIN-060-F1): cảnh giới 3, 5 RES-127; thời lượng 12s; CD 60s; chakra 35; manual_stance.
- **Susanoo** (NIN-060-F2): cảnh giới 5, 10 RES-127; thời lượng 16s; CD 60s; chakra 45; skill_or_existing_manual_route.

### Combo
- COMBO-007 Akatsuki phối hợp: Itachi Uchiha + Kisame Hoshigaki; CD 30s.

---

