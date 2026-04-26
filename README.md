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

### Cách 1: Cài đặt tự động bằng script (Khuyên dùng)

Trên máy mới (Linux, Mac hoặc Git Bash trên Windows), bạn chỉ cần chạy dòng lệnh sau trên Terminal để tự động tải/cập nhật toàn bộ skills:

```bash
curl -s https://raw.githubusercontent.com/BaoTrung37/veo3-skills/main/skills.sh | bash
```
Sau khi chạy, mã nguồn sẽ tự động lưu vào thư mục `~/.agents`.
Bạn có thể mở từng thư mục và copy nội dung file **`SKILL.md`** để cấu hình cho Agent.

### Cách 2: Tải về qua Git thủ công

1. Mở Terminal và chạy lệnh:
   ```bash
   git clone https://github.com/BaoTrung37/veo3-skills.git ~/.agents
   ```
2. Mở thư mục `~/.agents` và lấy nội dung file **`SKILL.md`** trong từng thư mục.

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
