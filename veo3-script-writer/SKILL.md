---
name: veo3-script-writer
description: Chuyển một kịch bản (truyện, đoạn văn, cốt truyện, content video) thành các prompt video AI có cấu trúc dùng cho Google Veo 3 và Flow. Hãy dùng skill này mỗi khi người dùng nhắc tới "Veo", "Veo 3", "Google Veo", "Flow", "kịch bản video AI", "tạo video từ kịch bản", "viết prompt video", "chia phân cảnh", hoặc upload một kịch bản/truyện và muốn biến nó thành video AI — kể cả khi họ không nói thẳng từ "prompt". Skill cũng kích hoạt khi người dùng đưa file .txt/.docx chứa kịch bản và yêu cầu xử lý để làm video.
triggers:
  - veo
  - veo 3
  - veo3
  - google veo
  - flow
  - google flow
  - kịch bản
  - kich ban
  - phân cảnh
  - phan canh
  - prompt video
  - video ai
  - tạo video
  - tao video
  - câu lệnh key
  - cau lenh key
risk_level: low
language: vi
handoff:
  - flow-operator
---

# Veo 3 Script Writer (Câu Lệnh Key — Danh Tú)

Skill này áp dụng quy trình "Câu Lệnh Key" để biến một kịch bản tiếng Việt thành **chuỗi prompt 8 giây** cho Google Veo 3, mỗi prompt là một phân cảnh độc lập có thể paste thẳng vào Flow để render.

Lý do skill tồn tại: Veo 3 chỉ tạo được clip 8 giây và yêu cầu mô tả rất cụ thể (góc máy, ánh sáng, trang phục, lời thoại, voice tone). Nếu không có khuôn mẫu, người dùng dễ quên nhân vật/bối cảnh sau vài phân cảnh, dẫn tới video mất tính nhất quán. Cấu trúc cố định bên dưới giải quyết đúng vấn đề đó — đặc biệt là nguyên tắc "lặp y nguyên" mô tả trang phục và bối cảnh khi chúng tái xuất hiện.

## Khi nào kích hoạt

Người dùng có thể nói rất nhiều cách khác nhau, tất cả đều nên dùng skill này:
- "Viết prompt Veo cho kịch bản này"
- "Chia phân cảnh giúp tôi làm video AI"
- "Tôi có truyện, làm thành video bằng Flow"
- "Tạo câu lệnh Veo 3 từ đoạn văn này"
- Upload file .txt/.docx kịch bản kèm câu hỏi mơ hồ kiểu "làm video"

Nếu người dùng chỉ hỏi lý thuyết về Veo (không có kịch bản cụ thể), trả lời ngắn gọn và mời họ gửi kịch bản — không cần chạy full quy trình.

## Quy trình 7 bước

### Bước 1 — Nhận kịch bản

Kịch bản có thể đến theo hai cách. Xử lý cả hai:

- **Dán trực tiếp trong chat**: làm việc ngay trên nội dung đó.
- **File đính kèm (.txt, .docx, .md, .pdf)**: dùng tool đọc file phù hợp (Read cho file text, hoặc skill `docx`/`pdf` nếu cần). Nếu file dài, đọc trọn vẹn trước khi chia cảnh — đừng đoán nội dung từ vài dòng đầu.

Nếu kịch bản chưa rõ (chỉ có ý tưởng 1-2 câu), hỏi người dùng có muốn skill viết nháp một kịch bản trước không, **đừng** tự bịa thêm tình tiết rồi cho ra prompt.

### Bước 2 — Trích xuất nhân vật chính & bối cảnh tái xuất

Trước khi chia phân cảnh, viết một mục **"Nhân vật & Bối cảnh"** ở đầu output. Đây là việc quan trọng nhất để giữ nhất quán xuyên suốt video.

Với mỗi **nhân vật chính** (xuất hiện ≥ 2 phân cảnh), mô tả ngắn:
- Tên / vai (cô gái, ông lão, chàng trai...)
- Ngoại hình cố định (tuổi, vóc dáng, tóc, đặc điểm khuôn mặt)
- Trang phục mặc định (nếu thay đổi giữa các mốc thời gian thì liệt kê từng bộ)

Với mỗi **bối cảnh tái xuất** (≥ 2 lần), mô tả chi tiết một lần ở đây để các phân cảnh sau "lặp y nguyên".

