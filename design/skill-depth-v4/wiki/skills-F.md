# Lô F — 136 kỹ năng
Các giá trị chakra theo sao là preview chưa tính nhánh hoặc hiệu suất cấp độ. Hệ số hiệu ứng tính trên tổng mỗi mục tiêu; không mặc định là sát thương. Nguồn và HOLD không thay đổi.

## NIN-075

### NIN-075-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-075-S1 — Biến đổi cơ thể
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-075-S2 — Hấp thụ tự nhiên
- Chakra (chakra_regen); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.magnitude base*(1+.20*r) (authored regen multiplier; actual missing CP).
- Tham số cơ chế: {"duration_s":6,"magnitude":0.25}.
- Nhánh: không phân nhánh.
- Điều kiện: chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-075-S3 — Chú ấn cường hóa
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-075-S4 — Cánh tay biến đổi
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-075-S5 — Chú ấn bộc phát
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-075-F1","requires_unlock":true,"shared_group":"NIN-075-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-075-S6 — Hấp tự nhiên
- Đặc thù (absorb); arc_self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.duration_s base*(1+.15*r) (unchanged projectile cap and chakra return).
- Tham số cơ chế: {"duration_s":3,"max_projectiles":1,"chakra_return":15,"angle_deg":120}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-075-S1 giai 2, thành thạo 500; CHALLENGE-NIN-075-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

### NIN-075-S7 — Chakra pháo
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-075-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-075-2 — 5 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_TAKA.

## NIN-076

### NIN-076-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU.

