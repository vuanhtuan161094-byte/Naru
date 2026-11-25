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

## SKILL-P2 overlay (Combat V3)
Design draft covering all 1,152 skill IDs, 54 forms, 12 combos; see design/skill-p2/README.md and audit.json. Numeric and non-canon adaptations are DEV; D4 remains runtime until reviewed integration. Stable IDs/save progression preserved.

## SKILL-P2 A–I second-pass handoff — 25/11/2026
Design evidence `e6e848b1cdc9334ab90289bfa63c018108d7e6d2`: 1,152 records / 144 kits, 54 forms, 12 combos, 146 VFX families / 18 production groups, 12 second-pass structural checks PASS. 38 official source pointers (8 pages opened); 10 limited technique context matches, 334 character context only, 808 without source pointer; 176 era-flagged skill records, 1 explicit HOLD. All values DEV. 3 proposed status extensions and 4 changed legacy form trigger routes need gameplay adapter. Runtime NOT_RUN on design branch; no production art claim. Read `design/skill-p2/HANDOFF_01_02.md`, `audit.json`, `production_groups.json`, `form_migration_review.json`, `status_extensions.json`. 01 and 02 work independently, no Codex Cloud, no merge. 00 next resolves source/era review and approves numerical tuning. 

## SKILL-P3 + BALANCE-P1 — 25/11/2026
Source overlay 904/1152 linked (560 newly linked vs P2, 248 missing, 35 limited technique context/link, 55 source records not necessarily unique URLs; 176 era records/22 snapshots, 2 HOLD). All 54 forms annotated. Balance overlay covers 1152 skills (503 changes), 54 forms/12 combos, campaign/economy all IDs plus special progression. 7+15+8 analytical/structural checks PASS; runtime balance NOT_RUN. Existing D4 untouched, no source/production acceptance claim. CI 45574564478 exact gameplay 1b5c8da2 success; current 01 docs ffde762f, 02 art 100f1b1d review 12 character/14 skill VFX candidates. Handoff `design/balance-p1/HANDOFF_01_02.md`. No code or art branch edits, no merge.

## PRODUCT-AUDIT / Wiki / SKILL-P4 (25/11/2026)
Wiki `wiki/README.md`: 144 ninja/1152 skills, 54 forms/12 combos, progression, 150 resources, 63 recipes, 30 buildings, 128 gear, 15 jobs, 120 stages, 24 chapters, 60 territories,81 quests,288 trials. SKILL-P4 reviewed 248 prior missing-pointer rows with 30 source records (22 official,4 licensed,4 secondary); all 1152 now have context pointers, not individual canon proof. Prior source ledgers inherited, 6 new limited technique/role links. Product audit pinned 197bd5d1 CI 45582064721 PASS, 1134 confirmed/18 fallback; 17 UI navigation, V6 artifact 15007960377, art 100f1b1d CI 45576264528 safe DEV only, 12 static/14 VFX candidates, 0 complete clips/approved. P3/P4/P1 not present in checked gameplay tree. 21 baseline gates + 9 completion gates; no final acceptance. Read `design/product-audit/HANDOFF_01_02.md`. No gameplay/art writes or merge.
