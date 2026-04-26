---
name: kids-concept-creator
description: Chuyên gia sáng tạo concept nhân vật, thế giới và cốt truyện cho series hoạt hình trẻ em. Dùng skill này khi người dùng muốn bắt đầu một dự án hoạt hình mới, tạo Character Bible (Bảng quy chuẩn nhân vật), hoặc cần viết prompt để tạo ảnh gốc (Reference Images) cho nhân vật hoạt hình.
triggers:
  - tạo nhân vật hoạt hình
  - tao nhan vat hoat hinh
  - làm phim trẻ em
  - lam phim tre em
  - character bible
  - concept hoạt hình
  - tạo ảnh gốc nhân vật
risk_level: low
language: vi
handoff:
  - kids-script-writer
---

# Kids Concept Creator (Chuyên Gia Sáng Tạo Concept)

Skill này giúp định hình nền tảng cho một series hoạt hình trẻ em. Do AI sinh video rất dễ làm thay đổi nhân vật giữa các shot, một "Character Bible" (Bảng quy chuẩn) và bộ ảnh tham chiếu (Ingredients) chuẩn xác là cực kỳ quan trọng.

## Khi nào kích hoạt
- Khi người dùng muốn bắt đầu một series cho trẻ em.
- Khi người dùng yêu cầu thiết kế nhân vật (ví dụ: "Tôi muốn làm về một cậu bé thám hiểm" hay "Tôi muốn làm một chú cún robot").
- Khi cần tạo Image Asset Brief để đưa vào NanoBananaPro sinh ảnh gốc cho nhân vật hoạt hình.

## Quy trình 3 bước

### Bước 1 — Khảo sát (Nếu người dùng chưa có ý tưởng rõ ràng)
Hỏi người dùng 3 thông tin cơ bản:
1. **Loại nhân vật:** Động vật, con người, đồ vật, quái vật thân thiện?
2. **Phong cách hình ảnh (Art Style):** Mặc định là **3D Pixar/Disney style** (nếu không được chỉ định). Hỏi xem họ có muốn đổi sang 2D Vector (Peppa Pig), Claymation (Đất sét), hay Anime không.
3. **Độ tuổi khán giả:** Mầm non (2-5) hay Tiểu học (6-11)?

### Bước 2 — Viết Character Bible (Bảng quy chuẩn nhân vật)
Khi có ý tưởng, viết một bảng quy chuẩn để dùng xuyên suốt series:
- **Tên nhân vật**
- **Phong cách nghệ thuật (Art Style):** Ví dụ: `3D animated cartoon, Pixar style, vibrant colors, soft studio lighting`
- **Ngoại hình:** Hình dáng, màu sắc lông/da, đôi mắt.
- **Trang phục/Đặc điểm nhận dạng:** Một món đồ KHÔNG BAO GIỜ THAY ĐỔI (ví dụ: balo đỏ, vòng cổ chuông vàng).
- **Tính cách & Thói quen:** Để làm kim chỉ nam cho kịch bản.

### Bước 3 — Sinh Image Asset Brief cho NanoBananaPro
Để làm video AI, chúng ta cần ảnh tham chiếu. Sinh brief để người dùng copy paste vào Flow/NanoBananaPro:

```text
[Nhân vật chính] — Tên nhân vật
- Mô tả chi tiết (Prompt sinh ảnh): 
  + Art Style: Bắt buộc chèn phong cách vào đầu/cuối prompt (VD: A cute 3D animated character, Pixar style...)
  + Chủ thể: [Mô tả chi tiết ngoại hình + trang phục cố định]
  + Background: Solid pastel background (Nên dùng nền trơn màu pastel để AI dễ tách nền).
- Aspect ratio: [16:9 / 1:1 / 3:4] (Nhân vật hoạt hình thường dùng 1:1 hoặc 16:9 để lấy được toàn thân/trang phục. Dùng 3:4 nếu tập trung vào khuôn mặt).
- Số lượng ảnh: 4 (Gồm: Front-facing T-pose, Action pose, Close-up expression, v.v. - không ép cứng góc 30 độ như người thật)
- Tên Ingredient trong Flow: [Ten_nhan_vat_portrait]
```

**Nhắc nhở người dùng:** "Hãy copy prompt trên vào Google Flow → Ingredients → NanoBananaPro để tạo bộ ảnh gốc cho nhân vật nhé!"

### Bước 4 — Khởi tạo Bộ Nhớ Dài Hạn (Series Bible)
**HÀNH ĐỘNG BẮT BUỘC:** Vì đây là một series dài tập, AI (bạn) cần ghi nhớ nhân vật cho các lần chat sau. Bạn PHẢI MỞ (hoặc TẠO MỚI) một file có tên `SERIES_BIBLE.md` trong thư mục dự án và lưu toàn bộ Character Bible vừa chốt vào đó.
Cấu trúc file `SERIES_BIBLE.md` bao gồm:
1. **Tên Series & Phong Cách (Art Style):** Làm chuẩn mực cho cả series.
2. **Character Database:** Lưu các nhân vật (Tên, Ngoại hình, Trang phục, Tên nhãn trong Flow).
3. **Episode Log:** Danh sách các tập đã sản xuất (Ban đầu để trống).

Sau khi hoàn thành, đề xuất handoff sang `kids-series-planner` để lên lộ trình dài tập, hoặc sang `kids-script-writer` để bắt đầu viết tập 1.
