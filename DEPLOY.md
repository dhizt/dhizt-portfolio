# Deploy Portfolio ke GitHub Pages

## Langkah 1: Buat Repository di GitHub

1. Buka https://github.com/new
2. Isi:
   - **Repository name:** `dhizt-portfolio` (atau nama lain sesuai keinginan)
   - **Description:** `Professional Web3 Community Manager Portfolio`
   - **Visibility:** Public (GitHub Pages gratis butuh public repo)
3. Klik **Create repository**

## Langkah 2: Upload Files

### Option A: Upload via GitHub Web (Mudah)

1. Buka repository yang baru dibuat
2. Klik **Add file** → **Upload files**
3. Upload kedua file:
   - `index.html`
   - `404.html`
4. Klik **Commit changes**

### Option B: Upload via Git (Recommended)

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/dhizt-portfolio.git
cd dhizt-portfolio

# Copy files
cp /root/dhizt-portfolio/index.html .
cp /root/dhizt-portfolio/404.html .

# Commit dan push
git add .
git commit -m "Initial portfolio commit"
git push origin main
```

## Langkah 3: Aktifkan GitHub Pages

1. Buka repository di GitHub
2. Klik **Settings** (tab di atas)
3. Scroll ke bawah, klik **Pages** (di sidebar kiri)
4. Di bagian **Source**:
   - **Source:** Deploy from a branch
   - **Branch:** `main` (atau `master`)
   - **Folder:** `/ (root)`
5. Klik **Save**

## Langkah 4: Tunggu Deploy

1. Klik tab **Actions** di repository
2. Tunggu workflow selesai (biasanya 1-2 menit)
3. Setelah selesai, klik link yang muncul:
   ```
   https://YOUR_USERNAME.github.io/dhizt-portfolio/
   ```

## Langkah 5: Custom Domain (Optional)

Kalau lo punya domain sendiri:

1. Di **Settings** → **Pages** → **Custom domain**
2. Masukkan domain lo (contoh: `dhizt.com`)
3. Klik **Save**
4. Setup DNS di provider domain lo:
   ```
   Type: CNAME
   Name: www
   Value: YOUR_USERNAME.github.io
   ```
5. Tunggu DNS propagate (biasanya 24-48 jam)
6. Centang **Enforce HTTPS**

## Troubleshooting

### 404 Error
- Pastikan file `index.html` ada di root repository
- Pastikan GitHub Pages sudah diaktifkan
- Tunggu beberapa menit setelah deploy

### CSS/JS Tidak Muncul
- Cek path file di HTML
- Pastikan tidak ada typo di nama file

### Deploy Gagal
- Cek tab **Actions** untuk error message
- Pastikan repository public (untuk GitHub Pages gratis)

## File Structure

```
dhizt-portfolio/
├── index.html    # Halaman utama
└── 404.html      # Halaman error custom
```

## Update Portfolio

Untuk update portfolio:

1. Edit file `index.html`
2. Commit dan push ke GitHub
3. GitHub Pages otomatis rebuild (1-2 menit)

---

Portfolio lo akan tersedia di:
`https://YOUR_USERNAME.github.io/dhizt-portfolio/`
