# AGENTS.md

Panduan ini ditujukan untuk AI Agent yang bekerja di repositori ini (`test-figma-cli`). Repositori ini berfokus pada eksplorasi dan otomasi desain Figma menggunakan **`figma-cli`** serta proses slicing desain ke dalam aplikasi mobile **Flutter**.

---

## 1. Lingkungan & Setup `figma-cli`

Tool `figma-cli` sudah ter-install secara global di sistem:
- **Lokasi Eksekusi**: `/Users/macbook/.nvm/versions/node/v24.20.0/bin/figma-cli` (atau langsung `figma-cli` di terminal).
- **Node.js**: v24.20.0
- **Flutter**: Flutter 3.47.4 • Dart 3.13.3 (`/Users/macbook/Developer/flutter/bin/flutter`)

### Diagnostik & Koneksi ke Figma

Sebelum menjalankan operasi yang membutuhkan interaksi langsung dengan canvas Figma:
1. **Periksa status koneksi**:
   ```bash
   figma-cli diagnose
   ```
2. **Koneksi ke Figma Desktop**:
   ```bash
   figma-cli connect [options]
   ```
   - Opsi koneksi:
     - `--safe`: Menjalankan Safe Mode via plugin tanpa perlu modifikasi app.
     - `--browser`: Menjalankan Browser Mode (Chromium via CDP) untuk Figma di browser.
3. **Cek file yang sedang terbuka**:
   ```bash
   figma-cli files
   ```

---

## 2. Kemampuan & Perintah Utama `figma-cli`

### A. Membuat Desain & Komponen dari Nol (`view-and-create`)

Agent dapat membangun UI langsung ke canvas Figma menggunakan JSX syntax atau perintah primitif:
- **Render JSX ke Figma**:
  ```bash
  figma-cli render "<Frame width={390} height={844} fill='#FFFFFF'><Text fontSize={24}>Hello Mobile</Text></Frame>"
  ```
  - Gunakan `--as-component` untuk otomatis menjadikannya Figma Component.
  - Gunakan `--verify` untuk otomatis mengambil screenshot hasil render.
  - Gunakan `-x <n> -y <n>` untuk koordinat penempatan.
- **Render Batch**:
  ```bash
  figma-cli render-batch '<[{"type":"Frame",...}]>' --as-component
  ```
- **Mengatur Token Desain & Variabel**:
  ```bash
  figma-cli tokens        # Buat preset design token
  figma-cli variables     # Kelola variabel/tokens (color, number, string)
  figma-cli col           # Kelola variable collections
  ```
- **Mengatur Auto-Layout & Posisi**:
  ```bash
  figma-cli gap <value>           # Set auto-layout gap
  figma-cli pad <value>           # Set padding (CSS syntax: 1-4 nilai)
  figma-cli align <start|center|end|stretch> # Set alignment
  figma-cli pin <edge>            # Pin node ke edge parent
  figma-cli unstack               # Rapikan node yang bertumpuk pada posisi yang sama
  ```

### B. Inspeksi & Ekstraksi File Figma (`view-only`)

Untuk file Figma yang sudah ada (termasuk yang hanya view-only), gunakan perintah ekstraksi untuk membaca seluruh struktur:
- **Ekstraksi Lengkap ke DESIGN.md**:
  ```bash
  figma-cli extract DESIGN.md
  ```
  Menghasilkan dokumentasi lengkap berisi token warna, tipografi, spacing, hierarki frame, dan matriks varian komponen.
- **Inspeksi Node Spesifik**:
  ```bash
  figma-cli inspect <nodeId> --json
  figma-cli inspect <nodeId> --spec
  ```
- **Melihat Pohon Node**:
  ```bash
  figma-cli node tree [nodeId]
  figma-cli node bindings <nodeId>
  ```
- **Ekspor Aset & Screenshot**:
  ```bash
  figma-cli export screenshot [nodeId]   # Screenshot halaman/node tertentu
  figma-cli export node <nodeId>         # Ekspor node tertentu sebagai PNG
  figma-cli export css                   # Ekspor variables sebagai CSS variables
  figma-cli export dtcg [output.json]    # Ekspor tokens dalam format W3C DTCG
  figma-cli export-jsx <nodeId>          # Ekspor struktur node menjadi kode JSX
  ```
- **Verifikasi Hasil AI**:
  ```bash
  figma-cli verify [nodeId]              # Screenshot resolusi optimal untuk verifikasi AI
  figma-cli lint                         # Linting ketidakkonsistenan desain
  ```

