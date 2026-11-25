# Nội tại — tập 01
Thông số DEV gốc chưa cộng nhánh, cấp giai hoặc sao. Mọi buff chịu cap tổng theo stacking-rules; nội tại không tiêu chakra hoặc kích hoạt tuyệt kỹ.

## NIN-001 — Naruto Uzumaki (thiếu niên)

### NIN-001-P1 — Thể chất Uzumaki · Naruto Uzumaki
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-001-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-001-P2 — Ảnh Phân Thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-001-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-001-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-001-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-001-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-001-P3 — Naruto Uzumaki — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-001-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-001-P4 — Naruto Uzumaki — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-001-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-001-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-001-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-001-P5 — Naruto Uzumaki — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-001-S6, NIN-001-S7; hình thái NIN-001-F1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-001-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-001-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-001-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-001-P6 — Naruto Uzumaki — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-001.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-001-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-001-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-001-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-002 — Sasuke Uchiha (thiếu niên)

### NIN-002-P1 — Tập trung Uchiha · Sasuke Uchiha
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chính xác +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-002-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-002-P2 — Hào hỏa cầu — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Đòn chí mạng hợp lệ; hồi riêng 10s; duy trì 4s; first positive critical damage in exact parent signature cast; no child/proc/reflection.
- Tham chiếu: NIN-002-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-002-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-002-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-002-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-002-P3 — Sasuke Uchiha — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-002-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-002-P4 — Sasuke Uchiha — hiệp lực huyết hệ
- Mở khóa cảnh giới 3, Đồng đội cùng huyết hệ (uchiha).
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-002-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-002-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-002-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-002-P5 — Sasuke Uchiha — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-002-S5, NIN-002-S6; hình thái NIN-002-F1, NIN-002-F2.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-002-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-002-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-002-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-002-P6 — Sasuke Uchiha — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-001.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-002-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-002-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-002-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-003 — Sakura Haruno (thiếu niên)

### NIN-003-P1 — Kiểm soát chakra · Sakura Haruno
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: trị liệu +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-003-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-003-P2 — Giải ảo thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: trị liệu +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Giải hiệu ứng hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-003-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-003-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-003-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-003-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-003-P3 — Sakura Haruno — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-003-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-003-P4 — Sakura Haruno — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: nhận trị liệu +6%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-003-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-003-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-003-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-003-P5 — Ý chí Đội 7 — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: giảm chi phí chakra +4%; loại skill_cp_discount. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-003-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-003-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-003-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-003-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-003-P6 — Sakura Haruno — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: nhận trị liệu +4%; loại received_heal_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trị liệu hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-003-S2.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-003-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-003-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-003-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-004 — Kakashi Hatake

### NIN-004-P1 — Phán đoán sao chép · Kakashi Hatake
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chính xác +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-004-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-004-P2 — Thổ Lưu Bích — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Chặn đường/đạn thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-004-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-004-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-004-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-004-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-004-P3 — Kakashi Hatake — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-004-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-004-P4 — Kakashi Hatake — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-004-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-004-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-004-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-004-P5 — Kakashi Hatake — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-004-S5, NIN-004-S6; hình thái NIN-004-F1, NIN-004-F2.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-004-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-004-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-004-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-004-P6 — Kakashi Hatake — liên kết hợp kích
- Mở khóa cảnh giới 6, Hợp kích.
- Hiệu ứng: hiệu ứng hợp kích +4%; loại combo_payload_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Khi xử lý hiệu ứng hợp kích; valid authored committed combo; owner one of living primary participants.
- Tham chiếu: không giới hạn skill cụ thể; combo COMBO-003.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-004-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-004-P6-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: deny signature timing, disable participant; no auto-trigger. Nguồn: thiết kế game-original, tham chiếu NIN-004-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-005 — Iruka Umino