### NIN-076-S1 — Lôi lê nhiệt đao
- Khống chế (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-076-S1-B1 Lôi lê nhiệt đao — Uy lực; effect.total_coefficient ×1.12 | NIN-076-S1-B2 Lôi lê nhiệt đao — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU.

### NIN-076-S2 — Thất kiếm
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 225%; Giai 1/3/10 cấp 20: 310.5% / 535.5% / 1323%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-076-S3 — Thất kiếm liên hoàn
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU.

### NIN-076-S4 — Lôi độn gia trì
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU.

### NIN-076-S5 — Vĩ thú chakra
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-076-F1","requires_unlock":true,"shared_group":"NIN-076-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: unlocked_form_ready; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU.

### NIN-076-S6 — Lôi lê nhiệt đao — liên kích áp sát
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-076-S6-B1 Lôi lê nhiệt đao — liên kích áp sát — Uy lực; effect.total_coefficient ×1.12 | NIN-076-S6-B2 Lôi lê nhiệt đao — liên kích áp sát — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: cảnh 3, NIN-076-S1 giai 2, thành thạo 500; CHALLENGE-NIN-076-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU.

### NIN-076-S7 — Bát Vĩ biến thân
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-076-F1","requires_unlock":true,"shared_group":"NIN-076-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-076-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-076-2 — 5 lần form_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; IMMORTALS, BIJUU.

## NIN-077

### NIN-077-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-077-S1 — Lôi độn giáp
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-077-S2 — Lôi lê nhiệt đao
- Khống chế (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-077-S2-B1 Lôi lê nhiệt đao — Uy lực; effect.total_coefficient ×1.12 | NIN-077-S2-B2 Lôi lê nhiệt đao — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-077-S3 — Lôi giáp
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: NIN-077-S3-B1 Lôi giáp — Cường hóa move_speed; effect.params.magnitude ×1.1 | NIN-077-S3-B2 Lôi giáp — Duy trì; effect.params.duration_s ×1.12.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-077-S4 — Lôi độn tốc độ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-077-S5 — Lôi ngã bạo
- Khống chế (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"push_m":0.65,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-077-S5-B1 Lôi ngã bạo — Uy lực; effect.total_coefficient ×1.12 | NIN-077-S5-B2 Lôi ngã bạo — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-077-S6 — Lôi ngã bạo — liên kích áp sát
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: NIN-077-S6-B1 Lôi ngã bạo — liên kích áp sát — Uy lực; effect.total_coefficient ×1.12 | NIN-077-S6-B2 Lôi ngã bạo — liên kích áp sát — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: cảnh 3, NIN-077-S1 giai 2, thành thạo 500; CHALLENGE-NIN-077-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-077-S7 — Lôi giáp cực hạn
- Hình thái (activate_form); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.15*r) (min .25s and animation minimum; no duplicate form scaling).
- Tham số cơ chế: {"form_id":"NIN-077-F1","requires_unlock":true,"shared_group":"NIN-077-FORM"}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-077-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-077-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

## NIN-078

### NIN-078-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-078-S1 — Hắc ban sai
- Khống chế (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy_in_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-078-S2 — Lôi độn
- Khống chế (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-078-S2-B1 Lôi độn — Uy lực; effect.total_coefficient ×1.12 | NIN-078-S2-B2 Lôi độn — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-078-S3 — Hắc lôi liên kích
- Khống chế (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"angle_deg":65,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: NIN-078-S3-B1 Hắc lôi liên kích — Uy lực; effect.total_coefficient ×1.12 | NIN-078-S3-B2 Hắc lôi liên kích — Khống chế; effect.params.status_s ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-078-S4 — Thủy trận bích
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- Nhánh: NIN-078-S4-B1 Thủy trận bích — Kiên cố; effect.params.duration_s ×1.12 | NIN-078-S4-B2 Thủy trận bích — Tường rộng; effect.params.width_m ×1.12.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-078-S5 — Lam độn lệ tỏa hà tố
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 247%; Giai 1/3/10 cấp 20: 340.86% / 587.86% / 1452.36%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-078-S6 — Lam độn truy kích
- Sát thương (pierce); line, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 215%; Giai 1/3/10 cấp 20: 296.7% / 511.7% / 1264.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-078-S1 giai 2, thành thạo 500; CHALLENGE-NIN-078-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-078-S7 — Hắc ban sai — chấn kích
- Khống chế (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"push_m":0.65,"status":"shock","status_s":0.6,"chance":0.6}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-078-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-078-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

## NIN-079

### NIN-079-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-079-S1 — Cảm tri
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE. Cân bằng V4: RETAIN_DEV — mobility/mark conditional value.

### NIN-079-S2 — Ảo thuật
- Khống chế (status); single, tầm 5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-120; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"fear","status_s":1.8,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE. Cân bằng V4: RETAIN_DEV — control value includes chance/duration, area and immunity.

### NIN-079-S3 — Cảm tri diện rộng
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-079-S4 — Ảo giác chớp sáng
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-079-S5 — Hỗ trợ cảm ứng
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 123%; Giai 1/3/10 cấp 20: 169.74% / 292.74% / 723.24%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-079-S6 — Hỗ trợ định vị
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 28%; Giai 1/3/10 cấp 20: 38.64% / 66.64% / 164.64%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-079-S1 giai 2, thành thạo 500; CHALLENGE-NIN-079-1 — 3 lần mark_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-079-S7 — Giải nhiễu
- Cường hóa/giải thuật (cleanse); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":1,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-079-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-079-2 — 5 lần shield_absorbed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

## NIN-080

### NIN-080-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI.

### NIN-080-S1 — Kiếm thuật
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-080-S2 — Cận kích
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI.

### NIN-080-S3 — Kiếm đón đòn
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI.

### NIN-080-S4 — Kiếm khí áp chế
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI.

### NIN-080-S5 — Kiếm liên trảm
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 326%; Giai 1/3/10 cấp 20: 449.88% / 775.88% / 1916.88%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI.

### NIN-080-S6 — Kiếm liên kích
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-080-S1 giai 2, thành thạo 500; CHALLENGE-NIN-080-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI.

### NIN-080-S7 — Kiếm thủ hộ vệ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-080-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-080-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_SAMUI.

## NIN-081

### NIN-081-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-081-S1 — Kiếm thuật
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-081-S2 — Phản đòn
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-081-S3 — Kiếm phản đòn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-081-S4 — Kiếm chặn đường
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-081-S5 — Kiếm trận
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 5 mục tiêu; 5 hit.
- Hệ số gốc 239%; Giai 1/3/10 cấp 20: 329.82% / 568.82% / 1405.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-081-S6 — Kiếm liên trảm
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-081-S1 giai 2, thành thạo 500; CHALLENGE-NIN-081-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-081-S7 — Kiếm đột kích
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-081-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-081-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

## NIN-082

### NIN-082-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-082-S1 — Kiếm thuật
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-082-S2 — Áp sát
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-082-S3 — Kiếm thuật tấn công
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-082-S4 — Kiếm phòng vệ
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-082-S5 — Liên trảm
- Sát thương (multi_hit); single, tầm 1.8 m, tối đa 1 mục tiêu; 6 hit.
- Hệ số gốc 326%; Giai 1/3/10 cấp 20: 449.88% / 775.88% / 1916.88%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":6,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-082-S6 — Kiếm áp sát
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-082-S1 giai 2, thành thạo 500; CHALLENGE-NIN-082-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

### NIN-082-S7 — Liên trảm — chấn kích
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-082-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-082-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_CLOUD.

## NIN-083

### NIN-083-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-083-S1 — Dung độn
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-083-S2 — Phí độn
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-083-S3 — Dung độn dòng chảy
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-083-S4 — Phí độn sương axit
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-083-S5 — Sương axit
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-083-S6 — Dung độn vây khốn
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-083-S1 giai 2, thành thạo 500; CHALLENGE-NIN-083-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-083-S7 — Sương hòa tan
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 68%; Giai 1/3/10 cấp 20: 93.84% / 161.84% / 399.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"attack_down","status_s":4,"magnitude":0.18,"chance":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-083-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-083-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

## NIN-084

### NIN-084-S0 — Đòn cận chiến
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST.

### NIN-084-S1 — Hiramekarei
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-084-S2 — Chakra lưỡi kiếm
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST.

### NIN-084-S3 — Hiramekarei song đao
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST.

### NIN-084-S4 — Chakra đại kiếm
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST.

### NIN-084-S5 — Đại kiếm chakra
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST.

### NIN-084-S6 — Kiếm hộ vệ
- Hộ thuẫn (directional_shield); arc_self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 169%; Giai 1/3/10 cấp 20: 233.22% / 402.22% / 993.72%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"angle_deg":120}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-084-S1 giai 2, thành thạo 500; CHALLENGE-NIN-084-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST.

### NIN-084-S7 — Đại kiếm liên trảm
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 232%; Giai 1/3/10 cấp 20: 320.16% / 552.16% / 1364.16%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-084-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-084-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_MIST.

## NIN-085

### NIN-085-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO.

### NIN-085-S1 — Cảm tri
- Đặc thù (mark); single, tầm 6 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 25%; Giai 1/3/10 cấp 20: 34.5% / 59.5% / 147%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; timing.chakra: base*(1-.15*r).
- Tham số cơ chế: {"duration_s":8,"owner_scoped":true,"max_marks":3}.
- Nhánh: không phân nhánh.
- Điều kiện: no_valid_owned_mark; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO. Cân bằng V4: RETAIN_DEV — mobility/mark conditional value.

### NIN-085-S2 — Bạch nhãn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.15,"duration_s":7}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO.

### NIN-085-S3 — Bạch nhãn trinh sát
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"accuracy","magnitude":0.1,"duration_s":6,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO.

### NIN-085-S4 — Cảm tri chakra
- Chakra (chakra_restore); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: params.chakra_amount base*(1+.25*r) (actual missing CP; no self return above paid CP).
- Tham số cơ chế: {"chakra_amount":12,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_chakra_below_70pct; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO.

### NIN-085-S5 — Trinh sát chiến trường
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 123%; Giai 1/3/10 cấp 20: 169.74% / 292.74% / 723.24%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO.

### NIN-085-S6 — Thủy độn hộ vệ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-085-S6-B1 Thủy độn hộ vệ — Hộ thể; effect.total_coefficient ×1.12 | NIN-085-S6-B2 Thủy độn hộ vệ — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: cảnh 3, NIN-085-S1 giai 2, thành thạo 500; CHALLENGE-NIN-085-1 — 3 lần mark_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO.

### NIN-085-S7 — Cảm ứng phá ảo
- Cường hóa/giải thuật (cleanse); single_ally, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; timing.chakra: base*(1-.15*r); V4: timing.windup_s base*(1-.20*r) (min .12s and animation minimum; unchanged max statuses).
- Tham số cơ chế: {"max_statuses":2,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-085-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-085-2 — 5 lần shield_absorbed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_AO.

## NIN-086

### NIN-086-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-086-S1 — Khinh trọng nham
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.25,"duration_s":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-086-S2 — Gia trọng nham
- Khống chế (status); circle_target, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"slow","status_s":3,"magnitude":0.25,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-086-S3 — Khinh trọng nham — tăng tốc nhóm
- Cường hóa/giải thuật (team_buff); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"move_speed","magnitude":0.15,"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-086-S4 — Gia trọng nham — khóa đơn
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-086-S5 — Trần độn nguyên giới bác ly
- Sát thương (ground_damage); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.9s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"telegraph_s":0.9}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-086-S6 — Trần độn hình lập phương
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 192%; Giai 1/3/10 cấp 20: 264.96% / 456.96% / 1128.96%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-086-S1 giai 2, thành thạo 500; CHALLENGE-NIN-086-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-086-S7 — Thổ độn hộ vệ
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-086-S7-B1 Thổ độn hộ vệ — Hộ thể; effect.total_coefficient ×1.12 | NIN-086-S7-B2 Thổ độn hộ vệ — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: cảnh 6, NIN-086-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-086-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

## NIN-087

### NIN-087-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-087-S1 — Thổ độn
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- Nhánh: NIN-087-S1-B1 Thổ độn — Kiên cố; effect.params.duration_s ×1.12 | NIN-087-S1-B2 Thổ độn — Tường rộng; effect.params.width_m ×1.12.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-087-S2 — Dung độn
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE. Cân bằng V4: RETAIN_DEV — retain pending full loadout comparison; mixed slot and mechanics proxy not decisive.

### NIN-087-S3 — Dung độn vôi hóa
- Khống chế (status); single, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 55%; Giai 1/3/10 cấp 20: 75.9% / 130.9% / 323.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"status":"bind","status_s":2,"chance":0.85}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-087-S4 — Thổ độn trói
- Khống chế (trap); circle_ground, tầm 4.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 60%; Giai 1/3/10 cấp 20: 82.8% / 142.8% / 352.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.status_s: base*(1+.20*r) capped.
- Tham số cơ chế: {"duration_s":8,"trigger_radius_m":1.35,"trigger_once":true,"status":"bind","status_s":1.4}.
- Nhánh: NIN-087-S4-B1 Thổ độn trói — Uy lực; effect.total_coefficient ×1.12 | NIN-087-S4-B2 Thổ độn trói — Bẫy rộng; effect.params.trigger_radius_m ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-087-S5 — Vôi hóa
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 5 mục tiêu; 1 hit.
- Hệ số gốc 312%; Giai 1/3/10 cấp 20: 430.56% / 742.56% / 1834.56%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-087-S6 — Thủy độn hỗ trợ
- Sát thương (projectile_damage); projectile_burst, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true,"status":"wet","status_s":4,"chance":0.9}.
- Nhánh: NIN-087-S6-B1 Thủy độn hỗ trợ — Uy lực; effect.total_coefficient ×1.12 | NIN-087-S6-B2 Thủy độn hỗ trợ — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 3, NIN-087-S1 giai 2, thành thạo 500; CHALLENGE-NIN-087-1 — 3 lần wall_blocked, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-087-S7 — Dung độn phong tỏa
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 186%; Giai 1/3/10 cấp 20: 256.68% / 442.68% / 1093.68%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-087-S7-B1 Dung độn phong tỏa — Uy lực; effect.total_coefficient ×1.12 | NIN-087-S7-B2 Dung độn phong tỏa — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 6, NIN-087-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-087-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

## NIN-088

### NIN-088-S0 — Đòn phòng thủ
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-088-S1 — Thổ thuẫn
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"defense","magnitude":0.25,"duration_s":6}.
- Nhánh: NIN-088-S1-B1 Thổ thuẫn — Cường hóa defense; effect.params.magnitude ×1.1 | NIN-088-S1-B2 Thổ thuẫn — Duy trì; effect.params.duration_s ×1.12.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-088-S2 — Thổ nhân
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: NIN-088-S2-B1 Thổ nhân — Phân thân bền; effect.params.hp_fraction ×1.12 | NIN-088-S2-B2 Thổ nhân — Triệu hồi công kích; effect.params.attack_fraction ×1.1.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-088-S3 — Thổ nhân hộ vệ
- Hộ thuẫn (shield); single_ally, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 115%; Giai 1/3/10 cấp 20: 158.7% / 273.7% / 676.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-088-S4 — Thổ thuẫn — hộ vệ nhóm
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 117.3% / 202.3% / 499.8%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: NIN-088-S4-B1 Thổ thuẫn — hộ vệ nhóm — Hộ thể; effect.total_coefficient ×1.12 | NIN-088-S4-B2 Thổ thuẫn — hộ vệ nhóm — Duy trì; effect.params.duration_s ×1.15.
- Điều kiện: ally_under_threat; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-088-S5 — Cự thạch hộ vệ
- Tường chắn (wall); wall, tầm 4 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.duration_s: base*(1+.25*r).
- Tham số cơ chế: {"duration_s":6,"width_m":2.2,"thickness_m":0.45,"blocks_movement":true,"blocks_projectile":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_placement; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-088-S6 — Thổ nhân trọng kích
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: NIN-088-S6-B1 Thổ nhân trọng kích — Uy lực; effect.total_coefficient ×1.12 | NIN-088-S6-B2 Thổ nhân trọng kích — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 3, NIN-088-S1 giai 2, thành thạo 500; CHALLENGE-NIN-088-1 — 3 lần stance_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

### NIN-088-S7 — Cự thạch phòng tuyến
- Hộ thuẫn (shield); circle_self, tầm 0 m, tối đa 6 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"no_enemy_targets":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-088-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-088-2 — 5 lần wall_blocked, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; PRESERVE_P2_P3_GATE; P4_STONE.

## NIN-089

### NIN-089-S0 — Đòn nhanh
- Đánh thường (damage); single, tầm 1.2 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-089-S1 — Iaido
- Sát thương (dash_damage); dash_contact, tầm 3.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.42s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"push_m":0.55,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE. Cân bằng V4: RETAIN_DEV — early slot designed for frequent use; full rotation needed.

### NIN-089-S2 — Kiếm khí
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-089-S3 — Iaido liên trảm
- Sát thương (multi_hit); single, tầm 1.6 m, tối đa 1 mục tiêu; 3 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":3,"interval_s":0.12}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-089-S4 — Kiếm đón đòn
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 130%; Giai 1/3/10 cấp 20: 179.4% / 309.4% / 764.4%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-089-S5 — Nhất thiểm
- Sát thương (dash_multi_hit); dash_contact, tầm 4 m, tối đa 1 mục tiêu; 2 hit.
- Hệ số gốc 297%; Giai 1/3/10 cấp 20: 409.86% / 706.86% / 1746.36%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"stop_m":0.65,"hits":2,"interval_s":0.16,"swept_collision":true,"no_clip":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-089-S6 — Kiếm áp chế
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 175%; Giai 1/3/10 cấp 20: 241.5% / 416.5% / 1029%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-089-S1 giai 2, thành thạo 500; CHALLENGE-NIN-089-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-089-S7 — Nhất thiểm — xuyên phá
- Sát thương (pierce); line, tầm 6 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 215%; Giai 1/3/10 cấp 20: 296.7% / 511.7% / 1264.2%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 6, NIN-089-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-089-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

## NIN-090

### NIN-090-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC.

### NIN-090-S1 — Độc vụ
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: NIN-090-S1-B1 Độc vụ — Uy lực; effect.total_coefficient ×1.12 | NIN-090-S1-B2 Độc vụ — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-090-S2 — Thông linh kỳ nhông
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC.

### NIN-090-S3 — Độc vụ lan rộng
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65,"status":"poison","status_s":5,"chance":0.8,"dot_fraction_of_total":0.2}.
- Nhánh: NIN-090-S3-B1 Độc vụ lan rộng — Uy lực; effect.total_coefficient ×1.12 | NIN-090-S3-B2 Độc vụ lan rộng — Duy trì poison; effect.params.status_s ×1.12 (V4 có hợp đồng adapter, runtime HOLD).
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC.

### NIN-090-S4 — Kỳ nhông Ibuse
- Sát thương (zone_damage); zone_target, tầm 5.5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 165%; Giai 1/3/10 cấp 20: 227.7% / 392.7% / 970.2%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"hit_budget":5}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC.

### NIN-090-S5 — Độc trận
- Sát thương (multi_hit); circle_ground, tầm 6.5 m, tối đa 6 mục tiêu; 4 hit.
- Hệ số gốc 333%; Giai 1/3/10 cấp 20: 459.54% / 792.54% / 1958.04%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"hits":4,"interval_s":0.25,"telegraph_s":0.75}.
- Nhánh: NIN-090-S5-B1 Độc trận — Uy lực; effect.total_coefficient ×1.12 | NIN-090-S5-B2 Độc trận — Liên kích nhanh; effect.params.interval_s ×0.9.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC.

