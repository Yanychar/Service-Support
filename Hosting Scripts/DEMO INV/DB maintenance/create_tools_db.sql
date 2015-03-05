
CREATE USER inventory with password 'inventory';
CREATE DATABASE inventory WITH OWNER = inventory;
GRANT CONNECT, TEMPORARY ON DATABASE inventory TO public;
GRANT ALL PRIVILEGES ON DATABASE inventory TO inventory;



