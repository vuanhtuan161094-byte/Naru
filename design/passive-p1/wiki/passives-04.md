# Nội tại — tập 04
Thông số DEV gốc chưa cộng nhánh, cấp giai hoặc sao. Mọi buff chịu cap tổng theo stacking-rules; nội tại không tiêu chakra hoặc kích hoạt tuyệt kỹ.

## NIN-037 — Jirobo

### NIN-037-P1 — Thổ lao — nền tảng · Jirobo
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: giáp +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-037-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-037-P2 — Thổ lao — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Chặn đường/đạn thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-037-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-037-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-037-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-037-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-037-P3 — Jirobo — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-037-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-037-P4 — Jirobo — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-037-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-037-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-037-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-037-P5 — Thổ lăng đoàn tử — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-037-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-037-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-037-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-037-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-037-P6 — Jirobo — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Chịu sát thương thực tế; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-037-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-037-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-037-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-038 — Kidomaru

### NIN-038-P1 — Tơ nhện — nền tảng · Kidomaru
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công nhẫn thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-038-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-038-P2 — Tơ nhện — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-038-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-038-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-038-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-038-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-038-P3 — Kidomaru — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-038-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-038-P4 — Kidomaru — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-038-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-038-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-038-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-038-P5 — Mũi tên hoàng kim — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-038-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-038-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-038-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-038-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-038-P6 — Tơ nhện — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng nhẫn thuật −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-038-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-038-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-038-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-038-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-039 — Tayuya

### NIN-039-P1 — Sáo ảo thuật — nền tảng · Tayuya
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-039-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-039-P2 — Sáo ảo thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-039-S1.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-039-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-039-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-039-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-039-P3 — Tayuya — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-039-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-039-P4 — Tayuya — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-039-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-039-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-039-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-039-P5 — Ma âm — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-039-S5.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-039-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-039-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-039-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-039-P6 — Sáo ảo thuật — áp chế diện rộng
- Mở khóa cảnh giới 6, Toàn đội địch.
- Hiệu ứng: kháng khống chế −2.5%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 2.78% / 3.08% / 3.33%; 15 sao: 2.93% / 3.23% / 3.48%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 18s; duy trì 4s; actual nonimmune status applied to one hostile primary by signature parent cast; emit at most once per parent; all living hostile primary recipients subject to debuff immunity.
- Tham chiếu: NIN-039-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-039-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-039-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: prevent signature or cleanse debuff; per recipient immunity; defeat source ends buff. Nguồn: thiết kế game-original, tham chiếu NIN-039-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-040 — Sakon và Ukon

### NIN-040-P1 — Liên kích song thân — nền tảng · Sakon và Ukon
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-040-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-040-P2 — Liên kích song thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-040-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-040-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-040-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-040-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-040-P3 — Sakon và Ukon — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-040-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-040-P4 — Sakon và Ukon — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-040-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-040-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-040-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-040-P5 — Song thân hợp kích — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-040-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-040-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-040-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-040-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-040-P6 — Sakon và Ukon — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-040-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-040-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-040-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-041 — Naruto Uzumaki (Shippuden)

### NIN-041-P1 — Thể chất Uzumaki · Naruto Uzumaki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-041-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-041-P2 — Đa Trọng Ảnh Phân Thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-041-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-041-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-041-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-041-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-041-P3 — Naruto Uzumaki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-041-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-041-P4 — Naruto Uzumaki — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-041-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-041-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-041-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-041-P5 — Naruto Uzumaki — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-041-S5, NIN-041-S6; hình thái NIN-041-F1, NIN-041-F2, NIN-041-F3.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-041-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-041-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-041-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-041-P6 — Naruto Uzumaki — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-002, COMBO-003.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-041-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-041-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-041-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-042 — Sasuke Uchiha (Shippuden)

### NIN-042-P1 — Tập trung Uchiha · Sasuke Uchiha
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chính xác +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-042-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-042-P2 — Chidori Lưu — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Đòn chí mạng hợp lệ; hồi riêng 10s; duy trì 4s; first positive critical damage in exact parent signature cast; no child/proc/reflection.
- Tham chiếu: NIN-042-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-042-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-042-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-042-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-042-P3 — Sasuke Uchiha — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-042-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-042-P4 — Sasuke Uchiha — hiệp lực huyết hệ
- Mở khóa cảnh giới 3, Đồng đội cùng huyết hệ (uchiha).
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-042-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-042-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-042-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-042-P5 — Sasuke Uchiha — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-042-S6, NIN-042-S7; hình thái NIN-042-F1, NIN-042-F2, NIN-042-F3.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-042-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-042-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-042-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-042-P6 — Sasuke Uchiha — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-002.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-042-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-042-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-042-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-043 — Sakura Haruno (Shippuden)

