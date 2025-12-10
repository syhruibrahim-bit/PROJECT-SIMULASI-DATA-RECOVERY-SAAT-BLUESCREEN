@echo off
setlocal enabledelayedexpansion
title Project 6 – Advanced Backup System

:: Menu utama
:menu
cls
echo ================================
echo     PROJECT 6 – ADVANCED BACKUP
echo ================================
echo Pilih mode backup:
echo [1] Selective Backup (pilih folder dan ekstensi)
echo [2] Incremental Backup (hanya file yang berubah)
echo [3] Scheduled Backup (otomatis tiap X menit)
echo [4] Simulasi Email Notification
echo [0] Keluar
echo ================================
set /p pilihan=Masukkan pilihan [0-4]: 

if "%pilihan%"=="1" goto selective
if "%pilihan%"=="2" goto incremental
if "%pilihan%"=="3" goto scheduled
if "%pilihan%"=="4" goto email
if "%pilihan%"=="0" exit
goto menu

:: Mode 1 – Selective Backup
:selective
cls
echo === Selective Backup ===
set /p src=Masukkan path folder sumber (contoh: D:\SimulasiDrive_D\Folder_1): 
set /p ekstensi=Masukkan ekstensi file yang ingin dibackup (contoh: pdf docx): 
set "dst=C:\SimulasiDrive_C\SelectiveBackup_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%"
mkdir "%dst%"
set /a counter=0

for %%E in (%ekstensi%) do (
  for /R "%src%" %%F in (*%%E) do (
    set /a counter+=1
    echo [!counter!] Menyalin: %%~nxF
    xcopy "%%F" "%dst%\" /Y /I
  )
)

echo Total file disalin: !counter! > "%dst%\recovery_log.txt"
echo Backup selesai ke: %dst%
pause
goto menu

:: Mode 2 – Incremental Backup
:incremental
cls
echo === Incremental Backup ===
set "src=D:\SimulasiDrive_D"
set "dst=C:\SimulasiDrive_C\IncrementalBackup"
mkdir "%dst%"

for /R "%src%" %%F in (.) do (
  xcopy "%%F" "%dst%\" /D /Y /I
)

echo Backup incremental selesai ke: %dst%
pause
goto menu

:: Mode 3 – Scheduled Backup
:scheduled
cls
echo === Scheduled Backup ===
set /p interval=Masukkan interval waktu (dalam detik): 
:loop
call 2_recovery_data.bat
echo Menunggu %interval% detik untuk backup berikutnya...
timeout /t %interval%
goto loop

:: Mode 4 – Email Notification (Simulasi)
:email
cls
echo === Simulasi Email Notification ===
set "src=D:\SimulasiDrive_D"
set "dst=C:\SimulasiDrive_C\BackupWithNotif_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%"
mkdir "%dst%"
xcopy "%src%\*" "%dst%\" /E /H /C /I /Y > "%dst%\recovery_log.txt"

echo Kepada: user@example.com > "%dst%\email_notif.txt"
echo Subjek: Backup Selesai >> "%dst%\email_notif.txt"
echo Isi: Backup berhasil ke %dst% pada %DATE% %TIME% >> "%dst%\email_notif.txt"

echo Simulasi email notifikasi selesai. File: email_notif.txt
pause
goto menu