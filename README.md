# Test Figma CLI & Flutter Slicing Exploration

Repositori ini berfokus pada otomasi eksplorasi desain Figma menggunakan **`figma-cli`** dan implementasi slicing UI mobile app ke dalam **Flutter** (Dart 3).

---

## 📌 Alur Kerja / Tracks

Repositori ini dibagi menjadi dua track tugas utama:

### 1. [`view-and-create/`](file:///view-and-create)
- **Tujuan**: Membangun desain UI mobile dari kanvas kosong di Figma secara terprogram menggunakan `figma-cli render` dan variabel token.
- **Standar Desain**: Mengikuti prinsip [`frontend-design`](file:///.agents/skills/frontend-design/SKILL.md) untuk menciptakan tampilan yang berkarakter, palet warna kohesif (4–6 hex), tipografi kontras, dan signature element (menghindari template AI generik).
- **Slicing Flutter**: Mengimplementasikan UI ke dalam project Flutter modern sesuai prinsip [`flutter-expert`](file:///.agents/skills/flutter-expert/SKILL.md).

### 2. [`view-only/`](file:///view-only)
- **Tujuan**: Menerima file desain Figma yang sudah ada (status view-only), menginspeksi dan mengekstrak spesifikasi lengkap (`DESIGN.md`, DTCG design tokens JSON, screenshot acuan) menggunakan `figma-cli extract` dan `export`.
- **Slicing Flutter**: Melakukan slicing murni (pixel-perfect) ke Flutter yang 100% presisi sesuai spesifikasi layout, spacing, dan styling yang diekstrak.

---

## 🗂️ Struktur Direktori

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
└── TASKS.md                   # Roadmap tugas & checklist pengerjaan per track
```

---

## ⚙️ Prasyarat & Lingkungan

- **Node.js**: v24.20.0 (via NVM)
- **Figma CLI (`figma-cli`)**: Ter-install secara global (`/Users/macbook/.nvm/versions/node/v24.20.0/bin/figma-cli`)
- **Flutter SDK**: Flutter 3.47.4 • Dart 3.13.3 (`/Users/macbook/Developer/flutter/bin/flutter`)
- **GitHub CLI (`gh`)**: Terhubung ke akun GitHub aktif

---

## 🚀 Panduan Memulai

### 1. Cek Koneksi Figma CLI
Jalankan diagnosa koneksi antara CLI dan Figma:
```bash
figma-cli diagnose
```
Untuk menghubungkan ke Figma Desktop yang sedang aktif:
```bash
figma-cli connect --safe     # Safe Mode via plugin
# atau
figma-cli connect --browser  # Browser Mode via CDP
```

### 2. Menjalankan Task
Lihat checklist lengkap dan tahapan pengerjaan di file [`TASKS.md`](file:///TASKS.md).

---

## 🔄 Aturan Git & Commit-Push

Sesuai aturan di [`AGENTS.md`](file:///AGENTS.md), setiap tahapan atau fase pengerjaan yang selesai dikerjakan **wajib** langsung di-commit dan di-push ke remote repository `main` menggunakan konvensi Conventional Commits:
- `design(...)`: Perubahan atau penambahan desain di Figma.
- `feat(...)`: Fitur baru, widget, atau slicing Flutter.
- `docs(...)`: Dokumentasi (`README.md`, `AGENTS.md`, `TASKS.md`).
- `chore(...)`: Konfigurasi project atau dependensi.
- `test(...)`: Pengujian atau verifikasi QA.
