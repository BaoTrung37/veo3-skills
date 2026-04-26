# Template Deep Research prompts

Đây là 6 template prompt đã được tinh chỉnh để gửi cho **Gemini Deep Research / Deep Research Max**. Skill chọn template tương ứng với mục tiêu video, điền các biến trong dấu `{{...}}`, rồi gửi.

Quy ước biến:
- `{{NICHE}}` — chủ đề/ngách cụ thể (ví dụ: "skincare cho da dầu")
- `{{PLATFORM}}` — TikTok / Reels / YouTube Shorts / Mix
- `{{AUDIENCE}}` — mô tả audience (ví dụ: "Gen Z nữ 18-25 ở Hà Nội/HCM")
- `{{REGION}}` — Việt Nam / Đông Nam Á / Global (default: Việt Nam)
- `{{TIMEFRAME}}` — khoảng thời gian (default: "90 ngày qua")

Mỗi template kết thúc bằng yêu cầu format output thống nhất để skill parse dễ.

---

## Template 1 — EDUCATE (giáo dục, hướng dẫn, kiến thức)

```
Hãy nghiên cứu thị trường video {{PLATFORM}} ngắn ở {{REGION}} về chủ đề "{{NICHE}}" trong {{TIMEFRAME}} với target audience {{AUDIENCE}}.

Tôi đang định làm video educational/hướng dẫn. Hãy phân tích:

1. TOP CREATORS & VIDEOS
   - Liệt kê 10-15 video có lượt xem cao nhất hoặc engagement rate cao nhất về chủ đề này trong {{TIMEFRAME}}.
   - Với mỗi video: tên creator, link, view, like, comment, hook line ở 3 giây đầu.

2. PATTERN HOOK
   - Phân tích 3 giây đầu của 15 video trên. Phân loại các pattern hook (ví dụ: câu hỏi gây tò mò, claim gây sốc, demo trực quan, before/after).
   - Tỉ lệ % mỗi pattern. Đưa ra 5-8 hook line cụ thể đang work nhất, viết bằng tiếng của audience target.

3. CẤU TRÚC KỊCH BẢN
   - Độ dài trung bình (giây). Có break point chính ở giây thứ mấy?
   - Cấu trúc 3-act phổ biến: hook → body → CTA. Body chia subsection thế nào?
   - Vị trí CTA (cuối video, giữa, hay không có)?

4. NGÔN NGỮ AUDIENCE
   - 5-7 từ ngữ/slang audience đang dùng trong comment các video top.
   - 3-5 pain point chính được nhắc đi nhắc lại.
   - Tone phổ biến: nghiêm túc / hài hước / thân mật / chuyên gia?

5. TREND SUPPORT
   - 3 bài nhạc đang trend cho ngách này (kèm link).
   - 8-10 hashtag đang tăng trưởng tốt.
   - Khung giờ post tốt nhất trong {{REGION}}.

YÊU CẦU OUTPUT:
- Tiếng Việt 100%.
- Mọi số liệu phải có citation rõ ràng (link nguồn).
- Không liệt kê chung chung — trích dẫn video, creator, comment cụ thể.
- Cuối cùng, đưa ra 1 đoạn "Ý kiến tổng hợp" 5-7 câu về xu hướng đang nổi nhất.
```

---

## Template 2 — ENTERTAIN (giải trí, comedy, storytime)

