# GST Billing System 🚀

A simple PHP/MySQL GST invoicing system to create, view and manage GST-compliant invoices. Suitable for local testing (XAMPP) and small demos.

---

## Features ✅
- Create invoices with customer and product details
- Automatic GST calculation (default 18%)
- View single invoice and list all invoices
- Minimal, easy-to-understand codebase (PHP + MySQL + CSS)

---

## Prerequisites ⚙️
- PHP 7.4+ (or PHP bundled with XAMPP)
- MySQL / MariaDB (XAMPP recommended)
- Web server (Apache via XAMPP) or PHP built-in server
- Basic command-line or phpMyAdmin access

---

## Quick Start — XAMPP (recommended) 🔧
1. Copy project to XAMPP `htdocs` (e.g., `C:\xampp\htdocs\GST-Billing`).
2. Start **Apache** and **MySQL** in XAMPP Control Panel.
3. Import DB: open **phpMyAdmin** → Import → choose `sql/schema_and_sample.sql` (or run `sql\import.bat`).
4. Confirm DB credentials in `php/db.php` (defaults: host=localhost, user=root, password empty).
5. Open the app: http://localhost/GST-Billing/index.html

Alternative: run PHP built-in server (for quick tests)

```bash
cd path/to/GST-Billing
php -S localhost:8000
# then visit http://localhost:8000/index.html
```

---

## Database 📦
- DB name: `gst_billing` (matches `php/db.php`)
- Schema + sample data: `sql/schema_and_sample.sql`
- Note: raw MySQL server files (`gst_billing/` folder) are not recommended for sharing; use the SQL dump for safe restores.

---

## Project Structure 🗂️
- `index.html` — landing page
- `css/` — styles (`style.css`, `style0.css`, `style2.css`, `style3.css`)
- `imgs/` — images used by CSS/HTML
- `php/` — all PHP pages: `generate_form.php`, `generate_invoice.php`, `view_invoice.php`, `all_invoices.php`, `dashboard.php`, `db.php`
- `sql/` — `schema_and_sample.sql`, `import.bat`
- `.gitignore` — ignores raw DB data (`gst_billing/`)

---

## Configuration 🔐
- Edit `php/db.php` if your DB username/password or host are different.
- Keep credentials out of Git — use `.env` or server config for production.

---

## Troubleshooting 🛠️
- Blank pages or 500 errors: check Apache/PHP logs and `display_errors` for dev.
- Images missing: ensure CSS paths point to `../imgs/` (when CSS is in `css/`).
- Buttons to PHP pages not working when opening `index.html` via `file://` — run via local server (Apache or `php -S`).

---

## Contributing 🤝
- Fixes and small improvements welcome. Create PRs or issues with clear steps to reproduce.

---

## License & Notes 📝
- Add your license (e.g., MIT) as needed.
- Avoid committing raw DB server files; keep logical dumps (`.sql`) instead.

---

## How to run (screenshot / GIF)
Add a short `docs/how-to-run.gif` or `docs/screenshot.png` if you want a visual guide here. (Placeholder: `docs/how-to-run.gif`)
