---
name: viral-video-research
description: Nghiên cứu thị trường video ngắn (TikTok, Reels, Shorts, YouTube) bằng Gemini Deep Research, sau đó viết kịch bản tối ưu theo data thị trường. Dùng skill này khi người dùng muốn "làm video viral", "nghiên cứu thị trường video", "phân tích đối thủ TikTok/Reels", "viết kịch bản dựa trên data", "video về chủ đề X cho Gen Z", hoặc bất cứ khi nào họ có một ý tưởng/ngách nhưng chưa có kịch bản và muốn tận dụng dữ liệu thị trường. Skill này là bước ĐẦU trong pipeline làm video AI — sau khi có kịch bản, hand off sang skill `veo3-script-writer` để chia phân cảnh và sinh prompt Veo 3.
triggers:
  - viral
  - video viral
  - nghiên cứu thị trường
  - nghien cuu thi truong
  - market research
  - tiktok
  - reels
  - shorts
  - youtube shorts
  - phân tích đối thủ
  - phan tich doi thu
  - kịch bản video
  - kich ban video
  - viết kịch bản
  - viet kich ban
  - deep research
  - gemini deep research
  - hook video
  - trend video
risk_level: low
language: vi
handoff:
  - veo3-script-writer
---

# Viral Video Research

Skill này dùng **Gemini Deep Research / Deep Research Max** (chạy trên Gemini 3.1 Pro) để nghiên cứu thị trường video ngắn, rồi viết một kịch bản đã được tối ưu theo data trước khi đẩy sang `veo3-script-writer` để sinh prompt Veo 3.

Lý do skill tồn tại: viết kịch bản dựa trên cảm hứng cá nhân là cách nhanh nhất để làm ra video không có người xem. Mỗi ngách đều có pattern riêng — hook 3 giây đầu, độ dài thoại, format (POV/storytime/educational), nhịp dựng, thậm chí từ ngữ phải dùng — và những pattern này thay đổi theo tháng. Deep Research giúp bạn nắm được data 90 ngày gần nhất trước khi viết, thay vì mò.

## Khi nào kích hoạt

- "Tôi muốn làm video TikTok về [chủ đề], nghiên cứu giúp tôi"
- "Phân tích các video viral về skincare/đầu tư/du lịch trong tháng qua"
- "Viết kịch bản video sản phẩm X dựa trên data thị trường"
- "Đối thủ của tôi đang làm video gì? Tôi nên làm gì?"
- "Cho tôi 3 ý tưởng video viral cho ngách [X]"

Nếu user đã có sẵn kịch bản và chỉ muốn sinh prompt Veo → **không** dùng skill này, hand off thẳng sang `veo3-script-writer`.

## Quy trình 6 bước

### Bước 1 — Hỏi ngách & target (một lần, gộp 4 câu)

Trước khi gọi Deep Research, **bắt buộc** hỏi user 4 thông tin sau (gộp vào một lần hỏi để không phiền):

1. **Chủ đề / ngách cụ thể** (ví dụ: "skincare cho da dầu", "đầu tư chứng khoán cho người mới", "review món ăn Hà Nội")
2. **Platform target** (TikTok / Reels / YouTube Shorts / mix — ảnh hưởng độ dài, format)
3. **Audience** (tuổi, giới tính, vùng miền — ví dụ "Gen Z nữ 18-25 ở thành phố")
4. **Mục tiêu video** (educate / entertain / sell / build personal brand / drive traffic)

Nếu user đã cung cấp một phần thông tin trong câu hỏi gốc, **chỉ hỏi phần còn thiếu** — đừng bắt họ trả lời lại từ đầu.

### Bước 2 — Gọi Gemini Deep Research

Dùng template từ `references/deep-research-prompts.md`, chọn template tương ứng với mục tiêu (educate/entertain/sell...) và điền thông tin từ Bước 1.

Cách gọi Deep Research, theo thứ tự ưu tiên:

1. **Nếu có MCP `gemini-deep-research`** trong agent: gọi trực tiếp tool đó. Truyền prompt template, đợi response (thường 3-8 phút cho Deep Research, 10-20 phút cho Deep Research Max).
2. **Nếu có Gemini API key** + skill `gemini-cli`: chạy `gemini deep-research --max-mode "<prompt>"`.
3. **Nếu không có cả hai**: nói rõ với user, đề xuất họ chạy thủ công trên https://gemini.google.com → Deep Research, paste prompt skill đã viết, copy kết quả về cho skill xử lý tiếp.

Trong khi đợi, in ra cho user thấy **prompt đã gửi** (để họ debug/hiệu chỉnh nếu cần) và **ETA**.

> Quan trọng: dùng **Deep Research Max** khi có thể — tốn thời gian hơn nhưng cho citations chất lượng và phân tích sâu hơn nhiều, đặc biệt với câu hỏi cần data cross-reference từ nhiều nguồn.

### Bước 3 — Tổng hợp insight thành 5 mục cố định

Khi nhận được research brief từ Deep Research, **đừng paste cả khối báo cáo dài dòng cho user**. Tổng hợp thành đúng 5 mục dưới đây (ngắn gọn, mỗi mục 3-7 dòng):

1. **Top patterns** — 3-5 pattern hook/format đang viral trong ngách này (kèm citation).
2. **Hook 3 giây** — 5-8 hook line đang work nhất, viết dưới dạng các câu cụ thể có thể dùng được.
3. **Cấu trúc kịch bản phổ biến** — độ dài tổng (15s/30s/45s/60s+), nhịp 3-act, vị trí CTA.
4. **Audience pain point + ngôn ngữ** — 3-5 nỗi đau cụ thể, kèm các từ ngữ/slang audience đang dùng (ví dụ "fail", "auth", "đỉnh nóc", "real không trúng").
5. **Trend support** — nhạc đang trend (1-3 bài), hashtag (5-10 hashtag), thời điểm post tốt nhất.

