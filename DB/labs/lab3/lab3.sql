--LAB3
    --#1
        SELECT PDB_ID, PDB_NAME, STATUS FROM DBA_PDBS ORDER BY PDB_ID;
        
        SELECT NAME, OPEN_MODE, RESTRICTED, OPEN_TIME FROM V$PDBS;
        
    --#3
        SELECT comp_name, version, status FROM dba_registry
    --#1
        select * from v$pdbs;
    --#2
        select * from v$instance;
    --#3
        select * from product_component_version;
    --#5
        select * from v$pdbs;
    --#6
        CREATE TABLESPACE U1_SVA_PDB_TS
            DATAFILE 'U1_SVA_PDB.dbf'
            SIZE 7M
            AUTOEXTEND ON NEXT 5M
            MAXSIZE 20M
            EXTENT MANAGEMENT LOCAL;
        CREATE TEMPORARY TABLESPACE U1_SVA_PDB_TS_TEMP
            TEMPFILE 'U1_SVA_PDB_TEMP.dbf'
            SIZE 5M
            AUTOEXTEND ON NEXT 4M
            MAXSIZE 35M
            EXTENT MANAGEMENT LOCAL
            
        CREATE ROLE U1_SVA_PDB_ROLE
        GRANT CREATE SESSION,
              CREATE ANY TABLE,
              CREATE ANY VIEW,
              CREATE PROCEDURE,
              DROP ANY TABLE,
              DROP ANY VIEW,
              DROP ANY PROCEDURE TO U1_SVA_PDB_ROLE
        
        SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE ='U1_SVA_PDB_ROLE';
        SELECT * FROM dba_roles WHERE ROLE LIKE 'U1_SVA%';    
        
        CREATE PROFILE U1_SVA_PDB_PROFILE LIMIT
            PASSWORD_LIFE_TIME 180
            SESSIONS_PER_USER 3
            FAILED_LOGIN_ATTEMPTS 7
            PASSWORD_LOCK_TIME 1
            PASSWORD_REUSE_TIME 10
            PASSWORD_GRACE_TIME DEFAULT
            CONNECT_TIME 180
            IDLE_TIME 30
            
        SELECT *FROM DBA_PROFILES WHERE PROFILE = 'U1_SVA_PDB_PROFILE'
    
        CREATE USER U1_SVA_PDB IDENTIFIED BY 1
            DEFAULT TABLESPACE U1_SVA_PDB_TS QUOTA UNLIMITED ON U1_SVA_PDB_TS
            TEMPORARY TABLESPACE U1_SVA_PDB_TS_TEMP
            PROFILE U1_SVA_PDB_PROFILE
            ACCOUNT UNLOCK
            
        GRANT CREATE SESSION TO U1_SVA_PDB
        GRANT RESOURCE to U1_SVA_PDB;

    --#7
        CREATE TABLE SVA_TABLE(
            NUMBER_OF_AUDIT INT,
            TEACHER VARCHAR(50)
        )
        INSERT INTO SVA_TABLE VALUES(301,'SMELOV');
        INSERT INTO SVA_TABLE VALUES(209,'BLINOVA');
        
        SELECT COUNT(*) FROM SVA_TABLE;
    --#8
        SELECT TABLESPACE_NAME,STATUS, CONTENTS LOGGING FROM SYS.DBA_TABLESPACES;
        
        SELECT FILE_NAME,TABLESPACE_NAME FROM SYS.DBA_DATA_FILES
        UNION
        SELECT FILE_NAME,TABLESPACE_NAME FROM SYS.DBA_TEMP_FILES
           
        
        SELECT * FROM DBA_ROLES
        SELECT * FROM DBA_SYS_PRIVS;
        SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE ='U1_SVA_PDB_ROLE';

    
        SELECT *FROM DBA_PROFILES WHERE PROFILE LIKE '%U1_SVA_PDB%'
        
        SELECT * FROM DBA_USERS
            ORDER BY created DESC;
            
    --#9
        SELECT * FROM CDB_PDBS
        select instance_name, con_id, version from v$instance;
        SELECT * FROM ALL_TABLES WHERE OWNER LIKE '%C##SVACLIENT%';
    --#11
        SELECT username FROM v$session where username is not Null
        SELECT * FROM v$session where username is not Null

        SELECT * FROM v$session WHERE SERVICE_NAME LIKE '%CDB%'
        SELECT * FROM v$session WHERE username IN ('U1_SVA_PDB', 'C##SVA', 'C##SVACLIENT');
        
        
        