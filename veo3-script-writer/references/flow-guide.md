# Hướng dẫn dùng Google Flow + NanoBananaPro + Veo 3

Flow là giao diện UI do Google Labs cung cấp, gói trọn 3 thứ: **NanoBananaPro** (sinh ảnh tham chiếu), **Ingredients** (kho asset bind với prompt) và **Veo 3** (sinh clip 8 giây). Hướng dẫn này đi từ A → Z theo đúng workflow mà skill `veo3-script-writer` đã ép buộc.

## Workflow chuẩn (5 bước)

### Bước 1 — Tạo project

Vào https://flow.google → **New Project** → đặt tên trùng với tên kịch bản để dễ tìm lại sau này.

### Bước 2 — Sinh ảnh tham chiếu bằng NanoBananaPro

Đây là bước **bắt buộc** trước khi render video. Bạn dùng **Image Asset Brief** mà skill đã sinh ra.

Trong project Flow:

1. Mở tab **Ingredients** → bấm **Generate** → chọn engine **NanoBananaPro**.
2. Với mỗi entry trong Image Asset Brief, paste mô tả vào ô prompt.
3. Đặt **Aspect Ratio** đúng theo brief:
   - **3:4** — chân dung nhân vật (mặc định cho mọi character).
   - **16:9** — bối cảnh toàn cảnh (phòng khách, đường phố, ngoại thất...).
   - **1:1** hoặc **4:3** — đồ vật (props), con vật toàn thân.
4. Nếu là nhân vật chính, chỉ cần sinh **1 lần (ra 4 ảnh)** góc chính diện. Không cần phải sinh chi tiết các góc nghiêng trái, nghiêng phải hay toàn thân.
   > **Quy trình sinh & chốt ảnh:** Flow tự động sinh ra 4 kết quả góc chính diện ngay trong lần Generate đầu tiên. Nếu bạn ưng ý 1 trong 4 ảnh đó, hãy chốt luôn làm tham chiếu và nhảy qua tạo thành phần khác. Chỉ khi nào không ưng ý bất kỳ ảnh nào mới cần bấm **Regenerate**.
5. Bấm **Save to Ingredients** (chỉ lưu ảnh đã chốt), đặt nhãn (label) trùng với tên gợi ý trong brief — ví dụ `Lan_portrait`, `PhongKhach_BacAu`, `NhanCuoi_VangHong`. Nhãn này là khoá để bind với prompt video.

> **Mẹo NanoBananaPro:** mô tả càng cụ thể về tuổi, vóc dáng, đặc điểm khuôn mặt, ánh sáng, hậu cảnh thì ảnh càng nhất quán. Tránh từ trừu tượng kiểu "đẹp", "ấn tượng" — thay bằng đặc điểm đo được ("tóc đen dài ngang vai", "mắt một mí", "lúm đồng tiền bên trái").

### Bước 3 — Tạo Shot trong Scene Builder

Mở tab **Scene Builder** → **New Shot**.

Cho mỗi phân cảnh skill đã viết, làm như sau:

1. **Paste prompt**: copy nguyên khối 12 dòng (Time → Voice Tone) vào ô prompt của Shot.
2. **Attach Ingredients**: ở panel bên phải, kéo các Ingredient cần dùng vào ô **References** của Shot. Ví dụ phân cảnh có Lan trong phòng khách → kéo `Lan_portrait` + `PhongKhach_BacAu`.
3. **Aspect ratio**:
   - **9:16** (mặc định) — TikTok / Reels / Shorts.
   - **16:9** — YouTube ngang, video trình chiếu.
   - Skill đã hỏi user và ghi sẵn lựa chọn ở đầu output — set đúng cái đó.
4. **Spec render** (đặt cho từng Shot):
   - **Loại**: chọn tab **Video** (không phải Image, Frames, hay Ingredients).
   - **Aspect ratio**: **9:16** (TikTok/Reels/Shorts) hoặc 16:9 (YouTube) — chọn ở dãy bên dưới tab.
   - **Model + Priority**: chọn dropdown **"Veo 3.1 - Fast [Lower Priority]"** (gộp model và priority thành 1 option).
   - **Output count**: chọn **x4** trong dãy x1 / x2 / x3 / x4.
   - **Duration**: chọn **8s** trong dãy 4s / 6s / 8s.
5. Bấm **Generate**. Lặp lại cho từng phân cảnh.

