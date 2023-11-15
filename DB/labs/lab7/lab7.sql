--large pool, null pool,java pool
--lab7
    --#1
        select username from dba_users order by created DESC;
        GRANT CREATE ANY SEQUENCE TO C##SVA;
        GRANT SELECT ANY SEQUENCE TO C##SVA;
        GRANT CREATE ANY TABLE TO C##SVA;
        GRANT CREATE CLUSTER TO C##SVA;
        GRANT CREATE SYNONYM TO C##SVA;
        GRANT CREATE PUBLIC SYNONYM TO C##SVA;
        GRANT DROP ANY SYNONYM TO C##SVA;
        GRANT CREATE VIEW TO C##SVA;
        GRANT CREATE MATERIALIZED VIEW TO C##SVA;
        GRANT QUERY REWRITE TO C##SVA;
        ALTER USER C##SVA QUOTA 100M ON USERS;
        SELECT * FROM USER_SYS_PRIVS; 
    --#2
        CREATE SEQUENCE S1
            INCREMENT BY 10
            START WITH 1000
            NOMAXVALUE
            NOMINVALUE
            NOCYCLE
            NOCACHE
            NOORDER;
        SELECT S1.NEXTVAL FROM DUAL;
        SELECT S1.NEXTVAL FROM DUAL;
        SELECT S1.CURRVAL FROM DUAL;
    --#3,4
        CREATE SEQUENCE S2
            START WITH 10
            INCREMENT BY 10
            MAXVALUE 100
            NOCYCLE;
        SELECT S2.NEXTVAL FROM DUAL;
    --#5
        CREATE SEQUENCE S3
            MAXVALUE 10
            START WITH 10
            INCREMENT BY -10
            MINVALUE -100
            NOCYCLE
            ORDER;
        SELECT S3.NEXTVAL FROM DUAL;
    --#6
        CREATE SEQUENCE S4
            START WITH 1
            INCREMENT BY 1
            MINVALUE 1
            MAXVALUE 10
            CYCLE
            CACHE 5
            NOORDER;
        SELECT S4.NEXTVAL FROM DUAL;
    --#7
        SELECT * FROM SYS.USER_SEQUENCES;
    --#8
        CREATE TABLE T1(
        N1 NUMBER(20),
        N2 NUMBER(20),
        N3 NUMBER(20),
        N4 NUMBER(20)
        )STORAGE (buffer_pool keep)
        TABLESPACE USERS;
        DROP TABLE T1 PURGE;
        
        DROP SEQUENCE S1;
        DROP SEQUENCE S2;
        DROP SEQUENCE S3;
        DROP SEQUENCE S4;

        INSERT INTO T1 VALUES(S1.NEXTVAL,S2.NEXTVAL,S3.NEXTVAL,S4.NEXTVAL);
        
    --#9
        CREATE CLUSTER ABC(
            X NUMBER (10),
            V VARCHAR2(12)
        )
        HASHKEYS 200;
        
    --#10
        CREATE TABLE A(
            X NUMBER(10),
            V VARCHAR2(12),
            INFORMATION VARCHAR(20)
        )CLUSTER ABC(X,V);
    --#11
        CREATE TABLE C##SVA.B(
            X NUMBER(10),
            V VARCHAR2(12),
            INFORMATION VARCHAR(20)
        )CLUSTER ABC(X,V);
        DROP TABLE B PURGE;
    --#12
        CREATE TABLE C##SVA.C(
            X NUMBER(10),
            V VARCHAR2(12),
            INFORMATION VARCHAR(20)
        )CLUSTER ABC(X,V);
        INSERT INTO C##SVA.C VALUES(1,'CC','IMPORTANT INFO');
    --#13
        SELECT * FROM DBA_CLUSTERS WHERE OWNER = 'C##SVA';
        SELECT table_name FROM user_tables;
    --#14
        CREATE SYNONYM T1 FOR C##SVA.C;
        SELECT * FROM T1;
        DROP SYNONYM T1;
    --#15
        CREATE PUBLIC SYNONYM T2 FOR C##SVA.B;
        SELECT * FROM T2;
    --#16
        CREATE TABLE A1(
        A1_ID INT PRIMARY KEY,
        INORM NVARCHAR2(20)
        );
        
        CREATE TABLE B1(
        B1_ID INT PRIMARY KEY,
        A1_IDS INT,
        CONSTRAINT A1_ID_CONSTRAINT FOREIGN KEY (A1_IDS) REFERENCES A1(A1_ID)
        );
        INSERT INTO B1 VALUES(0,0);
        DROP TABLE B1 PURGE;
        DROP TABLE A1 PURGE;
        CREATE VIEW A1_B1_VIEW AS 
            SELECT * FROM A1 
                INNER JOIN B1 
                    ON A1.A1_ID = B1.A1_IDS;
                    
        DROP VIEW A1_B1_VIEW;
        INSERT INTO a1 VALUES(0,'INFORMATION');
        COMMIT;
        SELECT *FROM A1_B1_VIEW;
        
    --#17
        CREATE MATERIALIZED VIEW MV 
            BUILD IMMEDIATE
            REFRESH COMPLETE ON DEMAND
            NEXT SYSDATE + NUMTODSINTERVAL(2,'MINUTE')
            AS SELECT * FROM A1 
                INNER JOIN B1 
                    ON A1.A1_ID = B1.A1_IDS;
                    
        EXECUTE DBMS_MVIEW.REFRESH('MV');
        
        SELECT * FROM MV;
        
        COMMIT;
    
    
    