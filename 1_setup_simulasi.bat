@echo off
title Setup SimulasiDrive_D
echo Membuat struktur folder dan file dummy di D:\SimulasiDrive_D ...

set "base=D:\SimulasiDrive_D"

:: Buat 10 folder utama dengan 3 subfolder masing-masing
for /l %%i in (1,1,10) do (
  mkdir "%base%\Folder_%%i\SubFolder_A"
  mkdir "%base%\Folder_%%i\SubFolder_B"
  mkdir "%base%\Folder_%%i\SubFolder_C"

  :: SubFolder_A (6 file)
  echo Catatan %%i > "%base%\Folder_%%i\SubFolder_A\catatan_%%i.txt"
  echo Data %%i > "%base%\Folder_%%i\SubFolder_A\data_%%i.csv"
  echo Dokumen %%i > "%base%\Folder_%%i\SubFolder_A\dokumen_%%i.docx"
  echo PDF %%i > "%base%\Folder_%%i\SubFolder_A\dokumen_%%i.pdf"
  echo Script %%i > "%base%\Folder_%%i\SubFolder_A\script_%%i.bat"
  echo Config %%i > "%base%\Folder_%%i\SubFolder_A\config_%%i.ini"

  :: SubFolder_B (6 file)
  echo Python %%i > "%base%\Folder_%%i\SubFolder_B\script_%%i.py"
  echo Setting %%i > "%base%\Folder_%%i\SubFolder_B\setting_%%i.ini"
  echo Tool %%i > "%base%\Folder_%%i\SubFolder_B\tool_%%i.bat"
  echo Log %%i > "%base%\Folder_%%i\SubFolder_B\log_%%i.txt"
  echo Data %%i > "%base%\Folder_%%i\SubFolder_B\data_%%i.csv"
  echo Report %%i > "%base%\Folder_%%i\SubFolder_B\report_%%i.docx"

  :: SubFolder_C (6 file)
  echo Catatan %%i > "%base%\Folder_%%i\SubFolder_C\catatan_%%i.txt"
  echo Data %%i > "%base%\Folder_%%i\SubFolder_C\data_%%i.csv"
  echo Dokumen %%i > "%base%\Folder_%%i\SubFolder_C\dokumen_%%i.docx"
  echo PDF %%i > "%base%\Folder_%%i\SubFolder_C\dokumen_%%i.pdf"
  echo Script %%i > "%base%\Folder_%%i\SubFolder_C\script_%%i.bat"
  echo Config %%i > "%base%\Folder_%%i\SubFolder_C\config_%%i.ini"
)

echo Struktur folder dan file dummy selesai dibuat!
pause