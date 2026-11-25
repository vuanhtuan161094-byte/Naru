# Nhẫn giới, nhiệm vụ và thử thách

[Mục lục](README.md) · Nguồn thiết kế BALANCE-P1; mọi số liệu mới là DEV, chưa phải thông số runtime được nghiệm thu.

60 lãnh thổ, 71 đường, 9 phe theo D4. Chu kỳ chiến tranh P1 đề xuất 6h toàn thế giới, 12h mỗi phe, ngân sách hữu hạn; không coi số đếm chiến tranh là kết quả đã cân bằng. Khai thác cần sở hữu, bảo vệ và sức chứa. Làng nhà không bị chuyển chủ; raid có bảo hộ 12h, không xóa ninja/cấp nhà.

## Lãnh thổ

| ID | Tên | Loại | Thông tin |
| --- | --- | --- | --- |
| TER-001 | Làng Lá | village | {"owner_id":"FAC-001","resources":[{"resource_id":"RES-006","yield_per_tick":8},{"resource_id":"RES-021","yield_per_tick":6},{"resource_id":"RES-036","yield_per_tick":4}]} |
| TER-002 | Rừng Tử Thần | forest | {"owner_id":"FAC-001","resources":[{"resource_id":"RES-007","yield_per_tick":8},{"resource_id":"RES-040","yield_per_tick":6},{"resource_id":"RES-047","yield_per_tick":4}]} |
| TER-003 | Sân luyện Đội 7 | training | {"owner_id":"FAC-001","resources":[{"resource_id":"RES-116","yield_per_tick":8},{"resource_id":"RES-118","yield_per_tick":6},{"resource_id":"RES-121","yield_per_tick":4}]} |
| TER-004 | Thung lũng Tận Cùng | valley | {"owner_id":null,"resources":[{"resource_id":"RES-009","yield_per_tick":8},{"resource_id":"RES-076","yield_per_tick":6},{"resource_id":"RES-079","yield_per_tick":4}]} |
| TER-005 | Đường biên phía đông | road | {"owner_id":null,"resources":[{"resource_id":"RES-008","yield_per_tick":8},{"resource_id":"RES-019","yield_per_tick":6},{"resource_id":"RES-024","yield_per_tick":4}]} |
| TER-006 | Mỏ núi lửa | mine | {"owner_id":"FAC-001","resources":[{"resource_id":"RES-011","yield_per_tick":8},{"resource_id":"RES-015","yield_per_tick":6},{"resource_id":"RES-020","yield_per_tick":4}]} |
| TER-007 | Nông trại ngoại thành | farm | {"owner_id":"FAC-001","resources":[{"resource_id":"RES-021","yield_per_tick":8},{"resource_id":"RES-024","yield_per_tick":6},{"resource_id":"RES-030","yield_per_tick":4}]} |
| TER-008 | Trạm giao thương | market | {"owner_id":"FAC-001","resources":[{"resource_id":"RES-006","yield_per_tick":8},{"resource_id":"RES-068","yield_per_tick":6},{"resource_id":"RES-073","yield_per_tick":4}]} |
| TER-009 | Núi rừng phía bắc | forest | {"owner_id":null,"resources":[{"resource_id":"RES-007","yield_per_tick":8},{"resource_id":"RES-048","yield_per_tick":6},{"resource_id":"RES-054","yield_per_tick":4}]} |
| TER-010 | Làng Cát | village | {"owner_id":"FAC-002","resources":[{"resource_id":"RES-016","yield_per_tick":8},{"resource_id":"RES-046","yield_per_tick":6},{"resource_id":"RES-079","yield_per_tick":4}]} |
| TER-011 | Sa mạc cửa ngõ | desert | {"owner_id":"FAC-002","resources":[{"resource_id":"RES-016","yield_per_tick":8},{"resource_id":"RES-018","yield_per_tick":6},{"resource_id":"RES-046","yield_per_tick":4}]} |
| TER-012 | Hẻm đá đỏ | mine | {"owner_id":null,"resources":[{"resource_id":"RES-010","yield_per_tick":8},{"resource_id":"RES-011","yield_per_tick":6},{"resource_id":"RES-012","yield_per_tick":4}]} |
| TER-013 | Ốc đảo phía nam | farm | {"owner_id":"FAC-002","resources":[{"resource_id":"RES-019","yield_per_tick":8},{"resource_id":"RES-025","yield_per_tick":6},{"resource_id":"RES-046","yield_per_tick":4}]} |
| TER-014 | Bãi thử con rối | training | {"owner_id":"FAC-002","resources":[{"resource_id":"RES-072","yield_per_tick":8},{"resource_id":"RES-105","yield_per_tick":6},{"resource_id":"RES-110","yield_per_tick":4}]} |
| TER-015 | Mỏ tinh thể gió | mine | {"owner_id":null,"resources":[{"resource_id":"RES-076","yield_per_tick":8},{"resource_id":"RES-079","yield_per_tick":6},{"resource_id":"RES-089","yield_per_tick":4}]} |
| TER-016 | Tuyến thương nhân | road | {"owner_id":"FAC-002","resources":[{"resource_id":"RES-016","yield_per_tick":8},{"resource_id":"RES-067","yield_per_tick":6},{"resource_id":"RES-073","yield_per_tick":4}]} |
| TER-017 | Làng Sương Mù | village | {"owner_id":"FAC-003","resources":[{"resource_id":"RES-029","yield_per_tick":8},{"resource_id":"RES-019","yield_per_tick":6},{"resource_id":"RES-078","yield_per_tick":4}]} |
| TER-018 | Bờ biển sương mù | coast | {"owner_id":"FAC-003","resources":[{"resource_id":"RES-029","yield_per_tick":8},{"resource_id":"RES-018","yield_per_tick":6},{"resource_id":"RES-078","yield_per_tick":4}]} |
| TER-019 | Đảo sương phía bắc | island | {"owner_id":null,"resources":[{"resource_id":"RES-045","yield_per_tick":8},{"resource_id":"RES-053","yield_per_tick":6},{"resource_id":"RES-078","yield_per_tick":4}]} |
| TER-020 | Vịnh kiếm sĩ | training | {"owner_id":"FAC-003","resources":[{"resource_id":"RES-011","yield_per_tick":8},{"resource_id":"RES-103","yield_per_tick":6},{"resource_id":"RES-104","yield_per_tick":4}]} |
| TER-021 | Làng chài ngoại vi | farm | {"owner_id":"FAC-003","resources":[{"resource_id":"RES-029","yield_per_tick":8},{"resource_id":"RES-018","yield_per_tick":6},{"resource_id":"RES-019","yield_per_tick":4}]} |
| TER-022 | Hải lộ phía nam | road | {"owner_id":null,"resources":[{"resource_id":"RES-029","yield_per_tick":8},{"resource_id":"RES-067","yield_per_tick":6},{"resource_id":"RES-073","yield_per_tick":4}]} |
| TER-023 | Làng Mây | village | {"owner_id":"FAC-004","resources":[{"resource_id":"RES-010","yield_per_tick":8},{"resource_id":"RES-080","yield_per_tick":6},{"resource_id":"RES-013","yield_per_tick":4}]} |
| TER-024 | Hẻm núi sấm | mountain | {"owner_id":"FAC-004","resources":[{"resource_id":"RES-010","yield_per_tick":8},{"resource_id":"RES-011","yield_per_tick":6},{"resource_id":"RES-080","yield_per_tick":4}]} |
| TER-025 | Đảo Rùa | island | {"owner_id":"FAC-004","resources":[{"resource_id":"RES-076","yield_per_tick":8},{"resource_id":"RES-121","yield_per_tick":6},{"resource_id":"RES-147","yield_per_tick":4}]} |
| TER-026 | Mỏ tinh thể lôi | mine | {"owner_id":null,"resources":[{"resource_id":"RES-012","yield_per_tick":8},{"resource_id":"RES-080","yield_per_tick":6},{"resource_id":"RES-089","yield_per_tick":4}]} |
| TER-027 | Thung lũng mây | farm | {"owner_id":"FAC-004","resources":[{"resource_id":"RES-025","yield_per_tick":8},{"resource_id":"RES-028","yield_per_tick":6},{"resource_id":"RES-044","yield_per_tick":4}]} |
| TER-028 | Trạm gác núi cao | fort | {"owner_id":"FAC-004","resources":[{"resource_id":"RES-009","yield_per_tick":8},{"resource_id":"RES-010","yield_per_tick":6},{"resource_id":"RES-105","yield_per_tick":4}]} |
| TER-029 | Làng Đá | village | {"owner_id":"FAC-005","resources":[{"resource_id":"RES-009","yield_per_tick":8},{"resource_id":"RES-010","yield_per_tick":6},{"resource_id":"RES-081","yield_per_tick":4}]} |
| TER-030 | Cao nguyên đá | mountain | {"owner_id":"FAC-005","resources":[{"resource_id":"RES-010","yield_per_tick":8},{"resource_id":"RES-017","yield_per_tick":6},{"resource_id":"RES-054","yield_per_tick":4}]} |
| TER-031 | Mỏ sắt phía tây | mine | {"owner_id":"FAC-005","resources":[{"resource_id":"RES-011","yield_per_tick":8},{"resource_id":"RES-015","yield_per_tick":6},{"resource_id":"RES-013","yield_per_tick":4}]} |
| TER-032 | Hẻm núi sâu | mine | {"owner_id":null,"resources":[{"resource_id":"RES-009","yield_per_tick":8},{"resource_id":"RES-014","yield_per_tick":6},{"resource_id":"RES-081","yield_per_tick":4}]} |
| TER-033 | Lò luyện khoáng | market | {"owner_id":"FAC-005","resources":[{"resource_id":"RES-011","yield_per_tick":8},{"resource_id":"RES-012","yield_per_tick":6},{"resource_id":"RES-015","yield_per_tick":4}]} |
| TER-034 | Đường núi biên giới | road | {"owner_id":null,"resources":[{"resource_id":"RES-009","yield_per_tick":8},{"resource_id":"RES-018","yield_per_tick":6},{"resource_id":"RES-054","yield_per_tick":4}]} |
| TER-035 | Làng Mưa | village | {"owner_id":"FAC-006","resources":[{"resource_id":"RES-019","yield_per_tick":8},{"resource_id":"RES-078","yield_per_tick":6},{"resource_id":"RES-053","yield_per_tick":4}]} |
| TER-036 | Kênh đào phía đông | coast | {"owner_id":"FAC-006","resources":[{"resource_id":"RES-019","yield_per_tick":8},{"resource_id":"RES-029","yield_per_tick":6},{"resource_id":"RES-078","yield_per_tick":4}]} |
| TER-037 | Tháp mưa cũ | ruin | {"owner_id":null,"resources":[{"resource_id":"RES-082","yield_per_tick":8},{"resource_id":"RES-096","yield_per_tick":6},{"resource_id":"RES-136","yield_per_tick":4}]} |
| TER-038 | Đường giao thương | road | {"owner_id":"FAC-006","resources":[{"resource_id":"RES-019","yield_per_tick":8},{"resource_id":"RES-068","yield_per_tick":6},{"resource_id":"RES-069","yield_per_tick":4}]} |
| TER-039 | Làng Âm Thanh | village | {"owner_id":"FAC-007","resources":[{"resource_id":"RES-040","yield_per_tick":8},{"resource_id":"RES-042","yield_per_tick":6},{"resource_id":"RES-110","yield_per_tick":4}]} |
| TER-040 | Phòng nghiên cứu ngầm | lab | {"owner_id":"FAC-007","resources":[{"resource_id":"RES-040","yield_per_tick":8},{"resource_id":"RES-050","yield_per_tick":6},{"resource_id":"RES-144","yield_per_tick":4}]} |
| TER-041 | Hang rắn | cave | {"owner_id":null,"resources":[{"resource_id":"RES-040","yield_per_tick":8},{"resource_id":"RES-047","yield_per_tick":6},{"resource_id":"RES-148","yield_per_tick":4}]} |
| TER-042 | Rừng biên giới | forest | {"owner_id":null,"resources":[{"resource_id":"RES-007","yield_per_tick":8},{"resource_id":"RES-049","yield_per_tick":6},{"resource_id":"RES-052","yield_per_tick":4}]} |
| TER-043 | Thành samurai | fort | {"owner_id":null,"resources":[{"resource_id":"RES-011","yield_per_tick":8},{"resource_id":"RES-059","yield_per_tick":6},{"resource_id":"RES-103","yield_per_tick":4}]} |
| TER-044 | Đèo tuyết | mountain | {"owner_id":null,"resources":[{"resource_id":"RES-045","yield_per_tick":8},{"resource_id":"RES-054","yield_per_tick":6},{"resource_id":"RES-009","yield_per_tick":4}]} |
| TER-045 | Cầu Đại Naruto | road | {"owner_id":null,"resources":[{"resource_id":"RES-006","yield_per_tick":8},{"resource_id":"RES-019","yield_per_tick":6},{"resource_id":"RES-029","yield_per_tick":4}]} |
| TER-046 | Bến sông | coast | {"owner_id":null,"resources":[{"resource_id":"RES-029","yield_per_tick":8},{"resource_id":"RES-019","yield_per_tick":6},{"resource_id":"RES-008","yield_per_tick":4}]} |
| TER-047 | Cầu Thiên Địa | road | {"owner_id":null,"resources":[{"resource_id":"RES-008","yield_per_tick":8},{"resource_id":"RES-019","yield_per_tick":6},{"resource_id":"RES-076","yield_per_tick":4}]} |
| TER-048 | Đồng cỏ biên giới | farm | {"owner_id":null,"resources":[{"resource_id":"RES-021","yield_per_tick":8},{"resource_id":"RES-023","yield_per_tick":6},{"resource_id":"RES-036","yield_per_tick":4}]} |
| TER-049 | Hang Akatsuki | cave | {"owner_id":"FAC-008","resources":[{"resource_id":"RES-076","yield_per_tick":8},{"resource_id":"RES-126","yield_per_tick":6},{"resource_id":"RES-146","yield_per_tick":4}]} |
| TER-050 | Căn cứ Akatsuki | fort | {"owner_id":"FAC-008","resources":[{"resource_id":"RES-082","yield_per_tick":8},{"resource_id":"RES-095","yield_per_tick":6},{"resource_id":"RES-136","yield_per_tick":4}]} |
| TER-051 | Di tích cổ | ruin | {"owner_id":null,"resources":[{"resource_id":"RES-095","yield_per_tick":8},{"resource_id":"RES-137","yield_per_tick":6},{"resource_id":"RES-139","yield_per_tick":4}]} |
| TER-052 | Chiến trường Đại chiến | valley | {"owner_id":null,"resources":[{"resource_id":"RES-076","yield_per_tick":8},{"resource_id":"RES-128","yield_per_tick":6},{"resource_id":"RES-130","yield_per_tick":4}]} |
| TER-053 | Núi Myoboku | training | {"owner_id":null,"resources":[{"resource_id":"RES-147","yield_per_tick":8},{"resource_id":"RES-148","yield_per_tick":6},{"resource_id":"RES-047","yield_per_tick":4}]} |
| TER-054 | Hang Ryuchi | cave | {"owner_id":null,"resources":[{"resource_id":"RES-147","yield_per_tick":8},{"resource_id":"RES-148","yield_per_tick":6},{"resource_id":"RES-040","yield_per_tick":4}]} |
| TER-055 | Rừng Shikkotsu | forest | {"owner_id":null,"resources":[{"resource_id":"RES-147","yield_per_tick":8},{"resource_id":"RES-148","yield_per_tick":6},{"resource_id":"RES-055","yield_per_tick":4}]} |
| TER-056 | Phòng nghiên cứu Kara | lab | {"owner_id":null,"resources":[{"resource_id":"RES-144","yield_per_tick":8},{"resource_id":"RES-149","yield_per_tick":6},{"resource_id":"RES-150","yield_per_tick":4}]} |
| TER-057 | Khu phong ấn cổ | ruin | {"owner_id":null,"resources":[{"resource_id":"RES-095","yield_per_tick":8},{"resource_id":"RES-100","yield_per_tick":6},{"resource_id":"RES-145","yield_per_tick":4}]} |
| TER-058 | Làng người chơi | village | {"owner_id":"FAC-009","resources":[{"resource_id":"RES-006","yield_per_tick":8},{"resource_id":"RES-009","yield_per_tick":6},{"resource_id":"RES-021","yield_per_tick":4}]} |
| TER-059 | Rừng cạnh làng | forest | {"owner_id":"FAC-009","resources":[{"resource_id":"RES-006","yield_per_tick":8},{"resource_id":"RES-007","yield_per_tick":6},{"resource_id":"RES-036","yield_per_tick":4}]} |
| TER-060 | Mỏ cạnh làng | mine | {"owner_id":"FAC-009","resources":[{"resource_id":"RES-009","yield_per_tick":8},{"resource_id":"RES-011","yield_per_tick":6},{"resource_id":"RES-015","yield_per_tick":4}]} |

