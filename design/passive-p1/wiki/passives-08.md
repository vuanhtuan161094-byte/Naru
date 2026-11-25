# Nội tại — tập 08
Thông số DEV gốc chưa cộng nhánh, cấp giai hoặc sao. Mọi buff chịu cap tổng theo stacking-rules; nội tại không tiêu chakra hoặc kích hoạt tuyệt kỹ.

## NIN-085 — Ao

### NIN-085-P1 — Cảm tri — nền tảng · Ao
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chakra tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-085-S1, PRESERVE_P2_P3_GATE.

### NIN-085-P2 — Cảm tri — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Đánh dấu hợp lệ; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-085-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-085-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-085-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-085-S1, PRESERVE_P2_P3_GATE.

### NIN-085-P3 — Ao — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-085-S1, PRESERVE_P2_P3_GATE.

### NIN-085-P4 — Ao — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-085-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-085-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-085-S1, PRESERVE_P2_P3_GATE.

### NIN-085-P5 — Trinh sát chiến trường — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số khiên +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-085-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-085-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-085-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-085-S1, PRESERVE_P2_P3_GATE.

### NIN-085-P6 — Ao — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: hồi chakra +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-085-S2.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-085-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-085-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-085-S1, PRESERVE_P2_P3_GATE.

## NIN-086 — Onoki

### NIN-086-P1 — Khinh trọng nham — nền tảng · Onoki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công nhẫn thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-086-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-086-P2 — Khinh trọng nham — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-086-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-086-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-086-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-086-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-086-P3 — Onoki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-086-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-086-P4 — Onoki — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-086-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-086-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-086-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-086-P5 — Trần độn nguyên giới bác ly — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-086-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-086-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-086-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-086-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-086-P6 — Onoki — phản công áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng nhẫn thuật −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Gây sát thương trực tiếp; hồi riêng 12s; duy trì 5s; owner primary direct S0-S7 positive damage to living hostile primary; no summoned/child, reflected, DOT or combo event; first eligible target per parent cast.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-086-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-086-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-086-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-087 — Kurotsuchi

### NIN-087-P1 — Thổ độn — nền tảng · Kurotsuchi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-087-S1, PRESERVE_P2_P3_GATE.

### NIN-087-P2 — Thổ độn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Chặn đường/đạn thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-087-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-087-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-087-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-087-S1, PRESERVE_P2_P3_GATE.

### NIN-087-P3 — Kurotsuchi — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-087-S1, PRESERVE_P2_P3_GATE.

### NIN-087-P4 — Kurotsuchi — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-087-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-087-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-087-S1, PRESERVE_P2_P3_GATE.

### NIN-087-P5 — Vôi hóa — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-087-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-087-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-087-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-087-S1, PRESERVE_P2_P3_GATE.

### NIN-087-P6 — Kurotsuchi — phản công áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng khống chế −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Gây sát thương trực tiếp; hồi riêng 12s; duy trì 5s; owner primary direct S0-S7 positive damage to living hostile primary; no summoned/child, reflected, DOT or combo event; first eligible target per parent cast.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-087-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-087-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-087-S1, PRESERVE_P2_P3_GATE.

## NIN-088 — Akatsuchi

### NIN-088-P1 — Thổ thuẫn — nền tảng · Akatsuchi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: giáp +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-088-S1, PRESERVE_P2_P3_GATE.

### NIN-088-P2 — Thổ thuẫn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-088-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-088-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-088-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-088-S1, PRESERVE_P2_P3_GATE.

### NIN-088-P3 — Akatsuchi — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-088-S1, PRESERVE_P2_P3_GATE.

### NIN-088-P4 — Akatsuchi — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-088-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-088-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-088-S1, PRESERVE_P2_P3_GATE.

### NIN-088-P5 — Cự thạch hộ vệ — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: giảm chi phí chakra +4%; loại skill_cp_discount. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-088-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-088-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-088-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-088-S1, PRESERVE_P2_P3_GATE.

### NIN-088-P6 — Akatsuchi — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Chịu sát thương thực tế; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-088-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-088-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-088-S1, PRESERVE_P2_P3_GATE.

## NIN-089 — Mifune

### NIN-089-P1 — Iaido — nền tảng · Mifune
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: né tránh +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-089-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-089-P2 — Iaido — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Đòn chí mạng hợp lệ; hồi riêng 10s; duy trì 4s; first positive critical damage in exact parent signature cast; no child/proc/reflection.
- Tham chiếu: NIN-089-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-089-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-089-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-089-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-089-P3 — Mifune — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-089-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-089-P4 — Mifune — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-089-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-089-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-089-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-089-P5 — Nhất thiểm — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-089-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-089-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-089-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-089-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-089-P6 — Iaido — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: giáp −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-089-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-089-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-089-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-089-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-090 — Hanzo

