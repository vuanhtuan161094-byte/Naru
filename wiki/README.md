# Naru — Bách khoa nội bộ tiếng Việt

Bản thiết kế, không phải Wiki thông số đã nghiệm thu của bản Web hiện tại. Ưu tiên quyết định người chơi đã khóa > GDD > SKILL-P2 cơ chế > SKILL-P3/P4 nguồn/thời kỳ > BALANCE-P1 tham số thử nghiệm. D4 là fallback cho adapter chưa hỗ trợ; không xóa save hoặc ID. 

## Tra cứu
- [144 ninja và 1.152 nhẫn thuật](ninja-index.md): 12 tập; từng chiêu có P2/P1, chakra, CD, geometry, hit, mở khóa, tiến hóa, VFX, nguồn.
- [Tu luyện, chỉ số, trận pháp, vĩ thú và thông linh](progression.md)
- [Công trình và nghề nghiệp](village.md)
- [Tài nguyên và công thức](resources.md)
- [Trang bị](equipment.md)
- [120 phó bản và 24 chương](campaign.md)
- [Nhẫn giới, nhiệm vụ, thử thách](world.md)
- [Hướng dẫn chơi](play-guide.md)
- [Nguồn SKILL-P4](../design/skill-p4/README.md), [GDD](../design/MASTER_GDD_D2.md), [BALANCE-P1](../design/balance-p1/HANDOFF_01_02.md)

## Trạng thái
Wiki sinh từ ID thiết kế, không bịa thêm công thức. Các cột P2/P1 là lựa chọn trước/sau điều chỉnh; không mặc định áp dụng vào save hiện tại. Một số dữ liệu chi tiết còn ở dạng tham chiếu ID/JSON. GDD và file JSON gốc là nguồn ưu tiên. 

[Ma trận nghiệm thu toàn game](../design/product-audit/PRODUCT_AUDIT.md) · [Bàn giao sản xuất](../design/product-audit/HANDOFF_01_02.md)

## PASSIVE-P2 / COMBAT-SYNERGY-P1 (DEV)
- [Nội tại P2 — pilot 12 ninja / 72 nội tại](passive-p2-pilot.md)
- [Luật tương tác, khắc chế, trận pháp và bài test 6v6](../design/combat-synergy-p1/README.md)
- [Kiểm toán ID và liên kết ứng viên 2.016 kỹ năng](../design/combat-synergy-p1/interaction-audit.json)
- [Phân tích áp lực giới hạn 12 đội hình](../design/combat-synergy-p1/6v6-passive-pressure.json)

Còn 132 ninja / 792 nội tại cần cá thể hóa riêng. Chưa xác nhận cân bằng runtime, không thay Wiki active hoặc luật P1 đã có.
