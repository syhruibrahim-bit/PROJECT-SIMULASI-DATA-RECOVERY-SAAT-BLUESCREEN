@echo off 
echo simulasi membuat struktur folder... 
echo cd /d C:\Users\Rafli Massi\Desktop 
cd /d C:\Users\Rafli MassiDesktop 
mkdir simulasidriveD 
cd simulasidriveD 
for %%i in (1 2 3 4 5 6 7 8 9 10) do ( 
	mkdir folder_%%i
	cd folder_%%i
	mkdir SubfolderA SubfolderB SubfolderC
	cd SubfolderA
	echo file contoh txt > txt%%i.txt
	echo configuration > configuration%%i.ini
	echo Judul Dokumen > Dokumen%%i.docx
	echo > Database%%i.db
	echo pedeef > pdf%%i.pdf
	echo > Python%%i.py
	cd ..
	cd SubfolderB
	echo file contoh txt > txt%%i.txt
	echo configuration > configuration%%i.ini
	echo Judul Dokumen > Dokumen%%i.docx
	echo > Database%%i.db
	echo pedeef > pdf%%i.pdf
	echo > Python%%i.py
	cd ..
	cd SubfolderC
	echo file contoh txt > txt%%i.txt
	echo configuration > configuration%%i.ini
	echo Judul Dokumen > Dokumen%%i.docx
	echo > Database%%i.db
	echo pedeef > pdf%%i.pdf
	echo > Python%%i.py
	cd ..
	cd ..
)

echo simulasi selesai dibuat.
pause
