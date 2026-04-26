---
name: smart-script-processor
description: Flow tự động đọc kịch bản, phân tích điểm yếu, tự động tối ưu lại nội dung (nhịp điệu, lời thoại, hành động) và lập tức sinh ra bộ prompt Veo 3 hoàn chỉnh. Dùng khi người dùng nói "đọc kịch bản", "tự động làm video", "xử lý kịch bản này".
triggers:
  - đọc kịch bản
  - doc kich ban
  - tự động làm video
  - tu dong lam video
  - xử lý kịch bản
  - xu ly kich ban
risk_level: low
language: vi
handoff:
  - flow-operator
---

# Smart Script Processor (Tự Động Phân Tích & Tạo Prompt Veo 3)

Skill này là một luồng (flow) tự động liền mạch (All-in-One). Khi người dùng đưa một kịch bản thô và gọi skill, hệ thống sẽ đóng vai trò như một chuyên gia biên tập (Script Analyzer) kết hợp với kỹ thuật viên AI Video (Veo 3 Script Writer) để cho ra kết quả cuối cùng mà không cần người dùng phải xác nhận qua từng bước.

## Khi nào kích hoạt

- "Đọc kịch bản này và làm video đi"
- "Đọc kịch bản: [nội dung...]"
- Người dùng gửi một file và nói "đọc kịch bản".

## Quy trình 5 Bước Tự Động (Zero-Click Flow)

Skill này thực hiện toàn bộ 5 bước dưới đây **trong một lần phản hồi duy nhất**. Không dừng lại hỏi người dùng trừ khi kịch bản hoàn toàn không thể hiểu được.

### Bước 1 — Tiếp nhận & Phân tích Nhanh (Fast Analysis)

- Đọc toàn bộ nội dung kịch bản.
- Đánh giá nhanh:
  - **Hook:** Đủ hấp dẫn trong 3s đầu không?
  - **Nhịp điệu & Thoại:** Có câu thoại nào quá dài (trên 30 chữ, không vừa trong 8s của Veo 3) không?
  - **Hành động (Action):** Có "Show, don't tell" (mô tả hành động thay vì chỉ nói) không?

### Bước 2 — Tự Động Tối Ưu (Auto-Refinement)

- **Không cần hỏi ý kiến**, tự động viết lại/tinh chỉnh kịch bản để đạt chuẩn AI Video:
  - Cắt ngắn các câu thoại dài lê thê xuống dưới 30 chữ/cảnh.
  - Bổ sung mô tả hành động (Action) nếu kịch bản gốc chỉ có thoại.
  - Sửa lại Hook nếu đoạn mở đầu quá nhàm chán (thêm hành động giật gân hoặc góc máy bất ngờ).
- Lưu ý: Giữ nguyên cốt truyện và ý nghĩa, chỉ tối ưu cách thể hiện hình ảnh và độ dài.

### Bước 3 — Trích xuất "Image Asset Brief"

- Dựa trên kịch bản đã tối ưu, liệt kê toàn bộ entity cần tạo ảnh tham chiếu (Ingredients) trên Flow bằng NanoBananaPro:
  - **Nhân vật (Characters):** Tên, ngoại hình, trang phục mặc định. (Chân dung → Aspect ratio: 3:4, Chỉ cần 1 lần gen ra 4 ảnh chính diện).
  - **Bối cảnh (Locations):** Mô tả chi tiết để lặp lại trong prompt. (Toàn cảnh → Aspect ratio: 16:9).
  - **Đồ vật/Con vật (Props/Animals):** Aspect ratio 1:1 hoặc 4:3.
- *Nhắc nhở người dùng ở cuối brief:* Hãy sinh ảnh bằng NanoBananaPro trên Flow trước khi render.

### Bước 4 — Sinh Prompt Veo 3 (Mặc định dọc 9:16)

