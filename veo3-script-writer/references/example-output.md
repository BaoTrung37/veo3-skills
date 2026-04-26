# Ví dụ output mẫu

Đây là một ví dụ "đi từ đầu đến cuối" để đối chiếu định dạng. **Đừng** copy nội dung — chỉ tham khảo cấu trúc.

---

## Kịch bản đầu vào (giả lập)

> *Sáng sớm, Lan — một cô gái trẻ — bước ra ban công căn hộ, vươn vai và mỉm cười với mặt trời. Cô vào bếp pha cà phê, vừa khuấy vừa ngân nga. Ba của Lan, ông Hùng, bước ra hỏi "Sáng nay ăn gì con?". Lan cười tươi "Con làm bánh mì ốp la cho ba nhé!". Hai cha con cùng ngồi vào bàn ăn ấm cúng.*

---

## Output mẫu

### Nhân vật & Bối cảnh

**Nhân vật chính:**

- **Lan** — cô gái 22 tuổi, dáng người mảnh, tóc đen dài ngang vai, gương mặt tươi sáng có lúm đồng tiền. Trang phục buổi sáng: áo thun trắng oversize và quần short jean ngắn, chân trần.
- **Ông Hùng** — người đàn ông 55 tuổi, dáng tầm thước, tóc muối tiêu, đeo kính gọng tròn. Trang phục buổi sáng: áo polo xanh navy và quần kaki nâu, đi dép trong nhà.

**Bối cảnh tái xuất:**

- **Căn hộ của Lan** — căn hộ chung cư hiện đại tầng cao, phong cách Bắc Âu, tường trắng, sàn gỗ sáng màu, cây xanh trong góc, ánh nắng tự nhiên qua cửa kính lớn nhìn ra thành phố.

> Phần này chỉ để bạn đọc — bước tiếp theo mới là tạo ảnh thực tế.

---

### Image Asset Brief (cho NanoBananaPro trong Flow)

**Nhân vật — Lan**
- Mô tả: Cô gái Việt 22 tuổi, dáng người mảnh cao 1m60, tóc đen dài ngang vai, gương mặt tươi sáng có lúm đồng tiền bên trái, mắt một mí, nước da sáng. Mặc áo thun trắng oversize và quần short jean ngắn, chân trần. Background trung tính (xám nhạt) để dễ tách.
- Aspect ratio: **3:4**
- Số ảnh: **3** (chính diện, nghiêng trái 30°, nghiêng phải 30°)
- Tên Ingredient: `Lan_portrait`

**Nhân vật — Ông Hùng**
- Mô tả: Người đàn ông Việt 55 tuổi, dáng tầm thước, tóc muối tiêu cắt ngắn, đeo kính gọng tròn, gương mặt hiền với nếp nhăn nhẹ. Mặc áo polo xanh navy và quần kaki nâu. Background trung tính.
- Aspect ratio: **3:4**
- Số ảnh: **3**
- Tên Ingredient: `OngHung_portrait`

**Bối cảnh — Căn hộ Bắc Âu**
- Mô tả: Căn hộ chung cư hiện đại tầng cao, phong cách Bắc Âu, tường trắng, sàn gỗ sáng màu, sofa xám nhạt, cây xanh trong góc, cửa kính lớn nhìn ra thành phố ban ngày, ánh nắng vàng ấm tràn vào.
- Aspect ratio: **16:9**
- Số ảnh: **2** (góc nhìn từ ban công, góc nhìn từ bếp)
- Tên Ingredient: `CanHo_BacAu`

> Mở Flow → Ingredients → Generate with NanoBananaPro → tạo lần lượt 3 Ingredient ở trên trước khi sang bước render Shot.

---

### Spec Render

| Tham số | Giá trị |
|---|---|
| Aspect ratio video | **9:16** (TikTok/Reels — đã hỏi user) |
| Số take mỗi shot | **x4** |
| Model | **Video-3.1 Fast** |
| Priority | **Low priority** |
| Thời lượng | **8 giây / shot** |

---

### Phân cảnh 1 — Lan vươn vai trên ban công

