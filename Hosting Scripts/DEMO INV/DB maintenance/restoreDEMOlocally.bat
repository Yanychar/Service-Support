REM @echo off

REM The script does not accept parameters

echo   Bat file to restore DB locally in this computer
echo
echo     It supposed that inventory_sql_dump is stored next to this script


echo 1. Configuration...

REM set db_path="c:\Program Files\PostgreSQL\9.4\bin"
set db_path="c:\Program Files\PostgreSQL\9.4\bin"

echo 2. Drop and re-create tables ...

%db_path%\psql -U postgres -h localhost -d inventory -c "DROP SCHEMA public CASCADE;"

%db_path%\psql -U postgres -h localhost -d inventory -c "CREATE SCHEMA public AUTHORIZATION postgres;"
%db_path%\psql -U postgres -h localhost -d inventory -c "GRANT ALL ON SCHEMA public TO postgres;"
%db_path%\psql -U postgres -h localhost -d inventory -c "GRANT ALL ON SCHEMA public TO public;"
%db_path%\psql -U postgres -h localhost -d inventory -c "COMMENT ON SCHEMA public IS 'standard public schema';"

echo 3. Restore database ...

%db_path%\psql -U postgres -h localhost -d inventory < inventory_sql_dump


:exit

pause
