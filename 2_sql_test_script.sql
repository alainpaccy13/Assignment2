------TO CREATE PLUGGABLE DATABASE 

SQL> CREATE PLUGGABLE DATABASE paccy1
  2  ADMIN USER paccy IDENTIFIED BY 123
  3  FILE_NAME_CONVERT=('D:\ORACLE_21\aaaaaaaaaaaaaaaaaaa\oradata\ORCL\pdbseed\',
  4                     'D:\ORACLE_21\aaaaaaaaaaaaaaaaaaa\oradata\ORCL\oracle21dbcpdb\paccy\');

Pluggable database created.

SQL>
SQL>
SQL> 
SQL>
SQL>
SQL> SELECT pdb_name, status FROM cdb_pdbs;

PDB_NAME
--------------------------------------------------------------------------------
STATUS
----------
ORCLPDB
NORMAL

PDB$SEED
NORMAL

PACCY1
NEW
----TO MOUNT NEW PLUGGABLE
SQL>
SQL> select name, open_mode from v$pdbs;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

ORCLPDB
READ WRITE

PACCY1
MOUNTED


SQL>


SQL> SELECT NAME, CON_ID FROM v$active_services order by 1;

NAME                                                                 CON_ID
---------------------------------------------------------------- ----------
SYS$BACKGROUND                                                            1
SYS$USERS                                                                 1
orcl                                                                      1
orclXDB                                                                   1
orclpdb                                                                   3
paccy1                                                                    4

6 rows selected.

SQL>

SQL> ALTER PLUGGABLE DATABASE PACCY1 OPEN;

Pluggable database altered.

SQL>SQL> SHOW CON_NAME;

CON_NAME
------------------------------
CDB$ROOT
SQL>
SQL> SELECT name, open_mode from v$pdbs;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

ORCLPDB
READ WRITE

PACCY1
READ WRITE


SQL>
SQL> ALTER PLUGGABLE DATABASE PACCY1 OPEN;
ALTER PLUGGABLE DATABASE PACCY1 OPEN
*
ERROR at line 1:
ORA-65019: pluggable database PACCY1 already open


SQL> ALTER PLUGGABLE DATABASE PACCY1 SAVE STATE;

Pluggable database altered.

SQL>
SQL> SELECT instance_name FROM v$instance;

INSTANCE_NAME
----------------
orcl

SQL>ALTER SESSION SET CONTAINER = PACCY1;

Session altered.

SQL> CREATE USER ishimwe IDENTIFIED BY 123;

User created.

SQL> GRANT ALL PRIVILEGES TO ishimwe;

Grant succeeded.

SQL>SQL> col name for a20;
SQL> /

Grant succeeded.

SQL> select name, open_mode from v$containers
  2  /

NAME                 OPEN_MODE
-------------------- ----------
PACCY1               READ WRITE

SQL> SELECT directory_name, directory_path FROM dba_directories;
DIRECTORY_NAME
--------------------------------------------------------------------------------
DIRECTORY_PATH
--------------------------------------------------------------------------------
DATA_PUMP_DIR
D:\ORACLE_21\aaaaaaaaaaaaaaaaaaa\admin\orcl\dpdump/989E1EC4E45C44818AB7B628240E4
277

DBMS_OPTIM_LOGDIR
D:\ORACLE_21/cfgtoollogs

DBMS_OPTIM_ADMINDIR
D:\ORACLE_21/rdbms/admin

--cloning 

SQL> col name for a20;
SQL> select name, open_mode from v$containers
  2  /

NAME                 OPEN_MODE
-------------------- ----------
PACCY1               READ WRITE

SQL>
SQL> show con_name;

CON_NAME
------------------------------
PACCY1
SQL> show pdbs;

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         4 PACCY1                         READ WRITE NO
SQL>



SQL> SELECT CON_ID, TABLESPACE_NAME, FILE_NAME FROM CDB_DATA_FILES WHERE CON_ID = 4;

    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
         4 SYSTEM
D:\ORACLE_21\AAAAAAAAAAAAAAAAAAA\ORADATA\ORCL\ORACLE21DBCPDB\PACCY\SYSTEM01.DBF

         4 SYSAUX
D:\ORACLE_21\AAAAAAAAAAAAAAAAAAA\ORADATA\ORCL\ORACLE21DBCPDB\PACCY\SYSAUX01.DBF

         4 UNDOTBS1
D:\ORACLE_21\AAAAAAAAAAAAAAAAAAA\ORADATA\ORCL\ORACLE21DBCPDB\PACCY\UNDOTBS01.DBF

         COIN_ID TABLESPACE_NAME
---------------- ---------------------------------------------------------------
FILE_NAME
--------------------------------------------------------------------------------
         3 USERS
D:\ORACLE_21\AAAAAAAAAAAAAAAAAAA\ORADATA\ORCL\ORACLE21DBCPDB\PACCY\USERS01.DBF
SQL>
SQL> CREATE PLUGGABLE DATABASE plsql2024
FROM AAAAAAAAAAAAAAAAAAA
FILE_NAME_CONVERT =
('D:\ORACLE_21\AAAAAAAAAAAAAAAAAAA\ORADATA\ORCL\',

'D:\ORACLE_21\AAAAAAAAAAAAAAAAAAA\ORADATA\ORCL\plsql2024\');

Pluggable database created.
SQL>
SQL>
SQL>show pdbs;
 
    CON_ID CON_NAME
---------- ----------------------------------------------------------------------
         2 PDB$SEED
         3 AAAAAAAAAAAAAAAAAAA
         5 PLSQL2024

SQL>
SQL> ALTER PLUGGABLE DATABASE plsql2024 OPEN;

pluggable database altered.

SQL>show con_name;

CON_NAME
------------------------------
CDB$ROOT
SQL>
SQL> ALTER SESSION SET CONTAINER=plsql2024;

session altered.
SQL> CREATE USER adminpdb IDENTIFIED BY 123;

User created.

SQL> GRANT ALL PRIVILEGES TO adminpdb;

Grant succeeded.

SQL>
SQL> SELECT username FROM dba_users WHERE username = 'ADMINPDB';

USERNAME
--------------------------------------------------------------------------------
ADMINPDB

SQL>

