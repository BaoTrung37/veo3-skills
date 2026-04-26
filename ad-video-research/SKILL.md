---
name: ad-video-research
description: Research quảng cáo competitor và viết kịch bản video ads cho client thuê ngoài. Dùng skill này khi người dùng nhắc tới "làm quảng cáo cho khách", "client muốn làm ad", "video ads", "TikTok Ads", "Meta Ads", "quảng cáo sản phẩm", "brief khách hàng", "research quảng cáo đối thủ", "kịch bản quảng cáo", "UGC ad", "video thương mại", "làm job quảng cáo", hoặc bất kỳ khi nào có nhà quảng cáo/brand thuê làm video. Khác với viral-video-research (nội dung organic), skill này tập trung vào paid ads — KPI là CTR, conversion, ROAS thay vì views.
triggers:
  - quảng cáo
  - quang cao
  - ads
  - ad video
  - video ads
  - tiktok ads
  - meta ads
  - facebook ads
  - youtube ads
  - client
  - khách hàng thuê
  - brief khách hàng
  - kịch bản quảng cáo
  - kich ban quang cao
  - ugc
  - ugc ad
  - video thương mại
  - thuong mai
  - job quảng cáo
  - làm job
  - research đối thủ
  - competitor ads
  - quảng cáo đối thủ
risk_level: low
language: vi
handoff:
  - veo3-script-writer
---

# Ad Video Research — Nghiên cứu quảng cáo & Viết kịch bản ads

Skill này dành riêng cho tình huống **bạn được nhà quảng cáo / brand thuê làm video quảng cáo**. Quy trình khác hoàn toàn với làm nội dung organic: input là brief của client, output cần có hook đủ mạnh để dừng scroll + truyền tải USP rõ ràng + CTA dẫn đến conversion.

Lý do skill tồn tại: viết kịch bản ads theo cảm hứng mà không research competitor là cách nhanh nhất để client từ chối concept. Mỗi ngách sản phẩm đều có ad format đang convert tốt, messaging angle chưa ai khai thác, và objection cần xử lý trước — Deep Research giúp bạn nắm data đó trước khi đặt bút viết.

## Khi nào kích hoạt

- "Client muốn làm TikTok Ads cho sản phẩm X, research giúp tôi"
- "Tôi nhận job làm video quảng cáo cho thương hiệu Y, bắt đầu từ đâu?"
- "Research quảng cáo đối thủ trong ngành skincare / thực phẩm / app / ..."
- "Viết kịch bản UGC ads cho sản phẩm này"
- "Client gửi brief, giúp tôi phân tích và viết script"

Nếu người dùng muốn làm **nội dung kênh cá nhân** (không phải ads trả phí cho client) → dùng `viral-video-research` thay thế.

---

## Quy trình 7 bước

### Bước 1 — Nhận brief từ client (8 trường)

Hỏi một lần, gộp đủ 8 trường. Nếu user đã cung cấp một phần, chỉ hỏi phần còn thiếu:

1. **Tên & mô tả sản phẩm/dịch vụ** — cụ thể, không chỉ tên thương hiệu (ví dụ: "Serum dưỡng ẩm ban đêm, 30ml, chiết xuất rau má, giá 350k")
2. **USP** — điểm khác biệt duy nhất so với đối thủ (nếu client không cung cấp, hỏi họ muốn nhấn điểm gì nhất)
3. **Target audience** — tuổi, giới tính, thu nhập, vấn đề họ đang gặp
4. **Platform** — TikTok Ads / Meta Ads (FB+IG) / YouTube / Mix
5. **Mục tiêu chiến dịch** — awareness / traffic / add-to-cart / purchase / app install
6. **Tone thương hiệu** — premium / mainstream / trẻ trung / chuyên gia / thân thiện / hài hước
7. **Đối thủ biết tên** (nếu có) — để Deep Research target đúng competitor
8. **Hạn chế** — claim không được nói, hình ảnh cấm, quy định ngành (ví dụ: không dùng từ "trị" nếu không có GPKD dược)

> Lưu brief lại dưới dạng block riêng trong output để tham chiếu xuyên suốt quy trình.

---

### Bước 2 — Research competitor ads bằng Deep Research

Dùng template từ `references/ad-research-prompt.md`, chọn template theo mục tiêu chiến dịch:
- **Template A** — Purchase / Add-to-cart (sản phẩm vật lý)
- **Template B** — App install / Sign-up (sản phẩm digital)
- **Template C** — Awareness / Brand lift (nhận diện thương hiệu)

Cách gọi Deep Research, theo thứ tự ưu tiên:

