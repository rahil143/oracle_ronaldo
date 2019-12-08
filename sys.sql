-- Creatinf Permenet Tablespace

CREATE TABLESPACE tbs_perm_01
  DATAFILE 'tbs_perm_01.dat' 
    SIZE 20M
  ONLINE;
  
--Creating User for the table space

CREATE USER ronaldo
  IDENTIFIED BY ronaldo
  DEFAULT TABLESPACE tbs_perm_01
  QUOTA 20M on tbs_perm_01;
  
--Granting Permissions

GRANT create session TO Ronaldo;
GRANT create table TO Ronaldo;
GRANT create view TO Ronaldo;
GRANT create any trigger TO Ronaldo;
GRANT create any procedure TO Ronaldo;
GRANT create sequence TO Ronaldo;
GRANT create synonym TO Ronaldo;

  
  

  