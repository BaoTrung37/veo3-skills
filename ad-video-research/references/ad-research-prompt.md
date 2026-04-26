# Template Deep Research prompts — Nghiên cứu Paid Ads

Khác với `viral-video-research`, template ở đây nhắm vào **paid advertising creatives** — quảng cáo đang chạy thực sự trên các platform, không phải nội dung organic. Nguồn ưu tiên: TikTok Creative Center, Meta Ads Library, YouTube Ads (qua SERP / spytools).

Quy ước biến:
- `{{PRODUCT}}` — tên/mô tả sản phẩm cụ thể (ví dụ: "serum dưỡng ẩm ban đêm chiết xuất rau má")
- `{{CATEGORY}}` — ngành hàng rộng hơn (ví dụ: "skincare", "thực phẩm chức năng", "app tài chính")
- `{{PLATFORM}}` — TikTok Ads / Meta Ads / YouTube Ads / Mix
- `{{AUDIENCE}}` — mô tả audience (ví dụ: "nữ 22-35 tuổi, quan tâm skincare, thu nhập trung bình khá")
- `{{COMPETITORS}}` — tên thương hiệu đối thủ (nếu biết)
- `{{OBJECTIVE}}` — mục tiêu chiến dịch (purchase / app install / awareness)
- `{{REGION}}` — Việt Nam (mặc định) / Đông Nam Á / Global
- `{{TIMEFRAME}}` — 90 ngày qua (mặc định)

---

## Template A — PURCHASE / ADD-TO-CART (sản phẩm vật lý)

Dùng khi: client bán sản phẩm hữu hình, mục tiêu là đơn hàng / add-to-cart / ROAS.

```
Tôi cần research paid ads đang chạy trên {{PLATFORM}} ở {{REGION}} cho ngành hàng "{{CATEGORY}}" (sản phẩm cụ thể: "{{PRODUCT}}"), target audience {{AUDIENCE}}, trong {{TIMEFRAME}}.

Mục tiêu: phân tích creatives đang convert tốt để viết kịch bản quảng cáo mới cạnh tranh.

Nguồn cần ưu tiên:
- TikTok Creative Center (https://ads.tiktok.com/business/creativecenter) — top performing ads trong ngành
- Meta Ads Library (https://www.facebook.com/ads/library) — ads đang active của: {{COMPETITORS}} và các brand tương tự
- YouTube Ads qua SERP: site:youtube.com "quảng cáo {{CATEGORY}}" hoặc "[brand] ads {{CATEGORY}}"

Hãy phân tích:

1. TOP AD CREATIVES
   - Liệt kê 10-15 ads đang chạy hoặc đã chạy nhiều nhất trong {{TIMEFRAME}}. Với mỗi ad: brand, platform, định dạng (UGC / Testimonial / Demo / Storytelling...), độ dài (giây), hook line 3 giây đầu.
   - Ưu tiên ads có dấu hiệu spend cao (chạy lâu ngày, nhiều variation, xuất hiện nhiều lần trong Creative Center).

2. HOOK ANALYSIS
   - Phân loại hook theo 4 nhóm: Pain hook / Desire hook / Curiosity hook / Social proof hook.
   - Tỉ lệ % mỗi loại. 5-8 hook line cụ thể đang dùng nhiều nhất, viết nguyên văn.

3. AD STRUCTURE
   - Cấu trúc phổ biến nhất trong ngành: mô tả từng giai đoạn (Hook → Body → CTA), thời gian mỗi giai đoạn.
   - Độ dài convert tốt nhất: 15s / 30s / 45s / 60s+?
   - Vị trí USP xuất hiện (giây mấy)?
   - CTA: mid-roll hay end-roll? Wording CTA phổ biến nhất?

4. USP MESSAGING & WHITESPACE
   - USP nào đang được khai thác nhiều (đã bão hòa)?
   - Góc tiếp cận nào chưa ai làm hoặc làm ít — đây là whitespace để khai thác.

5. OBJECTION & COUNTER
   - 3-5 phản đối/lo ngại phổ biến nhất trong comment hoặc video nghi vấn về ngành này (ví dụ: "có thật không?", "đắt quá", "bị dị ứng không?").
   - Cách các ads đang counter từng objection đó trong creative.

6. CONVERSION TRIGGERS
   - FOMO elements phổ biến: giới hạn thời gian / số lượng / ưu đãi giảm giá / combo.
   - Cách hiển thị giá trong ad (có hay không? Hiển thị sớm hay muộn?).
   - Social proof được dùng thế nào (số khách hàng, rating, UGC, KOL).

YÊU CẦU OUTPUT:
- Tiếng Việt 100%.
- Mọi ví dụ / số liệu phải kèm citation (tên brand, link nếu có, platform nguồn).
- Không chung chung — cần ví dụ ad cụ thể.
- Cuối cùng: "Recommendation" 5-7 câu — format nào, hook nào, độ dài nào đang convert tốt nhất cho ngành {{CATEGORY}} trên {{PLATFORM}} tại {{REGION}}.
```

---

## Template B — APP INSTALL / SIGN-UP / LEAD GEN (sản phẩm digital)

Dùng khi: client có app, SaaS, khóa học online, landing page đăng ký.

