---
name: script-analyzer
description: Phân tích chuyên sâu kịch bản video (độ dài, nhịp điệu, cấu trúc hook/body/CTA, phát triển nhân vật) và đưa ra gợi ý chỉnh sửa để tối ưu hóa tỷ lệ giữ chân (retention rate) trước khi sản xuất. Dùng skill này khi người dùng muốn "phân tích kịch bản", "đánh giá kịch bản", "sửa kịch bản", "chấm điểm kịch bản".
triggers:
  - phân tích kịch bản
  - phan tich kich ban
  - đánh giá kịch bản
  - danh gia kich ban
  - sửa kịch bản
  - sua kich ban
  - chấm điểm kịch bản
  - cham diem kich ban
  - review script
risk_level: low
language: vi
handoff:
  - veo3-script-writer
---

# Script Analyzer (Phân tích & Tối ưu Kịch bản)

Skill này đóng vai trò như một màng lọc chuyên gia. Nó nhận một kịch bản thô, tiến hành mổ xẻ cấu trúc, nhịp điệu, các điểm neo giữ chân khán giả (Hook) và tính nhất quán hình ảnh trước khi chuyển sang bước sinh prompt Veo 3.

Lý do skill tồn tại: Một kịch bản yếu về mặt cấu trúc sẽ cho ra một video nhàm chán dù hình ảnh AI có đẹp đến đâu. Skill này giúp người dùng phát hiện ra các khoảng trống trong kịch bản (ví dụ: Hook quá dài, thoại lê thê, thiếu Action cụ thể, nhân vật không rõ ràng) và gợi ý chỉnh sửa trực tiếp, đồng thời đảm bảo kịch bản phù hợp với giới hạn kỹ thuật của các mô hình AI Video hiện hành.

## Khi nào kích hoạt

- Khi người dùng gửi một đoạn text hoặc file và nói: "Nhận xét kịch bản này giúp tôi"
- "Phân tích kịch bản này xem có ổn để làm video không"
- "Chấm điểm kịch bản video AI này"
- "Làm sao để kịch bản này hay hơn?"

*Lưu ý: Nếu người dùng gửi kịch bản và nói "Tạo prompt Veo" hoặc "Chia phân cảnh", hãy chuyển thẳng (handoff) sang skill `veo3-script-writer`, KHÔNG chạy skill này trừ khi họ yêu cầu đánh giá.*

## Quy trình 5 bước

### Bước 1 — Tiếp nhận và định hình thể loại

- Đọc toàn bộ kịch bản được cung cấp (từ chat hoặc file).
- Xác định thể loại và mục tiêu của video (Quảng cáo bán hàng, Kể chuyện/Storytime, Viral/Giải trí, Giáo dục). Nếu chưa rõ, hỏi nhanh người dùng định dạng mong muốn để có tiêu chí đánh giá phù hợp.

### Bước 2 — Phân tích Cấu trúc & Hook (Retention Analysis)

Tiến hành đánh giá 3s đầu tiên và cấu trúc tổng thể:
- **Hook (3-5s đầu):** Có đủ mạnh không? Có hình ảnh hoặc âm thanh gì gây tò mò không? Nếu chỉ là thoại chào hỏi ("Xin chào các bạn..."), hãy đánh giá là yếu.
- **Body (Thân bài):** Nội dung có giải quyết được kỳ vọng mà Hook tạo ra không? Mạch truyện có logic không?
- **Payoff / CTA (Kết thúc):** Video kết thúc có để lại cảm xúc gì không? Có lời kêu gọi hành động (Call To Action) rõ ràng không?

### Bước 3 — Đánh giá Nhịp điệu (Pacing) & Thoại

- **Độ dài thoại:** Với video AI (như Veo 3 hỗ trợ shot 8s), mỗi phân cảnh chỉ nên có khoảng 20-30 chữ thoại (đọc trong ~6 giây). Nếu có đoạn thoại quá dài, hãy chỉ ra và đề xuất cắt ngắn hoặc ngắt cảnh.
- **Hành động (Action):** Kịch bản có mô tả hành động trực quan không, hay chỉ toàn chữ? Video là "Show, don't tell". Nhắc nhở người dùng nếu kịch bản thiếu mô tả hình ảnh.

### Bước 4 — Tính khả thi về hình ảnh (Visual & AI Potential)

- Đánh giá xem kịch bản có phù hợp để tạo bằng AI Video (Veo 3/Flow) không.
- **Nhân vật:** Có quá nhiều nhân vật phức tạp xuất hiện cùng lúc không? Có yêu cầu sự tương tác vật lý khó (ví dụ: hai người ôm nhau khóc, nhào lộn, ăn uống chi tiết) mà AI hiện tại dễ bị lỗi (morphing/glitch) không?
- **Bối cảnh:** Tính nhất quán của không gian như thế nào? Số lượng bối cảnh có quá nhiều gây khó khăn cho việc nhất quán không?

### Bước 5 — Chấm điểm & Trả kết quả (Output)

In ra báo cáo cho người dùng theo cấu trúc sau:

1. **Điểm số Kịch bản (Scoring):** .../100 (Kèm tóm tắt 1 câu nhận xét tổng quan)
2. **Điểm sáng (Strengths):** 2-3 điểm kịch bản đã làm tốt.
3. **Điểm mù / Cần cải thiện (Weaknesses):** Các vấn đề cụ thể về nhịp điệu, khả năng thực thi bằng AI, hoặc sức hút của Hook.
4. **Bản sửa lỗi đề xuất (Rewrite Suggestion):** Viết lại cụ thể một đoạn quan trọng (thường là làm lại đoạn Hook cho giật gân hơn, hoặc viết lại một đoạn thoại đang bị dài lê thê) để làm ví dụ cho người dùng thấy sự khác biệt.

Cuối cùng, in dòng thông báo Handoff:

> Nếu bạn đã ưng ý với kịch bản (hoặc muốn dùng bản tôi vừa gợi ý sửa), hãy gõ: **"Chia phân cảnh và viết prompt Veo cho kịch bản này"**. Skill `veo3-script-writer` sẽ tự động tiếp quản để lên spec render chi tiết cho bạn.

## Các quy tắc bất biến

1. **Luôn thẳng thắn nhưng mang tính xây dựng.** Nếu Hook dở, hãy nói là chưa đủ hấp dẫn và cung cấp ngay 2 option viết lại. Đừng chỉ chê mà không sửa.
2. **Định hướng AI Video.** Luôn nhắc nhở người dùng về giới hạn thời gian (shot 8s của Veo 3) và giới hạn hình ảnh của AI Video hiện tại (hạn chế các chuyển động vật lý quá phức tạp).
3. **Không làm thay việc của `veo3-script-writer`.** Đừng tự ý chia 12 dòng prompt phân cảnh hay sinh spec render. Việc phân tích nội dung và việc viết prompt kỹ thuật là hai bước tách biệt.
4. **Trình bày rõ ràng.** Sử dụng markdown, in đậm, gạch đầu dòng để bản phân tích dễ đọc, dễ tiếp thu.
