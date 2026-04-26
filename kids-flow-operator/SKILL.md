---
name: kids-flow-operator
description: Tự động hóa trình duyệt để vận hành Google Flow chuyên biệt cho các dự án đa thể loại và Hoạt hình (3D, 2D, v.v.). Tự động nhận diện Tỷ lệ khung hình (Aspect Ratio) và Phong cách nghệ thuật (Style) để áp dụng vào Ingredients và Shots. Kích hoạt khi người dùng muốn chuyển kịch bản thành video tự động.
triggers:
  - mở flow kids
  - tự động flow kids
  - làm hoạt hình trên flow
  - kids flow operator
  - universal flow
  - chạy flow hoạt hình
risk_level: medium
language: vi
requires_browser: true
handoff: []
---

# Kids Flow Operator — Tự động thao tác Google Flow (Đa thể loại)

Skill này điều khiển browser để thực hiện quy trình Google Flow thay người dùng. Điểm khác biệt so với bản gốc là khả năng **tùy biến linh hoạt** Tỷ lệ khung hình (Aspect Ratio) và Phong cách (Visual Style), cực kỳ phù hợp cho các dự án YouTube Kids, Hoạt hình đa thể loại, hoặc video ngang.

**Điều kiện bắt buộc trước khi bắt đầu:**
- Người dùng đã **đăng nhập** Google Account trên browser.
- Có sẵn output từ `kids-script-writer` (hoặc các agent khác): Image Asset Brief + Danh sách prompt phân cảnh.

**Nguyên tắc vàng (TUYỆT ĐỐI KHÔNG VI PHẠM):**
> ⚠️ **ẢNH TRƯỚC — VIDEO SAU.** Hoàn thành 100% Ingredients trước khi tạo Shot.
> 
> ⚠️ **STYLE & RATIO KHÔNG THỂ THIẾU.** Luôn chèn từ khóa phong cách (ví dụ: "3D Pixar style") vào MỌI prompt sinh ảnh và sinh video để đảm bảo tính nhất quán.
> 
> 🔒 **MODEL CỐ ĐỊNH: `Veo 3.1 - Fast [Lower Priority]` — KHÔNG ĐƯỢC DÙNG MODEL KHÁC.** Luôn chủ động chọn lại đúng model này trong dropdown trước khi bấm Generate. Nếu không tìm thấy → dừng, báo user, KHÔNG thay thế bằng model khác.
> 
> 🚫 **TUYỆT ĐỐI KHÔNG XÓA BẤT KỲ THỨ GÌ** trong project Flow — không xóa ảnh, không xóa video, không xóa ingredients, không xóa shots. Mọi thao tác xóa chỉ được thực hiện khi user gõ tường minh lệnh xóa kèm tên cụ thể.

---

## Quy trình 5 Phase

### Phase 0 — Chuẩn bị & Thu thập thông số động
Đọc và phân tích output từ kịch bản, xác định rõ **4 thông số then chốt** sau:
1. **Phong cách nghệ thuật (Visual Style):** (VD: `3D Pixar style animation`, `2D vector flat design`, `Stop motion clay`, `Realistic cinematic`). 
2. **Tỷ lệ Video (Video Aspect Ratio):** (VD: `16:9` cho YouTube, `9:16` cho Shorts, `1:1` cho vuông).
3. **Danh sách Ingredients (Image Asset Brief):** Đếm số lượng nhân vật, bối cảnh, đồ vật.
4. **🔒 URL Project Flow:** Xem quy tắc bên dưới.

> 🔒 **QUY TẮC 1 PROJECT — TUYỆT ĐỐI KHÔNG VI PHẠM:**
> Mỗi dự án (series, phim, chiến dịch) chỉ dùng **DUY NHẤT 1 project Flow** xuyên suốt tất cả các tập.
> - **Nếu user chưa cung cấp tên project hoặc URL** → **BẮT BUỘC hỏi ngay:**
>   `"Bạn đã có project Flow cho series này chưa? Nếu có, hãy dán URL vào đây. Nếu chưa, tôi sẽ tạo mới và lưu URL lại."`
> - **Nếu đã có URL** → mở thẳng URL đó, **KHÔNG tạo project mới**.
> - **KHÔNG BAO GIỜ tự ý tạo project mới** khi đã có project cũ.
> - Lý do: Ingredients lưu theo project. Tạo mới = mất Ingredients cũ = phải gen lại toàn bộ.

*Nếu kịch bản không ghi rõ Style / Ratio, hỏi người dùng để xác nhận.*

Báo cáo tóm tắt cho người dùng trước khi mở browser:
```
Thông số dự án đã nhận diện:
- Style: [Tên style]
- Tỷ lệ Video: [16:9 / 9:16]
- Số lượng Ingredients cần tạo: [N]
- Số lượng Shots: [M]
- Project Flow: [URL hoặc "Chưa có — cần tạo mới"]
Bạn đã sẵn sàng để tôi mở trình duyệt chưa? (Gõ "rồi" để bắt đầu)
```

---

### Phase 1 — Mở Flow & vào đúng project
Dùng `browser_subagent`:
- **Nếu có URL (do user cung cấp)** → mở thẳng URL, **KHÔNG tạo project mới**.
- **Nếu chưa có URL** và user đã xác nhận muốn tạo mới → mở `https://labs.google/fx/vi/tools/flow/` → New Project → đặt tên → **sao chép URL mới và báo user ngay** để lưu lại cho các lần sau.
- **Nếu chưa hỏi user về URL** → **DỪNG**, quay lại Phase 0 hỏi trước.