### NIN-005-P1 — Bẫy dây — nền tảng · Iruka Umino
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chakra tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-005-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-005-P2 — Bẫy dây — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-005-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-005-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-005-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-005-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-005-P3 — Iruka Umino — điều tức nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: hồi chakra +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: Chakra giảm qua ngưỡng 25%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing after actual paid legal skill cost or hostile drain; alive, no max CP resize or passive cost.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: deny recovery with chakra pressure; temporary dispellable buff; no immediate CP refund. Nguồn: thiết kế game-original, tham chiếu NIN-005-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-005-P4 — Iruka Umino — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: hồi chakra +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-005-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-005-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-005-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-005-P5 — Ý chí người thầy — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: giảm chi phí chakra +4%; loại skill_cp_discount. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-005-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-005-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-005-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-005-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-005-P6 — Iruka Umino — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: hồi chakra +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: NIN-005-S5.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-005-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-005-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-005-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-006 — Konohamaru (thiếu niên)

### NIN-006-P1 — Ảnh phân thân — nền tảng · Konohamaru
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-006-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-006-P2 — Ảnh phân thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Triệu hồi thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-006-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-006-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-006-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-006-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-006-P3 — Konohamaru — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-006-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-006-P4 — Konohamaru — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-006-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-006-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-006-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-006-P5 — Phân thân liên kích tập sự — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-006-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-006-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-006-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-006-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-006-P6 — Konohamaru — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-006-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-006-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-006-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-007 — Shikamaru Nara (thiếu niên)

### NIN-007-P1 — Tư duy chiến thuật · Shikamaru Nara
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng khống chế +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-007-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-007-P2 — Ảnh mô phỏng — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-007-S1.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-007-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-007-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-007-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-007-P3 — Shikamaru Nara — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-007-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-007-P4 — Shikamaru Nara — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-007-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-007-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-007-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-007-P5 — Ảnh trói — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: thời gian khống chế +5%; loại skill_status_duration_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-007-S5.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-007-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-007-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-007-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-007-P6 — Ảnh mô phỏng — áp chế diện rộng
- Mở khóa cảnh giới 6, Toàn đội địch.
- Hiệu ứng: kháng khống chế −2.5%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 2.78% / 3.08% / 3.33%; 15 sao: 2.93% / 3.23% / 3.48%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 18s; duy trì 4s; actual nonimmune status applied to one hostile primary by signature parent cast; emit at most once per parent; all living hostile primary recipients subject to debuff immunity.
- Tham chiếu: NIN-007-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-007-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-007-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: prevent signature or cleanse debuff; per recipient immunity; defeat source ends buff. Nguồn: thiết kế game-original, tham chiếu NIN-007-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-008 — Choji Akimichi (thiếu niên)

### NIN-008-P1 — Thể lực Akimichi · Choji Akimichi
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: HP tối đa +8%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-008-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-008-P2 — Bội hóa — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: giáp +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hình thái kích hoạt; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-008-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-008-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-008-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-008-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-008-P3 — Choji Akimichi — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-008-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-008-P4 — Choji Akimichi — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-008-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-008-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-008-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-008-P5 — Choji Akimichi — làm chủ hình thái
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hiệu ứng kỹ năng trong hình thái +5%; loại form_skill_coefficient_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Khi hình thái hoạt động; exact legal form active; authored empowered skill for that exact form; no form unlock/activation.
- Tham chiếu: NIN-008-S5, NIN-008-S6; hình thái NIN-008-F1, NIN-008-F2.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-008-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-008-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: wait out form; interrupt legitimate activation. Nguồn: thiết kế game-original, tham chiếu NIN-008-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-008-P6 — Choji Akimichi — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: giảm sát thương nhận +4%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Chịu sát thương thực tế; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-008-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-008-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-008-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-009 — Ino Yamanaka (thiếu niên)

