# Nội tại P2 — pilot 12 ninja

DEV: thiết kế game nguyên bản, không phải canon. Giữ P1, chỉ áp dụng overlay khi Chat01 có adapter và kiểm thử. 20 cấp/giai; sao 1/5/10/15 thêm 0/2/4/6% của base; G3 B1/B2, cap/pity theo P1.

## NIN-001 — Naruto Uzumaki (thiếu niên)

Phân thân tạo cửa sổ cận chiến; không kích nội tại từ phân thân. Khắc chế: Chặn đường lao, loại phân thân.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-001-P1 | Sức sống phân thân | derived_stats | self | hp 8.00% | 0 | —/— s |
| NIN-001-P2 | Thế công phân thân | summon_spawned NIN-001-S1 | self | patk 6.00% | 1 | 8/4 s |
| NIN-001-P3 | Bất khuất Cửu Vĩ | hp_threshold_crossed | self | damage_reduction 8.00% | 2 | 24/6 s |
| NIN-001-P4 | Ý chí xung phong | continuous_aura | team | patk 4.50% | 3 | —/— s |
| NIN-001-P5 | Rasengan phối hợp | while_form_active NIN-001-S6, NIN-001-S7 | self | form_empowered 5.00% | 4 | —/— s |
| NIN-001-P6 | Nhịp phối hợp Đội 7 | before_combo_payload | combo | combo 4.00% | 6 | —/— s |

## NIN-002 — Sasuke Uchiha (thiếu niên)

Hỏa cầu mở nhịp chính xác cho Chidori, không đảm bảo né tuyệt đối. Khắc chế: Giãn đội hình, cắt đường lao, đợi ấn chú hết.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-002-P1 | Nhãn lực Uchiha | derived_stats | self | accuracy 8.00% | 0 | —/— s |
| NIN-002-P2 | Hỏa cầu mở thế | critical_hit_confirmed NIN-002-S1 | self | accuracy 7.00% | 1 | 10/4 s |
| NIN-002-P3 | Bộ pháp thoát hiểm | hp_threshold_crossed | self | move_speed 10.00% | 2 | 24/6 s |
| NIN-002-P4 | Quan sát đồng tộc | continuous_aura | family | accuracy 5.50% | 3 | —/— s |
| NIN-002-P5 | Lôi kích ấn chú | while_form_active NIN-002-S5, NIN-002-S6 | self | form_empowered 5.00% | 4 | —/— s |
| NIN-002-P6 | Đối ứng Đội 7 | before_combo_payload | combo | combo 4.00% | 6 | —/— s |

## NIN-003 — Sakura Haruno (thiếu niên)

Thiếu niên thiên giải ảo và bảo hộ, không vay sức mạnh Bách Hào. Khắc chế: Ép dùng giải ảo trước, gây áp lực nhiều mục tiêu.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-003-P1 | Điều hòa chakra sơ cấp | derived_stats | self | healing 8.00% | 0 | —/— s |
| NIN-003-P2 | Giải ảo chuẩn xác | cleanse_effective NIN-003-S1 | self | chakra_regen 6.50% | 1 | 8/4 s |
| NIN-003-P3 | Duy trì chakra | chakra_threshold_crossed | self | chakra_regen 10.00% | 2 | 24/6 s |
| NIN-003-P4 | Tuyến sơ cứu Đội 7 | continuous_aura | team | healing_received 5.50% | 3 | —/— s |
| NIN-003-P5 | Tiết chế viện trợ | before_skill_effect NIN-003-S5 | self | chakra_cost 4.00% | 4 | —/— s |
| NIN-003-P6 | Sơ cứu tiếp sức | heal_confirmed NIN-003-S2 | team | healing_received 4.00% | 6 | 18/5 s |

## NIN-004 — Kakashi Hatake

Phòng tuyến tạo cơ hội Lôi kích; chỉ tính khi tường thật sự chặn. Khắc chế: Đánh vòng tường, ép chakra, né đường Lôi.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-004-P1 | Quan sát sao chép | derived_stats | self | accuracy 7.00% | 0 | —/— s |
| NIN-004-P2 | Phản ứng sau Thổ Lưu Bích | wall_blocked NIN-004-S1 | self | accuracy 7.00% | 1 | 8/4 s |
| NIN-004-P3 | Thoát góc nguy hiểm | hp_threshold_crossed | self | move_speed 10.00% | 2 | 24/6 s |
| NIN-004-P4 | Quan sát chiến thuật | continuous_aura | radius | accuracy 5.50% | 3 | —/— s |
| NIN-004-P5 | Raikiri cường hóa | while_form_active NIN-004-S5, NIN-004-S6 | self | form_empowered 5.00% | 4 | —/— s |
| NIN-004-P6 | Phối hợp chiến thuật | before_combo_payload | combo | combo 4.00% | 6 | —/— s |

