@echo off
title Recovery Data Simulation (Original)
echo Menyalin data dari D: ke C: ...

:: Tentukan folder sumber dan tujuan
set "src=D:\SimulasiDrive_D"
set "dst=C:\SimulasiDrive_C\DataRecovery_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%"

:: Buat folder tujuan
mkdir "%dst%"

:: Copy semua isi folder sumber ke folder backup di C:
xcopy "%src%\*" "%dst%\" /E /H /C /I /Y > "%dst%\recovery_log.txt"

echo Proses recovery selesai!
echo Log file ada di: %dst%\recovery_log.txt
pause