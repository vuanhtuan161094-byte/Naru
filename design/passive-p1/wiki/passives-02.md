# Nội tại — tập 02
Thông số DEV gốc chưa cộng nhánh, cấp giai hoặc sao. Mọi buff chịu cap tổng theo stacking-rules; nội tại không tiêu chakra hoặc kích hoạt tuyệt kỹ.

## NIN-013 — Neji Hyuga (thiếu niên)

### NIN-013-P1 — Quan sát điểm huyệt · Neji Hyuga
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chính xác +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-013-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-013-P2 — Bạch nhãn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-013-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-013-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-013-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-013-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-013-P3 — Neji Hyuga — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-013-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-013-P4 — Neji Hyuga — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-013-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-013-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-013-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-013-P5 — Bát quái lục thập tứ chưởng — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-013-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-013-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-013-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-013-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-013-P6 — Neji Hyuga — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-013-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-013-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-013-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-014 — Rock Lee (thiếu niên)

### NIN-014-P1 — Rèn luyện thể thuật · Rock Lee
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công vật lý +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-014-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-014-P2 — Mộc diệp toàn phong — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-014-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-014-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-014-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-014-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-014-P3 — Rock Lee — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-014-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-014-P4 — Rock Lee — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-014-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-014-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-014-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-014-P5 — Rock Lee — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-014-S5, NIN-014-S6; hình thái NIN-014-F1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-014-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-014-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-014-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-014-P6 — Rock Lee — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-014-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-014-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-014-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-015 — Tenten (thiếu niên)

### NIN-015-P1 — Phóng nhẫn cụ — nền tảng · Tenten
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công nhẫn thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-015-S1, PRESERVE_P2_P3_GATE.

### NIN-015-P2 — Phóng nhẫn cụ — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-015-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-015-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-015-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-015-S1, PRESERVE_P2_P3_GATE.

### NIN-015-P3 — Tenten — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-015-S1, PRESERVE_P2_P3_GATE.

### NIN-015-P4 — Tenten — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-015-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-015-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-015-S1, PRESERVE_P2_P3_GATE.

### NIN-015-P5 — Mưa nhẫn cụ — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-015-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-015-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-015-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-015-S1, PRESERVE_P2_P3_GATE.

### NIN-015-P6 — Phóng nhẫn cụ — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng nhẫn thuật −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-015-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-015-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-015-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-015-S1, PRESERVE_P2_P3_GATE.

## NIN-016 — Might Guy

### NIN-016-P1 — Mộc diệp đại toàn phong — nền tảng · Might Guy
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-016-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-016-P2 — Mộc diệp đại toàn phong — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-016-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-016-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-016-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-016-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-016-P3 — Might Guy — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-016-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-016-P4 — Might Guy — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-016-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-016-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-016-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-016-P5 — Might Guy — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-016-S6, NIN-016-S7; hình thái NIN-016-F1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-016-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-016-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-016-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-016-P6 — Might Guy — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-006.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-016-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-016-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-016-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-017 — Asuma Sarutobi

### NIN-017-P1 — Phi yến — nền tảng · Asuma Sarutobi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-017-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-017-P2 — Phi yến — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-017-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-017-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-017-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-017-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-017-P3 — Asuma Sarutobi — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-017-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-017-P4 — Asuma Sarutobi — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-017-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-017-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-017-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-017-P5 — Chakra đao liên kích — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-017-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-017-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-017-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-017-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-017-P6 — Asuma Sarutobi — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-017-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-017-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-017-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-018 — Kurenai Yuhi

### NIN-018-P1 — Ảo thuật trói cây — nền tảng · Kurenai Yuhi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-018-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-018-P2 — Ảo thuật trói cây — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-018-S1.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-018-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-018-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-018-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-018-P3 — Kurenai Yuhi — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-018-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-018-P4 — Kurenai Yuhi — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-018-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-018-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-018-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-018-P5 — Mộng cảnh trói buộc — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: thời gian khống chế +5%; loại skill_status_duration_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-018-S5.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-018-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-018-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-018-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-018-P6 — Ảo thuật trói cây — áp chế diện rộng
- Mở khóa cảnh giới 6, Toàn đội địch.
- Hiệu ứng: kháng khống chế −2.5%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 2.78% / 3.08% / 3.33%; 15 sao: 2.93% / 3.23% / 3.48%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 18s; duy trì 4s; actual nonimmune status applied to one hostile primary by signature parent cast; emit at most once per parent; all living hostile primary recipients subject to debuff immunity.
- Tham chiếu: NIN-018-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-018-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-018-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: prevent signature or cleanse debuff; per recipient immunity; defeat source ends buff. Nguồn: thiết kế game-original, tham chiếu NIN-018-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-019 — Hiruzen Sarutobi

