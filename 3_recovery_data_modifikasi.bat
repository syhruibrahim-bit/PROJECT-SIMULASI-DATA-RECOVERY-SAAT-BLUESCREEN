@echo off
setlocal enabledelayedexpansion
title Recovery Data Simulation (Tugas 2 Modifikasi)
echo Menyalin hanya file tertentu (.pdf dan .docx) dari D: ke C: ...

:: Tentukan folder sumber dan tujuan
set "src=D:\SimulasiDrive_D"
set "dst=C:\SimulasiDrive_C\DataRecovery_Tugas2_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%"

mkdir "%dst%"

:: Inisialisasi counter
set /a counter=0

:: Copy hanya file .pdf dan .docx dengan counter
for /R "%src%" %%F in (*.pdf *.docx) do (
    set /a counter+=1
    echo [!counter!] Menyalin: %%~nxF
    xcopy "%%F" "%dst%\" /Y /I
)

:: Tambahkan verifikasi ukuran file (file size)
echo ----------------------------- >> "%dst%\recovery_log.txt"
echo Verifikasi ukuran file: >> "%dst%\recovery_log.txt"
for /R "%dst%" %%F in (*.pdf *.docx) do (
    echo %%~nxF - %%~zF bytes >> "%dst%\recovery_log.txt"
)

:: Tambahkan total file ke log
echo ----------------------------- >> "%dst%\recovery_log.txt"
echo Total file disalin: !counter! >> "%dst%\recovery_log.txt"

:: Compress hasil backup ke .zip (gunakan PowerShell)
powershell -command "Compress-Archive -Path '%dst%\*' -DestinationPath '%dst%.zip' -Force"

echo Backup selesai! File hasil ada di %dst% dan %dst%.zip

:: Notifikasi suara
echo Recovery selesai! ^G

pause