### NIN-090-S6 — Liêm đao độc
- Sát thương (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 96%; Giai 1/3/10 cấp 20: 132.48% / 228.48% / 564.48%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-118; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: NIN-090-S6-B1 Liêm đao độc — Uy lực; effect.total_coefficient ×1.12 | NIN-090-S6-B2 Liêm đao độc — Tiết chakra; timing.chakra ×0.9.
- Điều kiện: cảnh 3, NIN-090-S1 giai 2, thành thạo 500; CHALLENGE-NIN-090-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC.

### NIN-090-S7 — Độc trận — hút chakra vùng
- Chakra (zone_drain); zone_target, tầm 5 m, tối đa 4 mục tiêu; 5 hit.
- Hệ số gốc 169%; Giai 1/3/10 cấp 20: 233.22% / 402.22% / 993.72%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F; params.chakra_per_tick: base*(1+.50*r) actual net.
- Tham số cơ chế: {"duration_s":5,"tick_s":1,"chakra_per_tick":3,"transfer_fraction":0.3,"hit_budget":5}.
- Nhánh: NIN-090-S7-B1 Độc trận — hút chakra vùng — Hấp thu; effect.params.chakra_per_tick ×1.1 (V4 có hợp đồng adapter, runtime HOLD) | NIN-090-S7-B2 Độc trận — hút chakra vùng — Vùng hút; geometry.extent ×1.1.
- Điều kiện: cảnh 6, NIN-090-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-090-2 — 5 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3B_SANIN, S3B_MEDIC.

## NIN-091

### NIN-091-S0 — Phi tiêu
- Đánh thường (damage); projectile_first, tầm 4.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 85%; Giai 1/3/10 cấp 20: 85% / 85% / 85%.
- Chakra 1/5/10/15 sao: 0 / 0 / 0 / 0 CP; hồi chiêu 1.2s; tụ lực 0.18s; hồi động tác 0.28s.
- Tu luyện: chỉ số ninja, không sách; natural_actor_stats: no independent training.
- Tham số cơ chế: {"swept_collision":true,"homing":false,"obstacle_intercept":true}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_enemy; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-091-S1 — Phong độn
- Sát thương (cone_damage); cone, tầm 4.5 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 155%; Giai 1/3/10 cấp 20: 213.9% / 368.9% / 911.4%.
- Chakra 1/5/10/15 sao: 12 / 11.76 / 11.52 / 11.28 CP; hồi chiêu 6s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"angle_deg":65}.
- Nhánh: NIN-091-S1-B1 Phong độn — Uy lực; effect.total_coefficient ×1.12 | NIN-091-S1-B2 Phong độn — Góc quét; effect.params.angle_deg ×1.1.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE. Cân bằng V4: RETAIN_DEV — within same slot/shape/mechanic peer band.

