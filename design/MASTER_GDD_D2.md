# Naru — D2-D Master Design Addendum

## Baseline khóa theo V0.1–V1.0
- RPG Naruto/Shippuden/Boruto, cá nhân, tiếng Việt, Godot, Web/Android/PC, offline trước online sau. Lấy Ninja Rebirth làm cảm hứng, không tái sử dụng binary hay thông số chưa kiểm chứng.
- Isometric, bố trận ban đầu và di chuyển tự do, tối đa 6 ninja mỗi đội; tự đánh và chọn kỹ năng thường bằng AI theo tình huống/chakra. Tuyệt kỹ do người chơi bấm, AI chọn mục tiêu, cần chakra + cooldown. Không giới hạn thời gian trận, hồi phục sau trận.
- 1 đánh thường + 4 kỹ năng + 1 tuyệt kỹ ban đầu; mở thêm bộ kỹ năng cố định theo ninja; tất cả kỹ năng đã mở đều khả dụng. Tiến giai, cấp, thành thạo và tiến hóa đường thẳng/phân nhánh. Cấp skill giới hạn theo giai; tăng cấp luôn thành công, tiến giai có xác suất.
- 100–200 phiên bản ninja; 8 phẩm chất ban đầu có thể tiến hóa; sao tối đa 15, cấp bị giới hạn theo cảnh giới nhưng mở tiếp bằng đột phá; tổng sức mạnh vô hạn. Hơn 30 chỉ số, phân bổ nền tảng/chuyên biệt kết hợp tăng tự động; tăng vĩnh viễn qua hành động và ngẫu nhiên. Tiềm năng khác nhau, áp chế cảnh giới có thể khắc chế. Đột phá có bảo hiểm. Thiên phú cố định + ngẫu nhiên. Trùng ID chuyển mảnh. Gacha/mảnh/nhiệm vụ/sự kiện/tuyển trên map. Liên kết sở hữu/đội/combo. Hình thái vừa biến thân vừa phiên bản riêng.
- Toàn bộ chakra nguyên tố, huyết kế, huyết kế đào thải, đồng thuật thức tỉnh/cấy ghép có điều kiện. Vĩ thú thu phục/nuôi/phong ấn tương thích. Thông linh thú vừa hệ nuôi riêng vừa kỹ năng.
- Thủ lĩnh tổ chức: làng panorama, công trình vị trí cố định, tối đa 100 cấp, nâng cấp tài nguyên+thời gian. Không chi phí duy trì. Ninja vừa làm nghề vừa chiến đấu; nghề cấp/thiên phú/tiến hóa; số ninja và đội không giới hạn theo nhân lực. Offline toàn làng và NPC tối đa 24h. Phó bản có thể lực.
- 100+ tài nguyên, chuỗi chế biến, sản xuất tự động thiết lập được; chất lượng nghề+nguyên liệu+ngẫu nhiên; 12+ slot, trang bị tăng trưởng vô hạn, cường hóa/tinh luyện/tiến hóa/khảm/tẩy luyện, bảo hiểm/vật phẩm bảo vệ. Giao thương cung cầu/quan hệ/chiến tranh.
- Nhẫn giới khám phá, chiếm đóng, khai thác, ngoại giao, liên minh, NPC tự phát triển/giao thương/chiến tranh. Nhiều đội chiến đấu liên tiếp. Làng thất thủ mất tài nguyên + hư hại công trình. Cốt truyện canon kết hợp sandbox.
- HD Pixel Chibi theo ảnh người dùng, không rig, frame-by-frame; pixel VFX + glow/particle, tuyệt kỹ tùy cut-in tắt được, trang bị không đổi sprite, UI kết hợp chủ đề ninja hiện đại, âm thanh cơ bản.

## D2 dữ liệu
Tất cả file JSON mang trạng thái PROPOSED; số liệu không phải dữ liệu canon/client. 144 hồ sơ theo candidate ID D1; 864 skill ban đầu, gồm tên chiêu đặc trưng và action game giả lập, 720 liên kết tiến giai đầu tiên. Generic action chưa phải nhẫn thuật canon; các skill loại/target phải kiểm chứng từng nhân vật trước runtime. Các version cùng identity chưa chốt ra cùng đội. Không tự gán hình thái cho thời kỳ không phù hợp. Các nhánh tiến hóa đặc biệt và kỹ năng mở thêm xem skill_evolution_examples.json; chưa đủ cây từng ninja. 150 tài nguyên, 30 công trình, 16 slot, 128 mẫu equip và 63 recipe chế biến. Tài nguyên không có recipe dùng nguồn khai thác/nhiệm vụ/challenge; cần cân bằng toàn bộ sink/loot. Không có project.godot hay GDScript.

## Công thức và xử lý biên
Xem balance_rules.json. Tăng trưởng rating lưu vô hạn nhưng tỷ lệ bị chặn bởi soft cap, tránh 100% né/giảm sát thương. Skill kết hợp vùng nguyên tố có reaction cooldown và tối đa 1 chain; buff/debuff theo event. Trị liệu chỉ tính HP thực, chống farm tự đánh hồi máu. Nếu thiếu chakra hoặc cooldown >0 thì không cast, tuyệt kỹ không bị auto dùng khi manual. AI tie break theo ID, RNG seeded. Trận không hard timeout; khi bế tắc đề xuất rút lui tùy người chơi. Phần thưởng transaction theo event ID, không âm kho. Làng không mất cấp khi hư hại. Hệ mô phỏng offline dùng timestamp đã commit, không tính lặp; NPC giao chiến theo resolver cùng luật. Mỗi ninja một job và một đội triển khai; việc làm vẫn chạy khi tham chiến theo quyết định người dùng. Giai đoạn online cần server authoritative, không import save offline vào xếp hạng.

## Gate trước production
1. Duyệt 4 sprite tĩnh thử nghiệm; chưa duyệt animation.
2. Xác minh hồ sơ, nguồn từng kỹ năng, phiên bản, 4 hướng thực; art test ở battle 12 actor. Không dùng ảnh quảng cáo làm asset.
3. Duyệt tham số, xác định công thức còn thiếu (tất cả 48 derived stats, skill riêng, đồ set, loot, profession, world AI và gacha banner). Chưa có simulation/runtime balancing.
4. Chỉ sau owner duyệt mới tạo prototype Godot; chưa triển khai chính thức trong D2.

## Combat V3 — DEC-012 (LOCKED)
The current combat rules supersede previous arena geometry. See design/skill-p1/COMBAT_V3.md and data/combat_v3.json.