### NIN-009-P1 — Tập trung tinh thần · Ino Yamanaka
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng ảo thuật +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-009-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-009-P2 — Tâm chuyển thân — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-009-S1.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-009-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-009-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-009-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-009-P3 — Ino Yamanaka — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-120, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-009-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-009-P4 — Ino Yamanaka — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 4 m.
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-009-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-009-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-009-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-009-P5 — Khống chế tâm trí — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: thời gian khống chế +5%; loại skill_status_duration_bonus. Giai 1/3/10 cấp 20, 1 sao: 5.55% / 6.16% / 6.66%; 15 sao: 5.85% / 6.46% / 6.96%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-009-S5.
- Tu luyện RES-120, RES-130; 20 cấp/giai; NIN-009-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-009-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-009-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-009-P6 — Tâm chuyển thân — áp chế diện rộng
- Mở khóa cảnh giới 6, Toàn đội địch.
- Hiệu ứng: kháng khống chế −2.5%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 2.78% / 3.08% / 3.33%; 15 sao: 2.93% / 3.23% / 3.48%.
- Kích hoạt: Áp dụng trạng thái thành công; hồi riêng 18s; duy trì 4s; actual nonimmune status applied to one hostile primary by signature parent cast; emit at most once per parent; all living hostile primary recipients subject to debuff immunity.
- Tham chiếu: NIN-009-S1.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-009-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-009-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: prevent signature or cleanse debuff; per recipient immunity; defeat source ends buff. Nguồn: thiết kế game-original, tham chiếu NIN-009-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-010 — Hinata Hyuga (thiếu niên)

### NIN-010-P1 — Quan sát điểm huyệt · Hinata Hyuga
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: chính xác +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-010-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-010-P2 — Bạch nhãn — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-010-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-010-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-010-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-010-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-010-P3 — Hinata Hyuga — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: giảm sát thương nhận +8%; loại incoming_damage_reduction. Giai 1/3/10 cấp 20, 1 sao: 8.88% / 9.86% / 10.66%; 15 sao: 9.36% / 10.34% / 11.14%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-010-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-010-P4 — Hinata Hyuga — hiệp lực toàn đội
- Mở khóa cảnh giới 3, Toàn đội.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-010-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-010-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-010-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-010-P5 — Liên kích nhu quyền — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-010-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-010-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-010-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-010-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-010-P6 — Hinata Hyuga — tiếp viện
- Mở khóa cảnh giới 6, Toàn đội.
- Hiệu ứng: công vật lý +4%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Tiêu diệt địch hợp lệ; hồi riêng 18s; duy trì 5s; actual qualifying parent event; damage/kill from hostile combat; no child proc.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-010-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-010-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid event or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-010-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-011 — Kiba Inuzuka (thiếu niên)

### NIN-011-P1 — Giác quan nhẫn khuyển · Kiba Inuzuka
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: tốc di chuyển +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-011-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-011-P2 — Tứ cước thuật — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: công vật lý +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Cường hóa hữu hiệu; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-011-S1.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-011-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-011-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-011-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-011-P3 — Kiba Inuzuka — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: tốc di chuyển +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-118, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-011-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-011-P4 — Kiba Inuzuka — hào quang chiến thuật
- Mở khóa cảnh giới 3, Trong bán kính 3.5 m.
- Hiệu ứng: chính xác +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-011-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-011-P4-B2 Lan tỏa: {"field":"target.radius_m","multiplier":1.1,"max":5}.
- Khắc chế: leave radius or defeat source. Nguồn: thiết kế game-original, tham chiếu NIN-011-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-011-P5 — Nha thông nha — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: hệ số sát thương +6%; loại skill_effect_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-011-S5.
- Tu luyện RES-118, RES-130; 20 cấp/giai; NIN-011-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-011-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-011-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-011-P6 — Kiba Inuzuka — phản công áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: giáp −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Gây sát thương trực tiếp; hồi riêng 12s; duy trì 5s; owner primary direct S0-S7 positive damage to living hostile primary; no summoned/child, reflected, DOT or combo event; first eligible target per parent cast.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-011-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-011-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-011-S1, REVIEWED_ADAPTER_REQUIRED.

## NIN-012 — Shino Aburame (thiếu niên)

