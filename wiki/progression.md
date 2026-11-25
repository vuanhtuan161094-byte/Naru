# Tu luyện và hệ thống đặc biệt

[Mục lục](README.md) · Nguồn thiết kế BALANCE-P1; mọi số liệu mới là DEV, chưa phải thông số runtime được nghiệm thu.

## Cấp và cảnh giới
XP cần mỗi cấp: ceil(100×L^1.6×(1+0.15×cảnh giới)). 20 cấp mỗi cảnh giới, +3 điểm/cấp. Đột phá cần RES-128, ceil(3×(realm+1)^1.4), bảo hiểm sau 5 thất bại; không mất XP/cấp. 8 phẩm chất, 15 sao, tăng trưởng vô hạn. Không coi số liệu mô phỏng là thông số nguyên tác.

## Kỹ năng
S0 đánh thường; S1–4 tự động; S5 tuyệt kỹ người chơi bấm, AI chọn mục tiêu; S6–7 mở qua thử thách. Mỗi giai tối đa 20 cấp. Cấp luôn thành công; giai có xác suất và bảo hiểm. Công thức chi phí và giai lấy từ data/balance_rules.json; từng yêu cầu mở khóa tại hồ sơ ninja.

## 48 chỉ số

| ID | Công thức | Đơn vị | Lưu trữ |
| --- | --- | --- | --- |
| vitality | base + growth_per_level*(level-1)*quality_multiplier + allocated + training + permanent + gear_flat | points | unbounded |
| strength | base + growth_per_level*(level-1)*quality_multiplier + allocated + training + permanent + gear_flat | points | unbounded |
| spirit | base + growth_per_level*(level-1)*quality_multiplier + allocated + training + permanent + gear_flat | points | unbounded |
| agility | base + growth_per_level*(level-1)*quality_multiplier + allocated + training + permanent + gear_flat | points | unbounded |
| intellect | base + growth_per_level*(level-1)*quality_multiplier + allocated + training + permanent + gear_flat | points | unbounded |
| potential | base + growth_per_level*(level-1)*quality_multiplier + allocated + training + permanent + gear_flat | points | unbounded |
| hp | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | flat | unbounded |
| armor | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| nres | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| hp_regen | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | per_second | unbounded |
| damage_reduction | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| crit_resist | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| patk | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | flat | unbounded |
| armor_pen | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | flat | unbounded |
| attack_speed | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| accuracy | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| evasion | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| counter | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| natk | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | flat | unbounded |
| magic_pen | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | flat | unbounded |
| ncrit | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| element_power | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| area | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| cast_speed | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| genjutsu_power | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| control_chance | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| control_duration | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| control_resist | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| genjutsu_resist | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| cleanse | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| chakra_max | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | flat | unbounded |
| chakra_regen | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | per_second | unbounded |
| chakra_efficiency | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| chakra_drain | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| chakra_drain_resist | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| chakra_conversion | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| move_speed | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| pcrit | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| crit_damage | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| lifesteal | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| healing | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| cdr | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| insight | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| training_speed | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| comprehension | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| xp_efficiency | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| mastery_speed | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |
| absorption | max(0,base + sum(weights*base_stats)+per_level*level+specialization+gear_flat+permanent) | rating | unbounded |

## 8 trận pháp

| ID | Tên | Buff | Cấp 1/10/20 | Liên kết |
| --- | --- | --- | --- | --- |
| FRM-01 | Cân Bằng | attack | 3% / 6.6% / 10.6% | adjacent; tối đa 5% |
| FRM-02 | Phong Thỉ | attack | 6% / 9.6% / 13.6% | lane; tối đa 5% |
| FRM-03 | Thiết Bích | defense | 6% / 9.6% / 13.6% | rank; tối đa 5% |
| FRM-04 | Hạc Dực | move | 6% / 9.6% / 13.6% | adjacent; tối đa 5% |
| FRM-05 | Trường Xà | chakra | 6% / 9.6% / 13.6% | lane; tối đa 5% |
| FRM-06 | Nguyệt Ảnh | attack | 6% / 9.6% / 13.6% | diagonal; tối đa 5% |
| FRM-07 | Bát Quái | defense | 6% / 9.6% / 13.6% | diagonal; tối đa 5% |
| FRM-08 | Linh Trận | chakra | 6% / 9.6% / 13.6% | rank; tối đa 5% |

## 9 vĩ thú