### NIN-043-P1 — Kiểm soát chakra · Sakura Haruno
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: trị liệu +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-043-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-043-P2 — Chưởng Tiên Thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: trị liệu +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trị liệu hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-043-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-043-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-043-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-043-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-043-P3 — Sakura Haruno — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-043-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-043-P4 — Sakura Haruno — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: nhận trị liệu +6%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-043-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-043-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-043-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-043-P5 — Sakura Haruno — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-043-S2, NIN-043-S3; hình thái NIN-043-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-043-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-043-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-043-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-043-P6 — Sakura Haruno — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: nhận trị liệu +4%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trị liệu hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-043-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-043-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-043-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-043-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-044 — Sai

### NIN-044-P1 — Siêu thú ngụy họa — nền tảng · Sai
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công nhẫn thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-044-S1, PRESERVE_P2_P3_GATE.

### NIN-044-P2 — Siêu thú ngụy họa — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-044-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-044-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-044-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-044-S1, PRESERVE_P2_P3_GATE.

### NIN-044-P3 — Sai — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-044-S1, PRESERVE_P2_P3_GATE.

### NIN-044-P4 — Sai — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-044-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-044-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-044-S1, PRESERVE_P2_P3_GATE.

### NIN-044-P5 — Hổ mực liên kích — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-044-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-044-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-044-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-044-S1, PRESERVE_P2_P3_GATE.

### NIN-044-P6 — Sai — phản công áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng nhẫn thuật −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Gây sát thương trực tiếp; hồi riêng 12s; duy trì 5s; owner primary direct S0-S7 positive damage to living hostile primary; no summoned/child, reflected, DOT or combo event; first eligible target per parent cast.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-044-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-044-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-044-S1, PRESERVE_P2_P3_GATE.

## NIN-045 — Yamato

### NIN-045-P1 — Mộc phân thân — nền tảng · Yamato
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: giáp +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-045-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-045-P2 — Mộc phân thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-045-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-045-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-045-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-045-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-045-P3 — Yamato — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-045-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-045-P4 — Yamato — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-045-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-045-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-045-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-045-P5 — Mộc độn đại thụ — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-045-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-045-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-045-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-045-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-045-P6 — Yamato — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Chịu sát thương thực tế; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-045-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-045-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-045-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-046 — Shikamaru Nara (Shippuden)

### NIN-046-P1 — Tư duy chiến thuật · Shikamaru Nara
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-046-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-046-P2 — Ảnh mô phỏng — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-046-S1.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-046-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-046-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-046-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-046-P3 — Shikamaru Nara — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-046-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-046-P4 — Shikamaru Nara — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-046-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-046-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-046-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-046-P5 — Ảnh thủ phược — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-046-S5.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-046-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-046-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-046-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-046-P6 — Shikamaru Nara — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-004.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-046-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-046-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-046-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-047 — Choji Akimichi (Shippuden)

### NIN-047-P1 — Thể lực Akimichi · Choji Akimichi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-047-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-047-P2 — Bội hóa — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-047-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-047-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-047-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-047-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-047-P3 — Choji Akimichi — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-047-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-047-P4 — Choji Akimichi — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-047-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-047-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-047-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-047-P5 — Choji Akimichi — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-047-S3, NIN-047-S6; hình thái NIN-047-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-047-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-047-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-047-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-047-P6 — Choji Akimichi — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-004.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-047-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-047-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-047-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-048 — Ino Yamanaka (Shippuden)

### NIN-048-P1 — Tập trung tinh thần · Ino Yamanaka
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng ảo thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-048-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-048-P2 — Tâm chuyển thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-048-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-048-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-048-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-048-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-048-P3 — Ino Yamanaka — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-048-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-048-P4 — Ino Yamanaka — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-048-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-048-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-048-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-048-P5 — Tâm truyền thân: giải nhiễu — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: giảm chi phí chakra +4%; loại skill_cp_discount. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-048-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-048-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-048-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-048-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-048-P6 — Ino Yamanaka — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-004.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-048-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-048-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-048-S1, REVIEWED_ADAPTER_REQUIRED.