# Bản đồ UI Google Flow — Flow UI Map

Tài liệu này mô tả layout và các element UI của Google Flow tại `https://labs.google/fx/tools/flow/` để skill `flow-operator` biết chính xác cần tìm gì, click gì, trong trường hợp nào.

> **Quan trọng:** Google Labs thường xuyên cập nhật UI. Nếu thao tác thực tế không khớp với mô tả ở đây, skill phải **dừng và báo user** thay vì đoán mò. Cập nhật file này sau mỗi lần gặp thay đổi UI.

*Phiên bản tham chiếu: Flow tại labs.google/fx/tools/flow — tháng 4/2026*

---

## Cấu trúc tổng thể

```
┌─────────────────────────────────────────────────────────┐
│  [Google Labs logo]  Google Flow           [Profile]    │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  [Sidebar trái]        [Khu vực làm việc chính]        │
│  ├─ Projects           ├─ Ingredients tab               │
│  ├─ Recent             ├─ Scene Builder tab             │
│  └─ Settings           └─ Timeline / Export tab         │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 1. Trang chủ / Danh sách Projects

**URL:** `https://labs.google/fx/tools/flow/`

| Element | Mô tả | Cách tìm |
|---|---|---|
| Danh sách projects | Grid hoặc list các project đã tạo | Chiếm phần chính của trang |
| Nút "New Project" | Tạo project mới | Góc trên phải, thường có icon "+" hoặc text "New" |
| Ô tên project | Nhập tên khi tạo mới | Xuất hiện sau khi click New Project |
| Nút xác nhận | Confirm tên project | "Create" / "OK" / "Start" |

**Sau khi vào project:** URL đổi thành dạng `https://labs.google/fx/tools/flow/project/[project-id]`

---

## 2. Bên trong Project — Tabs chính

Project Flow có **3 khu vực** chính. Cách navigate:

| Tab / Khu vực | Tên hiển thị | Khi nào dùng |
|---|---|---|
| Ingredients | "Ingredients" / "Assets" | Tạo ảnh tham chiếu bằng NanoBananaPro |
| Scene Builder | "Scene Builder" / "Scenes" | Tạo và render từng Shot video |
| Timeline | "Timeline" / "Edit" | Ghép các Shot thành video hoàn chỉnh (user tự làm) |

---

## 3. Tab Ingredients — Chi tiết

### 3.1 Giao diện chính

```
┌─────────────────────────────────────────────────────┐
│  Ingredients                          [+ Generate]  │
├─────────────────────────────────────────────────────┤
│  [Grid ảnh Ingredients đã có]                       │
│                                                     │
│  [Ingredient 1]  [Ingredient 2]  [Ingredient 3]    │
│  "Lan_portrait"  "OngHung_..."   "CanHo_BacAu"    │
└─────────────────────────────────────────────────────┘
```

### 3.2 Flow tạo Ingredient mới

1. Click **"+ Generate"** (hoặc "Generate Image" / "+ Add") → mở dialog/panel
2. Trong dialog:
   - **Ô prompt**: text area để nhập mô tả (paste mô tả từ Image Asset Brief vào đây)
   - **Aspect Ratio dropdown**: chọn 3:4 / 16:9 / 1:1 / 4:3
   - **Engine**: chọn "NanoBananaPro" nếu có dropdown, hoặc đây là engine mặc định
   - **Nút Generate/Create**: sinh ảnh
3. Sau khi ảnh hiện ra:
   - **Nút Save / Use / Add to Ingredients**: lưu ảnh vào kho
   - **Ô đặt tên (label/name)**: nhập tên Ingredient (ví dụ: "Lan_portrait")
4. Click **Save** / **Confirm**

### 3.3 Lưu ý quan trọng

- Một số phiên bản Flow có nút **"Generate"** ngay trong panel Ingredients (không mở modal mới) — paste prompt trực tiếp vào ô text bên trong panel
- Nếu cần 3 ảnh cho nhân vật chính: lặp lại quy trình 3 lần với prompt điều chỉnh hướng mặt
- Label/tên Ingredient phải match chính xác tên gợi ý trong Image Asset Brief để Antigravity tự tìm đúng khi gắn vào Shot

---

## 4. Tab Scene Builder — Chi tiết

### 4.1 Giao diện chính

