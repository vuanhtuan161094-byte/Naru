# Benchmark gameplay — D1 (25/11/2026)

| Nguồn | Nội dung xác minh từ văn bản công khai | Áp dụng | Chưa xác minh |
|---|---|---|---|
| Ninja Rebirth Mobile, 2Game 03/03/2020 | Chiêu mộ, bố đội, vượt ải, nâng tướng/skill, tu bí thuật, duyên, tiến hóa, đấu trường | Core loop | Công thức, số đội, full database |
| Ninja Rebirth Hero Saga, TapTap | Mô tả tuyển/huấn luyện hơn 50 ninja, melee tank/ranged, bấm kích hoạt sức mạnh, survival, Kyuubi boss, PvE, synergy, guild, currencies | Combat + collection | Không suy ra hai bản giống hoàn toàn; chưa chạy client |
| Naruto Online, hướng dẫn chính thức | Trạng thái kích hoạt chuỗi truy kích giữa ninja | Combo thời gian thực tự thiết kế | Không sao chép turn-based engine |
| Ninja Voltage, Bandai Namco Studios | Xây pháo đài, tấn công/phòng thủ, ryo/chakra để nâng ninja | Căn cứ và phòng thủ | Không suy ra mô phỏng kinh tế độc lập |
| Slugfest, Cubinet/TapTap | Thế giới 3D mở, khám phá, nhiệm vụ, thời tiết | Nhẫn giới 2D graph | Không sao chép 3D, chưa chơi trực tiếp |
| 奧義集結：最強忍者, ảnh người dùng + Mobile01/AAYYY | Quảng cáo pixel chibi, bố trận, thu thập, khắc chế, duyên phận | Chủ yếu benchmark art | Chưa xác minh game runtime, nguồn cộng đồng không chính thức |
| Narutopedia / Ninja Blazing Nexus | Danh mục thuật và dữ liệu tham khảo nhân vật từ franchise/game khác | Nguồn tra cứu roster/skill | Không phải số liệu Ninja Rebirth |

## Link kiểm tra
- https://2game.vn/gioi-thieu-game-ninja-rebirth-mobile-post253091.html
- https://www.taptap.io/vn/app/63384
- https://www.youtube.com/watch?v=bjLL8qBvG_8 (walkthrough Hero Saga 2017; tìm thấy trang video, chưa xem toàn bộ footage)
- https://www.youtube.com/watch?v=0Yk74XqMXsA (walkthrough Ninja Rebirth 2019; tìm thấy trang video, chưa xem toàn bộ footage)
- https://naruto.narutowebgame.com/en/strategy/all/intro_to_combos
- https://www.narutoonlinenexus.com/ (cộng đồng)
- https://www.bandainamcostudios.com/en/behind-the-game/255
- https://www.cubinet.com/news/59-naruto-slugfest-obt-is-now-live
- https://www.taptap.io/vn/app/178299
- https://m.mobile01.com/topicdetail.php?f=675&t=7317584 (cộng đồng)
- https://naruto.fandom.com/wiki/Jutsu
- https://ninjablazingwiki.com/library/ (cộng đồng; Ninja Blazing, không phải Ninja Rebirth)
- https://docs.godotengine.org/en/4.5/tutorials/export/exporting_for_web.html

## Hướng nghiên cứu tiếp
Thu thập video theo màn hình/timestamp và phân loại UX; xác định phiên bản chính xác của Ninja Rebirth; nếu có client hợp lệ và an toàn, kiểm tra tĩnh trong môi trường cô lập, không chạy binary chưa xác minh. Tạo bảng skill canon theo từng ninja và thời kỳ, mọi thông số thiếu đánh dấu SIMULATED. Chỉ tái sử dụng asset nếu có quyền, ghi license từng file.