Mục này giúp người dùng đối chiếu khi tạo ảnh tham chiếu (reference image) cho nhân vật trên Flow/Midjourney. Nói rõ với người dùng rằng phần mô tả nhân vật chỉ để **họ tự đọc và làm ảnh tham chiếu** — *không* được nhúng vào trường Subject trong từng prompt.

### Bước 3 — Sinh "Image Asset Brief" cho Flow + NanoBananaPro

Đây là **bước bắt buộc trước khi viết prompt video**. Lý do: nếu một phân cảnh bất kỳ có nhân vật, bối cảnh, đồ vật hoặc con vật cụ thể, Veo sẽ render khác nhau giữa các shot trừ khi bạn gắn ảnh tham chiếu (Ingredients) trong Flow. Skill phải sinh sẵn brief để người dùng tạo ảnh trước trên Flow bằng **NanoBananaPro**.

Quét toàn bộ kịch bản và liệt kê **mọi entity cần ảnh tham chiếu**, chia 4 nhóm:

1. **Nhân vật (Characters)** — bất cứ ai có mặt ≥ 1 phân cảnh.
2. **Bối cảnh (Locations/Settings)** — không gian xuất hiện trong video.
3. **Đồ vật (Props)** — vật phẩm có vai trò cụ thể (chiếc nhẫn, cuốn sách cổ, chiếc xe đặc trưng...).
4. **Con vật (Animals/Creatures)** — thú cưng, động vật, sinh vật giả tưởng.

Với mỗi entity, viết một mục theo template:

```
[Nhân vật / Bối cảnh / Đồ vật / Con vật] — Tên entity
- Mô tả chi tiết (Prompt sinh ảnh): Cần xác định rõ:
  + Chủ thể là ai/cái gì:
    * Đặc điểm nhận dạng: Giới tính, độ tuổi, vóc dáng, kiểu tóc/màu tóc, màu da, màu mắt, các nét đặc trưng (sẹo, kính, râu, nếp nhăn...).
    * Trang phục & Phụ kiện: Loại quần áo cụ thể, màu sắc, phong cách (casual, suit, bảo hộ...), phụ kiện đi kèm (mũ, túi xách, đồng hồ, găng tay...).
    * Biểu cảm & Thần thái: Vui vẻ, nghiêm nghị, hoảng hốt, tự tin, mệt mỏi...
    * Tư thế & Hành động: Đứng, ngồi, khoanh tay, nhìn thẳng, nghiêng 30 độ...
  + Background/Bối cảnh là gì:
    * Yếu tố địa lý & văn hóa: Bắt buộc dựa vào kịch bản để xác định bối cảnh đặc trưng (ví dụ: đường phố Việt Nam, kiến trúc nhà cấp 4, công trường xây dựng ở Việt Nam...). Không gian phải phản ánh đúng quốc gia/vùng miền của cốt truyện.
    * Môi trường & Không gian: Chi tiết kiến trúc, nội/ngoại thất, thời gian trong ngày, phong cách ánh sáng, thời tiết.
  + Có những đồ vật gì bên trong: (đạo cụ cầm tay, máy móc xung quanh, vật dụng đi kèm đặc trưng)
- Aspect ratio: 3:4 (chân dung nhân vật) hoặc 16:9 / 1:1 cho bối cảnh, đồ vật, con vật toàn thân
- Số lượng ảnh: Chỉ tạo 1 lần ra 4 ảnh chính diện. Không cần tạo riêng các góc nghiêng trái, nghiêng phải hay góc toàn thân.
* Lưu ý khi tạo Ingredients: Flow tự động sinh ra 4 kết quả góc chính diện. Nếu người dùng ưng ý 1 trong 4 ảnh đó, hãy chốt luôn và nhảy qua tạo thành phần khác. Chỉ khi nào người dùng không ưng ý bất kỳ ảnh nào mới cần gen lại (regenerate).
- Tên Ingredient trong Flow: (gợi ý đặt nhãn, ví dụ "Lan_portrait", "PhongKhach_BacAu")
```

**Quy tắc aspect ratio:**

- **Chân dung nhân vật → luôn 3:4** (Flow + NanoBananaPro tối ưu cho ratio này khi tạo Ingredient nhân vật).
- **Bối cảnh toàn cảnh → 16:9** (giữ chiều ngang).
- **Đồ vật, con vật → 1:1 hoặc 4:3** (vuông để dễ crop trong Veo).
- **Nhóm 2+ nhân vật cùng khung → 3:4** nếu quay đứng, **16:9** nếu quay ngồi/dài ngang.