```
┌─────────────────────────────────────────────────────────────┐
│  Scene Builder                            [+ New Shot]      │
├──────────────────────────────┬──────────────────────────────┤
│  [Danh sách Shot bên trái]   │  [Panel chi tiết Shot]       │
│  Shot 1 "Phân cảnh 1"        │                              │
│  Shot 2 "Phân cảnh 2"        │  [Ô prompt / text area]     │
│  ...                         │                              │
│                              │  References / Ingredients    │
│                              │  [Kéo Ingredient vào đây]   │
│                              │                              │
│                              │  Settings:                   │
│                              │  - Aspect Ratio              │
│                              │  - Model                     │
│                              │  - Priority                  │
│                              │  - Output Count              │
│                              │  - Duration                  │
│                              │                              │
│                              │  [Generate button]           │
└──────────────────────────────┴──────────────────────────────┘
```

### 4.2 Flow tạo Shot mới

1. Click **"+ New Shot"** → Shot mới xuất hiện trong danh sách bên trái
2. Click vào Shot mới để mở panel chi tiết bên phải
3. **Đặt tên Shot** (nếu có ô name): gõ "Phân cảnh [N]"
4. **Paste prompt:** QUAN TRỌNG: Chỉ dùng DUY NHẤT 1 câu lệnh (copy nguyên đoạn văn của 1 phân cảnh) paste thẳng vào ô text area ở giữa panel. Đảm bảo đây là 1 dòng liên tục, nếu có xuống dòng Flow sẽ tự động tách thành nhiều video sai. Không gõ thêm bớt gì.
5. **Truyền các hình ảnh tham chiếu (Ingredients):**
   - Tìm panel "References" / "Ingredients" / "Assets" trong Shot panel
   - Cách 1: Drag & drop TẤT CẢ Ingredient liên quan (nhân vật, bối cảnh, đồ vật) từ danh sách vào ô References
   - Cách 2: Click dấu "+" trong References → chọn các Ingredient từ dropdown / list
6. **Cài Settings:**

| Setting | Tên UI thường gặp | Giá trị mặc định |
|---|---|---|
| Loại | Tab **"Video"** | Click tab Video (không phải Image / Frames / Ingredients) |
| Aspect Ratio | dãy "9:16" / "16:9" | **9:16** |
| Output Count | dãy "x1 / x2 / x3 / **x4**" | **x4** |
| Model + Priority | Dropdown giữa: **"Veo 3.1 - Fast [Lower Priority]"** | **Veo 3.1 - Fast [Lower Priority]** |
| Duration | dãy "4s / 6s / **8s**" | **8s** |

7. Click **"Generate"** → Shot được submit render

### 4.3 Trạng thái Shot sau khi submit

| Trạng thái | Icon / Text thường thấy | Ý nghĩa |
|---|---|---|
| Queued | "Queued" / loading spinner | Đang chờ trong hàng |
| Processing | "Processing" / progress bar | Đang render |
| Done | "Done" / thumbnail hiện ra | Render xong, có 4 take |
| Failed | "Failed" / error icon | Lỗi, cần submit lại |

---

## 5. Xử lý UI thay đổi

Nếu khi thao tác, element không đúng với mô tả ở đây:

1. **Chụp screenshot** khu vực đó
2. **Báo user** chính xác: "Tôi đang thấy màn hình X, có nút/ô Y nhưng không thấy Z như mô tả. Bạn có thể cho biết nút [tên] nằm ở đâu không?"
3. **Cập nhật file này** sau khi user xác nhận vị trí đúng

**TUYỆT ĐỐI KHÔNG** click đại vào các nút không rõ tên — đặc biệt là "Delete", "Clear", "Reset" vì có thể xóa mất công sức đã làm.

---

## 6. Tốc ký cho Antigravity

Khi báo cáo tiến độ, dùng ký hiệu này để user đọc nhanh:

```
📦 Ingredient [N/Total]: "[label]" ✅ / ❌ lỗi
🎬 Shot [N/Total] "Phân cảnh N": submitted ✅ / ❌ lỗi
   └─ 🖼️ Ingredients: [label1], [label2]
   └─ ⚙️ [aspect-ratio] / [model] / [priority] / x[takes]
⏳ Render đang chạy background...
```
