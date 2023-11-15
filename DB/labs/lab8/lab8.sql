--lab8
    --Preparing
        CREATE TABLE FACULTY
          (
           FACULTY      VARCHAR(30)      NOT NULL,
           FACULTY_NAME VARCHAR2(80), 
           CONSTRAINT PK_FACULTY PRIMARY KEY(FACULTY) 
          );
          
        
        CREATE TABLE PULPIT 
        (
         PULPIT       VARCHAR(30)      NOT NULL,
         PULPIT_NAME  VARCHAR2(100), 
         FACULTY      VARCHAR(40)      NOT NULL, 
         CONSTRAINT FK_PULPIT_FACULTY FOREIGN KEY(FACULTY)   REFERENCES FACULTY(FACULTY), 
         CONSTRAINT PK_PULPIT PRIMARY KEY(PULPIT) 
         ); 
         
         
         CREATE TABLE TEACHER
         ( 
          TEACHER       VARCHAR(40) NOT  NULL,
          TEACHER_NAME  VARCHAR2(70), 
          PULPIT        VARCHAR(40) NOT NULL, 
          BIRTHDAY      DATE,
          SALARY        NUMBER(5),
          CONSTRAINT PK_TEACHER  PRIMARY KEY(TEACHER), 
          CONSTRAINT FK_TEACHER_PULPIT FOREIGN   KEY(PULPIT)   REFERENCES PULPIT(PULPIT)
         ) ;
         CREATE TABLE SUBJECT
            (
             SUBJECT      VARCHAR(40)     NOT NULL, 
             SUBJECT_NAME VARCHAR2(70)  NOT NULL,
             PULPIT       VARCHAR(40)     NOT NULL,  
             CONSTRAINT PK_SUBJECT PRIMARY KEY(SUBJECT),
             CONSTRAINT FK_SUBJECT_PULPIT FOREIGN  KEY(PULPIT)  REFERENCES PULPIT(PULPIT)
            );
        create table AUDITORIUM_TYPE 
        (
          AUDITORIUM_TYPE   varchar(30) constraint AUDITORIUM_TYPE_PK  primary key,  
          AUDITORIUM_TYPENAME  varchar2(50) constraint AUDITORIUM_TYPENAME_NOT_NULL not null         
        );
         
         
        create table AUDITORIUM 
        (
         AUDITORIUM           varchar(40) primary key,  
         AUDITORIUM_NAME      varchar2(200),      
         AUDITORIUM_CAPACITY  number(4),          
         AUDITORIUM_TYPE      varchar(40) not null     
                              references AUDITORIUM_TYPE(AUDITORIUM_TYPE)  
        );
        
         -- Вставка данных в таблицу FACULTY
        INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
        VALUES ('FAC001', 'Faculty of Science');
        
        INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
        VALUES ('FAC002', 'Faculty of Arts');
        
        -- Вставка данных в таблицу PULPIT
        INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
        VALUES ('PUL001', 'Pulpit of Physics', 'FAC001');
        
        INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
        VALUES ('PUL002', 'Pulpit of History', 'FAC002');
        
        -- Вставка данных в таблицу TEACHER
        INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT, BIRTHDAY, SALARY)
        VALUES ('TCH001', 'John Smith', 'PUL001', TO_DATE('1980-01-15', 'yyyy-mm-dd'), 5000);
        
        INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT, BIRTHDAY, SALARY)
        VALUES ('TCH002', 'Alice Johnson', 'PUL002', TO_DATE('1985-03-20', 'yyyy-mm-dd'), 5500);
        
        -- Вставка данных в таблицу SUBJECT
        INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
        VALUES ('SUB001', 'Physics 101', 'PUL001');
        
        INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
        VALUES ('SUB002', 'History 101', 'PUL002');
        
        -- Вставка данных в таблицу AUDITORIUM_TYPE
        INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
        VALUES ('Type1', 'Lecture Hall');
        
        INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
        VALUES ('Type2', 'Classroom');
        
        -- Вставка данных в таблицу AUDITORIUM
        INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
        VALUES ('AUD001', 'Lecture Hall 101', 100, 'Type1');
        
        INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
        VALUES ('AUD002', 'Classroom A', 30, 'Type2');
        
        -- Вставка данных в таблицу FACULTY
        INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
        VALUES ('FAC003', 'Faculty of Engineering');
        
        -- Вставка данных в таблицу PULPIT
        INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
        VALUES ('PUL003', 'Pulpit of Computer Science', 'FAC003');
        
        -- Вставка данных в таблицу TEACHER
        INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT, BIRTHDAY, SALARY)
        VALUES ('TCH003', 'Mary Brown', 'PUL003', TO_DATE('1987-07-10', 'yyyy-mm-dd'), 6000);
        
        -- Вставка данных в таблицу SUBJECT
        INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
        VALUES ('SUB003', 'Introduction to Programming', 'PUL003');
        
        -- Вставка данных в таблицу AUDITORIUM_TYPE
        INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
        VALUES ('Type3', 'Laboratory');
        
        -- Вставка данных в таблицу AUDITORIUM
        INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
        VALUES ('AUD003', 'Laboratory 101', 40, 'Type3');
        
        -- Вставка данных в таблицу FACULTY
        INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
        VALUES ('FAC004', 'Faculty of Business Administration');
        
        -- Вставка данных в таблицу PULPIT
        INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
        VALUES ('PUL004', 'Pulpit of Finance', 'FAC004');
        
        -- Вставка данных в таблицу TEACHER
        INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT, BIRTHDAY, SALARY)
        VALUES ('TCH004', 'David Johnson', 'PUL004', TO_DATE('1983-05-25', 'yyyy-mm-dd'), 6200);
        
        -- Вставка данных в таблицу SUBJECT
        INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
        VALUES ('SUB004', 'Financial Management', 'PUL004');
        
        -- Вставка данных в таблицу AUDITORIUM_TYPE
        INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
        VALUES ('Type4', 'Conference Room');
        
        -- Вставка данных в таблицу AUDITORIUM
        INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
        VALUES ('AUD004', 'Conference Room 201', 80, 'Type4');
        
    --#1
        BEGIN 
            NULL;
        END;
    --#2
        BEGIN
            dbms_output.put_line('Hello, world');
        END;
        /
    --#3
        DECLARE 
            X NUMBER(3):= 3;
            Y NUMBER(3):=0;
            Z NUMBER(10,2);
        BEGIN
            dbms_output.put_line('X = '||X||', Y = '||Y);
            Z:=X/Y;
            dbms_output.put_line('Z = '||Z);
            EXCEPTION
                WHEN OTHERS
                    THEN dbms_output.put_line('ERROR = '||SQLERRM||', SQLCODE = '||SQLCODE);
        END;
        /
    --#4
        DECLARE 
            X NUMBER(3):= 3;
            Y NUMBER(3):=0;
            Z NUMBER(10,2);
            BEGIN
                dbms_output.put_line('X = '||X||', Y = '||Y);
                BEGIN
                Z:=X/Y;
                dbms_output.put_line('Z = '||Z);
                EXCEPTION
                    WHEN OTHERS
                        THEN dbms_output.put_line('ERROR = '||SQLERRM||', SQLCODE = '||SQLCODE);
            END;
            dbms_output.put_line('Z = '||Z);
        END;
        /
    --#5
        SELECT NAME, VALUE FROM V$PARAMETER WHERE NAME = 'plsql_warnings';
    --#6
        SELECT KEYWORD FROM V_$RESERVED_WORDS WHERE LENGTH = 1 AND KEYWORD !='A';
    --#7
        SELECT KEYWORD FROM V_$RESERVED_WORDS WHERE LENGTH > 1 AND KEYWORD !='A' ORDER BY KEYWORD;
    --#8 SHOW PARAMETER NLS;
        SELECT *FROM NLS_DATABASE_PARAMETERS;
    --#9,10,11,12,13,14,15,16,17
        DECLARE
            XN NUMBER(2):=5;
            YN NUMBER(3):=2;
            ZN NUMBER(10,2);
            
            XFIXED NUMBER(10):=1234567890;
            YFIXED NUMBER(20):=100009999290;
            
            my_number1 NUMBER(10, -2):= 123.456;
            my_number2 NUMBER(8, -3):= 444.222222;
            
            XBF BINARY_FLOAT := 2.07f;
            
            XBD BINARY_DOUBLE := 2.44d;
            
            XEXP NUMBER := 1.23E3;
            YEXP NUMBER := 2.23E3;
            
            BX1 BOOLEAN :=TRUE;
            BY1 BOOLEAN :=TRUE;
            
        BEGIN
            dbms_output.put_line('TASK 9,10,11,12,13,14,15,16,17');
            ZN:=XN+YN;
            dbms_output.put_line('XN+YN = '||ZN);
            ZN:=XN-YN;
            dbms_output.put_line('XN-YN = '||ZN);
            ZN:=XN*YN;
            dbms_output.put_line('XN*YN = '||ZN);
            ZN:=XN/YN;
            dbms_output.put_line('XN/YN = '||ZN);
            ZN:=MOD(XN,YN);
            dbms_output.put_line('XN%YN = '||ZN);
            
        EXCEPTION
                WHEN OTHERS
                    THEN dbms_output.put_line('ERROR = '||SQLERRM||', SQLCODE = '||SQLCODE);
        
        END;
        /
    --#18(ERROR)
        DECLARE
            V1 CONSTANT VARCHAR2(10) := 'LOB';
            V2 CONSTANT CHAR(4) := 'DB';
            V3 CONSTANT NUMBER := 10;
        BEGIN
            dbms_output.put_line('V1 = '||V1||', V2 = '||V2||', V3 = '||V3);
            --ERROR ATTEMPT TO ASSIGN VALUE TO CONST
            V3:=20;
        EXCEPTION
            WHEN OTHERS
                THEN dbms_output.put_line('ERROR = '||SQLERRM||', SQLCODE = '||SQLCODE);
        
        END;
        /
    --#19
        SELECT table_name FROM user_tables;
        DECLARE
            T1 A.X%TYPE;
        BEGIN
            T1:=10;
            dbms_output.put_line('T1 = '||T1);
        EXCEPTION
            WHEN OTHERS
                THEN dbms_output.put_line('ERROR = '||SQLERRM||', SQLCODE = '||SQLCODE);
        END;
    --#20
        DECLARE
            T1 A%ROWTYPE;
        BEGIN
            T1.X := 10;
            T1.V := 'INFO';
            dbms_output.put_line('T1.X = '||T1.X||', T1.Y = '||T1.V);
        EXCEPTION
            WHEN OTHERS
                THEN dbms_output.put_line('ERROR = '||SQLERRM||', SQLCODE = '||SQLCODE);
        END;
        
    --#21
        DECLARE
            X INT := 10;
        BEGIN
        ----------
        IF 8 > X
            THEN
                dbms_output.put_line('8 > '||X);
        END IF;
        ----------
        IF 8 > X
            THEN
                dbms_output.put_line('8 > '||X);
            ELSE
                dbms_output.put_line('8 <= '||X);
        END IF;
        ----------
        IF 8>X
            THEN
                dbms_output.put_line('8 > '||X);
            ELSIF 15=X
                THEN
                    dbms_output.put_line('15 = '||X);
            ELSE
                dbms_output.put_line('X > 8');
        END IF;
        EXCEPTION
            WHEN OTHERS
                THEN dbms_output.put_line('ERROR = '||SQLERRM||', SQLCODE = '||SQLCODE);
        END;
    --#23
        DECLARE
        grade CHAR := 'B';
        BEGIN
            CASE grade
                WHEN 'A' THEN
                    DBMS_OUTPUT.PUT_LINE('Отлично');
                WHEN 'B' THEN
                    DBMS_OUTPUT.PUT_LINE('Хорошо');
                WHEN 'C' THEN
                    DBMS_OUTPUT.PUT_LINE('Удовлетворительно');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('Неизвестная оценка');
            END CASE;
        END;
    --24
        DECLARE
            i NUMBER := 1;
        BEGIN
            LOOP
                DBMS_OUTPUT.PUT_LINE('Итерация ' || i);
                i := i + 1;
                EXIT WHEN i > 5;
            END LOOP;
        END;

    --25
        DECLARE
            i NUMBER := 1;
        BEGIN
            WHILE i <= 5 LOOP
                DBMS_OUTPUT.PUT_LINE('Итерация ' || i);
                i := i + 1;
            END LOOP;
        END;

    --26
        DECLARE
            n NUMBER;
        BEGIN
            FOR i IN 1..5 LOOP
                n := i * 2; 
                DBMS_OUTPUT.PUT_LINE('Значение i: ' || i);
                DBMS_OUTPUT.PUT_LINE('Результат: ' || n);
            END LOOP;
        END;
    
        