1. **Nếu có MCP `gemini-deep-research`**: gọi trực tiếp, truyền prompt từ template, đợi response.
2. **Nếu có Gemini CLI**: chạy `gemini deep-research --max-mode "<prompt>"`.
3. **Nếu không có cả hai**: in ra prompt đã viết sẵn, hướng dẫn user:
   - Paste vào https://gemini.google.com → Deep Research
   - **Hoặc** tra thủ công: TikTok Creative Center (https://ads.tiktok.com/business/creativecenter), Meta Ads Library (https://www.facebook.com/ads/library), rồi paste kết quả về để skill xử lý tiếp.

In prompt đã gửi ra để user kiểm tra. ETA: 3-8 phút (Deep Research thường) / 10-20 phút (Max).

> **Dùng Deep Research Max** khi: sản phẩm competitive (skincare, thực phẩm, fintech, app), client có ngân sách chạy ads lớn, hoặc bạn cần insight cross-reference nhiều nguồn. Fallback thường khi client cần nhanh trong 30 phút.

---

### Bước 3 — Tổng hợp 6 mục cố định

Không paste raw report. Tổng hợp thành đúng 6 mục (mỗi mục 4-8 dòng):

1. **Top ad patterns** — 3-5 cấu trúc quảng cáo đang được chạy nhiều nhất trong ngành này (kèm citation: tên brand / link creative nếu có). Phân loại: UGC / Testimonial / Demo / Storytelling / Comparison.

2. **Hook 3 giây** — 5-8 hook ad line đang dùng, phân loại rõ:
   - *Pain hook* (chạm vào vấn đề audience đang gặp)
   - *Desire hook* (kích thích kết quả/trải nghiệm muốn có)
   - *Curiosity hook* (gây tò mò, câu hỏi bỏ ngỏ)
   - *Social proof hook* (con số, người nổi tiếng, số lượng khách)

3. **Ad structure phổ biến** — Cấu trúc đang convert tốt trong ngách: độ dài (15s/30s/45s/60s), vị trí USP (giây mấy), vị trí CTA (mid-roll hay end-roll), có dùng text overlay không.

4. **USP whitespace** — Điểm khác biệt nào của sản phẩm client **chưa có ai khai thác** trong ads competitor. Đây là góc cạnh tranh để đề xuất concept.

5. **Objection & counter** — 3-5 phản đối phổ biến trong comment ads tương tự + cách brands khác counter trong creative. Đây là ammo để viết kịch bản "xử lý objection trước khi khách nghĩ ra".

6. **CTA & conversion trigger** — Wording CTA đang dùng nhiều nhất, FOMO triggers (giới hạn thời gian / số lượng), cách hiển thị giá / ưu đãi trong ads.

Nếu Deep Research trả data global khi cần VN → gọi lại với prompt narrow hơn về địa lý.

---

### Bước 4 — Đề xuất 3 concept quảng cáo

Dựa trên 6 mục Bước 3 + brief client, sinh **3 concept khác nhau**. Mỗi concept:

- **Tên concept** (ví dụ: "Trước / Sau 14 ngày", "Bạn bè hỏi dùng gì vậy?", "Lý do 10.000 người chọn...")
- **Ad format** (UGC / Testimonial / Demo / Problem-Solution / Comparison / Storytelling — tham chiếu `references/ad-formats.md`)
- **Hook line cụ thể** (câu mở đầu ≤ 8 từ)
- **Ad structure** — 3-4 giai đoạn theo timeline (ví dụ: Hook 0-3s → Pain 3-10s → Demo 10-22s → CTA 22-30s)
- **Angle cạnh tranh** — Concept này khai thác USP whitespace nào từ Bước 3?
- **Độ dài đề xuất**: 15s / 30s / 45s / 60s

In 3 concept. Hỏi: *"Bạn muốn phát triển concept nào? (1/2/3 hoặc chỉnh sửa cụ thể)"*

---

### Bước 5 — Checkpoint trước khi viết kịch bản

Trước khi viết, tự kiểm tra 3 điều:

- [ ] Concept có vi phạm hạn chế từ brief (Trường 8) không?
- [ ] USP của client có được nhấn mạnh rõ ràng không (không chỉ đề cập qua loa)?
- [ ] CTA có phù hợp mục tiêu chiến dịch không (awareness ≠ purchase)?

Nếu có vấn đề → báo user trước khi viết, không viết rồi mới nói.

---

### Bước 6 — Viết kịch bản theo ad template

Dùng `references/ad-script-template.md`. Cấu trúc cố định cho ads:

```
Hook (0-3s)       → Dừng scroll, gây chú ý ngay lập tức
Engagement (3-8s) → Giữ người xem tiếp, mở rộng hook
Demo / Proof (8-20s) → Cho thấy sản phẩm hoạt động / kết quả thực tế
USP (20-25s)      → Điểm khác biệt duy nhất, ngắn gọn, memorable
CTA (25-30s)      → Hành động cụ thể, có FOMO trigger nếu phù hợp
```

Quy tắc viết:

- **Mỗi câu thoại ≤ 8 giây** — khớp với clip Veo khi handoff.
- **USP phải xuất hiện trong 25 giây đầu** — không giấu USP cuối video.
- **Không dùng claim không có bằng chứng** — nếu brief ghi hạn chế claim, tuân thủ tuyệt đối.
- **CTA phải cụ thể** — "mua ngay link bio" / "nhận ưu đãi hôm nay" / "bình luận để nhận mã giảm giá" — không chung chung kiểu "tìm hiểu thêm".
- **Thoại theo ngôn ngữ audience** — dùng từ, slang, cách xưng hô từ Bước 3.

---

### Bước 7 — Output 4 phần + handoff

Trình bày theo đúng thứ tự:

1. **Brief đã tiếp nhận** — 8 trường từ Bước 1 (để user xác nhận không bị miss thông tin).
2. **Research Brief** — 6 mục từ Bước 3 (tóm tắt, lưu lại làm reference).
3. **Concept đã chọn** — chi tiết concept user chọn ở Bước 4.
4. **Kịch bản** — theo ad template, kèm **Production Note** (loại shot cần quay, props, talent profile, lighting style để chuẩn bị production).

Lưu kịch bản vào `E:\Ai Video\scripts\ad-[ten-san-pham]-[YYYYMMDD].md`.

Kích hoạt handoff:

> Kịch bản đã sẵn sàng. Gõ tiếp: *"Viết prompt Veo cho kịch bản quảng cáo trên"* — skill `veo3-script-writer` sẽ tiếp quản, sinh Image Asset Brief + prompt 12 dòng cho từng phân cảnh. Nếu muốn chỉnh kịch bản, nói rõ phần nào cần sửa.

---

## Các quy tắc bất biến

1. **Luôn nhận đủ 8 trường brief trước khi research.** Thiếu USP hoặc thiếu hạn chế claim là rủi ro lớn nhất — không đoán, hỏi thẳng.
2. **Research competitor ads, không research organic.** Ads và organic có cấu trúc khác nhau — đừng lẫn lộn nguồn.
3. **Tổng hợp thành 6 mục cố định** — không paste raw report.
4. **Đề xuất đúng 3 concept**, đa dạng format — đừng 3 concept cùng một format.
5. **Checkpoint trước khi viết** — đừng viết kịch bản có claim vi phạm hạn chế của client.
6. **USP phải xuất hiện trong 25 giây đầu** — không exception.
7. **CTA phải match mục tiêu chiến dịch** — awareness ad không cần CTA "mua ngay".
8. **Citations** — mọi pattern / số liệu từ research đều phải kèm nguồn.
9. **Production Note bắt buộc** — kịch bản ads cần chuẩn bị production khác với nội dung organic.

---

## Tài nguyên đính kèm

- `references/ad-research-prompt.md` — 3 template prompt Deep Research theo mục tiêu chiến dịch (purchase / digital / awareness).
- `references/ad-formats.md` — catalog 10 format quảng cáo phổ biến với cấu trúc điển hình và khi nào dùng.
- `references/ad-script-template.md` — template kịch bản quảng cáo chuẩn để feed vào `veo3-script-writer`.

---

## Sai lầm thường gặp cần né

- **Bỏ qua trường "hạn chế"** trong brief → viết kịch bản có claim không được phép, client từ chối toàn bộ concept, mất thời gian cả đôi bên.
- **Research organic thay vì paid ads** → pattern viral organic khác hoàn toàn với ads convert — TikTok Creative Center và Meta Ads Library mới là nguồn đúng.
- **Đề xuất 3 concept cùng format** (ví dụ 3 UGC) → không đa dạng, client không có cơ sở so sánh.
- **Bỏ qua USP whitespace** → viết concept giống hệt đối thủ, không có lý do để chọn sản phẩm của client.
- **Bỏ Production Note** → handoff sang quay phim không biết cần chuẩn bị gì, gây delay.
- **CTA generic** kiểu "tìm hiểu thêm" → click rate thấp, client đánh giá thấp chất lượng script.
- **Bỏ qua handoff** → kịch bản ads hoàn toàn dùng được cho `veo3-script-writer`, không skip.
