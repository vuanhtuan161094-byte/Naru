# Nội tại — tập 11
Thông số DEV gốc chưa cộng nhánh, cấp giai hoặc sao. Mọi buff chịu cap tổng theo stacking-rules; nội tại không tiêu chakra hoặc kích hoạt tuyệt kỹ.

## NIN-121 — Iwabe Yuino

### NIN-121-P1 — Thổ thuẫn — nền tảng · Iwabe Yuino
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: giáp +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-121-S1, PRESERVE_P2_P3_GATE.

### NIN-121-P2 — Thổ thuẫn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-121-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-121-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-121-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-121-S1, PRESERVE_P2_P3_GATE.

### NIN-121-P3 — Iwabe Yuino — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-121-S1, PRESERVE_P2_P3_GATE.

### NIN-121-P4 — Iwabe Yuino — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-121-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-121-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-121-S1, PRESERVE_P2_P3_GATE.

### NIN-121-P5 — Thổ độn chiến trận — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-121-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-121-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-121-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-121-S1, PRESERVE_P2_P3_GATE.

### NIN-121-P6 — Iwabe Yuino — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Chịu sát thương thực tế; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-121-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-121-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-121-S1, PRESERVE_P2_P3_GATE.

## NIN-122 — Sumire Kakei

### NIN-122-P1 — Thủy độn — nền tảng · Sumire Kakei
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chakra tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-122-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-122-P2 — Thủy độn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-122-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-122-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-122-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-122-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-122-P3 — Sumire Kakei — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-122-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-122-P4 — Sumire Kakei — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-122-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-122-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-122-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-122-P5 — Nue liên kết — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-122-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-122-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-122-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-122-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-122-P6 — Sumire Kakei — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: hồi chakra +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-122-S4.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-122-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-122-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-122-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-123 — Konohamaru (trưởng thành)

### NIN-123-P1 — Ảnh phân thân — nền tảng · Konohamaru
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-123-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-123-P2 — Ảnh phân thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-123-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-123-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-123-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-123-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-123-P3 — Konohamaru — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-123-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-123-P4 — Konohamaru — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-123-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-123-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-123-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-123-P5 — Rasengan — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-123-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-123-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-123-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-123-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-123-P6 — Konohamaru — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-123-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-123-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-123-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-124 — Moegi Kazamatsuri

### NIN-124-P1 — Thổ độn — nền tảng · Moegi Kazamatsuri
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chakra tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-124-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-124-P2 — Thổ độn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Chặn đường/đạn thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-124-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-124-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-124-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-124-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-124-P3 — Moegi Kazamatsuri — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-124-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-124-P4 — Moegi Kazamatsuri — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-124-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-124-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-124-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-124-P5 — Hộ vệ đồng đội — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số khiên +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-124-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-124-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-124-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-124-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-124-P6 — Moegi Kazamatsuri — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: hồi chakra +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-124-S3.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-124-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-124-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-124-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-125 — Udon Ise

### NIN-125-P1 — Thủy độn — nền tảng · Udon Ise
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chakra tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-125-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-125-P2 — Thủy độn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-125-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-125-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-125-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-125-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-125-P3 — Udon Ise — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-125-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-125-P4 — Udon Ise — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-125-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-125-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-125-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-125-P5 — Khống chế khu vực — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-125-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-125-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-125-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-125-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-125-P6 — Udon Ise — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: hồi chakra +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-125-S0.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-125-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-125-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-125-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-126 — Naruto Uzumaki (Hokage)

### NIN-126-P1 — Thể chất Uzumaki · Naruto Uzumaki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-126-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-126-P2 — Ảnh Phân Thân chiến thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-126-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-126-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-126-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-126-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-126-P3 — Naruto Uzumaki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-126-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-126-P4 — Naruto Uzumaki — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-126-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-126-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-126-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-126-P5 — Naruto Uzumaki — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-126-S5, NIN-126-S7; hình thái NIN-126-F1, NIN-126-F2.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-126-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-126-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-126-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-126-P6 — Naruto Uzumaki — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-012.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-126-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-126-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-126-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-127 — Sasuke Uchiha (trưởng thành)

### NIN-127-P1 — Tập trung Uchiha · Sasuke Uchiha
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chính xác +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-127-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-127-P2 — Chidori — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-127-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-127-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-127-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-127-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-127-P3 — Sasuke Uchiha — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-127-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-127-P4 — Sasuke Uchiha — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-127-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-127-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-127-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-127-P5 — Sasuke Uchiha — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-127-S3, NIN-127-S7; hình thái NIN-127-F1, NIN-127-F2.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-127-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-127-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-127-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-127-P6 — Sasuke Uchiha — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-012.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-127-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-127-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-127-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-128 — Sakura Haruno (trưởng thành)

