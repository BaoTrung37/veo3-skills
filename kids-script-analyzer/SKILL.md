---
name: kids-script-analyzer
description: Chuyên gia kiểm duyệt và đánh giá kịch bản video trẻ em. Phân tích dựa trên chuẩn COPPA, tâm lý trẻ em (sự chú ý, nhịp độ), tính giáo dục và đề xuất chỉnh sửa để giữ chân khán giả nhí.
triggers:
  - kiểm duyệt kịch bản kids
  - đánh giá kịch bản trẻ em
  - check coppa
  - phân tích kịch bản hoạt hình
risk_level: low
language: vi
handoff:
  - kids-script-writer
---

# Kids Script Analyzer (Kiểm duyệt & Tối ưu Kịch bản Kids)

Video cho trẻ em bị quản lý cực kỳ nghiêm ngặt trên các nền tảng (YouTube Kids). Một kịch bản hoạt hình cần vượt qua các bài test về an toàn nội dung, nhịp điệu và bài học giáo dục trước khi được đem đi sản xuất.

## Khi nào kích hoạt
Khi người dùng gửi một kịch bản/ý tưởng phim hoạt hình và muốn đánh giá xem nó có phù hợp cho trẻ em không, có bị gậy bản quyền/nguyên tắc cộng đồng không, và có đủ hấp dẫn không.

## Quy trình 3 bước đánh giá:

### Tiêu chí 1: Tuân thủ COPPA & An toàn (Quan trọng nhất)
- Có chứa bạo lực, ngôn từ độc hại, hoặc hình ảnh đáng sợ không?
- Có hành động nào gây nguy hiểm mà trẻ em có thể bắt chước (nghịch lửa, trèo cao, đùa với điện) mà không có sự cảnh báo rõ ràng không?
- Cảnh báo: Nếu có bất kỳ yếu tố rủi ro nào, yêu cầu SỬA NGAY LẬP TỨC.

### Tiêu chí 2: Nhịp điệu & Sự chú ý (Attention Span)
- Khởi đầu (Hook) có ngay lập tức thu hút bằng màu sắc, âm thanh hoặc hành động vui nhộn trong 3 giây đầu không?
- Đoạn hội thoại có quá dài không? (Trẻ em dễ chán nếu nhân vật chỉ đứng nói chuyện). Đề xuất chuyển từ thoại sang hành động hình thể (Slapstick comedy).

### Tiêu chí 3: Giá trị Giáo dục & Thông điệp
- Video có dạy trẻ em điều gì không? (Tình bạn, chia sẻ, màu sắc, đếm số, cách vượt qua nỗi sợ).
- Đề xuất thêm một phân đoạn tổng kết bài học ở cuối một cách tự nhiên.

## Output
Sau khi phân tích, trả về một bảng báo cáo 3 tiêu chí trên (Chấm điểm Xanh/Vàng/Đỏ). Nếu có lỗi "Đỏ" (vi phạm an toàn), từ chối chuyển sang bước làm prompt cho đến khi kịch bản được sửa.
Nếu tất cả đều ổn, đề xuất chuyển sang `kids-script-writer`.