```
Nghiên cứu thị trường video {{PLATFORM}} giải trí (entertainment, comedy, storytime, skit) ở {{REGION}} về chủ đề "{{NICHE}}" trong {{TIMEFRAME}}, target {{AUDIENCE}}.

Phân tích:

1. TOP VIDEOS — 15 video có engagement cao nhất; ghi rõ format (POV / storytime / skit / day-in-life / before-after / parody).

2. PATTERN VIRAL
   - Twist/punchline đặt ở đâu (giây thứ mấy)?
   - Cấu trúc setup → tension → punchline.
   - Yếu tố relatable nào khiến comment "đúng quá", "real không trúng"?

3. HOOK 3 GIÂY
   - 8 hook line đang viral. Phân loại: ngược kỳ vọng / câu hỏi gây tò mò / claim gây cười / visual cue / dialogue mở.

4. NHÂN VẬT & KỊCH TÍNH
   - Format nhân vật phổ biến (1 người độc thoại / 2 người hội thoại / multi-character skit / có "đối thủ").
   - Conflict/tension thường là gì? Resolution thế nào?

5. NGÔN NGỮ & VĂN HOÁ
   - Slang đặc trưng của audience (kèm nghĩa).
   - Reference văn hoá (meme, người nổi tiếng, sự kiện) hay được dùng.
   - Tone: chua / mặn / ngọt / lầy / chân thành?

6. TREND SUPPORT
   - 3 bài nhạc / sound trending.
   - Hashtag.
   - Filter / hiệu ứng đang được dùng nhiều.

OUTPUT: tiếng Việt, có citation, kết bằng "Ý kiến tổng hợp" 5-7 câu.
```

---

## Template 3 — SELL (bán hàng, sản phẩm, demo)

```
Nghiên cứu video {{PLATFORM}} dạng bán hàng / review sản phẩm / demo / quảng cáo cho "{{NICHE}}" ở {{REGION}}, {{TIMEFRAME}}, target {{AUDIENCE}}.

Phân tích:

1. TOP VIDEOS BÁN HÀNG — 15 video có conversion / save rate / CTA click cao nhất nếu có data, hoặc view + comment "mua ở đâu" cao nhất. Liệt kê creator, link, định dạng (UGC / KOL / brand / livestream replay).

2. PATTERN HOOK BÁN HÀNG
   - Hook gây pain (ám chỉ vấn đề audience đang gặp)?
   - Hook gây thèm muốn (visual trực quan)?
   - Hook gây tin tưởng (trước/sau, demo thực tế)?
   - Tỉ lệ mỗi pattern.

3. CẤU TRÚC
   - Hook → pain → solution → demo → social proof → CTA.
   - Vị trí CTA (mid-roll vs end-roll), wording CTA.
   - Có dùng giá / khuyến mãi / FOMO không?

4. PAIN POINT & ỌBJECTION
   - Pain point chính audience post trong comment.
   - Objection thường gặp ("đắt quá", "có thật không", "tôi đang dùng X rồi"...).
   - Cách creator counter các objection đó.

5. UGC vs BRAND
   - Định dạng nào convert tốt hơn?
   - Tone UGC vs tone brand.

6. TREND SUPPORT
   - Sound đang trend cho video sản phẩm.
   - Hashtag đang push (kèm volume).
   - Khung giờ post.

OUTPUT: tiếng Việt, citation đầy đủ, kết bằng "Ý kiến tổng hợp" + recommendation cụ thể (định dạng nào, độ dài bao nhiêu, hook kiểu gì cho ngách này).
```

---

## Template 4 — BUILD BRAND (xây kênh cá nhân / thương hiệu)

```
Nghiên cứu cách các creator xây personal brand thành công trên {{PLATFORM}} ở {{REGION}} trong ngách "{{NICHE}}", {{TIMEFRAME}}, target {{AUDIENCE}}.

1. TOP CREATORS — 10 creator tăng trưởng nhanh nhất. Mỗi người: tên, follower hiện tại + 90 ngày trước, content pillar, style đặc trưng.

2. CONTENT PILLAR — Các pillar phổ biến (ví dụ: educate / day-in-life / behind-the-scenes / opinion). Tỉ lệ pillar trong content mix.

3. STYLE VIDEO ĐẶC TRƯNG
   - Format đầu video (intro signature, catchphrase).
   - Bối cảnh quay (cố định hay đa dạng).
   - Outfit/visual identity.

4. TẦN SUẤT POST — Bao nhiêu video/tuần? Có pattern series không?

5. TƯƠNG TÁC AUDIENCE — Cách creator reply comment, q&a, livestream.

6. CONVERSION OFFLINE — Cách họ chuyển follower thành email list / khách hàng / cộng đồng paid.

7. TREND SUPPORT — Sound, hashtag, format challenge họ tham gia.

OUTPUT: tiếng Việt, citation, kết bằng "Recommendation" về cách bắt đầu xây kênh trong ngách này.
```

