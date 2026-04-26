---
name: flow-operator
description: Tự động mở Google Flow trên browser, tạo Ingredients bằng NanoBananaPro, tạo từng Shot trong Scene Builder, paste prompt, gắn Ingredients, cài spec render và bấm Generate — thay người dùng làm toàn bộ thao tác thủ công trên Flow. Kích hoạt skill này khi người dùng nói "mở Flow", "tự động làm trên Flow", "upload lên Flow", "render trên Flow", "làm trên Flow cho tôi", hoặc bất kỳ khi nào veo3-script-writer đã tạo xong output và người dùng muốn chuyển sang bước thực thi trên Flow mà không muốn tự tay làm. QUAN TRỌNG: người dùng phải đã đăng nhập Google Account trên browser — skill không tự đăng nhập được.
triggers:
  - mở flow
  - mo flow
  - tự động flow
  - tu dong flow
  - upload flow
  - render flow
  - làm trên flow
  - lam tren flow
  - flow operator
  - tạo ingredients
  - tao ingredients
  - tạo shot
  - tao shot
  - chạy flow
  - chay flow
  - antigravity làm flow
risk_level: medium
language: vi
requires_browser: true
handoff: []
---

# Flow Operator — Tự động thao tác trên Google Flow

Skill này điều khiển browser để thực hiện toàn bộ quy trình Google Flow thay người dùng: tạo Ingredients bằng NanoBananaPro → tạo Shot trong Scene Builder → paste prompt → gắn Ingredients → cài spec render → bấm Generate.

**Điều kiện bắt buộc trước khi bắt đầu:**
- Người dùng phải **đã đăng nhập** Google Account trên browser (skill không tự đăng nhập được).
- Phải có **output từ `veo3-script-writer`**: Image Asset Brief + danh sách prompt phân cảnh.

**Nguyên tắc vàng — TUYỆT ĐỐI KHÔNG vi phạm:**
> ⚠️ **ẢNH TRƯỚC — VIDEO SAU.** Toàn bộ Ingredients (ảnh tham chiếu) phải được tạo và lưu xong 100% trước khi bắt đầu tạo bất kỳ Shot video nào. Không bao giờ xen kẽ tạo ảnh và tạo video.
>
> ⚠️ **VIDEO LUÔN DỌC 9:16.** Mọi Shot video đều đặt 9:16 — không có ngoại lệ trừ khi user gõ tường minh "tôi cần ngang 16:9".
>
> ⚠️ **PHẢI CÓ ẢNH THAM CHIẾU** cho mọi phân cảnh có: người (dù chính hay phụ) / đồ vật đặc trưng / bối cảnh cụ thể. Chỉ bỏ qua nếu phân cảnh là cảnh trừu tượng/thiên nhiên không có người/vật.

Lý do skill tồn tại: sau khi `veo3-script-writer` sinh ra 5-15 phân cảnh kèm Image Asset Brief, người dùng phải paste thủ công từng mô tả vào Flow, sinh ảnh, đặt nhãn, rồi lại paste từng prompt 12 dòng vào từng Shot — lặp đi lặp lại và dễ nhầm. Skill này tự hóa toàn bộ phần thao tác đó.

---

## Khi nào kích hoạt

- Sau khi `veo3-script-writer` in xong output và người dùng gõ: "làm trên Flow cho tôi", "mở Flow", "tự động render"
- Khi người dùng paste link project Flow + output từ veo3-script-writer và muốn Antigravity tiếp quản
- Khi người dùng đang ở giữa flow và muốn Antigravity tiếp tục từ điểm dừng

---

## Quy trình 5 phase

### Phase 0 — Chuẩn bị & xác nhận đầu vào

Trước khi mở browser, **đọc và parse** toàn bộ output từ `veo3-script-writer`:

**Checklist đầu vào bắt buộc:**
- [ ] **Image Asset Brief**: danh sách entity (nhân vật / bối cảnh / đồ vật / con vật) với mô tả, aspect ratio, số ảnh, tên Ingredient gợi ý.
- [ ] **Danh sách prompt phân cảnh**: N khối 12 dòng (Time → Voice Tone).
- [ ] **Tên project** (lấy từ tên kịch bản hoặc hỏi user).
- [ ] **Flow project URL** (nếu đã có sẵn) hoặc cần tạo mới.