```
- Time: Sáng sớm, khoảng 6h30, thành phố vừa thức dậy.
- Camera Angle: Trung cảnh từ phía sau, máy đặt thấp, dolly nhẹ tiến tới.
- Subject: cô gái.
- Action: Bước chậm ra ban công, vươn vai thật dài, nhắm mắt hít một hơi sâu rồi mỉm cười với mặt trời.
- Location: Ban công căn hộ chung cư hiện đại tầng cao, phong cách Bắc Âu, tường trắng, sàn gỗ sáng màu, cây xanh trong góc, ánh nắng tự nhiên qua cửa kính lớn nhìn ra thành phố.
- Lighting: Golden hour, ánh nắng vàng ấm xiên ngang, lens flare nhẹ.
- Visual Style: Cinematic, tone màu ấm, depth of field nông.
- Line: (không có thoại)
```

### Phân cảnh 2 — Lan pha cà phê trong bếp

```
- Time: Sáng sớm, khoảng 6h35, ngay sau cảnh trước.
- Camera Angle: Cận cảnh tay khuấy ly cà phê, sau đó pan lên gương mặt Lan.
- Subject: cô gái, mặc áo thun trắng oversize và quần short jean ngắn, chân trần.
- Action: Khuấy cà phê bằng thìa nhỏ, vừa khuấy vừa khẽ ngân nga một giai điệu, mắt nhìn ly cà phê đầy thư giãn.
- Location: Khu bếp mở của căn hộ chung cư hiện đại tầng cao, phong cách Bắc Âu, tường trắng, sàn gỗ sáng màu, cây xanh trong góc, ánh nắng tự nhiên qua cửa kính lớn nhìn ra thành phố.
- Lighting: Ánh nắng vàng ấm tràn vào từ cửa sổ, tạo bóng dài trên mặt bàn đá.
- Visual Style: Cinematic, tone màu ấm, depth of field nông.
- Line: "Hmm... thơm quá đi mất."
- Voice Tone: Nhẹ nhàng, thư giãn, hơi thở dài ở cuối, nhấn mạnh từ "thơm". Ở bước này, bạn hãy Chọn giọng đọc phù hợp ở bên dưới để thêm vào Câu Lệnh.
```

### Phân cảnh 3 — Ông Hùng bước ra hỏi

```
- Time: Sáng sớm, khoảng 6h36, ngay sau cảnh pha cà phê.
- Camera Angle: Trung cảnh hai nhân vật, ông Hùng từ phía hành lang đi vào khung hình bên trái.
- Subject: ông lão.
- Action: Bước chậm vào bếp, đặt một tay lên ghế quầy bar, nhìn về phía Lan và mỉm cười dịu dàng.
- Location: Khu bếp mở của căn hộ chung cư hiện đại tầng cao, phong cách Bắc Âu, tường trắng, sàn gỗ sáng màu, cây xanh trong góc, ánh nắng tự nhiên qua cửa kính lớn nhìn ra thành phố.
- Lighting: Ánh nắng vàng ấm tràn vào từ cửa sổ, tạo bóng dài trên mặt bàn đá.
- Visual Style: Cinematic, tone màu ấm, depth of field nông.
- Line: "Sáng nay ba con mình ăn gì đây con?"
- Voice Tone: Trầm ấm, từ tốn, nhịp điệu chậm rãi của một người cha hiền. Nhấn nhẹ "ba con mình". Ở bước này, bạn hãy Chọn giọng đọc phù hợp ở bên dưới để thêm vào Câu Lệnh.
```

---

### Giọng đọc gợi ý cho kịch bản này

- **Lan** → 4c (Nữ sinh 15 tuổi trong trẻo) hoặc 1a (Nữ 25 tươi tắn)
- **Ông Hùng** → 3a (Nam trầm ấm rền vang) — *điều chỉnh nhịp xuống chậm hơn để hợp vai cha*

> Người dùng paste nguyên block giọng đã chọn (lấy từ `references/voice-tones.md`) thay cho dòng "Voice Tone" hiện tại trước khi đưa vào Veo.

---

### Ghi chú dùng trên Flow (5 bước)

1. Tạo project Flow → đặt tên trùng kịch bản.
2. Vào **Ingredients → Generate with NanoBananaPro**, sinh 3 Ingredient theo Image Asset Brief ở trên (đặt nhãn `Lan_portrait`, `OngHung_portrait`, `CanHo_BacAu`).
3. Vào **Scene Builder → New Shot** cho từng phân cảnh, paste prompt 12 dòng, attach đúng Ingredients, set **9:16 + Video-3.1 Fast + Low priority + x4**.
4. Render xong, chọn 1 take ưng nhất từ mỗi Shot.
5. Kéo các Shot lên timeline theo thứ tự, thêm nhạc nền, export MP4.

Chi tiết & xử lý lỗi xem `references/flow-guide.md`.