### NIN-012-P1 — Điều khiển ký hoại trùng · Shino Aburame
- Mở khóa cảnh giới 0, Bản thân.
- Hiệu ứng: kháng hút chakra +7%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 7.77% / 8.62% / 9.32%; 15 sao: 8.19% / 9.04% / 9.74%.
- Kích hoạt: Khi tính chỉ số chiến đấu; owner alive in battle; not persistent training stat.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: dispel immune intrinsic; no death persistence; stat caps. Nguồn: thiết kế game-original, tham chiếu NIN-012-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-012-P2 — Ký hoại trùng — dư thế
- Mở khóa cảnh giới 1, Bản thân.
- Hiệu ứng: thời gian khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Thay đổi tài nguyên thực tế; hồi riêng 8s; duy trì 4s; confirmed meaningful parent event; no child passive/combo/summon credit.
- Tham chiếu: NIN-012-S1.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-012-P2-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-012-P2-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: avoid/intercept signature, cleanse temporary buff if allowed. Nguồn: thiết kế game-original, tham chiếu NIN-012-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-012-P3 — Shino Aburame — ứng biến nguy cấp
- Mở khóa cảnh giới 2, Bản thân.
- Hiệu ứng: kháng khống chế +10%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 11.1% / 12.32% / 13.32%; 15 sao: 11.7% / 12.92% / 13.92%.
- Kích hoạt: HP giảm qua ngưỡng 30%, tái kích hoạt trên 40%; hồi riêng 24s; duy trì 6s; downward crossing caused by actual hostile damage, alive.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-119, RES-130; 20 cấp/giai; tuyến tính.
- Khắc chế: burst beyond threshold; dispellable temporary effect; no revive. Nguồn: thiết kế game-original, tham chiếu NIN-012-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-012-P4 — Shino Aburame — hiệp lực huyết hệ
- Mở khóa cảnh giới 3, Đồng đội cùng huyết hệ (aburame).
- Hiệu ứng: kháng khống chế +6%; loại stat_relative_bonus. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Hào quang liên tục; living deployed owner; recipient living same side primary; current world distance for radius.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-012-P4-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-012-P4-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: defeat source; no permanent aura after death. Nguồn: thiết kế game-original, tham chiếu NIN-012-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-012-P5 — Trùng thực chakra — bí truyền
- Mở khóa cảnh giới 4, Bản thân.
- Hiệu ứng: giảm chi phí chakra +4%; loại skill_cp_discount. Giai 1/3/10 cấp 20, 1 sao: 4.44% / 4.93% / 5.33%; 15 sao: 4.68% / 5.17% / 5.57%.
- Kích hoạt: Trước khi tính hiệu ứng kỹ năng; exact authored skill ID; no change to unlock or targeting.
- Tham chiếu: NIN-012-S5.
- Tu luyện RES-119, RES-130; 20 cấp/giai; NIN-012-P5-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-012-P5-B2 Bền vững: {"field":"effect.magnitude","multiplier":1,"secondary_effect":{"type":"stat_relative_bonus","key":"armor","base":0.015,"unit":"fraction","group":"PASSIVE:armor"},"scope":"self only; same activation/condition as primary; not teamwide"}.
- Khắc chế: avoid skill; ordinary authored counters. Nguồn: thiết kế game-original, tham chiếu NIN-012-S1, REVIEWED_ADAPTER_REQUIRED.

### NIN-012-P6 — Shino Aburame — phản công áp chế
- Mở khóa cảnh giới 6, Một địch trúng đòn.
- Hiệu ứng: kháng khống chế −6%; loại stat_relative_penalty. Giai 1/3/10 cấp 20, 1 sao: 6.66% / 7.39% / 7.99%; 15 sao: 7.02% / 7.75% / 8.35%.
- Kích hoạt: Gây sát thương trực tiếp; hồi riêng 12s; duy trì 5s; owner primary direct S0-S7 positive damage to living hostile primary; no summoned/child, reflected, DOT or combo event; first eligible target per parent cast.
- Tham chiếu: không giới hạn skill cụ thể.
- Tu luyện RES-121, RES-130; 20 cấp/giai; NIN-012-P6-B1 Tinh thông: {"field":"effect.magnitude","multiplier":1.05} | NIN-012-P6-B2 Linh hoạt: {"field":"internal_cooldown_s","multiplier":0.9,"min":4}.
- Khắc chế: dispel, avoid signature, immunity; no permanent debuff. Nguồn: thiết kế game-original, tham chiếu NIN-012-S1, REVIEWED_ADAPTER_REQUIRED.