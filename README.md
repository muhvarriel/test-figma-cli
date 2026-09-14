# Test Figma CLI & Flutter Slicing Exploration

Repositori ini berfokus pada otomasi eksplorasi desain Figma menggunakan **`figma-cli`** dan implementasi slicing UI mobile app ke dalam **Flutter** (Dart 3).

---

## Alur Kerja / Tracks

Repositori ini dibagi menjadi dua track tugas utama berdasarkan file Figma yang aktif:

### 1. [`view-and-create/`](file:///view-and-create)
- **Target File Figma**: `Untitled` (`https://www.figma.com/design/MMv9N0JTRXhlTMuwr91B9Q/Untitled`)
- **Tujuan**: Membangun desain UI mobile dari kanvas kosong di Figma secara terprogram menggunakan `figma-cli render` dan variabel token.
- **Standar Desain**: Mengikuti prinsip [`frontend-design`](file:///.agents/skills/frontend-design/SKILL.md) untuk menciptakan tampilan yang berkarakter, palet warna kohesif (4-6 hex), tipografi kontras, dan signature element (menghindari template AI generik).
- **Slicing Flutter**: Mengimplementasikan UI ke dalam project Flutter modern sesuai prinsip [`flutter-expert`](file:///.agents/skills/flutter-expert/SKILL.md).

### 2. [`view-only/`](file:///view-only)
- **Target File Figma**: `DANONE - AQUA APP` (`https://www.figma.com/design/caXZZxc1CP2MhfexwEUjin/DANONE---AQUA-APP`)
- **Tujuan**: Menginspeksi dan mengekstrak spesifikasi lengkap (`DESIGN.md`, DTCG design tokens JSON, screenshot acuan) menggunakan `figma-cli extract` dan `export`.
- **Slicing Flutter**: Melakukan slicing murni (pixel-perfect) ke Flutter yang presisi sesuai spesifikasi layout, spacing, dan styling yang diekstrak.

---

## Struktur Direktori

```text
.
├── .agents/
│   └── skills/                # Skills lokal Antigravity
│       ├── figma-automation/  # Workflow automasi Figma via MCP/CLI
│       ├── flutter-expert/    # Panduan Flutter 3.x, Dart 3, performa & widget
│       └── frontend-design/   # Panduan prinsip estetika dan desain frontend
├── view-and-create/           # Workspace Track 1: Desain dari nol & Flutter slicing
├── view-only/                 # Workspace Track 2: Ekstraksi view-only & Flutter slicing
├── .gitignore                 # Konfigurasi ignore file OS dan build Flutter
├── AGENTS.md                  # Panduan AI Agent, setup figma-cli & standar slicing
├── README.md                  # Dokumentasi umum repositori
├── REPORT.md                  # Laporan evaluasi dan temuan komprehensif (setelah semua task selesai)
├── TASKS.md                   # Roadmap tugas & checklist pengerjaan per track
└── TUTORIAL.md                # Panduan teknis langkah-demi-langkah (setelah semua task selesai)
```

---

## Dokumentasi Akhir Proyek

Setelah seluruh task pada Track 1 dan Track 2 tuntas diselesaikan dan divalidasi, repositori ini akan dilengkapi dengan:
1. **`[REPORT.md](file:///REPORT.md)`**: Laporan evaluasi komparatif antara perancangan via figma-cli vs ekstraksi file acuan, performa, kendala, dan rekomendasi teknis.
2. **`[TUTORIAL.md](file:///TUTORIAL.md)`**: Panduan teknis lengkap yang dapat direplikasi untuk menghubungkan Figma Desktop via CDP, mendesain UI via CLI, mengekstrak token/desain, dan melakukan slicing Flutter.

---

## Prasyarat & Lingkungan

- **Node.js**: v24.20.0 (via NVM)
- **Figma CLI (`figma-cli`)**: Ter-install secara global (`/Users/macbook/.nvm/versions/node/v24.20.0/bin/figma-cli`)
- **Flutter SDK**: Flutter 3.47.4 • Dart 3.13.3 (`/Users/macbook/Developer/flutter/bin/flutter`)
- **GitHub CLI (`gh`)**: Terhubung ke akun GitHub aktif

---

## Panduan Memulai

### 1. Status Koneksi Figma CLI
Koneksi ke Figma Desktop menggunakan direct CDP (port 9222) dan speed daemon (port 3456):
```bash
figma-cli diagnose
```
Untuk menginisialisasi atau memperbarui koneksi:
```bash
figma-cli connect
```
Melihat daftar file yang sedang terbuka:
```bash
figma-cli files
```

### 2. Menjalankan Task
Lihat checklist lengkap dan tahapan pengerjaan di file [`TASKS.md`](file:///TASKS.md).

---

## Aturan Git & Commit-Push

Sesuai aturan di [`AGENTS.md`](file:///AGENTS.md), setiap tahapan atau fase pengerjaan yang selesai dikerjakan wajib langsung di-commit dan di-push ke remote repository `main` menggunakan konvensi Conventional Commits:
- `design(...)`: Perubahan atau penambahan desain di Figma.
- `feat(...)`: Fitur baru, widget, atau slicing Flutter.
- `docs(...)`: Dokumentasi (`README.md`, `AGENTS.md`, `TASKS.md`).
- `chore(...)`: Konfigurasi project atau dependensi.
- `test(...)`: Pengujian atau verifikasi QA.