Sau danh sách, ghi 1 dòng nhắc người dùng:

> Hãy mở **Google Flow → Ingredients → Generate with NanoBananaPro**, paste từng mô tả ở trên, đặt aspect ratio đúng, sinh ảnh, đặt nhãn trùng tên Ingredient gợi ý. Quay lại bước render video sau khi đủ ảnh tham chiếu.

### Bước 4 — Hỏi định dạng video & spec render

Trước khi viết prompt, **hỏi người dùng** đúng 1 câu:

> "Video này bạn muốn quay **dọc 9:16** (TikTok/Reels/Shorts) hay **ngang 16:9** (YouTube)? Mặc định tôi sẽ chọn 9:16 nếu bạn không trả lời."

Ghi lại lựa chọn vào output. Nếu người dùng chọn ngang, đổi cách phân bố subject trong từng prompt (ví dụ thêm "wide shot" thay vì "close-up từ trên xuống").

Spec render cố định cho mọi phân cảnh (ghi 1 lần ở đầu phần prompt):

| Tham số | Giá trị | Vị trí trên UI Flow |
|---|---|---|
| Loại | **Video** | Tab Video (không phải Image / Frames / Ingredients) |
| Aspect ratio | **9:16** (mặc định) hoặc 16:9 | Chọn 9:16 hoặc 16:9 ngay bên dưới tab |
| Số take mỗi shot | **x4** | Chọn x4 trong dãy x1 / x2 / x3 / x4 |
| Model + Priority | **Veo 3.1 - Fast [Lower Priority]** | Dropdown giữa (gộp model và priority thành 1 option) |
| Thời lượng | **8s** | Chọn 8s trong dãy 4s / 6s / 8s |

Tuyệt đối CHỈ sử dụng **Veo 3.1 - Fast [Lower Priority]**. KHÔNG ĐƯỢC phép gợi ý hay sử dụng các phiên bản khác (như Quality hay Standard Priority) dưới bất kỳ hình thức nào.

### Bước 5 — Chia phân cảnh

Mỗi phân cảnh tương ứng **một clip Veo 8 giây**. Quy tắc:

- Hành động phức tạp → chia làm nhiều phân cảnh nhỏ (không giới hạn số lượng).
- Một phân cảnh chỉ nên có **một hành động chủ đạo** + tối đa 1-2 câu thoại.
- Đánh số liên tục: Phân cảnh 1, Phân cảnh 2, ...
- Khi cùng một mốc thời gian (ví dụ "buổi sáng ngày thứ Hai" lặp qua 3 phân cảnh liên tiếp), trang phục nhân vật phải **lặp lại y nguyên** — đừng cố viết lại cho đỡ trùng.
- Khi bối cảnh tái xuất, copy lại **đúng** mô tả ở Bước 2 vào trường Location.

Lý do của nguyên tắc lặp y nguyên: Veo 3 sinh từng clip độc lập, không "nhớ" clip trước. Mọi sự khác biệt từ ngữ (dù là đồng nghĩa) đều có thể dẫn tới khác model, khác màu áo, khác kiểu phòng. Lặp nguyên văn = nhất quán.

### Bước 6 — Viết prompt cho từng phân cảnh

Mỗi phân cảnh viết thành **một đoạn văn duy nhất** (không có dấu xuống dòng), để khi dán vào Flow không bị lỗi tự động Submit:

```text
Phân cảnh [N]:
Time: [thời gian trong ngày, mùa, năm]. Location: [bối cảnh chi tiết. Khi tái xuất, lặp y nguyên mô tả đã viết ở Bước 2]. Subject: [chỉ ghi vai trò nếu là nhân vật chính. Mô tả rõ trang phục nếu là quần chúng]. Props: [đạo cụ xuất hiện, lặp y nguyên tên nếu đã có ở Bước 2]. Emotion: [biểu cảm khuôn mặt và thần thái]. Action: [Miêu tả cực kỳ chi tiết vật lý của chuyển động trong 8 giây. Không dùng từ chung chung (như "ngã", "đi"). Phải tả rõ động tác của từng bộ phận cơ thể, sự tương tác với vật thể và hướng chuyển động trong không gian (vd: tay trái vung lên đập mạnh vào nút, cơ thể nảy lên 5cm, đất đá văng tung tóe)]. Camera Angle: [BẮT BUỘC DÙNG TIẾNG ANH: Low-angle, Wide shot, POV... tra cứu trong cinematic-terms.md]. Camera Movement: [BẮT BUỘC DÙNG TIẾNG ANH: Tracking shot, Pan right, Static...]. Lighting & Style: [BẮT BUỘC DÙNG TIẾNG ANH: Volumetric lighting, Cinematic, Film grain...]. SFX: [âm thanh môi trường/tiếng động]. Line: "[lời thoại — vừa đủ để đọc trong ~6-7 giây, chừa 1-2 giây cho hành động]". Voice Tone: [mô tả cảm xúc + thần thái]. Ở bước này, bạn hãy Chọn giọng đọc phù hợp ở bên dưới để thêm vào Câu Lệnh.
```