> Spec render mặc định cố định: **Video / 9:16 / x4 / Veo 3.1 - Fast [Lower Priority] / 8s** — không cần hỏi user.

Trước khi mở browser, **đếm số Ingredients cần tạo** (từ Image Asset Brief) và số Shot cần tạo (từ danh sách phân cảnh). Nếu thiếu bất kỳ mục nào → hỏi user.

Tóm tắt cho user:
```
Tôi sẽ thực hiện trên Flow theo đúng thứ tự:

BƯỚC 1 — TẠO ẢNH THAM CHIẾU (NanoBananaPro):
  [N] Ingredients: [liệt kê tên và aspect ratio]
  → Lưu toàn bộ lên Google Drive (4K) trước khi sang bước 2

BƯỚC 2 — TẠO VIDEO (chỉ sau khi ảnh xong 100%):
  [M] Shot: Phân cảnh 1 → Phân cảnh M
  Spec: Video / 9:16 / x4 / Veo 3.1 - Fast [Lower Priority] / 8s

Project: [tên] — [URL nếu có / "tạo mới"]

Bạn đã đăng nhập Google Account trên browser chưa? (Gõ "rồi" để bắt đầu)
```

---

### Phase 1 — Mở Flow & chuẩn bị project

Dùng `browser_subagent` để:

1. **Nếu có URL project**: mở thẳng URL đó.
2. **Nếu chưa có project**: mở `https://labs.google/fx/tools/flow/` → tìm nút **New Project** → click → đặt tên project → xác nhận đã tạo xong.

**Xử lý lỗi:**
- Nếu trang yêu cầu đăng nhập → dừng, báo user: "Bạn cần đăng nhập Google Account trên browser trước. Sau khi đăng nhập xong, gõ 'tiếp tục' để Antigravity tiếp quản."
- Nếu trang load lỗi / timeout → thử reload 1 lần, nếu vẫn lỗi báo user.

Báo user khi xong Phase 1: `✅ Đã vào project "[tên]". Bắt đầu tạo Ingredients...`

---

### Phase 2 — Tạo Ingredients bằng NanoBananaPro

> ⚠️ **PHASE NÀY PHẢI HOÀN THÀNH 100% TRƯỚC KHI SANG PHASE 3.** Không tạo Shot video khi còn bất kỳ Ingredient nào chưa xong.

**Phạm vi bắt buộc tạo Ingredient** — tạo ảnh tham chiếu cho MỌI entity có trong kịch bản:
- Bất kỳ **người** nào xuất hiện trong video (nhân vật chính, nhân vật phụ, người trong đám đông đặc trưng)
- Bất kỳ **bối cảnh cụ thể** nào (phòng, đường phố, công trường, văn phòng...)
- Bất kỳ **đồ vật đặc trưng** nào (sản phẩm, xe, máy móc...)
- Bất kỳ **con vật** nào

*Chỉ bỏ qua nếu:* phân cảnh là cảnh trừu tượng / thiên nhiên chung chung không có người/vật cụ thể (ví dụ: "bầu trời xanh", "biển cả" chung chung).

**Thứ tự tạo Ingredient:**
1. Nhân vật chính → **3 ảnh** (chính diện, nghiêng trái 30°, nghiêng phải 30°)
2. Nhân vật phụ → **1-2 ảnh**
3. Bối cảnh → **1-2 ảnh** (góc nhìn chính + góc nhìn phụ nếu có)
4. Đồ vật / Props → **1 ảnh**
5. Con vật → **1-2 ảnh**

**Cho mỗi entity, thực hiện trên browser:**