### NIN-091-S2 — Thông linh Baku
- Triệu hồi (summon); summon, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 16 / 15.68 / 15.36 / 15.04 CP; hồi chiêu 8s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.hp_fraction: base*(1+.50*r) owner once; params.attack_fraction: base*(1+.50*r) owner once.
- Tham số cơ chế: {"cap":1,"ttl_s":10,"hp_fraction":0.3,"attack_fraction":0.3,"no_recursive":true,"spawn_rule":"safe_free_position_no_overlap","owner_uid_bound":true,"no_growth_farming":true}.
- Nhánh: không phân nhánh.
- Điều kiện: below_summon_cap; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-091-S3 — Phong độn chân không
- Sát thương (line_damage); line, tầm 5.5 m, tối đa 3 mục tiêu; 1 hit.
- Hệ số gốc 170%; Giai 1/3/10 cấp 20: 234.6% / 404.6% / 999.6%.
- Chakra 1/5/10/15 sao: 18 / 17.64 / 17.28 / 16.92 CP; hồi chiêu 11s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {}.
- Nhánh: NIN-091-S3-B1 Phong độn chân không — Uy lực; effect.total_coefficient ×1.12 | NIN-091-S3-B2 Phong độn chân không — Phạm vi; geometry.extent ×1.15.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-091-S4 — Baku
- Sát thương (displace); single, tầm 5.5 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 75%; Giai 1/3/10 cấp 20: 103.5% / 178.5% / 441%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"direction":"towards_caster","distance_m":2.2}.
- Nhánh: không phân nhánh.
- Điều kiện: valid_target_and_los; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE. Cân bằng V4: RETAIN_DEV — conditional trigger or displacement not raw DPS.