---

### Phase 2 — Tạo Ingredients (Phong cách linh hoạt)

> ⚠️ **PHẢI HOÀN THÀNH 100% TRƯỚC KHI TẠO VIDEO.**

Thực hiện trên browser:
1. Mở tab "Ingredients" -> "Generate".
2. **Engine:** Luôn chọn **NanoBananaPro**.
3. **Aspect Ratio của Ảnh Tham Chiếu:**
   - Nhân vật Hoạt hình 3D/2D: Nên dùng `1:1` hoặc `16:9` để lấy được cả hình dáng và trang phục. (Chỉ dùng `3:4` nếu là dự án người thật cận mặt).
   - Bối cảnh / Background: `16:9`.
   - Đồ vật (Props): `1:1`.
4. **Cấu trúc Prompt Sinh Ảnh:** Luôn nối thêm `[Visual Style]` vào cuối prompt.
   *Ví dụ:* `A brave young boy exploring a magic forest, 3D Pixar style animation` hoặc `A cute flying robot, 2D vector flat design`
5. **Cách sinh nhiều góc độ cho Nhân vật (Khác với bản người thật):**
   - Lần 1: "[Mô tả] — Front-facing character turnaround sheet, T-pose, neutral background, [Style]"
   - Lần 2: "[Mô tả] — Action pose, dynamic angle, neutral background, [Style]"
   - Lần 3: "[Mô tả] — Close-up portrait, expressive facial expression, neutral background, [Style]"
6. **Xác nhận với User:** Chụp ảnh 4 kết quả vừa sinh -> Hỏi user chọn -> Lưu ảnh -> Đặt nhãn (label).
7. Tải ảnh về Google Drive để lưu trữ dài hạn (thư mục `Flow Ingredients / [Tên Project]`).

---

### Phase 3 — Tạo Shot trong Scene Builder

Với **mỗi phân cảnh** trong kịch bản:

1. Mở tab "Scene Builder" -> Tên Shot = "Cảnh [N]".
2. Paste prompt vào ô văn bản (Tuyệt đối không có dấu xuống dòng). 
   - **QUAN TRỌNG:** Gắn thêm cụm `[Visual Style]` vào cuối prompt của video để model Veo hiểu.
3. **Cài Settings động:**
   - **Aspect Ratio:** Đặt đúng theo Phase 0 (`16:9` hoặc `9:16`).
   - **Model:** `Veo 3.1 - Fast [Lower Priority]` — **🔒 CỐ ĐỊNH, không dùng model khác kể cả khi UI gợi ý model khác.**
   - **Output Count:** `x4` (hoặc `x2` để tiết kiệm thời gian, tùy user).
   - **Duration:** `8s` hoặc theo yêu cầu kịch bản.
4. **Attach Ingredients:** Gắn TẤT CẢ ảnh tham chiếu liên quan (nhân vật + bối cảnh + đồ vật).
5. Bấm Generate và chuyển sang Shot tiếp theo (Không đợi).

---

### Phase 4 — Kiểm tra & Báo cáo
- Chụp ảnh màn hình Scene Builder chứa các Shot đang render.
- In báo cáo tổng kết tiến độ cho người dùng.

---

### Phase 5 — Hỗ trợ lỗi & Reshoot
- Hướng dẫn `browser_subagent`: Nếu Flow load chậm hoặc kẹt UI, tự động thử refresh (F5) trang hoặc thử click lại bằng tọa độ (X,Y) trước khi bỏ cuộc.
- Xử lý nhân vật bị biến dạng bằng cách tạo thêm Ingredient cận mặt (Close-up) và Regenerate Shot.

---

## Mẹo khắc phục lỗi thường gặp cho `browser_subagent`
- **Nút bị ẩn (Hidden element):** Flow UI đôi khi ẩn nút "Add Ingredient" khi panel bị hẹp, hãy cuộn hoặc thu nhỏ cửa sổ.
- **Paste Prompt dính lỗi:** Đảm bảo prompt thực sự là một dòng liên tục. Việc ngắt dòng có thể khiến Flow submit kết quả quá sớm.
- **Mất Style:** Quên không chèn "3D Pixar style" vào Shot prompt sẽ khiến Veo tự render ra ảnh người thật. LUÔN LUÔN CHÈN STYLE.
- **TIẾNG VIỆT / Unicode (QUAN TRỌNG):** Browser agent KHÔNG gõ được tiếng Việt qua keystroke vì môi trường automation không có IME (Unikey). Khi cần nhập text có dấu tiếng Việt (ví dụ: thoại `Line: "Ôi chà, bong bóng đẹp quá!"`), BẮT BUỘC dùng một trong hai cách:
  - **Ưu tiên — JavaScript inject:** Set value trực tiếp vào element: `element.value = "<text có dấu>"; element.dispatchEvent(new Event('input', {bubbles:true}));`
  - **Dự phòng — Clipboard paste:** Copy text vào clipboard trước, click focus vào ô input, gửi `Ctrl+V` để paste — bỏ qua hoàn toàn IME.
  - *Lưu ý:* Phần prompt Veo (Time, Location, Action, Style...) luôn viết tiếng Anh nên không bị ảnh hưởng. Chỉ trường `Line: "..."` mới cần xử lý đặc biệt nếu thoại là tiếng Việt.
