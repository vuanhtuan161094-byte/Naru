# COMBAT-SYNERGY-P1 — thiết kế tương tác (DEV)
## Phạm vi
Giữ 144 ninja, 1152 chủ động, 864 nội tại, 54 hình thái, 12 combo, 8 trận pháp. Không thay ID, tài năng, save hoặc luật trận đấu đã khóa. Dữ liệu index là lớp tra cứu P1/P2, không thay thế overlay cân bằng V5 hoặc chính sách nguồn P3/P4. 72 nội tại pilot là đề xuất, chưa kích hoạt mặc định.
## Thứ tự giải quyết tương tác
1. Lấy snapshot chỉ số trước nội tại (gồm các nguồn hợp lệ hiện có); không tính lại sao hay thiên phú hai lần. Tách buff stat-relative, buff payload, giảm sát thương, giảm CP và điều kiện kích hoạt. Không dùng một hệ số tổng chung.
2. Thu thập nội tại tự thân, aura hợp lệ, buff sự kiện mạnh nhất mỗi recipient/key. Trừ debuff mạnh nhất cùng key, áp cap P1 theo đơn vị tương ứng; sau đó đưa vào chuyển đổi rating/resolver V3/V5. Không cộng aura cùng key từ nhiều nguồn. Khi nguồn chết, rời trận hoặc mất điều kiện, cập nhật ngay. Khi HP/CP max thay đổi giữ tỷ lệ, không sinh hồi máu/chakra.
3. AI đánh giá mục tiêu hợp lệ theo range/LOS, chakra, hồi chiêu, mức độ lãng phí và phản khắc; không tự dùng S5 của người chơi. Chọn mục tiêu cho S5 sau yêu cầu thủ công. Không bắt buộc trận kết thúc do timer.
4. Resolve parent cast và payload theo hợp đồng runtime hiện có: khóa đích, loại hình học, giới hạn hit, target cap, miễn nhiễm, hiệu ứng thực nhận. Trước combo chỉ dùng modifier thuần nếu hợp lệ. Sau sự kiện xác thực mới xét proc nội tại. Không dùng cast start như hit hoặc thành công. Dedupe actor/passive/parent cast; DOT, phản đòn child, combo child, summon child không khởi tạo chuỗi proc. Visual receipt không sinh logic chiến đấu.
5. Cộng dồn active buff, thiên phú, trận pháp và nội tại vẫn dùng resolver/cap hiện hữu; không tự nhân toàn bộ modifier độc lập. Trường hợp thứ tự V3/V5 chưa rõ yêu cầu Chat01 trả về kết quả kiểm chứng, không tự ghi đè luật.
## Tương tác theo nhóm
| Nhóm | Điều kiện hợp lệ | Chặn / khắc chế | Chỉ số kiểm tra |
|---|---|---|---|
| Đấu sĩ + phân thân | NIN-001-S1 spawn hợp lệ → P2 buff tự thân, không spawn thêm | hạ phân thân, chặn dash | proc/parent, thời gian sống phân thân |
| Hỏa cầu + Lôi kích | NIN-002-S1 critical confirmed → P2 chính xác; S5 vẫn phải bấm | giãn đội, gián đoạn, kháng | damage confirmed, accuracy rating, CP |
| Giải ảo + hồi phục | NIN-003-S1 thực sự xóa hiệu ứng → P2 hồi CP theo rating regen; S2 heal thực mới xét P6 | miễn nhiễm, ép cooldown, áp lực diện rộng | cleanse count, effective heal, overheal |
| Tường + lao | NIN-004-S1 chặn hợp lệ → P2 chính xác, không áp proc chỉ vì tường xuất hiện | đi vòng tường, chặn dash | wall block receipts, target lock |
| Ảnh trói + khống chế | NIN-007-S1 status thực nhận → P2 control duration, P6 debuff theo P1 cap | kháng, thanh tẩy, rời phạm vi | CC uptime, resist, không CC vô hạn |
| Bội hóa + chống chịu | NIN-008-S1 activate form hợp lệ; P5 chỉ payload hợp lệ, không buff nút biến thân | chờ hết hình thái, phá liên kết đội | form active, aura radius, damage reduction |
| Hút chakra + áp chế | NIN-012-S1 resource effect thực nhận; P2 regen, không tính tick child | kháng hút chakra, tránh vùng | CP thực mất/nhận, proc once |
| Hấp thụ | NIN-068-S1/NIN-130-S1 chỉ xác nhận resource_effect nếu adapter ghi thay đổi tài nguyên thực, không suy từ tên absorb | tránh cấp mục tiêu hấp thụ, dùng chiêu hợp lệ khác | net CP before/after, reject no-op |
| Nguyên tố | dùng authored element/status/luật phản ứng V3; không cho passive đổi nguyên tố của chiêu | kháng, môi trường, thanh tẩy đúng loại | thứ tự reaction, source uid, không hit trùng |
| Combo | exact 12 registry combo IDs, đủ điều kiện người tham gia, strongest modifier cap 8% | loại người tham gia, gián đoạn điều kiện | combo ID, parent, payload thực |
| Thiên phú | đọc fixed/random/unique talent đã có; nội tại không sửa talent ID hay growth ngoài trận | tùy điều kiện gốc | snapshot before/after, không double apply |
| Hình thái | exact form ID và giao với empowered list, payload typed >0 | ngắt kích hoạt hợp lệ / chờ hết thời gian | form ID, typed coefficient, no unlock bypass |
## Sáu vấn đề đã phát hiện
NIN-053-P5, NIN-076-P5, NIN-130-P5, NIN-136-P5: S5 là form activation hoặc stance, coefficient 0; đề nghị loại S5 khỏi danh sách payload, giữ S6 (053/076) hoặc S7 (130/136) nếu AND với empowered list chính thức. Nếu giao rỗng, HOLD; không tạo skill thay thế. NIN-068-P2 và NIN-130-P2: S1 absorb cần receipt resource_effect_confirmed chỉ khi chuyển đổi chakra thực; trường hợp không có thay đổi tài nguyên, không proc. Chưa tự sửa baseline.
## Tám trận pháp — giữ số liệu BALANCE-P1
| ID | Nhóm | Kiểm thử phối hợp nội tại |
|---|---|---|
| FRM-01 | Cân Bằng / attack / adjacent | so cùng đội có/không aura attack, không cộng hai lần link |
| FRM-02 | Phong Thỉ / attack / lane | dash phá đội hình, xác minh link mất đúng điều kiện |
| FRM-03 | Thiết Bích / defense / rank | sustain cap, tank chết, không tồn tại aura mồ côi |
| FRM-04 | Hạc Dực / move / adjacent | rời radius, tốc độ thay đổi, không teleport |
| FRM-05 | Trường Xà / chakra / lane | CP discount, regen, floor 1, không miễn phí chiêu |
| FRM-06 | Nguyệt Ảnh / attack / diagonal | hướng tiếp cận và combo, link chéo hợp lệ |
| FRM-07 | Bát Quái / defense / diagonal | tương tác kháng/giảm sát thương đúng đơn vị |
| FRM-08 | Linh Trận / chakra / rank | giữ tỷ lệ CP max, không refund hoặc proc threshold khi resize |
Mức trận pháp 1/10/20, link cap 5% theo wiki hiện hữu; không đề nghị thay các số này trong checkpoint.
## Cân bằng 6v6 — pressure test
12 đội 6 ninja theo 6 pattern (balanced/sustain/burst/control/frontline/support), mỗi pattern 2 biến thể; G1/3/10, L20, sao 1/5/10/15. 144 trường hợp, 14.688 đánh giá recipient/stat. Tất cả 144 có ít nhất một key bão hòa trong giả định buff đồng thời; tối đa 13 recipient/key bão hòa (sustain-2), tổng raw cao nhất 31.459%. Ví dụ G10/sao15 NIN-114 damage_reduction 22.828% raw, effective 10%. Đây là giới hạn trên giả định, không phải tỉ lệ thắng hay DPS, không thay đổi cap. 0 vượt cap sau clamp là hệ quả công thức, không chứng minh engine đúng. Không mô phỏng B2, enemy debuff, active buff, formation, form, combo, thời gian, source gate; một passive element/complex family bị loại.
## Đề nghị test runtime
12 đội ở pressure file đấu mirror và counter, cùng level/realm/grade/star/gear; chạy mỗi trận với 8 trận pháp theo seed cố định; log win/loss/unresolved, damage/heal thực, CP tiêu/nhận, CC uptime, số proc, link loss, cap saturation và thời gian kết thúc. So P1 on/off và pilot on/off, giữ mọi thứ khác. Tách scenario khác cảnh giới; không lấy đội hình có ID version trùng identity khi roster cấm. Watchdog chỉ đánh dấu unresolved, không tạo hard timer ingame. S5 manual test riêng, replay deterministic. Chưa chạy Godot trên design branch.
## Bàn giao
Chat01 có thể dùng index + 6 vấn đề để hoàn thiện adapter, không lấy candidate event làm bằng chứng runtime. P2 pilot optional DEV, re-evaluate B2/effective preview/source gates. Chat02 tiếp tục frame-by-frame và icon event receipt; chưa mở hàng loạt VFX kỹ năng. Chat00 tiếp tục 132 ninja/792 nội tại và cá thể hóa cơ chế, source review, 54 forms/12 combos cross-check. Không Codex Cloud/no merge.