> Nếu cần chất lượng final cho khách hàng, đổi dropdown sang **"Veo 3.1 - Quality [Standard Priority]"**. Mặc định luôn dùng **Fast [Lower Priority]** cho mọi tác vụ thông thường.

### Bước 4 — Chọn take & kiểm tra nhất quán

Khi Flow render xong, mỗi Shot sẽ có 4 take. Cách chọn:

- **Take giữ đúng mặt nhân vật** (so với Ingredient gốc) → ưu tiên cao nhất.
- **Take giữ đúng trang phục + bối cảnh** đã mô tả.
- **Take có camera angle khớp** prompt nhất.

Nếu cả 4 take đều lệch:

- Quay lại tab Ingredients, bổ sung ảnh tham chiếu sắc nét hơn.
- Hoặc rephrase 1 trường trong prompt (giữ nguyên các trường khác lặp lại).
- Bấm **Regenerate**, *đừng* xoá Shot rồi tạo lại từ đầu — sẽ mất setting Ingredients/aspect ratio.

### Bước 5 — Ghép timeline & export

1. Kéo các Shot đã chọn vào timeline theo thứ tự phân cảnh.
2. Thêm nhạc nền (Flow có thư viện built-in hoặc upload).
3. Chỉnh chuyển cảnh: **cut** cho hành động liên tục, **fade** cho chuyển mốc thời gian.
4. **Export** → MP4 / MOV → tải về.

---

## Mẹo giữ tính nhất quán

- **Ảnh Ingredient càng "thật" càng tốt** — đừng dùng ảnh quá stylized rồi mong Veo render photorealistic. Mâu thuẫn style giữa Ingredient và prompt Visual Style là nguồn lỗi #1.
- **Trang phục lặp y nguyên** giữa các shot cùng mốc thời gian. Skill đã ép trong prompt — Flow chỉ tận dụng được nếu bạn không tự ý sửa.
- **Locked seed** (nếu Flow cho phép) khi muốn reshoot cùng một cảnh không bị đổi không gian.
- Khi nhân vật cần **thay đồ** (sáng → tối; thường phục → vest), tạo *Ingredient mới* cho bộ đồ thứ hai (ví dụ `Lan_portrait_evening`) và gắn vào các Shot tương ứng.
- **Đừng dùng x1 take khi đang draft** — x4 chỉ tốn thêm chút credit nhưng tăng tỉ lệ chọn được take ngon từ 30% lên 80%.

## Lỗi hay gặp

| Lỗi | Cách xử lý |
|---|---|
| Nhân vật đổi mặt giữa các shot | Bổ sung 1 ảnh tham chiếu chính diện sắc nét hơn (ratio 3:4) vào Ingredient. |
| Ingredient bị crop sai khi paste | Kiểm tra ratio: chân dung phải 3:4, không được 1:1. |
| Bối cảnh đổi nội thất | Đảm bảo trường Location lặp **y nguyên** câu mô tả, không paraphrase. |
| Lời thoại dài quá 8s | Tách phân cảnh: cảnh A nói nửa đầu, cảnh B nói nửa sau (giữ nguyên trang phục + bối cảnh). |
| Voice Tone không khớp giọng | Kiểm tra lại block giọng — nhớ paste nguyên văn từ thư viện, không cắt cụt. |
| Veo không nghe lệnh thoại | Thoại phải nằm trong cặp ngoặc kép `"…"`, không kèm chú thích trong ngoặc đơn. |
| Render rất lâu | Đó là vì set Low priority — bình thường. Nếu gấp, đổi sang Standard priority cho 1-2 shot quan trọng. |
| Take x4 quá tệ | Nâng model lên Video-3.1 Quality cho shot đó (chỉ shot đó thôi, không cần đổi cả project). |

## Checklist trước khi render

- [ ] Đã sinh đủ Ingredients cho mọi nhân vật / bối cảnh / đồ vật / con vật trong Image Asset Brief?
- [ ] Mỗi Ingredient đặt nhãn trùng tên gợi ý của skill?
- [ ] Aspect ratio chân dung đặt 3:4?
- [ ] Đã chọn dọc 9:16 hay ngang 16:9 cho video tổng thể?
- [ ] Mỗi Shot đã attach đúng Ingredients cần thiết?
- [ ] Spec mặc định: tab **Video** + **9:16** + **x4** + **Veo 3.1 - Fast [Lower Priority]** + **8s**?

Tick xong cả 6 → bấm Generate và đi pha cà phê. Quay lại sau 10–30 phút sẽ có draft đầu tiên.