## Nhiệm vụ

| ID | Tên | Điều kiện / thưởng |
| --- | --- | --- |
| QST-001 | Hoàn thành Học viện và Đội 7 | {"objective":{"kind":"clear_chapter","target":"CH-001","count":1},"reward":[{"resource_id":"RES-001","qty":500},{"resource_id":"RES-002","qty":15}]} |
| QST-002 | Hoàn thành Hành trình Ba Quốc | {"objective":{"kind":"clear_chapter","target":"CH-002","count":1},"reward":[{"resource_id":"RES-001","qty":700},{"resource_id":"RES-002","qty":15}]} |
| QST-003 | Hoàn thành Kỳ thi Trung nhẫn | {"objective":{"kind":"clear_chapter","target":"CH-003","count":1},"reward":[{"resource_id":"RES-001","qty":900},{"resource_id":"RES-002","qty":15}]} |
| QST-004 | Hoàn thành Konoha bị tấn công | {"objective":{"kind":"clear_chapter","target":"CH-004","count":1},"reward":[{"resource_id":"RES-001","qty":1100},{"resource_id":"RES-002","qty":15}]} |
| QST-005 | Hoàn thành Tìm Tsunade | {"objective":{"kind":"clear_chapter","target":"CH-005","count":1},"reward":[{"resource_id":"RES-001","qty":1300},{"resource_id":"RES-002","qty":15}]} |
| QST-006 | Hoàn thành Truy tìm Sasuke | {"objective":{"kind":"clear_chapter","target":"CH-006","count":1},"reward":[{"resource_id":"RES-001","qty":1500},{"resource_id":"RES-002","qty":15}]} |
| QST-007 | Hoàn thành Giải cứu Kazekage | {"objective":{"kind":"clear_chapter","target":"CH-007","count":1},"reward":[{"resource_id":"RES-001","qty":1700},{"resource_id":"RES-002","qty":15}]} |
| QST-008 | Hoàn thành Cầu Thiên Địa | {"objective":{"kind":"clear_chapter","target":"CH-008","count":1},"reward":[{"resource_id":"RES-001","qty":1900},{"resource_id":"RES-002","qty":15}]} |
| QST-009 | Hoàn thành Akatsuki bất tử | {"objective":{"kind":"clear_chapter","target":"CH-009","count":1},"reward":[{"resource_id":"RES-001","qty":2100},{"resource_id":"RES-002","qty":15}]} |
| QST-010 | Hoàn thành Truy tìm Itachi | {"objective":{"kind":"clear_chapter","target":"CH-010","count":1},"reward":[{"resource_id":"RES-001","qty":2300},{"resource_id":"RES-002","qty":15}]} |
| QST-011 | Hoàn thành Pain tấn công Làng Lá | {"objective":{"kind":"clear_chapter","target":"CH-011","count":1},"reward":[{"resource_id":"RES-001","qty":2500},{"resource_id":"RES-002","qty":15}]} |
| QST-012 | Hoàn thành Hội nghị Ngũ Kage | {"objective":{"kind":"clear_chapter","target":"CH-012","count":1},"reward":[{"resource_id":"RES-001","qty":2700},{"resource_id":"RES-002","qty":15}]} |
| QST-013 | Hoàn thành Tu luyện Vĩ Thú | {"objective":{"kind":"clear_chapter","target":"CH-013","count":1},"reward":[{"resource_id":"RES-001","qty":2900},{"resource_id":"RES-002","qty":15}]} |
| QST-014 | Hoàn thành Đại chiến mở màn | {"objective":{"kind":"clear_chapter","target":"CH-014","count":1},"reward":[{"resource_id":"RES-001","qty":3100},{"resource_id":"RES-002","qty":15}]} |
| QST-015 | Hoàn thành Đối đầu Obito | {"objective":{"kind":"clear_chapter","target":"CH-015","count":1},"reward":[{"resource_id":"RES-001","qty":3300},{"resource_id":"RES-002","qty":15}]} |
| QST-016 | Hoàn thành Lục Đạo và Kaguya | {"objective":{"kind":"clear_chapter","target":"CH-016","count":1},"reward":[{"resource_id":"RES-001","qty":3500},{"resource_id":"RES-002","qty":15}]} |
| QST-017 | Hoàn thành Trận cuối | {"objective":{"kind":"clear_chapter","target":"CH-017","count":1},"reward":[{"resource_id":"RES-001","qty":3700},{"resource_id":"RES-002","qty":15}]} |
| QST-018 | Hoàn thành Thế hệ mới | {"objective":{"kind":"clear_chapter","target":"CH-018","count":1},"reward":[{"resource_id":"RES-001","qty":3900},{"resource_id":"RES-002","qty":15}]} |
| QST-019 | Hoàn thành Bí ẩn Nue | {"objective":{"kind":"clear_chapter","target":"CH-019","count":1},"reward":[{"resource_id":"RES-001","qty":4100},{"resource_id":"RES-002","qty":15}]} |
| QST-020 | Hoàn thành Kỳ thi và Otsutsuki | {"objective":{"kind":"clear_chapter","target":"CH-020","count":1},"reward":[{"resource_id":"RES-001","qty":4300},{"resource_id":"RES-002","qty":15}]} |
| QST-021 | Hoàn thành Kara xuất hiện | {"objective":{"kind":"clear_chapter","target":"CH-021","count":1},"reward":[{"resource_id":"RES-001","qty":4500},{"resource_id":"RES-002","qty":15}]} |
| QST-022 | Hoàn thành Karma và Kawaki | {"objective":{"kind":"clear_chapter","target":"CH-022","count":1},"reward":[{"resource_id":"RES-001","qty":4700},{"resource_id":"RES-002","qty":15}]} |
| QST-023 | Hoàn thành Nhẫn giới hậu chiến | {"objective":{"kind":"clear_chapter","target":"CH-023","count":1},"reward":[{"resource_id":"RES-001","qty":4900},{"resource_id":"RES-002","qty":15}]} |
| QST-024 | Hoàn thành Nhẫn giới vô tận | {"objective":{"kind":"clear_chapter","target":"CH-024","count":1},"reward":[{"resource_id":"RES-001","qty":5100},{"resource_id":"RES-002","qty":15}]} |
| QST-025 | Khảo sát Rừng Tử Thần | {"objective":{"kind":"visit_territory","target":"TER-002","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-007","qty":10}]} |
| QST-026 | Khảo sát Thung lũng Tận Cùng | {"objective":{"kind":"visit_territory","target":"TER-004","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-009","qty":10}]} |
| QST-027 | Khảo sát Đường biên phía đông | {"objective":{"kind":"visit_territory","target":"TER-005","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-008","qty":10}]} |
| QST-028 | Khảo sát Mỏ núi lửa | {"objective":{"kind":"visit_territory","target":"TER-006","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-011","qty":10}]} |
| QST-029 | Khảo sát Nông trại ngoại thành | {"objective":{"kind":"visit_territory","target":"TER-007","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-021","qty":10}]} |
| QST-030 | Khảo sát Trạm giao thương | {"objective":{"kind":"visit_territory","target":"TER-008","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-006","qty":10}]} |
| QST-031 | Khảo sát Núi rừng phía bắc | {"objective":{"kind":"visit_territory","target":"TER-009","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-007","qty":10}]} |
| QST-032 | Khảo sát Sa mạc cửa ngõ | {"objective":{"kind":"visit_territory","target":"TER-011","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-016","qty":10}]} |
| QST-033 | Khảo sát Hẻm đá đỏ | {"objective":{"kind":"visit_territory","target":"TER-012","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-010","qty":10}]} |
| QST-034 | Khảo sát Ốc đảo phía nam | {"objective":{"kind":"visit_territory","target":"TER-013","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-019","qty":10}]} |
| QST-035 | Khảo sát Mỏ tinh thể gió | {"objective":{"kind":"visit_territory","target":"TER-015","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-076","qty":10}]} |
| QST-036 | Khảo sát Tuyến thương nhân | {"objective":{"kind":"visit_territory","target":"TER-016","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-016","qty":10}]} |
| QST-037 | Khảo sát Bờ biển sương mù | {"objective":{"kind":"visit_territory","target":"TER-018","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-029","qty":10}]} |
| QST-038 | Khảo sát Đảo sương phía bắc | {"objective":{"kind":"visit_territory","target":"TER-019","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-045","qty":10}]} |
| QST-039 | Khảo sát Làng chài ngoại vi | {"objective":{"kind":"visit_territory","target":"TER-021","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-029","qty":10}]} |
| QST-040 | Khảo sát Hải lộ phía nam | {"objective":{"kind":"visit_territory","target":"TER-022","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-029","qty":10}]} |
| QST-041 | Khảo sát Hẻm núi sấm | {"objective":{"kind":"visit_territory","target":"TER-024","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-010","qty":10}]} |
| QST-042 | Khảo sát Đảo Rùa | {"objective":{"kind":"visit_territory","target":"TER-025","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-076","qty":10}]} |
| QST-043 | Khảo sát Mỏ tinh thể lôi | {"objective":{"kind":"visit_territory","target":"TER-026","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-012","qty":10}]} |
| QST-044 | Khảo sát Thung lũng mây | {"objective":{"kind":"visit_territory","target":"TER-027","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-025","qty":10}]} |
| QST-045 | Khảo sát Trạm gác núi cao | {"objective":{"kind":"visit_territory","target":"TER-028","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-009","qty":10}]} |
| QST-046 | Khảo sát Cao nguyên đá | {"objective":{"kind":"visit_territory","target":"TER-030","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-010","qty":10}]} |
| QST-047 | Khảo sát Mỏ sắt phía tây | {"objective":{"kind":"visit_territory","target":"TER-031","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-011","qty":10}]} |
| QST-048 | Khảo sát Hẻm núi sâu | {"objective":{"kind":"visit_territory","target":"TER-032","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-009","qty":10}]} |
| QST-049 | Khảo sát Lò luyện khoáng | {"objective":{"kind":"visit_territory","target":"TER-033","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-011","qty":10}]} |
| QST-050 | Khảo sát Đường núi biên giới | {"objective":{"kind":"visit_territory","target":"TER-034","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-009","qty":10}]} |
| QST-051 | Khảo sát Kênh đào phía đông | {"objective":{"kind":"visit_territory","target":"TER-036","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-019","qty":10}]} |
| QST-052 | Khảo sát Tháp mưa cũ | {"objective":{"kind":"visit_territory","target":"TER-037","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-082","qty":10}]} |
| QST-053 | Khảo sát Đường giao thương | {"objective":{"kind":"visit_territory","target":"TER-038","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-019","qty":10}]} |
| QST-054 | Khảo sát Phòng nghiên cứu ngầm | {"objective":{"kind":"visit_territory","target":"TER-040","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-040","qty":10}]} |
| QST-055 | Khảo sát Hang rắn | {"objective":{"kind":"visit_territory","target":"TER-041","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-040","qty":10}]} |
| QST-056 | Khảo sát Rừng biên giới | {"objective":{"kind":"visit_territory","target":"TER-042","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-007","qty":10}]} |
| QST-057 | Khảo sát Thành samurai | {"objective":{"kind":"visit_territory","target":"TER-043","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-011","qty":10}]} |
| QST-058 | Khảo sát Đèo tuyết | {"objective":{"kind":"visit_territory","target":"TER-044","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-045","qty":10}]} |
| QST-059 | Khảo sát Cầu Đại Naruto | {"objective":{"kind":"visit_territory","target":"TER-045","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-006","qty":10}]} |
| QST-060 | Khảo sát Bến sông | {"objective":{"kind":"visit_territory","target":"TER-046","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-029","qty":10}]} |
| QST-061 | Khảo sát Cầu Thiên Địa | {"objective":{"kind":"visit_territory","target":"TER-047","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-008","qty":10}]} |
| QST-062 | Khảo sát Đồng cỏ biên giới | {"objective":{"kind":"visit_territory","target":"TER-048","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-021","qty":10}]} |
| QST-063 | Khảo sát Hang Akatsuki | {"objective":{"kind":"visit_territory","target":"TER-049","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-076","qty":10}]} |
| QST-064 | Khảo sát Căn cứ Akatsuki | {"objective":{"kind":"visit_territory","target":"TER-050","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-082","qty":10}]} |
| QST-065 | Khảo sát Di tích cổ | {"objective":{"kind":"visit_territory","target":"TER-051","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-095","qty":10}]} |
| QST-066 | Khảo sát Chiến trường Đại chiến | {"objective":{"kind":"visit_territory","target":"TER-052","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-076","qty":10}]} |
| QST-067 | Khảo sát Hang Ryuchi | {"objective":{"kind":"visit_territory","target":"TER-054","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-147","qty":10}]} |
| QST-068 | Khảo sát Rừng Shikkotsu | {"objective":{"kind":"visit_territory","target":"TER-055","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-147","qty":10}]} |
| QST-069 | Khảo sát Phòng nghiên cứu Kara | {"objective":{"kind":"visit_territory","target":"TER-056","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-144","qty":10}]} |
| QST-070 | Khảo sát Khu phong ấn cổ | {"objective":{"kind":"visit_territory","target":"TER-057","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-095","qty":10}]} |
| QST-071 | Khảo sát Làng người chơi | {"objective":{"kind":"visit_territory","target":"TER-058","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-006","qty":10}]} |
| QST-072 | Khảo sát Rừng cạnh làng | {"objective":{"kind":"visit_territory","target":"TER-059","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-006","qty":10}]} |
| QST-073 | Khảo sát Mỏ cạnh làng | {"objective":{"kind":"visit_territory","target":"TER-060","count":1},"reward":[{"resource_id":"RES-004","qty":5},{"resource_id":"RES-009","qty":10}]} |
| QST-074 | Hoàn thành phó bản | {"objective":{"kind":"clear_stage","target":null,"count":3},"reward":[{"resource_id":"RES-116","qty":10},{"resource_id":"RES-001","qty":200}]} |
| QST-075 | Thu hoạch công trình | {"objective":{"kind":"collect_production","target":null,"count":5},"reward":[{"resource_id":"RES-001","qty":10},{"resource_id":"RES-001","qty":200}]} |
| QST-076 | Tu luyện ninja | {"objective":{"kind":"train_ninja","target":null,"count":3},"reward":[{"resource_id":"RES-118","qty":10},{"resource_id":"RES-001","qty":200}]} |
| QST-077 | Chế tạo vật phẩm | {"objective":{"kind":"craft_item","target":null,"count":2},"reward":[{"resource_id":"RES-113","qty":10},{"resource_id":"RES-001","qty":200}]} |
| QST-078 | Giao thương | {"objective":{"kind":"trade","target":null,"count":2},"reward":[{"resource_id":"RES-003","qty":10},{"resource_id":"RES-001","qty":200}]} |
| QST-079 | Chiêu mộ ninja | {"objective":{"kind":"recruit","target":null,"count":1},"reward":[{"resource_id":"RES-134","qty":10},{"resource_id":"RES-001","qty":200}]} |
| QST-080 | Hoàn thành nhiệm vụ | {"objective":{"kind":"finish_mission","target":null,"count":3},"reward":[{"resource_id":"RES-003","qty":10},{"resource_id":"RES-001","qty":200}]} |
| QST-081 | Chiến đấu lãnh thổ | {"objective":{"kind":"territory_battle","target":null,"count":1},"reward":[{"resource_id":"RES-004","qty":10},{"resource_id":"RES-001","qty":200}]} |