| ID | Tên | Host ưu tiên | Điều kiện | XP kế tiếp L10/L100 |
| --- | --- | --- | --- | --- |
| BIJ-1 | Shukaku | NIN-024 | {"realm":5,"seal_resource":"RES-100","seal_qty":1} | 3982 / 158490 |
| BIJ-2 | Matatabi | NIN-100 | {"realm":6,"seal_resource":"RES-100","seal_qty":2} | 3982 / 158490 |
| BIJ-3 | Isobu | NIN-101 | {"realm":7,"seal_resource":"RES-100","seal_qty":3} | 3982 / 158490 |
| BIJ-4 | Son Goku | NIN-102 | {"realm":8,"seal_resource":"RES-100","seal_qty":4} | 3982 / 158490 |
| BIJ-5 | Kokuo | NIN-103 | {"realm":9,"seal_resource":"RES-100","seal_qty":5} | 3982 / 158490 |
| BIJ-6 | Saiken | NIN-104 | {"realm":10,"seal_resource":"RES-100","seal_qty":6} | 3982 / 158490 |
| BIJ-7 | Chomei | NIN-105 | {"realm":11,"seal_resource":"RES-100","seal_qty":7} | 3982 / 158490 |
| BIJ-8 | Gyuki | NIN-076 | {"realm":12,"seal_resource":"RES-100","seal_qty":8} | 3982 / 158490 |
| BIJ-9 | Kurama | NIN-041 | {"realm":13,"seal_resource":"RES-100","seal_qty":9} | 3982 / 158490 |

## 11 thông linh

| ID | Tên | Vật phẩm | Tồn tại | Tỉ lệ chỉ số chủ |
| --- | --- | --- | --- | --- |
| SUM-001 | Gamabunta | RES-148 | 12s | 0.25 |
| SUM-002 | Gamaken | RES-148 | 12s | 0.27 |
| SUM-003 | Gamahiro | RES-148 | 12s | 0.29 |
| SUM-004 | Manda | RES-148 | 12s | 0.31 |
| SUM-005 | Aoda | RES-148 | 12s | 0.33 |
| SUM-006 | Katsuyu | RES-148 | 12s | 0.35 |
| SUM-007 | Enma | RES-148 | 12s | 0.37 |
| SUM-008 | Pakkun | RES-148 | 12s | 0.39 |
| SUM-009 | Ninken | RES-148 | 12s | 0.41000000000000003 |
| SUM-010 | Kamatari | RES-148 | 12s | 0.43 |
| SUM-011 | Nue | RES-148 | 12s | 0.45 |

## Huyết kế

| ID | Tên | Nhóm | Điều kiện bản địa | Cấy ghép |
| --- | --- | --- | --- | --- |
| BL-137 | Sharingan | ocular | {"realm":3,"resource_qty":10}; native family/element and explicit snapshot compatibility | HOLD until compatibility matrix and trial evidence; sandbox only; no campaign canon unlock |
| BL-138 | Byakugan | ocular | {"realm":3,"resource_qty":10}; native family/element and explicit snapshot compatibility | HOLD until compatibility matrix and trial evidence; sandbox only; no campaign canon unlock |
| BL-139 | Rinnegan | ocular | {"realm":3,"resource_qty":10}; HOLD automatic Rinnegan from Uchiha family; require explicit compatible version, not family alone | HOLD until compatibility matrix and trial evidence; sandbox only; no campaign canon unlock |
| BL-140 | Mộc Độn | body_bloodline | {"realm":3,"resource_qty":10}; native family/element and explicit snapshot compatibility | HOLD until compatibility matrix and trial evidence; sandbox only; no campaign canon unlock |
| BL-141 | Băng Độn | body_bloodline | {"realm":3,"resource_qty":10}; native family/element and explicit snapshot compatibility | HOLD until compatibility matrix and trial evidence; sandbox only; no campaign canon unlock |
| BL-142 | Dung Độn | body_bloodline | {"realm":3,"resource_qty":10}; native family/element and explicit snapshot compatibility | HOLD until compatibility matrix and trial evidence; sandbox only; no campaign canon unlock |
| BL-143 | Trần Độn | body_bloodline | {"realm":3,"resource_qty":10}; native family/element and explicit snapshot compatibility | HOLD until compatibility matrix and trial evidence; sandbox only; no campaign canon unlock |

## Chiêu mộ

| Phẩm chất | Số ninja | Xác suất nền |
| --- | --- | --- |
| N | 12 | 30.00% |
| R | 24 | 25.00% |
| SR | 42 | 20.00% |
| SSR | 43 | 13.00% |
| UR | 12 | 7.00% |
| LR | 5 | 3.00% |
| SP | 3 | 1.50% |
| EX | 3 | 0.50% |

Xác suất nền không tính bảo hiểm. Không tiền thật; trùng ID thành mảnh, giữ bộ đếm bảo hiểm.

## Đề xuất chi tiết kỹ năng (chưa chốt)
Xem [SKILL-DEPTH V1](../design/skill-depth/README.md), không áp dụng vào V6. Cấp/giai, sao, thành thạo, nhánh và chi phí được tách rõ; lỗi giảm hệ số sau tiến giai cần sửa khi được duyệt.
