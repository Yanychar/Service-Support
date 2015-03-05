REM  
REM Conversion from "Account<-->User OneToOne" into "Account<-->User OneToMany"
REM 

set db_path="c:\Program Files\PostgreSQL\9.1\bin"

%db_path%\psql -U postgres -h localhost -d inventory -c "ALTER TABLE orguser ADD COLUMN account_id bigint;"
%db_path%\psql -U postgres -h localhost -d inventory -c "ALTER TABLE orguser ADD CONSTRAINT fk_orguser_account_id FOREIGN KEY (account_id) REFERENCES account (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;"

%db_path%\psql -U postgres -h localhost -d inventory -c "UPDATE orguser u SET account_id = a.id FROM account a Where a.user_id=u.id;"

%db_path%\psql -U postgres -h localhost -d inventory -c "ALTER TABLE account DROP CONSTRAINT fk_account_user_id;"
%db_path%\psql -U postgres -h localhost -d inventory -c "ALTER TABLE account DROP COLUMN user_id;"

:exit

pause