## Thử thách cá nhân

| ID | Ninja / mở khóa | Yêu cầu |
| --- | --- | --- |
| CHALLENGE-NIN-001-1 | NIN-001 | {"skill_id":"NIN-001-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-001-S6"}} |
| CHALLENGE-NIN-001-2 | NIN-001 | {"skill_id":"NIN-001-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-001-S7"}} |
| CHALLENGE-NIN-002-1 | NIN-002 | {"skill_id":"NIN-002-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-002-S6"}} |
| CHALLENGE-NIN-002-2 | NIN-002 | {"skill_id":"NIN-002-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-002-S7"}} |
| CHALLENGE-NIN-003-1 | NIN-003 | {"skill_id":"NIN-003-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-003-S6"}} |
| CHALLENGE-NIN-003-2 | NIN-003 | {"skill_id":"NIN-003-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-003-S7"}} |
| CHALLENGE-NIN-004-1 | NIN-004 | {"skill_id":"NIN-004-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-004-S6"}} |
| CHALLENGE-NIN-004-2 | NIN-004 | {"skill_id":"NIN-004-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-004-S7"}} |
| CHALLENGE-NIN-005-1 | NIN-005 | {"skill_id":"NIN-005-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-005-S6"}} |
| CHALLENGE-NIN-005-2 | NIN-005 | {"skill_id":"NIN-005-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-005-S7"}} |
| CHALLENGE-NIN-006-1 | NIN-006 | {"skill_id":"NIN-006-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-006-S6"}} |
| CHALLENGE-NIN-006-2 | NIN-006 | {"skill_id":"NIN-006-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-006-S7"}} |
| CHALLENGE-NIN-007-1 | NIN-007 | {"skill_id":"NIN-007-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-007-S6"}} |
| CHALLENGE-NIN-007-2 | NIN-007 | {"skill_id":"NIN-007-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-007-S7"}} |
| CHALLENGE-NIN-008-1 | NIN-008 | {"skill_id":"NIN-008-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-008-S6"}} |
| CHALLENGE-NIN-008-2 | NIN-008 | {"skill_id":"NIN-008-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-008-S7"}} |
| CHALLENGE-NIN-009-1 | NIN-009 | {"skill_id":"NIN-009-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-009-S6"}} |
| CHALLENGE-NIN-009-2 | NIN-009 | {"skill_id":"NIN-009-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-009-S7"}} |
| CHALLENGE-NIN-010-1 | NIN-010 | {"skill_id":"NIN-010-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-010-S6"}} |
| CHALLENGE-NIN-010-2 | NIN-010 | {"skill_id":"NIN-010-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-010-S7"}} |
| CHALLENGE-NIN-011-1 | NIN-011 | {"skill_id":"NIN-011-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-011-S6"}} |
| CHALLENGE-NIN-011-2 | NIN-011 | {"skill_id":"NIN-011-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-011-S7"}} |
| CHALLENGE-NIN-012-1 | NIN-012 | {"skill_id":"NIN-012-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-012-S6"}} |
| CHALLENGE-NIN-012-2 | NIN-012 | {"skill_id":"NIN-012-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-012-S7"}} |
| CHALLENGE-NIN-013-1 | NIN-013 | {"skill_id":"NIN-013-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-013-S6"}} |
| CHALLENGE-NIN-013-2 | NIN-013 | {"skill_id":"NIN-013-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-013-S7"}} |
| CHALLENGE-NIN-014-1 | NIN-014 | {"skill_id":"NIN-014-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-014-S6"}} |
| CHALLENGE-NIN-014-2 | NIN-014 | {"skill_id":"NIN-014-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-014-S7"}} |
| CHALLENGE-NIN-015-1 | NIN-015 | {"skill_id":"NIN-015-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-015-S6"}} |
| CHALLENGE-NIN-015-2 | NIN-015 | {"skill_id":"NIN-015-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-015-S7"}} |
| CHALLENGE-NIN-016-1 | NIN-016 | {"skill_id":"NIN-016-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-016-S6"}} |
| CHALLENGE-NIN-016-2 | NIN-016 | {"skill_id":"NIN-016-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-016-S7"}} |
| CHALLENGE-NIN-017-1 | NIN-017 | {"skill_id":"NIN-017-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-017-S6"}} |
| CHALLENGE-NIN-017-2 | NIN-017 | {"skill_id":"NIN-017-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-017-S7"}} |
| CHALLENGE-NIN-018-1 | NIN-018 | {"skill_id":"NIN-018-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-018-S6"}} |
| CHALLENGE-NIN-018-2 | NIN-018 | {"skill_id":"NIN-018-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-018-S7"}} |
| CHALLENGE-NIN-019-1 | NIN-019 | {"skill_id":"NIN-019-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-019-S6"}} |
| CHALLENGE-NIN-019-2 | NIN-019 | {"skill_id":"NIN-019-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-019-S7"}} |
| CHALLENGE-NIN-020-1 | NIN-020 | {"skill_id":"NIN-020-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-020-S6"}} |
| CHALLENGE-NIN-020-2 | NIN-020 | {"skill_id":"NIN-020-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-020-S7"}} |
| CHALLENGE-NIN-021-1 | NIN-021 | {"skill_id":"NIN-021-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-021-S6"}} |
| CHALLENGE-NIN-021-2 | NIN-021 | {"skill_id":"NIN-021-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-021-S7"}} |
| CHALLENGE-NIN-022-1 | NIN-022 | {"skill_id":"NIN-022-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-022-S6"}} |
| CHALLENGE-NIN-022-2 | NIN-022 | {"skill_id":"NIN-022-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-022-S7"}} |
| CHALLENGE-NIN-023-1 | NIN-023 | {"skill_id":"NIN-023-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-023-S6"}} |
| CHALLENGE-NIN-023-2 | NIN-023 | {"skill_id":"NIN-023-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-023-S7"}} |
| CHALLENGE-NIN-024-1 | NIN-024 | {"skill_id":"NIN-024-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-024-S6"}} |
| CHALLENGE-NIN-024-2 | NIN-024 | {"skill_id":"NIN-024-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-024-S7"}} |
| CHALLENGE-NIN-025-1 | NIN-025 | {"skill_id":"NIN-025-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-025-S6"}} |
| CHALLENGE-NIN-025-2 | NIN-025 | {"skill_id":"NIN-025-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-025-S7"}} |
| CHALLENGE-NIN-026-1 | NIN-026 | {"skill_id":"NIN-026-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-026-S6"}} |
| CHALLENGE-NIN-026-2 | NIN-026 | {"skill_id":"NIN-026-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-026-S7"}} |
| CHALLENGE-NIN-027-1 | NIN-027 | {"skill_id":"NIN-027-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-027-S6"}} |
| CHALLENGE-NIN-027-2 | NIN-027 | {"skill_id":"NIN-027-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-027-S7"}} |
| CHALLENGE-NIN-028-1 | NIN-028 | {"skill_id":"NIN-028-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-028-S6"}} |
| CHALLENGE-NIN-028-2 | NIN-028 | {"skill_id":"NIN-028-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-028-S7"}} |
| CHALLENGE-NIN-029-1 | NIN-029 | {"skill_id":"NIN-029-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-029-S6"}} |
| CHALLENGE-NIN-029-2 | NIN-029 | {"skill_id":"NIN-029-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-029-S7"}} |
| CHALLENGE-NIN-030-1 | NIN-030 | {"skill_id":"NIN-030-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-030-S6"}} |
| CHALLENGE-NIN-030-2 | NIN-030 | {"skill_id":"NIN-030-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-030-S7"}} |
| CHALLENGE-NIN-031-1 | NIN-031 | {"skill_id":"NIN-031-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-031-S6"}} |
| CHALLENGE-NIN-031-2 | NIN-031 | {"skill_id":"NIN-031-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-031-S7"}} |
| CHALLENGE-NIN-032-1 | NIN-032 | {"skill_id":"NIN-032-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-032-S6"}} |
| CHALLENGE-NIN-032-2 | NIN-032 | {"skill_id":"NIN-032-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-032-S7"}} |
| CHALLENGE-NIN-033-1 | NIN-033 | {"skill_id":"NIN-033-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-033-S6"}} |
| CHALLENGE-NIN-033-2 | NIN-033 | {"skill_id":"NIN-033-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-033-S7"}} |
| CHALLENGE-NIN-034-1 | NIN-034 | {"skill_id":"NIN-034-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-034-S6"}} |
| CHALLENGE-NIN-034-2 | NIN-034 | {"skill_id":"NIN-034-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-034-S7"}} |
| CHALLENGE-NIN-035-1 | NIN-035 | {"skill_id":"NIN-035-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-035-S6"}} |
| CHALLENGE-NIN-035-2 | NIN-035 | {"skill_id":"NIN-035-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-035-S7"}} |
| CHALLENGE-NIN-036-1 | NIN-036 | {"skill_id":"NIN-036-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-036-S6"}} |
| CHALLENGE-NIN-036-2 | NIN-036 | {"skill_id":"NIN-036-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-036-S7"}} |
| CHALLENGE-NIN-037-1 | NIN-037 | {"skill_id":"NIN-037-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-037-S6"}} |
| CHALLENGE-NIN-037-2 | NIN-037 | {"skill_id":"NIN-037-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-037-S7"}} |
| CHALLENGE-NIN-038-1 | NIN-038 | {"skill_id":"NIN-038-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-038-S6"}} |
| CHALLENGE-NIN-038-2 | NIN-038 | {"skill_id":"NIN-038-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-038-S7"}} |
| CHALLENGE-NIN-039-1 | NIN-039 | {"skill_id":"NIN-039-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-039-S6"}} |
| CHALLENGE-NIN-039-2 | NIN-039 | {"skill_id":"NIN-039-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-039-S7"}} |
| CHALLENGE-NIN-040-1 | NIN-040 | {"skill_id":"NIN-040-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-040-S6"}} |
| CHALLENGE-NIN-040-2 | NIN-040 | {"skill_id":"NIN-040-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-040-S7"}} |
| CHALLENGE-NIN-041-1 | NIN-041 | {"skill_id":"NIN-041-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-041-S6"}} |
| CHALLENGE-NIN-041-2 | NIN-041 | {"skill_id":"NIN-041-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-041-S7"}} |
| CHALLENGE-NIN-042-1 | NIN-042 | {"skill_id":"NIN-042-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-042-S6"}} |
| CHALLENGE-NIN-042-2 | NIN-042 | {"skill_id":"NIN-042-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-042-S7"}} |
| CHALLENGE-NIN-043-1 | NIN-043 | {"skill_id":"NIN-043-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-043-S6"}} |
| CHALLENGE-NIN-043-2 | NIN-043 | {"skill_id":"NIN-043-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-043-S7"}} |
| CHALLENGE-NIN-044-1 | NIN-044 | {"skill_id":"NIN-044-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-044-S6"}} |
| CHALLENGE-NIN-044-2 | NIN-044 | {"skill_id":"NIN-044-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-044-S7"}} |
| CHALLENGE-NIN-045-1 | NIN-045 | {"skill_id":"NIN-045-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-045-S6"}} |
| CHALLENGE-NIN-045-2 | NIN-045 | {"skill_id":"NIN-045-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-045-S7"}} |
| CHALLENGE-NIN-046-1 | NIN-046 | {"skill_id":"NIN-046-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-046-S6"}} |
| CHALLENGE-NIN-046-2 | NIN-046 | {"skill_id":"NIN-046-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-046-S7"}} |
| CHALLENGE-NIN-047-1 | NIN-047 | {"skill_id":"NIN-047-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-047-S6"}} |
| CHALLENGE-NIN-047-2 | NIN-047 | {"skill_id":"NIN-047-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-047-S7"}} |
| CHALLENGE-NIN-048-1 | NIN-048 | {"skill_id":"NIN-048-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-048-S6"}} |
| CHALLENGE-NIN-048-2 | NIN-048 | {"skill_id":"NIN-048-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-048-S7"}} |
| CHALLENGE-NIN-049-1 | NIN-049 | {"skill_id":"NIN-049-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-049-S6"}} |
| CHALLENGE-NIN-049-2 | NIN-049 | {"skill_id":"NIN-049-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-049-S7"}} |
| CHALLENGE-NIN-050-1 | NIN-050 | {"skill_id":"NIN-050-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-050-S6"}} |
| CHALLENGE-NIN-050-2 | NIN-050 | {"skill_id":"NIN-050-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-050-S7"}} |
| CHALLENGE-NIN-051-1 | NIN-051 | {"skill_id":"NIN-051-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-051-S6"}} |
| CHALLENGE-NIN-051-2 | NIN-051 | {"skill_id":"NIN-051-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-051-S7"}} |
| CHALLENGE-NIN-052-1 | NIN-052 | {"skill_id":"NIN-052-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-052-S6"}} |
| CHALLENGE-NIN-052-2 | NIN-052 | {"skill_id":"NIN-052-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-052-S7"}} |
| CHALLENGE-NIN-053-1 | NIN-053 | {"skill_id":"NIN-053-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-053-S6"}} |
| CHALLENGE-NIN-053-2 | NIN-053 | {"skill_id":"NIN-053-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-053-S7"}} |
| CHALLENGE-NIN-054-1 | NIN-054 | {"skill_id":"NIN-054-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-054-S6"}} |
| CHALLENGE-NIN-054-2 | NIN-054 | {"skill_id":"NIN-054-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-054-S7"}} |
| CHALLENGE-NIN-055-1 | NIN-055 | {"skill_id":"NIN-055-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-055-S6"}} |
| CHALLENGE-NIN-055-2 | NIN-055 | {"skill_id":"NIN-055-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-055-S7"}} |
| CHALLENGE-NIN-056-1 | NIN-056 | {"skill_id":"NIN-056-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-056-S6"}} |
| CHALLENGE-NIN-056-2 | NIN-056 | {"skill_id":"NIN-056-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-056-S7"}} |
| CHALLENGE-NIN-057-1 | NIN-057 | {"skill_id":"NIN-057-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-057-S6"}} |
| CHALLENGE-NIN-057-2 | NIN-057 | {"skill_id":"NIN-057-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-057-S7"}} |
| CHALLENGE-NIN-058-1 | NIN-058 | {"skill_id":"NIN-058-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-058-S6"}} |
| CHALLENGE-NIN-058-2 | NIN-058 | {"skill_id":"NIN-058-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-058-S7"}} |
| CHALLENGE-NIN-059-1 | NIN-059 | {"skill_id":"NIN-059-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-059-S6"}} |
| CHALLENGE-NIN-059-2 | NIN-059 | {"skill_id":"NIN-059-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-059-S7"}} |
| CHALLENGE-NIN-060-1 | NIN-060 | {"skill_id":"NIN-060-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-060-S6"}} |
| CHALLENGE-NIN-060-2 | NIN-060 | {"skill_id":"NIN-060-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-060-S7"}} |
| CHALLENGE-NIN-061-1 | NIN-061 | {"skill_id":"NIN-061-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-061-S6"}} |
| CHALLENGE-NIN-061-2 | NIN-061 | {"skill_id":"NIN-061-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-061-S7"}} |
| CHALLENGE-NIN-062-1 | NIN-062 | {"skill_id":"NIN-062-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-062-S6"}} |
| CHALLENGE-NIN-062-2 | NIN-062 | {"skill_id":"NIN-062-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-062-S7"}} |
| CHALLENGE-NIN-063-1 | NIN-063 | {"skill_id":"NIN-063-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-063-S6"}} |
| CHALLENGE-NIN-063-2 | NIN-063 | {"skill_id":"NIN-063-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-063-S7"}} |
| CHALLENGE-NIN-064-1 | NIN-064 | {"skill_id":"NIN-064-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-064-S6"}} |
| CHALLENGE-NIN-064-2 | NIN-064 | {"skill_id":"NIN-064-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-064-S7"}} |
| CHALLENGE-NIN-065-1 | NIN-065 | {"skill_id":"NIN-065-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-065-S6"}} |
| CHALLENGE-NIN-065-2 | NIN-065 | {"skill_id":"NIN-065-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-065-S7"}} |
| CHALLENGE-NIN-066-1 | NIN-066 | {"skill_id":"NIN-066-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-066-S6"}} |
| CHALLENGE-NIN-066-2 | NIN-066 | {"skill_id":"NIN-066-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-066-S7"}} |
| CHALLENGE-NIN-067-1 | NIN-067 | {"skill_id":"NIN-067-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-067-S6"}} |
| CHALLENGE-NIN-067-2 | NIN-067 | {"skill_id":"NIN-067-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-067-S7"}} |
| CHALLENGE-NIN-068-1 | NIN-068 | {"skill_id":"NIN-068-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-068-S6"}} |
| CHALLENGE-NIN-068-2 | NIN-068 | {"skill_id":"NIN-068-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-068-S7"}} |
| CHALLENGE-NIN-069-1 | NIN-069 | {"skill_id":"NIN-069-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-069-S6"}} |
| CHALLENGE-NIN-069-2 | NIN-069 | {"skill_id":"NIN-069-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-069-S7"}} |
| CHALLENGE-NIN-070-1 | NIN-070 | {"skill_id":"NIN-070-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-070-S6"}} |
| CHALLENGE-NIN-070-2 | NIN-070 | {"skill_id":"NIN-070-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-070-S7"}} |
| CHALLENGE-NIN-071-1 | NIN-071 | {"skill_id":"NIN-071-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-071-S6"}} |
| CHALLENGE-NIN-071-2 | NIN-071 | {"skill_id":"NIN-071-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-071-S7"}} |
| CHALLENGE-NIN-072-1 | NIN-072 | {"skill_id":"NIN-072-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-072-S6"}} |
| CHALLENGE-NIN-072-2 | NIN-072 | {"skill_id":"NIN-072-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-072-S7"}} |
| CHALLENGE-NIN-073-1 | NIN-073 | {"skill_id":"NIN-073-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-073-S6"}} |
| CHALLENGE-NIN-073-2 | NIN-073 | {"skill_id":"NIN-073-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-073-S7"}} |
| CHALLENGE-NIN-074-1 | NIN-074 | {"skill_id":"NIN-074-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-074-S6"}} |
| CHALLENGE-NIN-074-2 | NIN-074 | {"skill_id":"NIN-074-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-074-S7"}} |
| CHALLENGE-NIN-075-1 | NIN-075 | {"skill_id":"NIN-075-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-075-S6"}} |
| CHALLENGE-NIN-075-2 | NIN-075 | {"skill_id":"NIN-075-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-075-S7"}} |
| CHALLENGE-NIN-076-1 | NIN-076 | {"skill_id":"NIN-076-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-076-S6"}} |
| CHALLENGE-NIN-076-2 | NIN-076 | {"skill_id":"NIN-076-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-076-S7"}} |
| CHALLENGE-NIN-077-1 | NIN-077 | {"skill_id":"NIN-077-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-077-S6"}} |
| CHALLENGE-NIN-077-2 | NIN-077 | {"skill_id":"NIN-077-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-077-S7"}} |
| CHALLENGE-NIN-078-1 | NIN-078 | {"skill_id":"NIN-078-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-078-S6"}} |
| CHALLENGE-NIN-078-2 | NIN-078 | {"skill_id":"NIN-078-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-078-S7"}} |
| CHALLENGE-NIN-079-1 | NIN-079 | {"skill_id":"NIN-079-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-079-S6"}} |
| CHALLENGE-NIN-079-2 | NIN-079 | {"skill_id":"NIN-079-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-079-S7"}} |
| CHALLENGE-NIN-080-1 | NIN-080 | {"skill_id":"NIN-080-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-080-S6"}} |
| CHALLENGE-NIN-080-2 | NIN-080 | {"skill_id":"NIN-080-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-080-S7"}} |
| CHALLENGE-NIN-081-1 | NIN-081 | {"skill_id":"NIN-081-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-081-S6"}} |
| CHALLENGE-NIN-081-2 | NIN-081 | {"skill_id":"NIN-081-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-081-S7"}} |
| CHALLENGE-NIN-082-1 | NIN-082 | {"skill_id":"NIN-082-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-082-S6"}} |
| CHALLENGE-NIN-082-2 | NIN-082 | {"skill_id":"NIN-082-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-082-S7"}} |
| CHALLENGE-NIN-083-1 | NIN-083 | {"skill_id":"NIN-083-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-083-S6"}} |
| CHALLENGE-NIN-083-2 | NIN-083 | {"skill_id":"NIN-083-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-083-S7"}} |
| CHALLENGE-NIN-084-1 | NIN-084 | {"skill_id":"NIN-084-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-084-S6"}} |
| CHALLENGE-NIN-084-2 | NIN-084 | {"skill_id":"NIN-084-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-084-S7"}} |
| CHALLENGE-NIN-085-1 | NIN-085 | {"skill_id":"NIN-085-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-085-S6"}} |
| CHALLENGE-NIN-085-2 | NIN-085 | {"skill_id":"NIN-085-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-085-S7"}} |
| CHALLENGE-NIN-086-1 | NIN-086 | {"skill_id":"NIN-086-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-086-S6"}} |
| CHALLENGE-NIN-086-2 | NIN-086 | {"skill_id":"NIN-086-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-086-S7"}} |
| CHALLENGE-NIN-087-1 | NIN-087 | {"skill_id":"NIN-087-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-087-S6"}} |
| CHALLENGE-NIN-087-2 | NIN-087 | {"skill_id":"NIN-087-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-087-S7"}} |
| CHALLENGE-NIN-088-1 | NIN-088 | {"skill_id":"NIN-088-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-088-S6"}} |
| CHALLENGE-NIN-088-2 | NIN-088 | {"skill_id":"NIN-088-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-088-S7"}} |
| CHALLENGE-NIN-089-1 | NIN-089 | {"skill_id":"NIN-089-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-089-S6"}} |
| CHALLENGE-NIN-089-2 | NIN-089 | {"skill_id":"NIN-089-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-089-S7"}} |
| CHALLENGE-NIN-090-1 | NIN-090 | {"skill_id":"NIN-090-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-090-S6"}} |
| CHALLENGE-NIN-090-2 | NIN-090 | {"skill_id":"NIN-090-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-090-S7"}} |
| CHALLENGE-NIN-091-1 | NIN-091 | {"skill_id":"NIN-091-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-091-S6"}} |
| CHALLENGE-NIN-091-2 | NIN-091 | {"skill_id":"NIN-091-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-091-S7"}} |
| CHALLENGE-NIN-092-1 | NIN-092 | {"skill_id":"NIN-092-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-092-S6"}} |
| CHALLENGE-NIN-092-2 | NIN-092 | {"skill_id":"NIN-092-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-092-S7"}} |
| CHALLENGE-NIN-093-1 | NIN-093 | {"skill_id":"NIN-093-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-093-S6"}} |
| CHALLENGE-NIN-093-2 | NIN-093 | {"skill_id":"NIN-093-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-093-S7"}} |
| CHALLENGE-NIN-094-1 | NIN-094 | {"skill_id":"NIN-094-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-094-S6"}} |
| CHALLENGE-NIN-094-2 | NIN-094 | {"skill_id":"NIN-094-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-094-S7"}} |
| CHALLENGE-NIN-095-1 | NIN-095 | {"skill_id":"NIN-095-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-095-S6"}} |
| CHALLENGE-NIN-095-2 | NIN-095 | {"skill_id":"NIN-095-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-095-S7"}} |
| CHALLENGE-NIN-096-1 | NIN-096 | {"skill_id":"NIN-096-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-096-S6"}} |
| CHALLENGE-NIN-096-2 | NIN-096 | {"skill_id":"NIN-096-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-096-S7"}} |
| CHALLENGE-NIN-097-1 | NIN-097 | {"skill_id":"NIN-097-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-097-S6"}} |
| CHALLENGE-NIN-097-2 | NIN-097 | {"skill_id":"NIN-097-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-097-S7"}} |
| CHALLENGE-NIN-098-1 | NIN-098 | {"skill_id":"NIN-098-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-098-S6"}} |
| CHALLENGE-NIN-098-2 | NIN-098 | {"skill_id":"NIN-098-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-098-S7"}} |
| CHALLENGE-NIN-099-1 | NIN-099 | {"skill_id":"NIN-099-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-099-S6"}} |
| CHALLENGE-NIN-099-2 | NIN-099 | {"skill_id":"NIN-099-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-099-S7"}} |
| CHALLENGE-NIN-100-1 | NIN-100 | {"skill_id":"NIN-100-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-100-S6"}} |
| CHALLENGE-NIN-100-2 | NIN-100 | {"skill_id":"NIN-100-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-100-S7"}} |
| CHALLENGE-NIN-101-1 | NIN-101 | {"skill_id":"NIN-101-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-101-S6"}} |
| CHALLENGE-NIN-101-2 | NIN-101 | {"skill_id":"NIN-101-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-101-S7"}} |
| CHALLENGE-NIN-102-1 | NIN-102 | {"skill_id":"NIN-102-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-102-S6"}} |
| CHALLENGE-NIN-102-2 | NIN-102 | {"skill_id":"NIN-102-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-102-S7"}} |
| CHALLENGE-NIN-103-1 | NIN-103 | {"skill_id":"NIN-103-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-103-S6"}} |
| CHALLENGE-NIN-103-2 | NIN-103 | {"skill_id":"NIN-103-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-103-S7"}} |
| CHALLENGE-NIN-104-1 | NIN-104 | {"skill_id":"NIN-104-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-104-S6"}} |
| CHALLENGE-NIN-104-2 | NIN-104 | {"skill_id":"NIN-104-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-104-S7"}} |
| CHALLENGE-NIN-105-1 | NIN-105 | {"skill_id":"NIN-105-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-105-S6"}} |
| CHALLENGE-NIN-105-2 | NIN-105 | {"skill_id":"NIN-105-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-105-S7"}} |
| CHALLENGE-NIN-106-1 | NIN-106 | {"skill_id":"NIN-106-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-106-S6"}} |
| CHALLENGE-NIN-106-2 | NIN-106 | {"skill_id":"NIN-106-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-106-S7"}} |
| CHALLENGE-NIN-107-1 | NIN-107 | {"skill_id":"NIN-107-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-107-S6"}} |
| CHALLENGE-NIN-107-2 | NIN-107 | {"skill_id":"NIN-107-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-107-S7"}} |
| CHALLENGE-NIN-108-1 | NIN-108 | {"skill_id":"NIN-108-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-108-S6"}} |
| CHALLENGE-NIN-108-2 | NIN-108 | {"skill_id":"NIN-108-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-108-S7"}} |
| CHALLENGE-NIN-109-1 | NIN-109 | {"skill_id":"NIN-109-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-109-S6"}} |
| CHALLENGE-NIN-109-2 | NIN-109 | {"skill_id":"NIN-109-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-109-S7"}} |
| CHALLENGE-NIN-110-1 | NIN-110 | {"skill_id":"NIN-110-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-110-S6"}} |
| CHALLENGE-NIN-110-2 | NIN-110 | {"skill_id":"NIN-110-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-110-S7"}} |
| CHALLENGE-NIN-111-1 | NIN-111 | {"skill_id":"NIN-111-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-111-S6"}} |
| CHALLENGE-NIN-111-2 | NIN-111 | {"skill_id":"NIN-111-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-111-S7"}} |
| CHALLENGE-NIN-112-1 | NIN-112 | {"skill_id":"NIN-112-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-112-S6"}} |
| CHALLENGE-NIN-112-2 | NIN-112 | {"skill_id":"NIN-112-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-112-S7"}} |
| CHALLENGE-NIN-113-1 | NIN-113 | {"skill_id":"NIN-113-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-113-S6"}} |
| CHALLENGE-NIN-113-2 | NIN-113 | {"skill_id":"NIN-113-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-113-S7"}} |
| CHALLENGE-NIN-114-1 | NIN-114 | {"skill_id":"NIN-114-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-114-S6"}} |
| CHALLENGE-NIN-114-2 | NIN-114 | {"skill_id":"NIN-114-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-114-S7"}} |
| CHALLENGE-NIN-115-1 | NIN-115 | {"skill_id":"NIN-115-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-115-S6"}} |
| CHALLENGE-NIN-115-2 | NIN-115 | {"skill_id":"NIN-115-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-115-S7"}} |
| CHALLENGE-NIN-116-1 | NIN-116 | {"skill_id":"NIN-116-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-116-S6"}} |
| CHALLENGE-NIN-116-2 | NIN-116 | {"skill_id":"NIN-116-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-116-S7"}} |
| CHALLENGE-NIN-117-1 | NIN-117 | {"skill_id":"NIN-117-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-117-S6"}} |
| CHALLENGE-NIN-117-2 | NIN-117 | {"skill_id":"NIN-117-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-117-S7"}} |
| CHALLENGE-NIN-118-1 | NIN-118 | {"skill_id":"NIN-118-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-118-S6"}} |
| CHALLENGE-NIN-118-2 | NIN-118 | {"skill_id":"NIN-118-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-118-S7"}} |
| CHALLENGE-NIN-119-1 | NIN-119 | {"skill_id":"NIN-119-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-119-S6"}} |
| CHALLENGE-NIN-119-2 | NIN-119 | {"skill_id":"NIN-119-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-119-S7"}} |
| CHALLENGE-NIN-120-1 | NIN-120 | {"skill_id":"NIN-120-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-120-S6"}} |
| CHALLENGE-NIN-120-2 | NIN-120 | {"skill_id":"NIN-120-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-120-S7"}} |
| CHALLENGE-NIN-121-1 | NIN-121 | {"skill_id":"NIN-121-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-121-S6"}} |
| CHALLENGE-NIN-121-2 | NIN-121 | {"skill_id":"NIN-121-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-121-S7"}} |
| CHALLENGE-NIN-122-1 | NIN-122 | {"skill_id":"NIN-122-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-122-S6"}} |
| CHALLENGE-NIN-122-2 | NIN-122 | {"skill_id":"NIN-122-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-122-S7"}} |
| CHALLENGE-NIN-123-1 | NIN-123 | {"skill_id":"NIN-123-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-123-S6"}} |
| CHALLENGE-NIN-123-2 | NIN-123 | {"skill_id":"NIN-123-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-123-S7"}} |
| CHALLENGE-NIN-124-1 | NIN-124 | {"skill_id":"NIN-124-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-124-S6"}} |
| CHALLENGE-NIN-124-2 | NIN-124 | {"skill_id":"NIN-124-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-124-S7"}} |
| CHALLENGE-NIN-125-1 | NIN-125 | {"skill_id":"NIN-125-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-125-S6"}} |
| CHALLENGE-NIN-125-2 | NIN-125 | {"skill_id":"NIN-125-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-125-S7"}} |
| CHALLENGE-NIN-126-1 | NIN-126 | {"skill_id":"NIN-126-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-126-S6"}} |
| CHALLENGE-NIN-126-2 | NIN-126 | {"skill_id":"NIN-126-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-126-S7"}} |
| CHALLENGE-NIN-127-1 | NIN-127 | {"skill_id":"NIN-127-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-127-S6"}} |
| CHALLENGE-NIN-127-2 | NIN-127 | {"skill_id":"NIN-127-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-127-S7"}} |
| CHALLENGE-NIN-128-1 | NIN-128 | {"skill_id":"NIN-128-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-128-S6"}} |
| CHALLENGE-NIN-128-2 | NIN-128 | {"skill_id":"NIN-128-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-128-S7"}} |
| CHALLENGE-NIN-129-1 | NIN-129 | {"skill_id":"NIN-129-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-129-S6"}} |
| CHALLENGE-NIN-129-2 | NIN-129 | {"skill_id":"NIN-129-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-129-S7"}} |
| CHALLENGE-NIN-130-1 | NIN-130 | {"skill_id":"NIN-130-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-130-S6"}} |
| CHALLENGE-NIN-130-2 | NIN-130 | {"skill_id":"NIN-130-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-130-S7"}} |
| CHALLENGE-NIN-131-1 | NIN-131 | {"skill_id":"NIN-131-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-131-S6"}} |
| CHALLENGE-NIN-131-2 | NIN-131 | {"skill_id":"NIN-131-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-131-S7"}} |
| CHALLENGE-NIN-132-1 | NIN-132 | {"skill_id":"NIN-132-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-132-S6"}} |
| CHALLENGE-NIN-132-2 | NIN-132 | {"skill_id":"NIN-132-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-132-S7"}} |
| CHALLENGE-NIN-133-1 | NIN-133 | {"skill_id":"NIN-133-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-133-S6"}} |
| CHALLENGE-NIN-133-2 | NIN-133 | {"skill_id":"NIN-133-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-133-S7"}} |
| CHALLENGE-NIN-134-1 | NIN-134 | {"skill_id":"NIN-134-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-134-S6"}} |
| CHALLENGE-NIN-134-2 | NIN-134 | {"skill_id":"NIN-134-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-134-S7"}} |
| CHALLENGE-NIN-135-1 | NIN-135 | {"skill_id":"NIN-135-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-135-S6"}} |
| CHALLENGE-NIN-135-2 | NIN-135 | {"skill_id":"NIN-135-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-135-S7"}} |
| CHALLENGE-NIN-136-1 | NIN-136 | {"skill_id":"NIN-136-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-136-S6"}} |
| CHALLENGE-NIN-136-2 | NIN-136 | {"skill_id":"NIN-136-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-136-S7"}} |
| CHALLENGE-NIN-137-1 | NIN-137 | {"skill_id":"NIN-137-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-137-S6"}} |
| CHALLENGE-NIN-137-2 | NIN-137 | {"skill_id":"NIN-137-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-137-S7"}} |
| CHALLENGE-NIN-138-1 | NIN-138 | {"skill_id":"NIN-138-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-138-S6"}} |
| CHALLENGE-NIN-138-2 | NIN-138 | {"skill_id":"NIN-138-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-138-S7"}} |
| CHALLENGE-NIN-139-1 | NIN-139 | {"skill_id":"NIN-139-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-139-S6"}} |
| CHALLENGE-NIN-139-2 | NIN-139 | {"skill_id":"NIN-139-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-139-S7"}} |
| CHALLENGE-NIN-140-1 | NIN-140 | {"skill_id":"NIN-140-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-140-S6"}} |
| CHALLENGE-NIN-140-2 | NIN-140 | {"skill_id":"NIN-140-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-140-S7"}} |
| CHALLENGE-NIN-141-1 | NIN-141 | {"skill_id":"NIN-141-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-141-S6"}} |
| CHALLENGE-NIN-141-2 | NIN-141 | {"skill_id":"NIN-141-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-141-S7"}} |
| CHALLENGE-NIN-142-1 | NIN-142 | {"skill_id":"NIN-142-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-142-S6"}} |
| CHALLENGE-NIN-142-2 | NIN-142 | {"skill_id":"NIN-142-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-142-S7"}} |
| CHALLENGE-NIN-143-1 | NIN-143 | {"skill_id":"NIN-143-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-143-S6"}} |
| CHALLENGE-NIN-143-2 | NIN-143 | {"skill_id":"NIN-143-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-143-S7"}} |
| CHALLENGE-NIN-144-1 | NIN-144 | {"skill_id":"NIN-144-S6","requires_realm":3,"requires_mastery":500,"reward":{"unlock_skill_id":"NIN-144-S6"}} |
| CHALLENGE-NIN-144-2 | NIN-144 | {"skill_id":"NIN-144-S7","requires_realm":6,"requires_mastery":1500,"reward":{"unlock_skill_id":"NIN-144-S7"}} |
