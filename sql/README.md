# SQL import instructions for GST-Billing ✅

This folder contains a SQL schema and sample data to initialize the `gst_billing` database used by the project.

Files:
- `schema_and_sample.sql` — Creates `gst_billing` DB, tables, and inserts sample data.
- `import.bat` — Windows helper to import the SQL using `mysql` CLI.

How to import (XAMPP / phpMyAdmin):
1. Open phpMyAdmin (usually http://localhost/phpmyadmin).
2. Click "Import" and upload `schema_and_sample.sql`, or open the SQL tab and paste the file contents.
3. Run the import. The database `gst_billing` will be created and populated.

How to import (Windows CLI with XAMPP):
1. Ensure `mysql` is in your PATH or use the full path to `mysql.exe` (e.g., `C:\xampp\mysql\bin\mysql.exe`).
2. Edit `import.bat` if your MySQL username or password differ from XAMPP defaults.
3. Run `import.bat` from this folder (right-click → "Run as administrator" if necessary).

Notes:
- `php/db.php` expects DB `gst_billing` and default XAMPP credentials (host=localhost, user=root, password=""). Update `php/db.php` if you use different credentials.
- The repository contains a `gst_billing/` folder with raw MySQL files (`*.frm`, `*.ibd`). Those are server data files and are not safe to copy into MySQL unless you know the server version and have stopped MySQL. It's recommended to use this SQL dump instead.
- To avoid accidentally committing raw DB files, `.gitignore` has been updated to ignore the `gst_billing/` folder.