---

## Template 5 — DRIVE TRAFFIC (kéo về website / app / sự kiện)

```
Nghiên cứu video {{PLATFORM}} có CTA dẫn traffic ngoài app (web, app, đăng ký, sự kiện) ở {{REGION}} cho ngách "{{NICHE}}", {{TIMEFRAME}}, target {{AUDIENCE}}.

1. TOP VIDEOS có CTA OUTBOUND — Liệt kê 15 video có "link in bio" / "đăng ký ngay" / "click bio link" và có dấu hiệu drive traffic tốt (high comment hỏi link).

2. PATTERN CTA
   - Vị trí CTA (giữa / cuối / repeat).
   - Wording CTA (lệnh / mời / FOMO / curiosity).
   - Cách giảm friction (preview value, hint, mystery).

3. HOOK CHO TRAFFIC VIDEO — 5-8 hook line tốt nhất.

4. CẤU TRÚC
   - Set-up curiosity gap → reveal partial → CTA để xem full.
   - Tỉ lệ video dùng pattern "phần 1/2/3".

5. PRE-LANDING — Có dùng Linktree / IG bio / pinned comment / chat bot không?

6. TREND SUPPORT — Sound, hashtag.

OUTPUT: tiếng Việt, citation, kết bằng "Recommendation".
```

---

## Template 6 — MIXED / CHƯA RÕ MỤC TIÊU

Khi user chưa rõ mục tiêu cụ thể, dùng template này (rộng hơn) — sau khi có kết quả, hỏi user xem họ muốn focus mục tiêu nào rồi gọi lại template chuyên sâu.

```
Nghiên cứu tổng quan thị trường video {{PLATFORM}} ngắn ở {{REGION}} về "{{NICHE}}" trong {{TIMEFRAME}}, target {{AUDIENCE}}.

Phân tích:

1. LANDSCAPE — 5 nhóm content chính trong ngách này (ví dụ: educational, storytime, sản phẩm, day-in-life, opinion). Tỉ lệ ước tính của mỗi nhóm.

2. TOP 20 VIDEOS — Theo lượt xem + engagement, đa dạng nhóm.

3. WHAT'S WORKING vs WHAT'S NOT — Pattern nào đang lên, pattern nào đang giảm?

4. WHITESPACE — Khoảng trống nào trong ngách (chủ đề chưa ai làm tốt)?

5. RECOMMENDATION — Nếu user mới vào ngách này, nên bắt đầu bằng nhóm content nào?

OUTPUT: tiếng Việt, citation. Cuối cùng đưa ra 3 hướng tiếp cận khả thi cho user.
```

---

## Mẹo gọi Deep Research hiệu quả

- **Càng cụ thể, càng đáng tiền** — `"skincare cho da dầu nam Gen Z Hà Nội"` cho insight tốt hơn `"skincare"` 10 lần.
- **Luôn ghi `{{TIMEFRAME}} = 90 ngày qua`** — viral pattern thay đổi từng quý, đừng research cũ.
- **Yêu cầu citations rõ ràng** trong prompt — nếu Deep Research lười cite, gọi lại với câu nhắc "every claim must have a source link".
- **Nếu prompt quá dài** (> 2000 từ), cắt template cho gọn lại — Deep Research handle tốt prompt 500-1500 từ.
- **Dùng Max khi nội dung quan trọng** (chuẩn bị launch sản phẩm, chiến dịch lớn). Dùng thường khi research nhanh test ý tưởng.
