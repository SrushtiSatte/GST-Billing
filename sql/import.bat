@echo off
REM Import schema_and_sample.sql into MySQL (XAMPP defaults)
REM Edit USER and PASS if your MySQL credentials differ
set USER=root
set PASS=
set DB=gst_billing

REM If mysql is not in PATH, set MYSQL_BIN to your XAMPP mysql bin path, e.g.:
REM set MYSQL_BIN=C:\\xampp\\mysql\\bin

if defined MYSQL_BIN (
  "%MYSQL_BIN%\\mysql.exe" -u %USER% %PASS% -e "source schema_and_sample.sql" %DB%
) else (
  mysql -u %USER% %PASS% -e "source schema_and_sample.sql" %DB%
)

if %errorlevel% equ 0 (
  echo Import completed successfully.
) else (
  echo Import failed. Ensure MySQL is running and credentials are correct.
)
pause