## NIN-005 — Iruka Umino

Bẫy và lá chắn hỗ trợ, không biến Iruka thành sát thủ. Khắc chế: Đánh ngoài bẫy, ép thay đổi vị trí và phá lá chắn.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-005-P1 | Kỷ luật học viện | derived_stats | self | chakra_max 7.00% | 0 | —/— s |
| NIN-005-P2 | Bẫy mở nhịp phòng hộ | status_applied NIN-005-S1 | self | armor 6.50% | 1 | 8/4 s |
| NIN-005-P3 | Tiết kiệm chakra | chakra_threshold_crossed | self | chakra_regen 10.00% | 2 | 24/6 s |
| NIN-005-P4 | Bảo hộ học viên | continuous_aura | team | chakra_regen 5.00% | 3 | —/— s |
| NIN-005-P5 | Tiết chế hiệu lệnh | before_skill_effect NIN-005-S5 | self | chakra_cost 4.00% | 4 | —/— s |
| NIN-005-P6 | Hiệu lệnh tiếp viện | stance_effect_confirmed NIN-005-S5 | team | chakra_regen 4.00% | 6 | 18/5 s |

## NIN-006 — Konohamaru (thiếu niên)

Phân thân hỗ trợ tiếp cận; giữ cổng thời kỳ Rasengan tập sự. Khắc chế: Xử lý phân thân, né liên kích; giữ source HOLD.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-006-P1 | Thể lực tập sự | derived_stats | self | hp 7.00% | 0 | —/— s |
| NIN-006-P2 | Phân thân mở đường | summon_spawned NIN-006-S1 | self | move_speed 6.00% | 1 | 8/4 s |
| NIN-006-P3 | Kiên trì học việc | hp_threshold_crossed | self | damage_reduction 8.00% | 2 | 24/6 s |
| NIN-006-P4 | Nhịp xung phong tập sự | continuous_aura | team | patk 3.50% | 3 | —/— s |
| NIN-006-P5 | Liên kích phân thân | before_skill_effect NIN-006-S5 | self | damage 6.00% | 4 | —/— s |
| NIN-006-P6 | Khích lệ chiến thắng | kill_confirmed | team | patk 4.00% | 6 | 18/5 s |

## NIN-007 — Shikamaru Nara (thiếu niên)

Khống chế có vị trí và kháng, không khóa dây chuyền vô hạn. Khắc chế: Giãn vị trí, thanh tẩy, kháng khống chế.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-007-P1 | Tư duy thế trận | derived_stats | self | control_resist 7.00% | 0 | —/— s |
| NIN-007-P2 | Bắt bóng đúng lúc | status_applied NIN-007-S1 | self | control_duration 7.00% | 1 | 8/4 s |
| NIN-007-P3 | Giữ bình tĩnh | hp_threshold_crossed | self | control_resist 10.00% | 2 | 24/6 s |
| NIN-007-P4 | Phạm vi chỉ huy | continuous_aura | radius | control_resist 6.00% | 3 | —/— s |
| NIN-007-P5 | Duy trì Ảnh trói | before_skill_effect NIN-007-S5 | self | control_duration 5.00% | 4 | —/— s |
| NIN-007-P6 | Phá nhịp đối phương | status_applied NIN-007-S1 | enemy_team | control_resist 2.50% | 6 | 18/4 s |

## NIN-008 — Choji Akimichi (thiếu niên)

Chuyển hình thái rồi lao; nội tại không tự kích hình thái. Khắc chế: Né đường lao, kéo giãn khỏi đồng đội, đợi hình thái hết.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-008-P1 | Thể chất Akimichi | derived_stats | self | hp 8.00% | 0 | —/— s |
| NIN-008-P2 | Bội hóa vững thân | form_activated NIN-008-S1 | self | armor 7.50% | 1 | 8/4 s |
| NIN-008-P3 | Chống chịu tuyến đầu | hp_threshold_crossed | self | damage_reduction 8.00% | 2 | 24/6 s |
| NIN-008-P4 | Che chắn cự ly gần | continuous_aura | radius | damage_reduction 3.50% | 3 | —/— s |
| NIN-008-P5 | Nhục đạn cường hóa | while_form_active NIN-008-S6 | self | form_empowered 5.00% | 4 | —/— s |
| NIN-008-P6 | Chia sẻ sức ép | damage_taken_confirmed | team | damage_reduction 4.00% | 6 | 18/5 s |

## NIN-009 — Ino Yamanaka (thiếu niên)

