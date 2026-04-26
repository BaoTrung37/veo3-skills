# 🤖 AI Agent Skills - Veo3 & Script Processing

Kho lưu trữ này chứa bộ kỹ năng (skills) và prompt cấu hình cho các Agent AI. Bạn có thể sử dụng bộ kỹ năng này trên nhiều máy khác nhau để tự động hóa quy trình viết kịch bản và sản xuất video (Veo3).

## 📂 Danh sách các Agent

- **`veo3-script-writer`**: Chuyên viết và tùy chỉnh kịch bản dùng cho Veo 3.
- **`smart-script-processor`**: Xử lý, phân tích và tinh chỉnh kịch bản thông minh.
- **`flow-operator`**: Vận hành luồng tự động.
- **`script-analyzer`**: Phân tích chi tiết kịch bản video.
- **`ad-video-research`**: Nghiên cứu và tìm kiếm định dạng video quảng cáo.
- **`viral-video-research`**: Phân tích và nghiên cứu các video xu hướng (viral).

---

## 🛠 Hướng dẫn Cài đặt & Sử dụng (Trên máy mới)

### Cách 1: Tải về qua Git (Khuyên dùng)

1. Mở Terminal (Command Prompt hoặc PowerShell).
2. Chạy lệnh sau để clone (tải) toàn bộ mã nguồn về máy:
   ```bash
   git clone https://github.com/BaoTrung37/veo3-skills.git
   ```
3. Mở thư mục `veo3-skills` bằng Code Editor (như VS Code).
4. Bên trong mỗi thư mục agent (ví dụ `veo3-script-writer`), bạn sẽ thấy file **`SKILL.md`**. Copy toàn bộ nội dung của file này dán vào phần cấu hình Prompt / System Instruction của Agent tương ứng.

### Cách 2: Tải trực tiếp file ZIP

1. Trên trang chủ GitHub của repository này, bấm vào nút màu xanh **`Code`** ➔ Chọn **`Download ZIP`**.
2. Giải nén file vừa tải về.
3. Mở các thư mục tương ứng và đọc file **`SKILL.md`** để lấy nội dung.

---

## 🔄 Cập nhật phiên bản mới nhất

Nếu bạn làm việc trên một máy và có thay đổi cập nhật, hãy push lên Github. Ở các máy khác, bạn chỉ cần mở terminal tại thư mục `veo3-skills` và chạy lệnh sau để lấy cập nhật mới nhất:

```bash
git pull origin main
```
