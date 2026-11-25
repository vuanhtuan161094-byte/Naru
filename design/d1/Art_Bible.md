# ART-01 — HD Pixel Chibi Anime | bản thử nghiệm

## Benchmark đã chốt
Ảnh người dùng gửi: nhân vật Itachi chibi 2D, nét viền tối rõ, mảng màu tương đối lớn, tóc/mắt/băng trán và áo Akatsuki dễ nhận; hiệu ứng Susanoo màu đỏ cam có đường viền pixel phát sáng. Ảnh là quảng cáo đã scale/compress nên không suy ra kích thước sprite gốc, tỷ lệ pixel thật hay frame count. HD Pixel Chibi Anime là tên mô tả nội bộ, không phải trường phái có chuẩn chính thức. Không sao chép layout quảng cáo hoặc chữ Trung Quốc.

## Đề xuất kỹ thuật thử nghiệm
- Sprite: 64×80 hoặc 80×96 px canvas, actor cao khoảng 56–72 px nội dung, upscale integer nearest-neighbor; so sánh 1×/2×/3×. Đầu khoảng 35–45% chiều cao. 2–4 mức sáng mỗi vật liệu, viền tối theo màu vật thể, hạn chế gradient mịn và anti-alias lẫn vào pixel.
- Isometric 2:1 nền, chân chạm ground plane; 4 hướng chéo trước, cân nhắc 8 hướng theo art test. Không rig; hướng lật chỉ dùng khi trang phục/vũ khí không bị sai bên. Y-sort theo foot anchor.
- Frame baseline đề xuất Idle 4–6, Walk/Run 6–8, Basic 6–8, Cast 6–10, Hit 2–4, Death 5–8; ultimate riêng theo skill. Anchor và timing metadata tách hình, event hit ở frame active. Không tạo poster rồi cắt thành frame giả.
- PNG RGBA nền alpha thực; sheet grid đều, không viền/lề/nhãn trong cell, không clipping; export atlas và metadata. Từng pose có silhouette thay đổi thực sự; không chỉ dịch sprite toàn thân. Trang bị không thay đổi sprite.
- VFX pixel: cấu trúc đầu/thân/đuôi hoặc vùng rõ ràng; anticipatory chakra, active hit, impact, decay. Glow nhẹ bằng sprite additive/shader tương thích web; particle không che actor; màu nguyên tố thống nhất. Susanoo lớn vẫn cần đọc HP bar và mục tiêu. Cut-in tắt được, không thay đổi timing combat.
- Bối cảnh làng: panorama pixel stylized, công trình cố định có hotspot, tầng nền/mid/foreground; không bắt buộc cùng góc nhìn chiến trường. UI hiện đại với chất liệu giấy/trục, màu cam/đỏ/than, icon nhất quán, số tiếng Việt dễ đọc. Không lấy chữ/biểu tượng trực tiếp từ quảng cáo.

## Bài duyệt mẫu
Tạo concept board có bốn nhân vật Naruto, Sasuke, Kakashi, Itachi theo đúng tỷ lệ và pixel của ảnh tham chiếu; hiển thị cùng kích thước và 1 cảnh Isometric nhỏ có Rasengan, Chidori, Susanoo. Concept art chỉ dùng duyệt ngôn ngữ hình ảnh, không phải sprite sheet runtime. Sau khi duyệt mới làm animation 4 hướng, test trong Godot với camera 1× và 2×, đối chiếu silhouette, hướng vũ khí, transparency, timing và hit. Không tuyên bố concept image là animation hay asset đã import.

## Gate
A1: owner duyệt phong cách và tỷ lệ. A2: sheet đúng grid/alpha/anchor và frame-by-frame thật. A3: runtime Godot test với 12 actor, skill VFX và UI. A4: đồng bộ palette, nhận diện, FPS trước batch 100–200 ninja. Hiện chỉ D1 concept; A2–A4 chưa thực hiện.
