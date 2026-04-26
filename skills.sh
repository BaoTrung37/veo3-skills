#!/bin/bash

# Cấu hình cài đặt
INSTALL_DIR="$HOME/.agents"
REPO_URL="https://github.com/BaoTrung37/veo3-skills.git"

echo "=========================================="
echo "🚀 Bắt đầu cài đặt AI Agent Skills (Veo3)..."
echo "=========================================="

# Kiểm tra xem git có được cài đặt không
if ! command -v git &> /dev/null; then
    echo "❌ Lỗi: Git chưa được cài đặt trên máy này."
    echo "Vui lòng cài đặt Git trước khi tiếp tục: https://git-scm.com/downloads"
    exit 1
fi

# Clone hoặc cập nhật kho lưu trữ
if [ -d "$INSTALL_DIR/.git" ]; then
    echo "🔄 Thư mục $INSTALL_DIR đã tồn tại. Đang tiến hành cập nhật phiên bản mới nhất..."
    cd "$INSTALL_DIR" || exit
    git pull origin main
else
    echo "📥 Đang tải mã nguồn về $INSTALL_DIR..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

echo "=========================================="
echo "✅ Cài đặt hoàn tất!"
echo "📂 Toàn bộ skills đã được lưu tại: $INSTALL_DIR"
echo ""
echo "Bạn có thể vào các thư mục sau để lấy nội dung file SKILL.md:"
echo " - $INSTALL_DIR/veo3-script-writer"
echo " - $INSTALL_DIR/smart-script-processor"
echo " - $INSTALL_DIR/flow-operator"
echo " - $INSTALL_DIR/script-analyzer"
echo " - $INSTALL_DIR/ad-video-research"
echo " - $INSTALL_DIR/viral-video-research"
echo "=========================================="