Nếu Deep Research trả về thông tin lệch (ví dụ trả về data global khi user yêu cầu VN), **gọi lại lần 2** với prompt được sửa cho narrow hơn.

### Bước 4 — Đề xuất 3 angle kịch bản

Dựa trên 5 mục Bước 3, tự sinh **3 angle khác nhau** cho cùng chủ đề. Mỗi angle gồm:

- **Tên angle** (ví dụ: "POV: tôi đã bỏ skincare 30 ngày và hối hận")
- **Format** (POV / storytime / educational / before-after / skit...)
- **Hook line** (câu mở đầu cụ thể, ≤ 8 từ)
- **Lý do chọn** (1 câu giải thích vì sao angle này hợp với insight đã research)
- **Độ dài dự kiến** (15s / 30s / 45s / 60s)

In 3 angle, hỏi user: *"Bạn muốn phát triển angle nào? (1/2/3 hoặc gợi ý chỉnh sửa)"*

### Bước 5 — Viết kịch bản nháp tối ưu

Sau khi user chọn angle, viết kịch bản **đúng theo template handoff** trong `references/handoff-template.md`. Template này được thiết kế để feed thẳng vào skill `veo3-script-writer` — có sẵn các trường:

- Tiêu đề + format + độ dài + platform
- Nhân vật (mô tả ngắn để skill kia trích xuất)
- Bối cảnh (mô tả tổng thể)
- Sequence hành động + thoại theo timeline (mỗi mốc thời gian là 1 dòng)
- Hook + payoff + CTA rõ ràng
- Nhạc + hashtag (lấy từ Bước 3)

Quy tắc viết kịch bản:

- **Áp dụng pattern đã research** — đừng tự sáng tác lệch khỏi data. Nếu data nói hook tốt nhất là dạng "POV ngược kỳ vọng", thì hook phải là dạng đó.
- **Dùng ngôn ngữ audience** — slang, từ vựng, cách xưng hô từ Bước 3.
- **Thoại ngắn** — mỗi câu thoại ≤ 8 giây để khớp với Veo (skill `veo3-script-writer` sẽ enforce, nhưng viết sẵn ngắn từ đây thì smoother).
- **Có hook + payoff + CTA** — không skip CTA dù video ngắn.

### Bước 6 — Output 3 phần + handoff

Trình bày output theo đúng thứ tự:

1. **Research Brief tóm tắt** — 5 mục từ Bước 3 (cho user lưu lại làm reference).
2. **Angle đã chọn** — chi tiết angle user chọn ở Bước 4.
3. **Kịch bản nháp** — theo template handoff.

Cuối cùng, **kích hoạt handoff**:

> Nếu bạn ưng kịch bản này, gõ tiếp: *"Viết prompt Veo cho kịch bản trên"* — skill `veo3-script-writer` sẽ tự động tiếp quản, sinh Image Asset Brief + Spec Render + prompt 12 dòng cho từng phân cảnh. Nếu muốn chỉnh kịch bản, nói rõ phần nào cần sửa, mình sẽ rewrite.

Đồng thời, lưu kịch bản vào `E:\Ai Video\scripts\[ten-kich-ban]-[YYYYMMDD].md` để dùng sau.

## Các quy tắc bất biến

1. **Luôn hỏi 4 thông tin Bước 1 trước khi gọi Deep Research.** Đừng đoán ngách.
2. **Ưu tiên Deep Research Max** cho chất lượng synthesis — chỉ fallback Deep Research thường khi user yêu cầu nhanh.
3. **Tổng hợp thành 5 mục cố định** (Bước 3), không paste raw report.
4. **Đề xuất 3 angle khác nhau**, không 1, không 2 — đa dạng để user so sánh.
5. **Viết kịch bản theo data**, không theo cảm hứng. Nếu insight nói A nhưng kịch bản đi B, bạn đang làm sai.
6. **Output kịch bản đúng template handoff** để skill `veo3-script-writer` parse được.
7. **Citations** — mọi số liệu/quote từ Deep Research đều phải kèm citation (link hoặc tên video gốc).

## Tài nguyên đính kèm

- `references/deep-research-prompts.md` — 6 template prompt cho 6 loại nội dung (educate / entertain / sell / build brand / drive traffic / mixed).
- `references/video-formats.md` — catalog 10 format video ngắn phổ biến với cấu trúc 3-act điển hình.
- `references/handoff-template.md` — format kịch bản chuẩn để feed vào `veo3-script-writer`.

## Sai lầm thường gặp cần né

- **Dùng Deep Research thường khi cần Max** — Deep Research thường (low latency) ổn cho query đơn giản nhưng synthesis nông; với research thị trường cần độ sâu, luôn ưu tiên Max nếu user không phản đối thời gian chờ.
- **Nhồi cả raw report 20 trang vào output** → user không đọc. Tổng hợp 5 mục, đính kèm raw report ở `references/last-research-[date].md` cho ai cần đào sâu.
- **Skip bước hỏi ngách** "vì user đã nói rồi" → kiểm tra kỹ 4 trường, ngách càng narrow research càng đáng tiền.
- **Viết kịch bản trước khi research** → đảo ngược pipeline, vô dụng. Nếu user nóng vội, vẫn phải research nhanh ít nhất 5 mục Bước 3.
- **Bỏ qua handoff** → skill này tồn tại để làm input cho `veo3-script-writer`. Output cuối luôn có dòng kích hoạt handoff.