### NIN-128-P1 — Kiểm soát chakra · Sakura Haruno
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: trị liệu +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-128-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-128-P2 — Chưởng tiên thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: trị liệu +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trị liệu hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-128-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-128-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-128-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-128-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-128-P3 — Sakura Haruno — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-128-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-128-P4 — Sakura Haruno — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: nhận trị liệu +6%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-128-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-128-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-128-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-128-P5 — Sakura Haruno — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-128-S2, NIN-128-S4; hình thái NIN-128-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-128-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-128-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-128-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-128-P6 — Sakura Haruno — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: nhận trị liệu +4%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trị liệu hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-128-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-128-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-128-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-128-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-129 — Shikamaru Nara (trưởng thành)

### NIN-129-P1 — Tư duy chiến thuật · Shikamaru Nara
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-129-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-129-P2 — Ảnh mô phỏng — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-129-S1.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-129-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-129-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-129-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-129-P3 — Shikamaru Nara — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-129-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-129-P4 — Shikamaru Nara — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-129-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-129-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-129-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-129-P5 — Ảnh trận chiến thuật — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-129-S5.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-129-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-129-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-129-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-129-P6 — Ảnh mô phỏng — áp chế diện rộng
- Mở khóa cảnh giới 6, Toàn đội địch.
- Hiệu ứng: kháng khống chế −2.5%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 2.78% / 3.08% / 3.33%; 15 sao: 2.93% / 3.23% / 3.48%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 18s; duy trì 4s; actual nonimmune status applied to one hostile primary by signature parent cast; emit at most once per parent; all living hostile primary recipients subject to debuff immunity.
- Tham chiếu: NIN-129-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-129-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-129-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: prevent signature or cleanse debuff; per recipient immunity; defeat source ends buff. Nguồn: thiết kế game-original, tham chiếu NIN-129-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-130 — Momoshiki Otsutsuki

### NIN-130-P1 — Hấp thụ nhẫn thuật — nền tảng · Momoshiki Otsutsuki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công nhẫn thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-130-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-130-P2 — Hấp thụ nhẫn thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Thay đổi tài nguyên thực tế; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-130-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-130-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-130-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-130-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-130-P3 — Momoshiki Otsutsuki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-130-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-130-P4 — Momoshiki Otsutsuki — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-130-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-130-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-130-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-130-P5 — Momoshiki Otsutsuki — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-130-S5, NIN-130-S7; hình thái NIN-130-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-130-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-130-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-130-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-130-P6 — Momoshiki Otsutsuki — phản công áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng nhẫn thuật −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Gây sát thương trực tiếp; hồi riêng 12s; duy trì 5s; owner primary direct S0-S7 positive damage to living hostile primary; no summoned/child, reflected, DOT or combo event; first eligible target per parent cast.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-130-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-130-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-130-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-131 — Kinshiki Otsutsuki

### NIN-131-P1 — Vũ khí chakra — nền tảng · Kinshiki Otsutsuki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-131-S1, PRESERVE_P2_P3_GATE.

### NIN-131-P2 — Vũ khí chakra — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-131-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-131-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-131-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-131-S1, PRESERVE_P2_P3_GATE.

### NIN-131-P3 — Kinshiki Otsutsuki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-131-S1, PRESERVE_P2_P3_GATE.

### NIN-131-P4 — Kinshiki Otsutsuki — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-131-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-131-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-131-S1, PRESERVE_P2_P3_GATE.

### NIN-131-P5 — Vũ khí khổng lồ — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-131-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-131-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-131-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-131-S1, PRESERVE_P2_P3_GATE.

### NIN-131-P6 — Kinshiki Otsutsuki — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-131-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-131-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-131-S1, PRESERVE_P2_P3_GATE.

## NIN-132 — Isshiki Otsutsuki

### NIN-132-P1 — Sukunahikona — nền tảng · Isshiki Otsutsuki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-132-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-132-P2 — Sukunahikona — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-132-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-132-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-132-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-132-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-132-P3 — Isshiki Otsutsuki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-132-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-132-P4 — Isshiki Otsutsuki — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-132-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-132-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-132-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-132-P5 — Khối lập phương — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-132-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-132-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-132-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-132-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-132-P6 — Isshiki Otsutsuki — phản công áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng khống chế −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Gây sát thương trực tiếp; hồi riêng 12s; duy trì 5s; owner primary direct S0-S7 positive damage to living hostile primary; no summoned/child, reflected, DOT or combo event; first eligible target per parent cast.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-132-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-132-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-132-S1, REVIEWED_ADAPTER_REQUIRED.