Lưu ý quan trọng về **trường Voice Tone**: phải kết thúc *đúng nguyên văn* bằng câu `Ở bước này, bạn hãy Chọn giọng đọc phù hợp ở bên dưới để thêm vào Câu Lệnh.` — đây là cờ nhắc người dùng paste thêm một mẫu giọng từ thư viện. Đừng viết tắt hay thay từ.

Lưu ý về **trường Line**: nếu phân cảnh không có thoại (chỉ tả hành động/khung cảnh), ghi `Line: (không có thoại)` và **bỏ luôn** dòng Voice Tone.

### Bước 7 — Output kép

Trình bày kết quả theo hai dạng song song, với thứ tự nội dung **cố định**:

1. **Trong chat (markdown)** — để người dùng xem nhanh và copy từng khối, sắp xếp theo đúng thứ tự dùng trên Flow:
   - **(A)** Mục "Nhân vật & Bối cảnh" (kết quả Bước 2) — để user đối chiếu.
   - **(B)** "Image Asset Brief" (kết quả Bước 3) — danh sách entity cần tạo ảnh trên NanoBananaPro, kèm aspect ratio.
   - **(C)** "Spec Render" (kết quả Bước 4) — bảng aspect ratio video, x4 take, Veo 3.1 - Fast [Lower Priority].
   - **(D)** Toàn bộ phân cảnh prompt (kết quả Bước 6).
   - **(E)** Danh sách giọng đọc gợi ý ở cuối (đọc từ `references/voice-tones.md`, chỉ kéo những giọng phù hợp với nội dung).