```
1. Mở tab / panel "Ingredients" trong project Flow
2. Tìm và click nút "Generate" (hoặc "+" / "Add Ingredient")
3. LUÔN chọn engine "NanoBananaPro" — đây là engine bắt buộc, không dùng engine khác
4. Paste mô tả entity vào ô prompt
5. Đặt Aspect Ratio theo loại entity:
   - Chân dung người (chính hoặc phụ) → 3:4  ← CỨNG, không thương lượng
   - Bối cảnh toàn cảnh                  → 16:9
   - Đồ vật / con vật                    → 1:1
6. Với nhân vật cần 4 ảnh, lặp lại 4 lần với prompt điều chỉnh:
   - Lần 1: "[mô tả đầy đủ] — chính diện, nhìn thẳng vào camera, background trung tính"
   - Lần 2: "[mô tả đầy đủ] — nghiêng trái 30 độ, background trung tính"
   - Lần 3: "[mô tả đầy đủ] — nghiêng phải 30 độ, background trung tính"
   - Lần 4: "[mô tả đầy đủ] — góc toàn thân (hoặc cận cảnh tuỳ kịch bản), background trung tính"
7. Cài đặt số lượng kết quả sinh ra là 4 (mặc định Flow gen 4 ảnh) và Click Generate / Submit → đợi ảnh sinh xong.
8. KIỂM TRA & XÁC NHẬN (QUAN TRỌNG): 
   - Không được tự ý chọn ảnh! Chụp screenshot 4 kết quả vừa sinh ra và gửi cho người dùng.
   - Hỏi người dùng: "Bạn muốn chọn ảnh nào làm tham chiếu? Hoặc bạn có muốn gen lại không?"
   - Nếu người dùng chưa ưng ý → Bấm Regenerate và lặp lại bước chụp hình/hỏi này liên tục cho đến khi người dùng chốt được ảnh thì thôi.
9. Lưu ảnh (chỉ lưu ảnh người dùng đã chốt):
   a. Click "Save" / "Add to Ingredients" trong Flow
   b. Đặt nhãn = tên Ingredient gợi ý từ brief (ví dụ: "Lan_portrait")
   c. Nếu Flow cho phép tải ảnh: tải về và lưu lên Google Drive với chất lượng 4K
      → Tên file: "[label]-[số thứ tự].png" (ví dụ: "Lan_portrait-1.png")
      → Thư mục Drive: "Flow Ingredients / [tên project]"
```

**Báo tiến độ sau mỗi entity:**
```
📦 Ingredient [N/Total]: "[tên]"
   └─ Engine: NanoBananaPro
   └─ Ratio: [3:4 / 16:9 / 1:1] | Số ảnh: [N]
   └─ Nhãn Flow: "[label]"
   └─ Drive: ✅ đã lưu / ⚠️ chưa lưu được
```

**Xử lý lỗi trong Phase 2:**
- Không tìm thấy engine NanoBananaPro → **dừng, báo user** — không dùng engine khác thay thế.
- Ảnh sinh ra quá xấu / lệch sau 2 lần thử → báo user, cho chọn: (a) thử lại với prompt điều chỉnh, (b) bỏ qua và user tự tạo thủ công, (c) dừng để user làm toàn bộ phase này.
- Không tìm thấy ô đặt nhãn → lưu ảnh, nhắc user đặt nhãn thủ công trước khi sang Phase 3.
- Không tải được ảnh về Drive → lưu trong Flow vẫn được, nhắc user tải thủ công sau.

Khi xong Phase 2:
```
✅ Hoàn thành tất cả [N] Ingredients!
Tất cả ảnh đã sẵn sàng trong Flow Ingredients.
Bắt đầu tạo video (Phase 3)...
```

---

### Phase 3 — Tạo Shot trong Scene Builder

Với **mỗi phân cảnh** trong danh sách prompt, thực hiện:

```
1. Mở tab / panel "Scene Builder"
2. Click "New Shot" / "+" để tạo Shot mới
3. Đặt tên Shot = "Phân cảnh [N]" (để dễ theo dõi)
4. Tìm ô prompt / text input của Shot → **QUAN TRỌNG: Chỉ dùng DUY NHẤT 1 câu lệnh (đảm bảo là MỘT ĐOẠN VĂN DUY NHẤT, không có dấu xuống dòng) paste thẳng vào ô prompt. Tuyệt đối không chia nhỏ, gõ phím Enter hay viết lại để tránh Flow tự động Submit sai.**
   - Nội dung paste: "Time: ... Location: ... Subject: ... Props: ... Emotion: ... Action: ... Camera Angle: ... Camera Movement: ... Lighting & Style: ... SFX: ... Line: ... Voice Tone: ..."
5. **Cài Settings** — đặt theo đúng thứ tự trên UI:

| Setting | Tên UI thường gặp | Giá trị mặc định |
|---|---|---|
| Loại | Tab **"Video"** | Click tab Video (không phải Image/Frames/Ingredients) |
| Aspect Ratio | "9:16" / "16:9" | **9:16** (hoặc theo spec) |
| Output Count | dãy "x1 / x2 / x3 / x4" | **x4** |
| Model + Priority | Dropdown: "Veo 3.1 - Fast [Lower Priority]" | **Veo 3.1 - Fast [Lower Priority]** |
| Duration | dãy "4s / 6s / 8s" | **8s** |
6. Attach Ingredients:
   - Xác định Ingredients cần gắn cho phân cảnh này dựa trên Subject, Location và các đồ vật trong prompt.
   - Tìm panel Ingredients / References của Shot.
   - Kéo hoặc click thêm TẤT CẢ Ingredient liên quan vào cùng một Shot (Flow cho phép gắn nhiều ảnh tham chiếu cùng lúc để tổng hợp).
   - Ví dụ: Phân cảnh cô gái ở phòng khách đang cầm cốc cà phê → gắn cả 3 ảnh: "Lan_portrait" + "PhongKhach_BacAu" + "CocCaPhe_Prop".
7. Verify đã đủ settings trước khi Generate:
   - Prompt đã paste?
   - Aspect ratio đúng?
   - Ingredients đã gắn?
8. Click "Generate"
9. KHÔNG đợi render xong — chuyển sang Shot tiếp theo ngay
   (Flow render background, tiết kiệm thời gian)
```

**Báo tiến độ sau mỗi Shot:**
```
🎬 Shot [N/Total] "Phân cảnh [N]": đã submit render
   └─ 🖼️ Ingredients gắn: [danh sách tên]
   └─ ⚙️ Video / 9:16 / x4 / Veo 3.1 - Fast [Lower Priority] / 8s
```

**Xử lý lỗi trong Phase 3:**
- Không tìm thấy ô paste prompt → chụp screenshot, mô tả vị trí, hỏi user.
- Ingredient không kéo được vào Shot → thử click thay vì drag; vẫn lỗi → báo user.
- Nút Generate bị disabled → kiểm tra còn thiếu trường nào (prompt? ratio? model?), báo user.
- **Aspect ratio bị đặt sai (16:9 thay vì 9:16)** → sửa lại trước khi Generate, không bỏ qua.

---

### Phase 4 — Kiểm tra & báo cáo

Sau khi submit tất cả Shots:

1. **Chụp screenshot** giao diện Scene Builder hiện tại để user xác nhận các Shot đã được tạo.
2. **Báo cáo tổng kết:**

```
✅ Hoàn thành! Đây là tóm tắt những gì đã làm trên Flow:

📦 Ingredients đã tạo:
  • [tên 1] — nhãn: "[label]" — [N] ảnh
  • [tên 2] — nhãn: "[label]" — [N] ảnh
  ...

🎬 Shots đã submit render:
  • Phân cảnh 1 — Ingredients: [...]
  • Phân cảnh 2 — Ingredients: [...]
  ...

⏳ Render đang chạy background (Low priority). Thường mất 10-30 phút.
   Quay lại Flow sau đó để chọn take ưng nhất từ mỗi Shot.

⚠️ Cần làm thủ công sau khi render xong:
  1. Vào từng Shot → chọn 1 take ưng nhất trong 4 take
  2. Kéo các Shot đã chọn vào Timeline theo thứ tự phân cảnh
  3. Thêm nhạc nền (nếu có từ research brief)
  4. Export → MP4
```

---

### Phase 5 — Hỗ trợ lỗi & reshoot (nếu cần)

Nếu sau khi render, người dùng quay lại và nói "cảnh X bị lỗi", "nhân vật sai mặt", "bối cảnh không đúng":

1. **Mở lại Shot bị lỗi** trong Scene Builder.
2. Tuỳ lỗi:
   - **Nhân vật sai mặt** → thêm Ingredient chân dung sắc nét hơn, click Regenerate.
   - **Bối cảnh không đúng** → kiểm tra trường Location trong prompt có lặp y nguyên không, sửa nếu lệch, Regenerate.
   - **Thoại sai / thiếu** → kiểm tra trường Line có đặt trong ngoặc kép không, sửa, Regenerate.
   - **Cần đổi góc máy** → sửa Camera Angle, giữ nguyên tất cả trường khác, Regenerate.
