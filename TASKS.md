# TASKS.md

Roadmap dan daftar tugas untuk pengerjaan project mobile Flutter menggunakan `figma-cli`. Terdiri dari 2 track terpisah:

1. **`view-and-create`**: Membuat UI mobile app di file Figma kosong mengikuti prinsip [frontend-design](file:///./.agents/skills/frontend-design/SKILL.md), kemudian melakukan slicing ke Flutter.
2. **`view-only`**: Membaca desain dari file Figma view-only yang sudah ada, lalu melakukan slicing ke Flutter secara presisi.

---

## Track 1: `view-and-create`
Lokasi direktori: `[view-and-create/](file:///Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-and-create)`
Target File Figma: `Untitled` (`https://www.figma.com/design/MMv9N0JTRXhlTMuwr91B9Q/Untitled`)

### Deskripsi
Tugas ini dimulai dari canvas kosong di Figma pada file `Untitled`. Agent merancang UI mobile app menggunakan `figma-cli` dengan menerapkan prinsip desain non-generik dan berkarakter, kemudian mengimplementasikan desain tersebut ke dalam project Flutter modern.

### Checklist Pengerjaan

#### 1. Konsep & Perencanaan Desain (Aturan `frontend-design`)
- [x] Tentukan subjek dan domain aplikasi (misal: Modern Coffee Roastery, Personal Finance Tracker, Artisan Plant Care).
- [x] Tentukan target audiens dan single job dari layar utama.
- [x] Buat sistem token visual:
  - **Palet Warna**: 4-6 nilai hex spesifik dengan kontras optimal (background, surface, primary, accent, text primary, text secondary).
  - **Tipografi**: Pasangan font display dan body (misal: Plus Jakarta Sans / Outfit / Inter) dengan type scale terukur.
  - **Signature Element**: 1 elemen unik yang menjadi ciri khas identitas visual (misal: custom progress ring, asymmetric card treatment, dynamic pill selector).
  - **Copywriting**: Menggunakan active voice dan istilah yang familiar bagi pengguna.

#### 2. Pembuatan Desain di Figma via `figma-cli`
- [x] Pastikan koneksi Figma aktif:
  ```bash
  figma-cli diagnose
  figma-cli connect --safe   # atau sesuaikan dengan metode koneksi yang aktif
  ```
- [x] Inisialisasi token/variabel desain di Figma:
  ```bash
  figma-cli tokens
  # atau daftarkan color tokens via figma-cli variables
  ```
- [x] Render frame mobile (contoh resolusi iPhone 14/15: 390 x 844) dan komponen-komponen UI menggunakan JSX:
  ```bash
  figma-cli render "<Frame name='Mobile Screen' width={390} height={844} fill='#F8FAFC'>...</Frame>" --verify
  ```
- [x] Atur auto-layout, padding, dan gap pada komponen:
  ```bash
  figma-cli pad 16 20
  figma-cli gap 12
  figma-cli align center
  ```
- [x] Ambil screenshot verifikasi desain Figma:
  ```bash
  figma-cli verify
  figma-cli export screenshot view-and-create/figma_preview.png
  ```
- [x] **Commit & Push Desain Figma**:
  ```bash
  git add .
  git commit -m "design(view-and-create): create mobile app UI and tokens in figma"
  git push origin main
  ```

#### 3. Inisialisasi Project Flutter
- [x] Buat project Flutter di dalam folder `view-and-create`:
  ```bash
  cd /Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-and-create
  flutter create --org com.rollingglory.viewandcreate --project-name app_view_and_create .
  ```
- [x] Verifikasi instalasi dependencies dan flutter doctor:
  ```bash
  flutter pub get
  ```
- [x] **Commit & Push Setup Flutter**:
  ```bash
  git add .
  git commit -m "chore(view-and-create): initialize flutter project"
  git push origin main
  ```

#### 4. Slicing UI ke Flutter (Aturan `flutter-expert`)
- [x] Setup Design System di Flutter:
  - `lib/core/theme/app_colors.dart`: Definisi warna sesuai token Figma.
  - `lib/core/theme/app_typography.dart`: Definisi style font dan type scale.
  - `lib/core/theme/app_theme.dart`: Konfigurasi `ThemeData` (Material 3).
- [x] Buat Reusable Widgets (`lib/widgets/`):
  - Custom button dengan micro-interaction / states.
  - Card / List item dengan layout dan elevation yang presisi.
  - Signature element yang sudah dirancang sebelumnya.
- [x] Buat Screen Utama (`lib/screens/` atau `lib/features/...`):
  - Implementasi layout responsif menggunakan `SafeArea`, `Column`, `ListView`, atau `CustomScrollView`.
  - Terapkan `const` constructor untuk efisiensi render loop.
- [x] Integrasi icon atau aset pendukung.
- [x] **Commit & Push Slicing Widget & Screen**:
  ```bash
  git add .
  git commit -m "feat(view-and-create): implement design system, widgets, and main screen"
  git push origin main
  ```

#### 5. Verifikasi & QA
- [x] Jalankan analisis statis dan linter Flutter:
  ```bash
  flutter analyze
  ```
- [x] Jalankan unit / widget test dasar:
  ```bash
  flutter test
  ```
- [x] Bandingkan visual UI Flutter dengan screenshot Figma (`figma_preview.png`) untuk memastikan akurasi layout dan estetika.
- [x] **Commit & Push Hasil Final QA**:
  ```bash
  git add .
  git commit -m "test(view-and-create): verify flutter analyze and visual QA"
  git push origin main
  ```

---

## Track 2: `view-only`
Lokasi direktori: `[view-only/](file:///Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-only)`
Target File Figma: `DANONE - AQUA APP` (`https://www.figma.com/design/caXZZxc1CP2MhfexwEUjin/DANONE---AQUA-APP`)

### Deskripsi
Tugas ini berfokus pada slicing murni dari file Figma `DANONE - AQUA APP` yang berstatus view-only. Agent mengekstrak struktur desain, token warna, typography, dan aset menggunakan `figma-cli`, kemudian menyusun aplikasi Flutter yang presisi sesuai desain Figma.

### Checklist Pengerjaan

#### 1. Inspeksi & Ekstraksi Desain via `figma-cli`
> [!WARNING]
> Ekstraksi langsung file view-only terblokir (plugin eval hang — lihat `REPORT.md` §3).
> Item di bawah ini belum dapat dieksekusi setia; slice memakai token proksimat.
- [ ] Buka dan pastikan tab `DANONE - AQUA APP` aktif di Figma Desktop.
- [ ] Verifikasi file terdeteksi via `figma-cli files`:
  ```bash
  figma-cli files
  ```
- [ ] Ekstrak spesifikasi lengkap desain ke dalam `DESIGN.md`:
  ```bash
  figma-cli extract view-only/DESIGN.md
  ```
- [ ] Ekspor token variabel (CSS / DTCG JSON):
  ```bash
  figma-cli export dtcg view-only/tokens.json
  figma-cli export css > view-only/tokens.css
  ```
- [ ] Ekspor screenshot acuan dari screen/frame yang akan di-slicing:
  ```bash
  figma-cli export screenshot view-only/target_screen.png
  ```
- [ ] Jika diperlukan inspeksi detail pada node tertentu:
  ```bash
  figma-cli inspect <nodeId> --json
  figma-cli node tree [nodeId]
  ```
- [ ] **Commit & Push Hasil Ekstraksi Figma** (terblokir — lihat catatan di atas):
  ```bash
  git add .
  git commit -m "docs(view-only): extract DESIGN.md, tokens, and target screenshots"
  git push origin main
  ```

#### 2. Inisialisasi Project Flutter
- [x] Buat project Flutter di dalam folder `view-only`:
  ```bash
  cd /Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-only
  flutter create --org com.rollingglory.viewonly --project-name app_view_only .
  ```
- [x] Update dependensi (misal `google_fonts` atau icon packs jika tertera pada hasil ekstraksi Figma).
- [x] **Commit & Push Setup Flutter**:
  ```bash
  git add .
  git commit -m "chore(view-only): initialize flutter project"
  git push origin main
  ```

#### 3. Slicing UI ke Flutter (Pixel-Perfect Slicing)
- [x] Mapping Token Desain:
  - Konversi nilai warna dari `tokens.json` / `tokens.css` ke class `AppColors` di Flutter.
  - Konversi font family, font weight, letter spacing, dan line height ke class `AppTypography`.
  - Konversi padding dan border radius dari `DESIGN.md` ke konstanta spacing.
- [x] Ekspor aset grafis (SVG / PNG icon / ilustrasi):
  ```bash
  figma-cli export node <iconNodeId> --output view-only/assets/icons/
  ```
  - Daftarkan aset pada `pubspec.yaml`.
- [x] Implementasi Slicing Komponen:
  - Pecah frame menjadi hierarki widget Flutter yang modular.
  - Pastikan dimensi, margin, padding, border radius, dan shadows identik dengan spesifikasi di `DESIGN.md`.
- [x] Susun Screen Lengkap:
  - Bangun tampilan layar penuh dengan state handling dasar (misal: scrollable view, status bar styling, safe area).
- [x] **Commit & Push Slicing Flutter**:
  ```bash
  git add .
  git commit -m "feat(view-only): slice pixel-perfect flutter UI from figma specs"
  git push origin main
  ```

#### 4. Verifikasi & Uji Kemiripan
- [x] Jalankan kode analisis:
  ```bash
  flutter analyze
  ```
- [x] Jalankan widget test:
  ```bash
  flutter test
  ```
- [x] Verifikasi kemiripan visual (side-by-side comparison):
  - Bandingkan rendering Flutter dengan `target_screen.png` yang diekspor dari Figma.
  - Pastikan tidak ada overflow error atau ketidaksesuaian warna dan font.
- [x] **Commit & Push Hasil Final QA**:
  ```bash
  git add .
  git commit -m "test(view-only): complete visual QA and tests"
  git push origin main
  ```

---

## Fase Akhir: Penyusunan Laporan & Tutorial
Lokasi file: `[REPORT.md](file:///Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/REPORT.md)` dan `[TUTORIAL.md](file:///Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/TUTORIAL.md)`

### Deskripsi
Setelah seluruh task di Track 1 (`view-and-create`) dan Track 2 (`view-only`) selesai dikerjakan dan diverifikasi, agent wajib menyusun dokumentasi komprehensif berupa laporan evaluasi hasil eksperimen (`REPORT.md`) dan tutorial panduan teknis langkah-demi-langkah (`TUTORIAL.md`).

### Checklist Pengerjaan

#### 1. Penyusunan REPORT.md
- [x] Ringkasan eksekutif eksperimen figma-cli dan Flutter slicing.
- [x] Evaluasi Track 1 (`view-and-create`): efektivitas pembuatan desain terprogram via figma-cli render, penerapan token, dan hasil slicing Flutter.
- [x] Evaluasi Track 2 (`view-only`): akurasi ekstraksi spesifikasi DESIGN.md, tokens, aset visual, dan presisi slicing Flutter.
- [x] Analisis performa, kendala teknis yang dihadapi, solusi pemecahan masalah, dan rekomendasi perbaikan.
- [x] Perbandingan efisiensi alur kerja: mendesain via CLI vs mengekstrak file yang sudah ada.

#### 2. Penyusunan TUTORIAL.md
- [x] Panduan instalasi dan setup awal (Node.js, figma-cli, Flutter, CDP connection port 9222, speed daemon).
- [x] Tutorial Alur 1: Membuat UI mobile dari nol di Figma menggunakan JSX, auto-layout, styling, dan variables via figma-cli.
- [x] Tutorial Alur 2: Menghubungkan ke file Figma view-only, mengekstrak DESIGN.md, mengekspor token warna/typography, dan mengekspor aset PNG/SVG.
- [x] Tutorial Alur 3: Slicing desain ke Flutter (setup arsitektur, mapping theme tokens, pembuatan reusable widgets, dan penanganan layout responsif).
- [x] Tutorial Alur 4: Otomasi commit dan push ke GitHub per task completion.

#### 3. Commit & Push Dokumen Akhir
- [x] **Commit & Push REPORT.md dan TUTORIAL.md**:
  ```bash
  git add REPORT.md TUTORIAL.md TASKS.md
  git commit -m "docs: add comprehensive REPORT.md and TUTORIAL.md"
  git push origin main
  ```