```
Research paid ads trên {{PLATFORM}} ở {{REGION}} cho ngành "{{CATEGORY}}" (sản phẩm: "{{PRODUCT}}"), mục tiêu install / sign-up / lead, target {{AUDIENCE}}, trong {{TIMEFRAME}}.

Nguồn: TikTok Creative Center, Meta Ads Library, Google UAC top creatives, App Store screenshots.
Đối thủ cụ thể cần research: {{COMPETITORS}}.

Phân tích:

1. TOP CREATIVES
   - 10-15 ads đang chạy, ghi rõ: brand, platform, format, độ dài, hook line đầu.
   - Dấu hiệu spend cao: chạy liên tục, nhiều variation A/B test, xuất hiện trong Creative Center top.

2. HOOK & PROBLEM FRAMING
   - Cách các ads frame vấn đề / nhu cầu để justify install (ví dụ: "bạn đang để tiền đẻ ra lãi suất thấp", "quên deadline mãi rồi").
   - 5-7 hook line cụ thể đang dùng.

3. DEMO & FEATURE SHOWCASE
   - Cách các ads cho thấy UI/UX sản phẩm: screen recording / animation / actor dùng app / kết quả thực tế.
   - Tốc độ demo (bao nhiêu feature trong 30s?).

4. VALUE PROPOSITION
   - Benefit nào được nhấn mạnh nhất: tiết kiệm thời gian / tiền bạc / tăng năng suất / social status / giải trí?
   - Whitespace: benefit nào chưa ai khai thác?

5. INSTALL TRIGGER
   - CTA wording phổ biến nhất ("Tải miễn phí", "Dùng thử 7 ngày", "Đăng ký nhận X").
   - Free trial / freemium có được nhắc không? Nhắc ở đâu trong ad?
   - Rating app, số user, giải thưởng được dùng thế nào.

6. OBJECTION
   - Lo ngại về: bảo mật dữ liệu / phí ẩn / độ phức tạp / "tôi đã có app khác".
   - Cách counter trong creative.

OUTPUT: Tiếng Việt, citations, kết bằng Recommendation về format + hook + CTA tốt nhất cho {{PRODUCT}} trên {{PLATFORM}}.
```

---

## Template C — AWARENESS / BRAND LIFT (nhận diện thương hiệu)

Dùng khi: client muốn tăng brand awareness, không cần conversion trực tiếp — thường là brand mới ra mắt hoặc campaign branding lớn.

```
Research paid ads dạng awareness / branding trên {{PLATFORM}} ở {{REGION}} cho ngành "{{CATEGORY}}", brand: "{{PRODUCT}}", target {{AUDIENCE}}, trong {{TIMEFRAME}}.

Đây là chiến dịch awareness — KPI là reach, view-through rate, brand recall — không phải purchase trực tiếp. Cần research creative approach khác với performance ads.

Nguồn: TikTok Brand Takeover / TopView, YouTube Masthead, Meta Reach campaigns trong ngành.
Đối thủ: {{COMPETITORS}}.

Phân tích:

1. BRAND AD FORMATS
   - Các brand lớn trong ngành đang dùng format nào cho awareness: mini-film / lifestyle montage / celebrity / animation / challenge / meme?
   - 10-12 ví dụ cụ thể, kèm tên brand và platform.

2. EMOTIONAL ANGLE
   - Cảm xúc chủ đạo đang khai thác: tự hào / vui vẻ / hoài niệm / khát vọng / kết nối cộng đồng?
   - Storytelling approach phổ biến nhất.

3. BRAND IDENTITY IN ADS
   - Cách các brand thể hiện visual identity trong 3 giây đầu mà không gây khó chịu (logo placement, color, music brand).
   - Có dùng mascot / brand character không?

4. MESSAGE HIERARCHY
   - Tagline / message chính xuất hiện ở đâu và bao lâu trong ad?
   - Cách kết nối message với lifestyle/aspiration của target audience.

5. MUSIC & SOUND
   - Loại nhạc nền phổ biến (jingle / nhạc trending / original soundtrack).
   - Có voiceover không? Giọng nam/nữ/trẻ em?

6. WHITESPACE
   - Cảm xúc / góc tiếp cận nào chưa brand nào trong ngành khai thác?

OUTPUT: Tiếng Việt, citations, kết bằng Recommendation về emotional angle + format + music style phù hợp nhất để tạo brand recall mạnh cho {{PRODUCT}} ở {{REGION}}.
```

---

## Mẹo gọi Deep Research hiệu quả cho Ads

- **Dùng tên đối thủ cụ thể** (`{{COMPETITORS}}`) — Deep Research tìm ads của Cocoon, Klairs, The Ordinary sẽ sắc nét hơn research "ngành skincare chung".
- **Ghi rõ nguồn ưu tiên** (TikTok Creative Center, Meta Ads Library) trong prompt — nếu không ghi, Deep Research có thể lấy từ blog review thay vì ads thực tế.
- **Thêm dấu hiệu spend cao** làm tiêu chí lọc — "ads chạy liên tục nhiều ngày" hoặc "có nhiều variation" là proxy tốt cho creative đang convert.
- **Nếu kết quả global** khi cần VN → gọi lại với thêm câu "chỉ lấy ví dụ từ thị trường Việt Nam, ưu tiên campaign đã chạy trên TikTok VN và Facebook VN".
- **Dùng Max cho campaign lớn** — client có budget > 50 triệu/tháng thì xứng đáng dùng Deep Research Max để có insight sâu hơn.