### NIN-090-P1 — Độc vụ — nền tảng · Hanzo
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-090-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-090-P2 — Độc vụ — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-090-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-090-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-090-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-090-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-090-P3 — Hanzo — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-090-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-090-P4 — Hanzo — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-090-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-090-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-090-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-090-P5 — Độc trận — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-090-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-090-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-090-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-090-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-090-P6 — Độc vụ — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng khống chế −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-090-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-090-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-090-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-090-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-091 — Danzo Shimura

### NIN-091-P1 — Phong độn — nền tảng · Danzo Shimura
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-091-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-091-P2 — Phong độn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-091-S1.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-091-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-091-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-091-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-091-P3 — Danzo Shimura — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-091-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-091-P4 — Danzo Shimura — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-091-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-091-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-091-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-091-P5 — Izanagi — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-091-S5.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-091-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-091-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-091-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-091-P6 — Phong độn — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng khống chế −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-091-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-091-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-091-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-091-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-092 — Shisui Uchiha

### NIN-092-P1 — Tập trung Uchiha · Shisui Uchiha
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chính xác +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-092-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-092-P2 — Thuấn thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Đòn chí mạng hợp lệ; hồi riêng 10s; duy trì 4s; first positive critical damage in exact parent signature cast; no child/proc/reflection.
- Tham chiếu: NIN-092-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-092-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-092-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-092-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-092-P3 — Shisui Uchiha — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-092-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-092-P4 — Shisui Uchiha — hiệp lực huyết hệ
- Mở khóa cảnh giới 3, Đồng đội cùng huyết hệ (uchiha).
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-092-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-092-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-092-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-092-P5 — Kotoamatsukami — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: thời gian khống chế +5%; loại skill_status_duration_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-092-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-092-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-092-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-092-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-092-P6 — Thuấn thân — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: giáp −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-092-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-092-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-092-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-092-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-093 — Minato Namikaze

### NIN-093-P1 — Phản xạ tốc độ · Minato Namikaze
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: tốc di chuyển +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-093-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-093-P2 — Phi Lôi Thần — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Dịch chuyển đến đích hợp lệ; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-093-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-093-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-093-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-093-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-093-P3 — Minato Namikaze — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-093-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-093-P4 — Minato Namikaze — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-093-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-093-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-093-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-093-P5 — Phi Lôi Thần liên kích — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: giảm chi phí chakra +4%; loại skill_cp_discount. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-093-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-093-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-093-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-093-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-093-P6 — Minato Namikaze — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-011.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-093-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-093-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-093-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-094 — Kushina Uzumaki

### NIN-094-P1 — Thể chất Uzumaki · Kushina Uzumaki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-094-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-094-P2 — Kim cương phong tỏa — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-094-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-094-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-094-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-094-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-094-P3 — Kushina Uzumaki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-094-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-094-P4 — Kushina Uzumaki — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-094-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-094-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-094-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-094-P5 — Xích chakra — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-094-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-094-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-094-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-094-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-094-P6 — Kushina Uzumaki — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-011.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-094-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-094-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-094-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-095 — Hashirama Senju

### NIN-095-P1 — Sinh lực Senju · Hashirama Senju
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-095-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-095-P2 — Mộc phân thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-095-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-095-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-095-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-095-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-095-P3 — Hashirama Senju — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-095-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-095-P4 — Hashirama Senju — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-095-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-095-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-095-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-095-P5 — Hashirama Senju — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-095-S5, NIN-095-S7; hình thái NIN-095-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-095-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-095-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-095-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-095-P6 — Hashirama Senju — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Chịu sát thương thực tế; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-095-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-095-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-095-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-096 — Tobirama Senju

### NIN-096-P1 — Sinh lực Senju · Tobirama Senju
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-096-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-096-P2 — Thủy độn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-096-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-096-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-096-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-096-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-096-P3 — Tobirama Senju — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-096-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-096-P4 — Tobirama Senju — cộng hưởng water
- Mở khóa cảnh giới 3, Đồng đội cùng hệ (water).
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-096-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-096-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-096-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-096-P5 — Thủy long đạn — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-096-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-096-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-096-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-096-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-096-P6 — Thủy độn — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng nhẫn thuật −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-096-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-096-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-096-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-096-S1, REVIEWED_ADAPTER_REQUIRED.