2. **File .docx** — lưu vào `E:\Ai Video\scripts\` với tên dạng `veo3-prompts-[ten-kich-ban]-[YYYYMMDD].docx`. Dùng skill `docx` để tạo file. Cấu trúc file:
   - Trang 1: tiêu đề + mục Nhân vật & Bối cảnh
   - Trang 2: Image Asset Brief (bảng tên/mô tả/ratio/số ảnh)
   - Trang 3: Spec Render
   - Mỗi phân cảnh tiếp theo = một heading + 12 dòng prompt
   - Trang cuối: thư viện giọng đọc + ghi chú Flow ngắn

3. **Hướng dẫn Flow ngắn** ở cuối tin nhắn chat — đọc từ `references/flow-guide.md`, tóm thành luồng 5 bước: (1) Tạo Ingredients trên NanoBananaPro theo Image Asset Brief → (2) Đặt nhãn đúng → (3) Chuyển sang Scene Builder, tạo Shot mới → (4) Paste prompt + gắn Ingredients tương ứng + chọn aspect ratio + Veo 3.1 - Fast [Lower Priority] + x4 → (5) Chọn take ưng nhất rồi ghép timeline.

Cuối cùng, gửi link `[Mở file prompt](computer:///E:/Ai Video/scripts/veo3-prompts-...docx)`.

Sau khi in xong toàn bộ output, **kích hoạt handoff sang flow-operator**:

> Antigravity có thể tự động mở Flow, tạo Ingredients và submit từng Shot render thay bạn. Gõ **"làm trên Flow cho tôi"** để bắt đầu — đảm bảo bạn đã đăng nhập Google Account trên browser trước.

## Các quy tắc bất biến

Đây là những thứ tuyệt đối không được "tối ưu" hay rút gọn, vì chúng là lý do skill tồn tại:

1. **Trang phục lặp y nguyên trong cùng mốc thời gian.** Đừng paraphrase.
2. **Bối cảnh tái xuất lặp y nguyên** câu mô tả ở Bước 2.
3. **Nhân vật chính chỉ ghi vai trò ngắn** ở trường Subject — vì có ảnh tham chiếu.
4. **Câu cố định cuối Voice Tone** phải nguyên văn.
5. **Mỗi clip ≤ 8 giây** → thoại không quá ~25-30 từ tiếng Việt.
6. **Tiếng Việt 100%** trong nội dung prompt (trừ tên trường Time/Camera Angle/... vốn là tiếng Anh).
7. **Bất kỳ phân cảnh nào có nhân vật / bối cảnh / đồ vật / con vật cụ thể đều PHẢI có entry tương ứng trong Image Asset Brief (Bước 3).** Không bao giờ skip — đây là điều kiện bắt buộc để Flow render nhất quán qua nhiều shot.
8. **Chân dung nhân vật luôn 3:4** trên NanoBananaPro. Đừng dùng 1:1 hay 16:9 cho ảnh chân dung — Flow Ingredient sẽ crop sai.
9. **Hỏi user dọc/ngang trước khi viết prompt.** Mặc định 9:16 nếu user không trả lời.
10. **Spec render bắt buộc**: Tuyệt đối CHỈ sử dụng Veo 3.1 - Fast [Lower Priority] + x4 take. Không được đổi sang model khác kể cả khi user yêu cầu.
11. **Miêu tả Action siêu chi tiết (Micro-actions):** Tuyệt đối không dùng các động từ chung chung (như "ngã", "vui mừng", "làm việc", "chạy"). Bắt buộc phải chia nhỏ thành các chuyển động vật lý cụ thể của cơ thể và môi trường xung quanh (tay làm gì, chân để đâu, quỹ đạo di chuyển thế nào, vật thể tương tác ra sao). Veo 3 cần chi tiết vật lý để render chính xác sự thay đổi trong 8 giây.

## Tài nguyên đính kèm

Đọc thêm khi cần:

- `references/voice-tones.md` — thư viện 8 nhóm giọng đọc mẫu (quảng cáo, kể chuyện, học sinh, giáo viên, cổ tích, lịch sử...). Chọn 2-3 giọng phù hợp nhất với kịch bản, đừng dump cả thư viện.
- `references/cinematic-terms.md` — từ điển thuật ngữ máy quay, ánh sáng và phong cách (tiếng Anh). Bạn **bắt buộc** phải sử dụng các từ vựng trong file này để điền vào trường Camera Angle, Camera Movement, và Lighting & Style, tuyệt đối không dùng tiếng Việt.
- `references/example-output.md` — một ví dụ đầy đủ từ kịch bản ngắn → output cuối, để đối chiếu định dạng.
- `references/flow-guide.md` — hướng dẫn dùng prompt trên Google Flow.

## Sai lầm thường gặp cần né

- **Viết quá nhiều thông tin trong một phân cảnh** → Veo bị quá tải, output không đúng. Chia nhỏ.
- **Quên trường nào đó** trong câu lệnh → vẫn phải có, nếu không áp dụng thì ghi "(không có)".
- **Mô tả ngoại hình nhân vật chính trong từng phân cảnh** → không cần, đã có ảnh tham chiếu. Lặp lại sẽ gây khác model.
- **Dịch các tên trường và thuật ngữ kỹ thuật sang tiếng Việt** ("Góc máy" thay cho "Camera Angle", "quay từ trên xuống" thay vì "Top-down shot") → Bắt buộc giữ nguyên tên trường tiếng Anh, đồng thời phần nội dung của Camera Angle, Camera Movement, Lighting & Style cũng **phải dùng tiếng Anh** để Veo parse đúng nhất.
- **Bịa giọng đọc** không có trong thư viện → luôn lấy từ `references/voice-tones.md`, hoặc nói rõ với người dùng đây là giọng tự đề xuất.
- **Bỏ qua bước Image Asset Brief** "vì kịch bản có vẻ đơn giản" → sai. Ngay cả khi chỉ có 1 nhân vật + 1 bối cảnh, vẫn phải sinh brief để user tạo Ingredient. Bỏ qua = video lệch nhân vật giữa các shot.
- **Quên hỏi dọc/ngang** rồi viết luôn theo 16:9 → user thường làm Reels/TikTok cần 9:16. Hỏi 1 câu trước khi viết là rẻ, viết lại cả output là đắt.
