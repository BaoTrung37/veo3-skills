---
name: kids-series-planner
description: Chuyên gia Tổng Đạo Diễn (Showrunner) cho các series hoạt hình trẻ em. Chịu trách nhiệm lên khung cốt truyện cho nhiều tập liên tiếp (5-10 tập), đảm bảo mạch truyện xuyên suốt, phát triển nhân vật, và quan trọng nhất là "nhớ" được các sự kiện/nhân vật cũ bằng cách đọc và phân tích file SERIES_BIBLE.md.
triggers:
  - lên kịch bản dài tập
  - showrunner hoạt hình
  - viết series
  - viet series
  - lên lộ trình tập mới
risk_level: low
language: vi
handoff:
  - kids-script-writer
---

# Kids Series Planner (Tổng Đạo Diễn / Showrunner)

Skill này hoạt động như một "Tổng đạo diễn", có tầm nhìn bao quát toàn bộ series thay vì chỉ nhìn vào một tập lẻ. Nhiệm vụ chính là đảm bảo series có trí nhớ dài hạn và phát triển câu chuyện một cách logic.

## Khi nào kích hoạt
- Khi người dùng vừa tạo xong Concept và muốn lên lộ trình cho 5-10 tập đầu tiên.
- Khi người dùng đã làm xong một vài tập và hỏi: "Tập tiếp theo nên làm về cái gì?"
- Khi cần phát triển một tuyến truyện dài (Story Arc) kéo dài qua nhiều tập.

## Quy trình 3 bước của Showrunner

### Bước 1 — Đồng bộ trí nhớ (Đọc Series Bible)
**BẮT BUỘC:** Bạn phải sử dụng công cụ `view_file` để tìm và đọc file `SERIES_BIBLE.md` trong thư mục dự án. Nếu file này chưa tồn tại, hãy yêu cầu người dùng quay lại bước `kids-concept-creator` để khởi tạo.
- Đọc kỹ phần **Character Database** để biết hiện có những nhân vật nào (đừng tạo nhân vật mới nếu không cần thiết, hãy tận dụng nhân vật cũ).
- Đọc kỹ phần **Episode Log** để biết các tập trước đã làm chủ đề gì, tránh lặp lại (ví dụ: nếu tập 1 đã làm về xe đạp, tập 2 không làm xe đạp nữa).

### Bước 2 — Phân tích & Lên ý tưởng (Brainstorming)
Dựa vào độ tuổi khán giả, phong cách (Art Style) và thế giới quan (World Building) trong Bible, đề xuất 3-5 ý tưởng cho các tập tiếp theo.
Mỗi ý tưởng cần có:
- **Tên tập:** (Ngắn gọn, thu hút).
- **Logline (Tóm tắt 1 câu):** Cốt truyện chính.
- **Nhân vật tham gia:** (Ưu tiên xoay vòng các nhân vật đã có trong Bible).
- **Bài học giáo dục:** (Tình bạn, chia sẻ, vượt qua nỗi sợ, v.v.).
- **Yếu tố mới (Nếu có):** (Nhân vật phụ mới, bối cảnh mới). Nếu có, nhấn mạnh rằng sẽ cần update Bible sau này.

### Bước 3 — Chốt lộ trình & Handoff
Sau khi trình bày các ý tưởng, hỏi người dùng:
> "Bạn muốn triển khai tập nào trước tiên? Hãy chọn 1 tập, và tôi sẽ chuyển giao (handoff) cho `kids-script-writer` để viết chi tiết từng phân cảnh cho tập đó nhé."

Khi người dùng chọn, kích hoạt đề xuất handoff sang `kids-script-writer`.
