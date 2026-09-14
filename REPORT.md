# REPORT.md — Eksperimen `figma-cli` & Slicing Flutter

Tanggal: 2026-09-14 · Repo: `test-figma-cli` · Branch: `main`

## 1. Ringkasan Eksekutif

Dua track dikerjakan sesuai `TASKS.md`:

- **Track 1 (`view-and-create`) — TUNTAS PENUH.** Dari canvas kosong file `Untitled`,
  dirancang UI **KopiCraft Roastery** (coffee pre-order, 390×844) via `figma-cli render`,
  lalu di-slicing ke Flutter (`app_view_and_create`). `flutter analyze` bersih,
  `flutter test` 2/2 lolos, screenshot Figma terverifikasi visual.
- **Track 2 (`view-only`) — SEBAGIAN, dengan blocker terdokumentasi.** File
  `DANONE - AQUA APP` (view-only) **memblokir seluruh operasi `figma-cli`** saat tab-nya
  fokus: `extract` mengembalikan file yang salah, `node tree` / `export screenshot`
  hang, `daemon reconnect` gagal ("Could not find Figma execution context").
  Sebagai fallback yang terdokumentasi, dibangun slice **AQUA Delivery**
  (layar hidrasi + pemesanan galon) memakai keluarga token aqua proksimat yang ada
  di environment; `flutter analyze` bersih, test lolos.

Total commit basis: 6 commit (`design`, `chore` ×2, `feat` ×2, + docs final).

## 2. Evaluasi Track 1 — Desain Terprogram via `figma-cli render`

| Aspek | Hasil |
|---|---|
| Efektivitas render JSX | Tinggi, setelah sintaks benar (lihat §4.1) |
| Token/variabel | Koleksi `KopiCraft` (6 warna) berhasil dibuat via `tokens add -c` |
| Auto-layout | `flex="row/col"`, `padding`, `gap`, `justify`, `items` bekerja andal |
| Verifikasi | `export node <id>` menghasilkan PNG 390×844 akurat; `verify` default scale 0.5 terlalu kecil untuk QA |
| Slicing Flutter | 1:1 — `AppColors`/`AppTypography`/`AppTheme` + 4 widget + 1 screen |

Keputusan desain (aturan `frontend-design`): menghindari default generik
(cream + serif + terracotta) dengan display sans geometris, palet oat/espresso/
karamel/moss/clay, signature element **Brew Strength Pill Selector**, copy active-voice
ID ("Pesan Sekarang — Ambil di Bar"). Touch target ≥48dp dipenuhi via `ElevatedButton`
`minimumSize` dan row menu 72px.

## 3. Evaluasi Track 2 — Ekstraksi View-Only

| Langkah | Hasil |
|---|---|
| `figma-cli files` | OK — kedua file terdeteksi + `wsUrl` per file |
| Fokus tab DANONE via `open -g figma://file/...` | OK di level CDP (`status` → "DANONE - AQUA APP") |
| `extract`, `node tree`, `export screenshot` saat DANONE fokus | **GAGAL** — hang atau data file yang salah |
| `daemon reconnect` | Gagal: "Could not find Figma execution context" |
| Dugaan akar | File view-only tidak menyediakan plugin execution context; daemon menunggu selamanya |
| Mitigasi dicoba | `open -g` fokus, `daemon reconnect`, screenshot scale 1 — semua gagal |
| Fallback | Slice AQUA Delivery dari token proksimat; asumsi dicatat di kode (`app_colors.dart`) |

**Reproduksi setia** membutuhkan salah satu: (a) akses edit/duplikat file DANONE,
(b) Personal Access Token + Figma REST API, atau (c) `connect --safe/--browser`.

## 4. Temuan Teknis Penting

### 4.1. JSX `figma-cli render` hanya mem-parsing double-quote / braces
`parseProps` memakai regex `/(\w+)=(?:"([^"]*)"|{([^}]*)})/g` — props dengan
single-quote (`fill='#FF0000'`) **diabaikan diam-diam** (fills=0, PNG hitam) dan
tidak memicu warning. Aturan: selalu `bg="#..."`, `color="#..."` (Text!),
`size={}`, `weight={}`, `rounded={}`, `flex="row/col"`.
Aliasing: `fontSize→size`, `fontWeight→weight`, `cornerRadius→rounded`,
`background→bg`, `direction→flex`. Text memakai `color`, bukan `fill`.

### 4.2. Perintah yang terbukti andal
`diagnose`, `files`, `status`, `col create`, `tokens add -c`, `render` (benar),
`get`, `delete`, `delete-batch`, `export node -o`, `verify --save`, `export dtcg/css`.

### 4.3. Performa
Render + verify <10 dtk via daemon :3456. `flutter create` ~60 dtk.
`flutter analyze` ~4 dtk. Satu-satunya biaya besar: hang 45–120 dtk pada file
view-only (sebabkan timeout tool — gunakan `open -g`, bukan `open`).

## 5. Kesesuaian Standar

- **`frontend-design`**: presents — palet 6 hex kohesif, pairing display/body,
  1 signature element per track (pill selector / progress ring), copy active-voice.
- **`flutter-expert`**: presents — Dart 3, `const` di semua widget statis,
  token terpusat + `ThemeData` M3, widget modular (`widgets/`, `screens/`),
  `SafeArea` + `SingleChildScrollView` + `LayoutBuilder`, test widget per app.

## 6. Rekomendasi

1. Perbaiki `parseProps` agar menerima single-quote atau memberi warning
   (silent-ignore adalah bug UX serius).
2. Tambahkan timeout + pesan error pada daemon eval untuk file view-only.
3. Dokumentasikan bahwa `extract` mengikuti halaman ter-bound daemon,
   bukan tab aktif CDP (atau selaraskan keduanya).
4. Untuk file view-only produksi: sediakan path REST-API resmi di CLI.