---

## 3. Aturan & Standar Desain Frontend

Saat mendesain UI mobile app dari awal (seperti di track `view-and-create`), agent **wajib** mematuhi prinsip dari skill `frontend-design` (`.agents/skills/frontend-design/SKILL.md`):

1. **Hindari Template / Gaya AI Generik**:
   - Jangan gunakan palet default umum seperti hitam pekat dengan satu neon hijau/orange, atau krem monoton tanpa karakter.
   - Buat palet warna yang kohesif (4–6 hex values) dengan kontras yang teruji.
2. **Tipografi Berkarakter**:
   - Pasangkan font display dan font body secara terencana dengan type scale yang jelas (misal: Inter/Plus Jakarta Sans/Outfit/Epilogue).
3. **Struktur yang Memiliki Makna**:
   - Layout mobile harus ergonomis untuk layar sentuh (touch target min 44x44 atau 48x48 dp).
   - Berikan signature element yang membuat tampilan berkesan dan relevan dengan tujuan aplikasi.
4. **Copywriting Berorientasi Pengguna**:
   - Gunakan kalimat aktif, ringkas, dan jelas ("Transfer Sekarang", "Lihat Riwayat", bukan kata-kata generik tanpa konteks).

---

## 4. Standar Slicing ke Flutter

Slicing ke Flutter mengacu pada skill `flutter-expert` (`.agents/skills/flutter-expert/SKILL.md`):

1. **Dart 3 & Flutter Modern**:
   - Gunakan fitur Dart 3 (records, patterns, sealed classes bila relevan).
   - Terapkan `const` constructor di semua tempat yang memungkinkan untuk menghindari rebuild yang tidak perlu.
2. **Struktur Desain Token di Flutter**:
   - Ekstrak warna, font, dan spacing menjadi class terpusat (misal `AppColors`, `AppTypography`, `AppSpacing`) atau integrasikan langsung ke `ThemeData` (Material 3).
3. **Modularitas Komponen**:
   - Pisahkan screen menjadi komponen-komponen kecil yang reusable di folder `widgets/` atau `components/`.
4. **Responsif & Aman**:
   - Gunakan `SafeArea`, `SingleChildScrollView`, atau `LayoutBuilder` untuk mencegah overflow di berbagai ukuran layar mobile.
5. **Verifikasi Visual**:
   - Bandingkan hasil slicing dengan screenshot dari `figma-cli export screenshot` atau `figma-cli verify`.

---

## 5. Referensi Skills Lokal

Skills berikut tersedia langsung di `.agents/skills/`:
- `[flutter-expert](file:///.agents/skills/flutter-expert/SKILL.md)`: Panduan mendalam arsitektur Flutter, performa, dan implementasi widget.
- `[figma-automation](file:///.agents/skills/figma-automation/SKILL.md)`: Panduan automasi Figma dan ekstraksi token.
- `[frontend-design](file:///.agents/skills/frontend-design/SKILL.md)`: Panduan prinsip desain visual berkualitas tinggi tanpa template AI.

---

## 6. Git Workflow & Aturan Commit-Push Tiap Task

Repositori ini terhubung ke GitHub private repository:
1. **Otomasi Commit & Push per Task**:
   - Setiap kali satu langkah/fase tugas dalam `TASKS.md` selesai dikerjakan, agent **wajib** langsung membuat commit dan melakukan push ke branch remote:
     ```bash
     git add .
     git commit -m "<tipe>(<scope>): <pesan ringkas deskriptif>"
     git push origin <branch>
     ```
2. **Format Pesan Commit (Conventional Commits)**:
   - `feat(view-and-create)`: Menambahkan fitur, komponen, atau slicing di track view-and-create.
   - `feat(view-only)`: Menambahkan fitur, token, atau slicing di track view-only.
   - `design(...)`: Perubahan atau penambahan desain Figma melalui figma-cli.
   - `docs(...)`: Pembaruan dokumentasi (AGENTS.md, TASKS.md, walkthrough).
   - `chore(...)`: Konfigurasi project, dependensi, atau build tooling.
3. **Integritas Repository**:
   - Pastikan file build sementara Flutter (`build/`, `.dart_tool/`) dan sistem OS (`.DS_Store`) tidak ter-commit (selalu patuhi `.gitignore`).
   - Sebelum memulai task baru, pastikan branch lokal bersih (`git status`).