3. Báo user kết quả sau khi Regenerate.

---

## Các quy tắc bất biến

1. **Không bao giờ bắt đầu nếu user chưa xác nhận đã đăng nhập.** Mở browser mà chưa đăng nhập là lãng phí thời gian.
2. **ẢNH TRƯỚC — VIDEO SAU. Tuyệt đối không tạo Shot video khi còn Ingredient chưa hoàn thành.** Đây là quy tắc số 1 của toàn bộ quy trình.
3. **Video luôn dọc 9:16.** Không có ngoại lệ trừ khi user yêu cầu tường minh bằng văn bản.
4. **Chỉ dùng NanoBananaPro để tạo Ingredients.** Không dùng engine khác dù engine đó là mặc định hay trông "tiện hơn".
5. **Chân dung người (chính và phụ) luôn 3:4.** Crop sai ratio = ảnh lệch trong video = phải làm lại toàn bộ.
6. **Mọi cảnh có người / đồ vật / bối cảnh cụ thể đều cần Ingredient.** Không skip dù cảnh trông "đơn giản".
7. **Không đợi render xong mới sang Shot tiếp theo.** Flow render background — submit hết rồi đợi một lần.
8. **Paste prompt nguyên 1 đoạn văn, không rút gọn, không paraphrase, TUYỆT ĐỐI không có dấu xuống dòng.**
9. **Gắn đúng Ingredients cho từng Shot.** Khi không chắc → gắn tất cả liên quan.
10. **Lưu ảnh Ingredients lên Google Drive (4K) sau khi tạo** để tiết kiệm bộ nhớ máy tính.
11. **Báo tiến độ sau mỗi Ingredient và mỗi Shot** — không im lặng làm hàng loạt.
12. **Khi gặp UI thay đổi:** chụp screenshot, mô tả, hỏi user — không đoán mò.
13. **Không tự export video** — user tự chọn take và ghép timeline.

---

## Giới hạn của skill này

- **Không tự đăng nhập Google Account** — cần user đăng nhập sẵn.
- **Không chọn take thay user** — 4 take mỗi Shot cần mắt người đánh giá tính nhất quán nhân vật.
- **Không ghép timeline** — thứ tự, chuyển cảnh, nhạc nền là sáng tạo của user.
- **Phụ thuộc UI của Flow** — nếu Google thay đổi layout, skill cần cập nhật. Khi gặp UI không quen, skill sẽ dừng và báo user thay vì đoán mò.
- **Không chạy được khi Flow bị lỗi phía server** — báo user và đề xuất thử lại sau.

---

## Tài nguyên đính kèm

- `references/flow-ui-map.md` — bản đồ UI của Flow: tên tab, tên nút, vị trí các element chính. Cập nhật khi Flow thay đổi giao diện.

---

## Sai lầm thường gặp cần né

- **Tạo Shot video khi chưa xong Ingredients** → vi phạm quy tắc số 1 — phải làm lại từ đầu.
- **Dùng engine khác thay NanoBananaPro** → chất lượng ảnh tham chiếu không đảm bảo, nhân vật sẽ lệch.
- **Đặt chân dung nhân vật sai ratio** → luôn 3:4, không dùng 1:1 hay 16:9 cho chân dung người.
- **Tạo Shot với aspect ratio 16:9 thay vì 9:16** → video ngang trên TikTok/Reels là thất bại.
- **Bỏ qua Ingredient cho nhân vật phụ** → Veo sẽ render khuôn mặt ngẫu nhiên mỗi cảnh — mất nhất quán.
- **Quên lưu ảnh lên Google Drive** → ảnh chỉ trong Flow, mất khi project bị xóa; tốn bộ nhớ máy tính.
- **Đợi từng render xong** → Flow chạy background, submit hết rồi đợi một lần.
- **Quên gắn Ingredients vào Shot** → Veo sinh nhân vật/bối cảnh ngẫu nhiên, không nhất quán.
- **Sửa wording prompt khi paste** → lặp y nguyên, không "cải thiện" hay tóm tắt.
- **Đặt nhãn Ingredient khác tên gợi ý** → không khớp khi cần reshoot sau này.