Khống chế tinh thần, cảm ứng và tiếp chakra; không chiếm quyền vĩnh viễn. Khắc chế: Kháng ảo, thanh tẩy, gây gián đoạn.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-009-P1 | Tâm trí vững vàng | derived_stats | self | genjutsu_resist 7.00% | 0 | —/— s |
| NIN-009-P2 | Tâm chuyển thân hiệu quả | status_applied NIN-009-S1 | self | control_duration 6.00% | 1 | 8/4 s |
| NIN-009-P3 | Tập trung dưới áp lực | hp_threshold_crossed | self | control_resist 10.00% | 2 | 24/6 s |
| NIN-009-P4 | Liên lạc tinh thần | continuous_aura | radius | genjutsu_resist 6.00% | 3 | —/— s |
| NIN-009-P5 | Duy trì nhiễu tâm | before_skill_effect NIN-009-S5 | self | control_duration 5.00% | 4 | —/— s |
| NIN-009-P6 | Rối loạn đội hình địch | status_applied NIN-009-S1 | enemy_team | control_resist 2.50% | 6 | 18/4 s |

## NIN-010 — Hinata Hyuga (thiếu niên)

Áp lực chakra từ Nhu quyền; giữ cự ly gần, không sát thương miễn phí. Khắc chế: Giữ khoảng cách, kháng hút chakra, chặn tiếp cận.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-010-P1 | Quan sát Bạch nhãn | derived_stats | self | accuracy 7.00% | 0 | —/— s |
| NIN-010-P2 | Nhu quyền chuẩn xác | stance_effect_confirmed NIN-010-S1 | self | accuracy 6.50% | 1 | 8/4 s |
| NIN-010-P3 | Phòng thủ mềm | hp_threshold_crossed | self | damage_reduction 8.00% | 2 | 24/6 s |
| NIN-010-P4 | Hỗ trợ điểm huyệt | continuous_aura | team | accuracy 4.50% | 3 | —/— s |
| NIN-010-P5 | Liên chưởng chính xác | before_skill_effect NIN-010-S5 | self | damage 6.00% | 4 | —/— s |
| NIN-010-P6 | Tiếp sức tuyến gần | kill_confirmed | team | patk 4.00% | 6 | 18/5 s |

## NIN-011 — Kiba Inuzuka (thiếu niên)

Định vị và lao nhanh; Akamaru không phải chủ thể kích nội tại mới. Khắc chế: Đổi hướng, chặn đường lao, bảo vệ mục tiêu.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-011-P1 | Khứu giác truy kích | derived_stats | self | move_speed 6.00% | 0 | —/— s |
| NIN-011-P2 | Tứ cước tăng tốc | stance_effect_confirmed NIN-011-S1 | self | move_speed 7.50% | 1 | 8/4 s |
| NIN-011-P3 | Thoát hiểm thú hóa | hp_threshold_crossed | self | move_speed 10.00% | 2 | 24/6 s |
| NIN-011-P4 | Chỉ điểm mục tiêu | continuous_aura | radius | accuracy 5.00% | 3 | —/— s |
| NIN-011-P5 | Nha thông nha | before_skill_effect NIN-011-S5 | self | damage 6.00% | 4 | —/— s |
| NIN-011-P6 | Vết thương truy đuổi | hostile_damage_confirmed | hit_primary_enemy | armor 6.00% | 6 | 12/5 s |

## NIN-012 — Shino Aburame (thiếu niên)

Hút chakra và vùng trùng; không tính mỗi tick là proc. Khắc chế: Rời vùng, chống hút chakra, cắt nguồn.

| ID | Nội tại | Sự kiện | Đối tượng | Chỉ số gốc | Cảnh | ICD / duy trì |
|---|---|---|---|---|---:|---|
| NIN-012-P1 | Cộng sinh ký hoại trùng | derived_stats | self | chakra_drain_resist 7.00% | 0 | —/— s |
| NIN-012-P2 | Trùng hút chakra | resource_effect_confirmed NIN-012-S1 | self | chakra_regen 7.00% | 1 | 8/4 s |
| NIN-012-P3 | Duy trì hệ trùng | hp_threshold_crossed | self | control_resist 10.00% | 2 | 24/6 s |
| NIN-012-P4 | Phòng hộ đồng tộc | continuous_aura | family | chakra_drain_resist 6.00% | 3 | —/— s |
| NIN-012-P5 | Tiết chế trùng thực chakra | before_skill_effect NIN-012-S5 | self | chakra_cost 4.00% | 4 | —/— s |
| NIN-012-P6 | Nhiễu phòng tuyến | hostile_damage_confirmed | hit_primary_enemy | control_resist 6.00% | 6 | 12/5 s |

