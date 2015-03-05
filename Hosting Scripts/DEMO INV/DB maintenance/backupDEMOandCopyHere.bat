@echo off

REM The script does not accept parameters

echo   Bat file to make a backup of PROD DB
echo     1. Configuration
echo     2. Backup database
echo     3. Gunzip backup file
echo     4. Copy backup to the local computer


echo 1. Configuration...

set putty_path="C:\Program Files (x86)"
set source_srv=ubuntu@toolsdemo.uisko.com

set source_key=C:\Users\sevastia\keys\tmskeys\tmskey.ppk
echo .              ... configured!


echo 2. Backup TMS database...
%putty_path%\PuTTY\plink -ssh -i %source_key% %source_srv% "rm -f inventory_sql_dump"

%putty_path%\PuTTY\plink -ssh -i %source_key% %source_srv% "sudo -u postgres pg_dump -U postgres inventory > inventory_sql_dump"

echo .                     ... DB backup done! File inventory_sql_dump

echo 3. Zip backup...
%putty_path%\PuTTY\plink -ssh -i %source_key% %source_srv% "gzip inventory_sql_dump"
echo .            ... zipped!

echo 4. Copy backup to local computer...
%putty_path%\PuTTY\pscp -i %source_key% %source_srv%:inventory_sql_dump.gz .

copy inventory_sql_dump.gz "Archive\inventory_sql_dump_%date:~-10,2%%date:~-7,2%%date:~-4,4%_%time:~0,2%%time:~3,2%".gz

%putty_path%\PuTTY\plink -ssh -i %source_key% %source_srv% "rm -f inventory_sql_dump.gz"
echo .                               ... copied!


:exit

pause