### NIN-091-S5 — Izanagi
- Sát thương (counter); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 189%; Giai 1/3/10 cấp 20: 260.82% / 449.82% / 1111.32%.
- Chakra 1/5/10/15 sao: 45 / 44.1 / 43.2 / 42.3 CP; hồi chiêu 30s; tụ lực 0.8s; hồi động tác 0.65s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"duration_s":4,"max_triggers":1,"no_recursive":true,"charges":1,"finite_per_battle":true,"eye_cost":"DEV_1_charge","cannot_reverse_reward_or_save":true}.
- Nhánh: không phân nhánh.
- Điều kiện: enemy_in_attack_range; cảnh 0.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-091-S6 — Izanagi: thoát hiểm
- Cường hóa/giải thuật (stance); self, tầm 0 m, tối đa 1 mục tiêu; 1 hit.
- Hệ số gốc 0%; Giai 1/3/10 cấp 20: 0% / 0% / 0%.
- Chakra 1/5/10/15 sao: 20 / 19.6 / 19.2 / 18.8 CP; hồi chiêu 14s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; params.magnitude: base*(1+.35*r) capped.
- Tham số cơ chế: {"stat":"evasion","magnitude":0.3,"duration_s":3,"max_avoided_hits":1,"charges":1,"finite_per_battle":true,"eye_cost":"DEV_1_charge","cannot_reverse_reward_or_save":true}.
- Nhánh: không phân nhánh.
- Điều kiện: cảnh 3, NIN-091-S1 giai 2, thành thạo 500; CHALLENGE-NIN-091-1 — 3 lần contact_or_effect_confirmed, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.

### NIN-091-S7 — Phong độn chân không đại ngọc
- Sát thương (area_damage); circle_target, tầm 3.8 m, tối đa 4 mục tiêu; 1 hit.
- Hệ số gốc 243%; Giai 1/3/10 cấp 20: 335.34% / 578.34% / 1428.84%.
- Chakra 1/5/10/15 sao: 28 / 27.44 / 26.88 / 26.32 CP; hồi chiêu 20s; tụ lực 0.28s; hồi động tác 0.35s.
- Tu luyện: RES-119; RES-130; 20 cấp/giai; total_coefficient: base*F.
- Tham số cơ chế: {"push_m":0.65}.
- Nhánh: NIN-091-S7-B1 Phong độn chân không đại ngọc — Uy lực; effect.total_coefficient ×1.12 | NIN-091-S7-B2 Phong độn chân không đại ngọc — Phạm vi; geometry.extent ×1.15.
- Điều kiện: cảnh 6, NIN-091-S5 giai 4, thành thạo 1500; CHALLENGE-NIN-091-2 — 5 lần counter_triggered, thắng và sống sót.
- Nguồn: PARTIAL_NOT_FULL_CANON; REVIEWED_ADAPTER_REQUIRED; S3_KAGE.