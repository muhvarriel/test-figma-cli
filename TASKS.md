# TASKS.md

Roadmap dan daftar tugas untuk pengerjaan project mobile Flutter menggunakan `figma-cli`. Terdiri dari 2 track terpisah:

1. **`view-and-create`**: Membuat UI mobile app di file Figma kosong mengikuti prinsip [frontend-design](file:///./.agents/skills/frontend-design/SKILL.md), kemudian melakukan slicing ke Flutter.
2. **`view-only`**: Membaca desain dari file Figma view-only yang sudah ada, lalu melakukan slicing ke Flutter secara presisi.

---

## Track 1: `view-and-create`
Lokasi direktori: `[view-and-create/](file:///Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-and-create)`

### Deskripsi
Tugas ini dimulai dari canvas kosong di Figma. Agent merancang UI mobile app menggunakan `figma-cli` dengan menerapkan prinsip desain non-generik dan berkarakter, kemudian mengimplementasikan desain tersebut ke dalam project Flutter modern.

### Checklist Pengerjaan

#### 1. Konsep & Perencanaan Desain (Aturan `frontend-design`)
- [ ] Tentukan subjek dan domain aplikasi (misal: Modern Coffee Roastery, Personal Finance Tracker, Artisan Plant Care).
- [ ] Tentukan target audiens dan single job dari layar utama.
- [ ] Buat sistem token visual:
  - **Palet Warna**: 4–6 nilai hex spesifik dengan kontras optimal (background, surface, primary, accent, text primary, text secondary).
  - **Tipografi**: Pasangan font display dan body (misal: Plus Jakarta Sans / Outfit / Inter) dengan type scale terukur.
  - **Signature Element**: 1 elemen unik yang menjadi ciri khas identitas visual (misal: custom progress ring, asymmetric card treatment, dynamic pill selector).
  - **Copywriting**: Menggunakan active voice dan istilah yang familiar bagi pengguna.

#### 2. Pembuatan Desain di Figma via `figma-cli`
- [ ] Pastikan koneksi Figma aktif:
  ```bash
  figma-cli diagnose
  figma-cli connect --safe   # atau sesuaikan dengan metode koneksi yang aktif
  ```
- [ ] Inisialisasi token/variabel desain di Figma:
  ```bash
  figma-cli tokens
  # atau daftarkan color tokens via figma-cli variables
  ```
- [ ] Render frame mobile (contoh resolusi iPhone 14/15: 390 x 844) dan komponen-komponen UI menggunakan JSX:
  ```bash
  figma-cli render "<Frame name='Mobile Screen' width={390} height={844} fill='#F8FAFC'>...</Frame>" --verify
  ```
- [ ] Atur auto-layout, padding, dan gap pada komponen:
  ```bash
  figma-cli pad 16 20
  figma-cli gap 12
  figma-cli align center
  ```
- [ ] Ambil screenshot verifikasi desain Figma:
  ```bash
  figma-cli verify
  figma-cli export screenshot view-and-create/figma_preview.png
  ```
- [ ] **Commit & Push Desain Figma**:
  ```bash
  git add .
  git commit -m "design(view-and-create): create mobile app UI and tokens in figma"
  git push origin main
  ```

#### 3. Inisialisasi Project Flutter
- [ ] Buat project Flutter di dalam folder `view-and-create`:
  ```bash
  cd /Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-and-create
  flutter create --org com.rollingglory.viewandcreate --project-name app_view_and_create .
  ```
- [ ] Verifikasi instalasi dependencies dan flutter doctor:
  ```bash
  flutter pub get
  ```
- [ ] **Commit & Push Setup Flutter**:
  ```bash
  git add .
  git commit -m "chore(view-and-create): initialize flutter project"
  git push origin main
  ```

#### 4. Slicing UI ke Flutter (Aturan `flutter-expert`)
- [ ] Setup Design System di Flutter:
  - `lib/core/theme/app_colors.dart`: Definisi warna sesuai token Figma.
  - `lib/core/theme/app_typography.dart`: Definisi style font dan type scale.
  - `lib/core/theme/app_theme.dart`: Konfigurasi `ThemeData` (Material 3).
- [ ] Buat Reusable Widgets (`lib/widgets/`):
  - Custom button dengan micro-interaction / states.
  - Card / List item dengan layout dan elevation yang presisi.
  - Signature element yang sudah dirancang sebelumnya.
- [ ] Buat Screen Utama (`lib/screens/` atau `lib/features/...`):
  - Implementasi layout responsif menggunakan `SafeArea`, `Column`, `ListView`, atau `CustomScrollView`.
  - Terapkan `const` constructor untuk efisiensi render loop.
- [ ] Integrasi icon atau aset pendukung.
- [ ] **Commit & Push Slicing Widget & Screen**:
  ```bash
  git add .
  git commit -m "feat(view-and-create): implement design system, widgets, and main screen"
  git push origin main
  ```

#### 5. Verifikasi & QA
- [ ] Jalankan analisis statis dan linter Flutter:
  ```bash
  flutter analyze
  ```
- [ ] Jalankan unit / widget test dasar:
  ```bash
  flutter test
  ```
- [ ] Bandingkan visual UI Flutter dengan screenshot Figma (`figma_preview.png`) untuk memastikan akurasi layout dan estetika.
- [ ] **Commit & Push Hasil Final QA**:
  ```bash
  git add .
  git commit -m "test(view-and-create): verify flutter analyze and visual QA"
  git push origin main
  ```

---

## Track 2: `view-only`
Lokasi direktori: `[view-only/](file:///Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-only)`

### Deskripsi
Tugas ini berfokus pada slicing murni dari file Figma yang sudah ada (berstatus view-only). Agent mengekstrak struktur desain, token warna, typography, dan aset menggunakan `figma-cli`, kemudian menyusun aplikasi Flutter yang 100% presisi sesuai desain Figma.

### Checklist Pengerjaan

#### 1. Inspeksi & Ekstraksi Desain via `figma-cli`
- [ ] Buka file Figma target di Figma Desktop / Browser.
- [ ] Hubungkan `figma-cli` ke sesi aktif:
  ```bash
  figma-cli connect --safe
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
- [ ] **Commit & Push Hasil Ekstraksi Figma**:
  ```bash
  git add .
  git commit -m "docs(view-only): extract DESIGN.md, tokens, and target screenshots"
  git push origin main
  ```

#### 2. Inisialisasi Project Flutter
- [ ] Buat project Flutter di dalam folder `view-only`:
  ```bash
  cd /Users/macbook/Developer/WorkingSpace/RollingGlory/test-figma-cli/view-only
  flutter create --org com.rollingglory.viewonly --project-name app_view_only .
  ```
- [ ] Update dependensi (misal `google_fonts` atau icon packs jika tertera pada hasil ekstraksi Figma).
- [ ] **Commit & Push Setup Flutter**:
  ```bash
  git add .
  git commit -m "chore(view-only): initialize flutter project"
  git push origin main
  ```

#### 3. Slicing UI ke Flutter (Pixel-Perfect Slicing)
- [ ] Mapping Token Desain:
  - Konversi nilai warna dari `tokens.json` / `tokens.css` ke class `AppColors` di Flutter.
  - Konversi font family, font weight, letter spacing, dan line height ke class `AppTypography`.
  - Konversi padding dan border radius dari `DESIGN.md` ke konstanta spacing.
- [ ] Ekspor aset grafis (SVG / PNG icon / ilustrasi):
  ```bash
  figma-cli export node <iconNodeId> --output view-only/assets/icons/
  ```
  - Daftarkan aset pada `pubspec.yaml`.
- [ ] Implementasi Slicing Komponen:
  - Pecah frame menjadi hierarki widget Flutter yang modular.
  - Pastikan dimensi, margin, padding, border radius, dan shadows identik dengan spesifikasi di `DESIGN.md`.
- [ ] Susun Screen Lengkap:
  - Bangun tampilan layar penuh dengan state handling dasar (misal: scrollable view, status bar styling, safe area).
- [ ] **Commit & Push Slicing Flutter**:
  ```bash
  git add .
  git commit -m "feat(view-only): slice pixel-perfect flutter UI from figma specs"
  git push origin main
  ```

#### 4. Verifikasi & Uji Kemiripan
- [ ] Jalankan kode analisis:
  ```bash
  flutter analyze
  ```
- [ ] Jalankan widget test:
  ```bash
  flutter test
  ```
- [ ] Verifikasi kemiripan visual (side-by-side comparison):
  - Bandingkan rendering Flutter dengan `target_screen.png` yang diekspor dari Figma.
  - Pastikan tidak ada overflow error atau ketidaksesuaian warna dan font.
- [ ] **Commit & Push Hasil Final QA**:
  ```bash
  git add .
  git commit -m "test(view-only): complete visual QA and tests"
  git push origin main
  ```