### NIN-019-P1 — Hỏa độn — nền tảng · Hiruzen Sarutobi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công nhẫn thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-019-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-019-P2 — Hỏa độn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-019-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-019-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-019-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-019-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-019-P3 — Hiruzen Sarutobi — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-019-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-019-P4 — Hiruzen Sarutobi — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-019-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-019-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-019-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-019-P5 — Ngũ hành liên kích — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-019-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-019-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-019-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-019-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-019-P6 — Hỏa độn — áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng nhẫn thuật −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 12s; duy trì 5s; actual hostile target UID confirmed; no allied or summon target proxy.
- Tham chiếu: NIN-019-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-019-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-019-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-019-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-020 — Jiraiya

### NIN-020-P1 — Dầu cóc — nền tảng · Jiraiya
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: công nhẫn thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-020-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-020-P2 — Dầu cóc — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-020-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-020-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-020-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-020-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-020-P3 — Jiraiya — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-020-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-020-P4 — Jiraiya — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công nhẫn thuật +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-020-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-020-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-020-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-020-P5 — Jiraiya — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-020-S5, NIN-020-S6; hình thái NIN-020-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-020-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-020-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-020-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-020-P6 — Jiraiya — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-009.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-020-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-020-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-020-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-021 — Tsunade

### NIN-021-P1 — Chưởng tiên thuật — nền tảng · Tsunade
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: trị liệu +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-021-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-021-P2 — Chưởng tiên thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: trị liệu +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trị liệu hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-021-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-021-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-021-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-021-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-021-P3 — Tsunade — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-021-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-021-P4 — Tsunade — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: nhận trị liệu +6%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-021-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-021-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-021-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-021-P5 — Tsunade — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-021-S2, NIN-021-S3; hình thái NIN-021-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-021-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-021-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-021-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-021-P6 — Tsunade — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-009.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-021-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-021-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-021-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-022 — Orochimaru

### NIN-022-P1 — Tiềm ảnh xà thủ — nền tảng · Orochimaru
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-022-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-022-P2 — Tiềm ảnh xà thủ — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Kỹ năng xác nhận hiệu ứng; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-022-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-022-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-022-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-022-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-022-P3 — Orochimaru — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-022-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-022-P4 — Orochimaru — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-022-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-022-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-022-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-022-P5 — Orochimaru — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: thời gian khống chế +5%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legitimate form ID active; no form unlock or activation.
- Tham chiếu: không giới hạn skill cụ thể; hình thái NIN-022-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-022-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-022-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-022-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-022-P6 — Orochimaru — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-009.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-022-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-022-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-022-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-023 — Kabuto Yakushi

### NIN-023-P1 — Chakra no Mesu — nền tảng · Kabuto Yakushi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: trị liệu +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-023-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-023-P2 — Chakra no Mesu — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: trị liệu +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Thay đổi tài nguyên thực tế; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-023-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-023-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-023-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-023-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-023-P3 — Kabuto Yakushi — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-023-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-023-P4 — Kabuto Yakushi — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: nhận trị liệu +6%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-023-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-023-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-023-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-023-P5 — Tái tạo tế bào — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số trị liệu +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-023-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-023-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-023-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-023-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-023-P6 — Kabuto Yakushi — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: nhận trị liệu +4%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trị liệu hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-023-S2.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-023-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-023-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-023-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-024 — Gaara (thiếu niên)

### NIN-024-P1 — Phòng hộ cát · Gaara
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: giáp +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-024-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-024-P2 — Sa phược cữu — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-024-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-024-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-024-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-024-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-024-P3 — Gaara — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-024-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-024-P4 — Gaara — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-024-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-024-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-024-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-024-P5 — Gaara — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-024-S5; hình thái NIN-024-F1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-024-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-024-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-024-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-024-P6 — Gaara — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Chịu sát thương thực tế; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-024-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-024-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-024-S1, REVIEWED_ADAPTER_REQUIRED.