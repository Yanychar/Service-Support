@echo off

REM The script does not accept parameters

echo   Bat file to make a backup of PROD DB
echo     1. Configuration
echo     2. Backup database


echo 1. Configuration...

set postgresql_path="C:\Program Files\PostgreSQL\9.4\bin"

echo .              ... configured!


echo 2. Backup TMS database...

%postgresql_path%\pg_dump -U postgres inventory > inventory_sql_dump"

echo .                     ... DB backup done! File inventory_sql_dump
goto exit




:exit

pause
