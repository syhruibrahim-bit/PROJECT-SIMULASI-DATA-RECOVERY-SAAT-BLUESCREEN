Nama : Syahru Ramadhan Ibrahim
---------------------------------------------


= 1. DESKRIPSI PROJECT
============================================================

Project ini mensimulasikan kondisi darurat:
- Windows tidak bisa boot normal
- Safe Mode gagal
- GUI tidak bisa dibuka
- Hanya CMD di Recovery Environment yang dapat diakses

Tujuan:
- Menguasai navigasi file melalui CMD
- Melakukan backup data penting secara manual
- Membuat batch script otomatis untuk recovery
- Memahami perintah xcopy / robocopy dan logging


= 2. TUJUAN PEMBELAJARAN
============================================================

1. Command Line Interface (CLI)
   - Navigasi (dir, cd, tree)
   - Identifikasi drive di Recovery Mode

2. Manajemen File
   - copy, xcopy, move, mkdir, rmdir

3. Problem Solving
   - Analisis kondisi darurat
   - Pengambilan keputusan cepat

4. Batch Scripting
   - Automasi backup
   - Error handling
   - Logging proses recovery


= 3. STRUKTUR SIMULASI FOLDER
============================================================

Desktop/
│
├── SimulasiDrive_D/          (Sumber data)
│   ├── Folder_1/
│   │   ├── SubFolder_A/ (5 file)
│   │   ├── SubFolder_B/ (5 file)
│   │   ├── SubFolder_C/ (6 file)
│   │   ├── database_1.db
│   │   └── config_1.ini
│   ├── Folder_2/
│   └── ... hingga Folder_10/
│
└── SimulasiDrive_C/          (Lokasi backup)
    └── DataRecovery_YYYYMMDD_HHMM/
        └── (hasil recovery)

Total: ±10 folder, 30 subfolder, ±180 file.


= 4. CARA MENJALANKAN PROJECT
============================================================

Terdapat 3 metode mengeksekusi project:


OPSI A — Tulis Script Sendiri
--------------------
1. Buka Notepad
2. Tulis perintah:
       mkdir
       echo > file.txt
       xcopy source dest /E /H /C /I /Y
3. Save as: recovery.bat
4. Jalankan dan debug


OPSI B — Menggunakan 2 File Terpisah
--------------------
1. File 1 : 1_setup_simulasi.bat
   - Membuat seluruh struktur SimulasiDrive_D
2. File 2 : 2_recovery_data.bat
   - Menyalin data dari D -> C
3. Jalankan berurutan:
       1_setup_simulasi.bat
       2_recovery_data.bat


OPSI C — Versi All-in-One
--------------------
1. Buat file: simulator.bat
2. Masukkan menu:
       1 = setup
       2 = recovery
3. Jalankan:
       simulator.bat


= 5. PERINTAH CMD PENTING
============================================================

Navigasi:
    dir
    cd Folder
    cd ..
    cd \
    D:
    C:

Manajemen file:
    copy source dest
    xcopy source dest /E /H /C /I /Y
    del file
    mkdir folder
    rmdir folder

Informasi sistem:
    diskpart
    list volume
    exit
    echo %date% %time%


= 6. PROSES RECOVERY MANUAL (CMD RECOVERY MODE)
============================================================

1. Boot ke Recovery Environment:
   - Restart PC 3x paksa
   - Pilih: Advanced Options → Command Prompt

2. Identifikasi drive:
       diskpart
       list volume
       exit

3. Periksa isi drive:
       D:
       dir /s
       tree

4. Jalankan recovery:
       xcopy D:\FolderPenting C:\Backup\ /E /H /C /I /Y

5. Verifikasi hasil:
       dir C:\Backup /s


= 7. LOGGING & PARAMETER XCOPY
============================================================

Parameter penting:
    /E  = copy semua folder & subfolder
    /H  = sertakan file hidden & system
    /C  = lanjut walau ada error
    /I  = asumsi destination adalah folder
    /Y  = overwrite tanpa tanya

Contoh logging:
    xcopy D:\Data C:\Backup\ /E /H /C /I /Y > recovery_log.txt


= 8. TUGAS MAHASISWA
============================================================

Tugas 1 — Basic Recovery (Wajib)
- Jalankan setup + recovery
- Simpan screenshot
- Sertakan recovery_log.txt

Tugas 2 — Modifikasi Script (Intermediate)
- Backup hanya file .pdf/.docx
- Tambah progress bar / counter
- Cek file size / checksum
- Kompres ke .zip

Tugas 3 — Advanced
- Selective backup
- Incremental backup
- Scheduled backup
- Email notification

Tugas 4 — Laporan Analisis
- Penyebab bluescreen
- Mengapa CMD masih bisa diakses
- Strategi backup 3-2-1
- Evaluasi hasil


= 9. BEST PRACTICE: 3-2-1 BACKUP RULE
============================================================

3 salinan data
2 media berbeda (HDD + cloud)
1 offsite backup


= 10. TROUBLESHOOTING
============================================================

Error: Access Denied
    → Jalankan CMD sebagai admin
    → Gunakan: xcopy /G

Error: Insufficient Disk Space
    → Cek dengan: dir C:\

Error: File in Use
    → Gunakan robocopy:
          robocopy D:\Data C:\Backup /E /Z /MT:8

= Selesai
============================================================
