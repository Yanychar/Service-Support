REM  
REM Conversion from "Account<-->User OneToOne" into "Account<-->User OneToMany"
REM 

set db_path="c:\Program Files\PostgreSQL\9.1\bin"

%db_path%\psql -U postgres -h localhost -d inventory -c "ALTER TABLE organisation ADD COLUMN service_owner boolean;"

:exit

pause
