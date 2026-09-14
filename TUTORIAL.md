# TUTORIAL.md — Panduan Replikasi `figma-cli` + Slicing Flutter

## 0. Prasyarat

- Node.js v24 (via NVM), `figma-cli` global (`figma-cli --version` → 2.1.2).
- Flutter 3.47.4 / Dart 3.13.3 (`flutter --version`).
- Figma Desktop berjalan + login; CDP port 9222; daemon `figma-cli` port 3456.

## 1. Setup Koneksi

```bash
figma-cli diagnose          # harus: debugging port 9222 ✓, daemon :3456 ✓
figma-cli files             # daftar file terbuka (+ wsUrl per file)
figma-cli status            # file yang sedang terhubung
figma-cli connect           # Yolo Mode (default); --safe / --browser bila perlu
```

> [!NOTE]
> CLI mengeksekusi pada tab yang **fokus**. Fokus via
> `open -g "figma://file/<FILE_KEY>/<Name>"` (`-g` = background, tidak hang).
> Jangan pakai `open` tanpa `-g` di sesi otomasi.

## 2. Alur 1 — Desain dari Nol (Track `view-and-create`)

### 2.1. Buat koleksi + token warna

```bash
figma-cli col create "KopiCraft"
figma-cli tokens add "oat-bg" "#EDE6DA" -c "KopiCraft" -t COLOR
figma-cli variables list    # verifikasi
```

### 2.2. Render JSX (ATURAN SINTAKS — penting!)

- Pakai **double-quote** untuk string: `bg="#..."`, `name="..."`.
  Single-quote (`bg='#...'`) **diabaikan diam-diam** → fills=0, PNG hitam.
- Text memakai `color`, bukan `fill`; `size`/`weight` (bukan fontSize/fontWeight);
  `rounded` (bukan cornerRadius); `flex="row"`/`"col"` untuk auto-layout horizontal/vertikal.

```bash
figma-cli render '<Frame name="Home" width={390} height={844} bg="#EDE6DA" flex="col" padding={20} gap={16}><Text size={28} weight={700} color="#2B1D16">Halo</Text><Frame width={350} height={52} bg="#2B1D16" rounded={26} flex="row" justify="center" items="center" padding={6} gap={6}><Frame width={106} height={40} bg="#C67A3A" rounded={20} flex="row" justify="center" items="center"><Text size={13} weight={600} color="#FFFFFF" align="center">Ringan</Text></Frame></Frame></Frame>' --verify
```

### 2.3. Rapikan + verifikasi

```bash
figma-cli unstack                       # bila ada node bertumpuk
figma-cli get "<nodeId>"                # cek fills=1, layoutMode
figma-cli export node "<nodeId>" -o view-and-create/figma_preview.png
figma-cli delete "<nodeId>"             # hapus hasil coba-coba
```

## 3. Alur 2 — Ekstraksi View-Only (Track `view-only`)

```bash
figma-cli files
figma-cli extract view-only/DESIGN.md
figma-cli export dtcg view-only/tokens.json
figma-cli export css > view-only/tokens.css
figma-cli export screenshot -o view-only/target_screen.png -s 2
figma-cli node tree [nodeId]
figma-cli inspect <nodeId> --json
```

> [!WARNING]
> File **view-only** dapat memblokir plugin eval: `extract` mengembalikan file
> yang salah, `node tree`/`export` hang, `daemon reconnect` gagal
> ("Could not find Figma execution context"). Jika terjadi: kembalikan fokus ke
> file editable (`open -g figma://...`), dan gunakan akses edit/duplikat atau
> Figma REST API sebagai gantinya. Lihat `REPORT.md` §3.

## 4. Alur 3 — Slicing ke Flutter

```bash
cd view-and-create
flutter create --org com.rollingglory.viewandcreate --project-name app_view_and_create .
```

Struktur:

```text
lib/
├── core/theme/app_colors.dart      # token warna (const Color 0xFF...)
├── core/theme/app_typography.dart  # type scale (const TextStyle)
├── core/theme/app_theme.dart       # ThemeData Material 3
├── widgets/*.dart                  # reusable, const constructor
└── screens/*.dart                  # SafeArea + LayoutBuilder + SingleChildScrollView
```

Aturan: `const` di mana mungkin; touch target ≥48dp
(`minimumSize: Size(48,48)`); tidak ada overflow pada 390×844.

Verifikasi:

```bash
flutter analyze   # harus: No issues found!
flutter test      # widget test untuk tiap screen utama
```

Bandingkan render Flutter vs `figma_preview.png` / `target_screen.png` berdampingan.

## 5. Alur 4 — Git per Task

```bash
git status --short                    # pastikan bersih sebelum mulai
git add <scope paths>
git commit -m "<tipe>(<scope>): <pesan>"
# tipe: design | feat | chore | docs | test — scope: view-and-create | view-only
git push origin main
```

Lakukan **satu commit+push per fase TASKS.md selesai**, jangan menumpuk.
`build/`, `.dart_tool/`, `.DS_Store` sudah di-ignore — jangan di-commit.
