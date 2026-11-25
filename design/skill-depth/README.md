# SKILL-DEPTH V1 — Đề xuất chờ chủ dự án chốt
## Phạm vi
Dừng mở rộng UI/UX/hệ thống khác ở Chat 00, làm rõ kỹ năng trước. GDD khóa: cấp luôn thành công, cấp giới hạn trong giai, tiến giai xác suất, tuyến tính/phân nhánh, toàn bộ skill mở được sử dụng, tuyệt kỹ bấm. Dữ liệu D4/P2/P3/P4/P1 không ghi đè.
## Lỗi V6 thực tế
- effective_skill factor (1+.02*(L-1))*(1+.12*(G-1)); G1 L20 1.38, G2 L1 1.12, mất sức mạnh khi thành công.
- stars 1..15 chỉ dùng ở stage_difficulty proxy; Stats.derive chưa dùng. Không coi sao đã tăng sức mạnh thật.
- B2 phạm vi P2 circle có 1.15×1.05; với kỹ năng đơn mục tiêu có thể không có tác dụng; mastery P2 đếm confirm, cần chặn nhiều hit/cast, chống farm.
## Phương án
F=1+0.50*(G-1)+0.02*(L-1). G1 L1=1, G1 L20=1.38, G2 L1=1.50. Giai vô hạn, 20 cấp/giai; 0.38 hệ số cấp cộng 0.12 bước tiến giai. S0 không luyện riêng. 1008 skill luyện cấp, 792 tuyến tính,216 phân nhánh. 1152 per-ID profiles. Sát thương/HP thật áp F một lần, tổng hệ số qua tất cả hit/DoT. Hỗ trợ dùng hàm tăng trưởng tương ứng; non-damage utility tăng hiệu suất có cap thay vì nhân hệ số 0. 48 stats/caps giữ nguyên; cấm hiệu ứng lặp vô hạn.
Sao đề xuất 4%/sao vượt 1 lên phần chỉ số tự nhiên trước cộng điểm/đồ; không nhân trực tiếp lần nữa lên skill, không khóa giai bằng sao. Phẩm chất chỉ tăng growth; level/realm riêng. Thành thạo không cộng damage trực tiếp; điều kiện S6/S7 theo ID, grade, realm, mastery, trial hiện hành; có 288 trial. Giữ 500/1500 nếu chưa duyệt điều chỉnh; credit 1 meaningful cast, dedupe và chống farm; fractional talent credit. 216 nhánh dùng ID cũ B1/B2 và cấp mở cũ, tác dụng phù hợp profile; chọn độc quyền, không reset.
Level cost và grade cost/xác suất giữ nguyên runtime, pity 4 fail -> lần 5 đảm bảo. Bảo toàn save. Không ép Chat 01 sửa trong lúc chưa chốt. 
## Review
Đọc rules.json, per_skill_progression.json, audit.json. Tất cả lựa chọn mới (F, 4% sao, hiệu ứng nhánh, mastery) là DEV đề xuất chưa duyệt; kiểm tra cấu trúc và số học, không test Godot. Chat 00 làm rõ tiếp từng cơ chế với người dùng trước khi bàn giao.
