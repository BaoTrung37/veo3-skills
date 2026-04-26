# Template kịch bản handoff sang `veo3-script-writer`

Khi viết kịch bản nháp ở Bước 5, **luôn dùng template này**. Nó được thiết kế để skill `veo3-script-writer` parse được trực tiếp các trường nó cần (nhân vật, bối cảnh, sequence hành động, thoại, hook, CTA).

---

## Template

```markdown
# Kịch bản: [Tên kịch bản]

## Meta thông tin

- Format: [POV / Storytime / Hook–Payoff / Before-After / DITL / Listicle / Talking Head / Skit / Tutorial / ASMR]
- Platform: [TikTok / Reels / YouTube Shorts]
- Aspect ratio đề xuất: [9:16 (dọc) / 16:9 (ngang)]
- Độ dài tổng: [X giây]
- Audience target: [mô tả ngắn]
- Mục tiêu: [educate / entertain / sell / build brand / drive traffic]
- Hook line: "[câu hook 3 giây đầu, ≤ 8 từ]"
- CTA cuối: "[câu CTA cụ thể]"

## Nhân vật chính

- **[Tên nhân vật 1]** — [vai trò: cô gái / chàng trai / ông lão...] — [tuổi, vóc dáng, đặc điểm khuôn mặt]. Trang phục: [mô tả cụ thể].
- **[Tên nhân vật 2]** (nếu có) — ...

## Bối cảnh chính

- **[Tên địa điểm 1]** — [mô tả không gian, ánh sáng, atmosphere].
- **[Tên địa điểm 2]** (nếu có) — ...

## Đồ vật / con vật quan trọng (nếu có)

- **[Tên prop 1]** — [mô tả].
- **[Tên con vật]** (nếu có) — [mô tả].

## Sequence hành động & thoại (theo timeline)

### 0:00–0:03 — Hook
- **Hành động:** [tả hành động cụ thể trong 3 giây đầu]
- **Thoại:** "[hook line]"
- **Voice tone:** [mô tả cảm xúc + nhấn từ nào]

### 0:03–0:08 — Setup
- **Hành động:** [...]
- **Thoại:** "[...]" (hoặc "không có thoại")
- **Voice tone:** [...]

### 0:08–0:15 — Body / Tension
- **Hành động:** [...]
- **Thoại:** "[...]"
- **Voice tone:** [...]

### 0:15–0:22 — Climax / Twist
- **Hành động:** [...]
- **Thoại:** "[...]"
- **Voice tone:** [...]

### 0:22–0:30 — Payoff / CTA
- **Hành động:** [...]
- **Thoại:** "[CTA cụ thể]"
- **Voice tone:** [...]

> Mỗi block 3-8 giây sẽ tương ứng 1 phân cảnh Veo 8s khi handoff sang `veo3-script-writer`. Nếu block dài quá 8 giây, skill kia sẽ tự chia nhỏ.

## Trend support (lấy từ research)

- **Nhạc đề xuất:** [tên bài + link]
- **Hashtag:** #... #... #... (5-10)
- **Thời điểm post:** [khung giờ tốt nhất]

## Note rủi ro / điều cần test

- [Bất cứ giả định nào trong kịch bản cần test, ví dụ: "Hook này có thể quá generic — A/B test với hook B"]
- [Lưu ý kỹ thuật khi quay/render]

---

> Để chuyển kịch bản này thành prompt Veo 3, gõ tiếp: *"Viết prompt Veo cho kịch bản trên"* — skill `veo3-script-writer` sẽ tự kích hoạt.
```

---

## Quy tắc viết template

1. **Mọi trường meta phải điền** — đừng để trống. Nếu không biết, đặt giá trị mặc định và đánh dấu `(cần xác nhận)`.

2. **Timeline chia block 3-8 giây** — vừa khớp Veo 8s/clip vừa dễ đọc.

3. **Mỗi block phải có 3 mục: Hành động / Thoại / Voice tone**. Nếu block không có thoại, ghi "(không có thoại)" và bỏ Voice tone.

4. **Nhân vật chính** mô tả đầy đủ ngoại hình + trang phục — `veo3-script-writer` dùng phần này để tạo Image Asset Brief cho NanoBananaPro.

5. **Bối cảnh** mô tả 1 lần ở mục "Bối cảnh chính", các block timeline chỉ tham chiếu tên — `veo3-script-writer` sẽ tự lặp y nguyên khi sinh prompt.

6. **Hook line + CTA** ngắn, cụ thể, copy-paste được. Đây là 2 yếu tố quyết định virality, đừng viết generic.

7. **Citation cho data** — nếu hook line hay format được copy/inspired từ video nào trong research, ghi trong "Note rủi ro" để user kiểm tra.

8. **Cuối template luôn có dòng kích hoạt handoff** — nguyên văn "Viết prompt Veo cho kịch bản trên" — để user chỉ cần copy 1 dòng là sang skill tiếp theo.