- Chuyển kịch bản đã tối ưu thành các phân cảnh 8 giây (Chuẩn Veo 3).
- **Mặc định sử dụng định dạng 9:16 (Video dọc)**. Nếu người dùng không chỉ định, cứ mặc định 9:16.
- **Spec render cố định:** Veo 3.1 - Fast [Lower Priority] (tuyệt đối KHÔNG sử dụng loại khác), x4 Take, 8s.
- Viết mỗi phân cảnh thành MỘT ĐOẠN VĂN DUY NHẤT (không có dấu xuống dòng) để tránh lỗi tự động Submit trên Flow:
  ```text
  Phân cảnh [N]:
  Time: [thời gian trong ngày, mùa]. Location: [Bối cảnh chi tiết. Tái xuất phải lặp y nguyên chữ]. Subject: [Vai trò nhân vật chính (không tả ngoại hình), hoặc tả chi tiết nếu là nhân vật phụ. Lặp y nguyên trang phục]. Props: [đạo cụ xuất hiện, lặp y nguyên tên đã định nghĩa]. Emotion: [biểu cảm khuôn mặt và thần thái]. Action: [Hành động chủ đạo trong 8s]. Camera Angle: [cận, trung, toàn, mắt chim...]. Camera Movement: [tĩnh, lia máy, đẩy vào, tracking...]. Lighting & Style: [ánh sáng và phong cách hình ảnh]. SFX: [âm thanh môi trường/tiếng động]. Line: "[thoại dưới 30 chữ]" (Hoặc "(không có thoại)"). Voice Tone: [cảm xúc/thái độ]. Ở bước này, bạn hãy Chọn giọng đọc phù hợp ở bên dưới để thêm vào Câu Lệnh.
  ```

### Bước 5 — Output Kép (Chat & File)

Trình bày kết quả theo đúng thứ tự:
1. **[Tóm tắt bản tối ưu]** (1-2 câu giải thích bạn đã tối ưu những gì từ kịch bản gốc: ví dụ "Tôi đã rút ngắn thoại và thêm hành động...").
2. **[Image Asset Brief]** (Danh sách Nhân vật & Bối cảnh cần làm ảnh).
3. **[Spec Render]** (Ghi rõ 9:16, Veo 3.1 - Fast [Lower Priority] (tuyệt đối không sử dụng loại khác), x4 Take).
4. **[Danh sách Prompt]** (Từ Phân cảnh 1 đến hết).
5. **[Giọng đọc gợi ý]** (Đọc từ `references/voice-tones.md` của thư mục `veo3-script-writer` nếu có, hoặc tự đề xuất 2 giọng phù hợp).
6. **Lưu thành file `.md`:** Dùng tool write_to_file để lưu toàn bộ nội dung từ phần "Tóm tắt bản tối ưu" đến "Danh sách Prompt" vào thư mục `E:\Ai Video\scripts\` với tên `doc-kich-ban-[ten-ngan]-[YYYYMMDD].md`.
7. Gửi link tới file vừa tạo và **kích hoạt handoff sang flow-operator**:
   > Antigravity có thể tự động mở Flow, tạo Ingredients và submit từng Shot render thay bạn. Gõ **"làm trên Flow cho tôi"** để bắt đầu.

## Quy Tắc Bất Biến

1. **Làm một mạch từ đầu đến cuối.** Không dừng lại để "Xin phép sửa kịch bản" hay "Hỏi tỉ lệ khung hình". Cứ tối ưu, chọn 9:16 và ra prompt luôn.
2. **Quy tắc lặp y nguyên:** Bối cảnh và Trang phục nhân vật (trong cùng mốc thời gian) PHẢI LẶP Y NGUYÊN từng chữ qua các phân cảnh để AI hiểu đó là một thứ.
3. **Câu Voice Tone:** Luôn kết thúc bằng `Ở bước này, bạn hãy Chọn giọng đọc phù hợp ở bên dưới để thêm vào Câu Lệnh.`
4. Luôn sinh file `.md` lưu lại kết quả.
