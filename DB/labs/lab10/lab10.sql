--lab10
    --#1
        SELECT *FROM TEACHER;
        UPDATE TEACHER 
        SET SALARY = 6100
        WHERE TEACHER = 'TCH006';
        COMMIT;
        ALTER TABLE TEACHER 
        ADD(
            BIRTHDAY DATE,
            SALARY NUMBER(5)
        );
    --#2
        DECLARE 
            CURSOR TEACHER_CURS IS SELECT TEACHER_NAME FROM TEACHER;
            last_name VARCHAR2(50);
            first_name VARCHAR2(50);
            middle_name VARCHAR2(50);
            formatted_name VARCHAR2(50);
        BEGIN
            FOR TEACHER IN TEACHER_CURS
            LOOP
                last_name := SUBSTR(TEACHER.TEACHER_NAME, 1, INSTR(TEACHER.TEACHER_NAME, ' ') - 1);
                first_name := SUBSTR(TEACHER.TEACHER_NAME, INSTR(TEACHER.TEACHER_NAME, ' ') + 1, INSTR(TEACHER.TEACHER_NAME, ' ', 1, 2) - INSTR(TEACHER.TEACHER_NAME, ' ') - 1);
                middle_name := SUBSTR(TEACHER.TEACHER_NAME, INSTR(TEACHER.TEACHER_NAME, ' ', 1, 2) + 1);
                  
                formatted_name := last_name || ' ' || SUBSTR(first_name, 1, 1) || '.' || SUBSTR(middle_name, 1, 1) || '.';
  
                DBMS_OUTPUT.PUT_LINE('‘‡ÏËÎËˇ ».Œ.: ' || formatted_name);
            END LOOP;
        
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#3
        DECLARE 
            CURSOR TEACHER_CURS IS SELECT * FROM TEACHER;
            date_val DATE;
            day_of_week NUMBER;
        BEGIN
            FOR TEACHER IN TEACHER_CURS
            LOOP
                date_val := TO_DATE(TEACHER.BIRTHDAY, 'DD.MM.RR');
                day_of_week := TO_CHAR(date_val, 'D');
                IF day_of_week = 2
                THEN
                    DBMS_OUTPUT.PUT_LINE('–Œƒ»À—ﬂ ¬ œŒÕ≈ƒ≈À‹Õ» : ' || TEACHER.TEACHER_NAME);
                END IF;
            END LOOP;
        
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#4
         CREATE OR REPLACE VIEW BIRTHDAY_IN_NEXT_MONTH AS
            SELECT * FROM TEACHER WHERE 
                EXTRACT(MONTH FROM TEACHER.BIRTHDAY) = EXTRACT(MONTH FROM SYSDATE) + 1;
        SELECT * FROM BIRTHDAY_IN_NEXT_MONTH;
        DROP VIEW BIRTHDAY_IN_NEXT_MONTH;
    --#5
        CREATE VIEW TEACHERS_BIRTHDAYS_SORTED_BY_MONTH AS
            SELECT 
              EXTRACT(MONTH FROM TEACHER.BIRTHDAY) AS BirthMonth,
              COUNT(*) AS BirthdaysCount
            FROM 
              TEACHER
            GROUP BY 
              EXTRACT(MONTH FROM TEACHER.birthday)
            ORDER BY 
              BirthMonth;
        SELECT * FROM TEACHERS_BIRTHDAYS_SORTED_BY_MONTH;
    --#6
        SELECT * FROM TEACHER;
        DECLARE 
            CURSOR TEACHER_CURS IS SELECT * FROM TEACHER;
            V_DATE DATE;
        BEGIN
            FOR TEACHER IN TEACHER_CURS
            LOOP
                V_DATE := TO_DATE(TEACHER.BIRTHDAY,'DD-MM-YYYY');
                IF MOD(((EXTRACT(YEAR FROM SYSDATE)+1) - EXTRACT(YEAR FROM v_date)), 10) = 0
                THEN
                    DBMS_OUTPUT.PUT_LINE('ﬁ¡»À≈… ¬ —À≈ƒ”ﬁŸ≈Ã √Œƒ”: ' || TEACHER.TEACHER_NAME);
                END IF;
            END LOOP;
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#7
        DECLARE
            CURSOR AVG_PULP IS 
                SELECT TEACHER.PULPIT,FLOOR(AVG(SALARY)) AS AVG_SALARY FROM TEACHER
                    INNER JOIN PULPIT ON 
                        TEACHER.PULPIT=PULPIT.PULPIT
                GROUP BY 
                    TEACHER.PULPIT
                ORDER BY AVG_SALARY DESC;
            CURSOR AVG_FACULTY IS
                SELECT FACULTY.FACULTY,FLOOR(AVG(TEACHER.SALARY))AS AVG_SALARY FROM TEACHER
                    INNER JOIN PULPIT ON 
                        TEACHER.PULPIT=PULPIT.PULPIT
                    INNER JOIN FACULTY ON
                        PULPIT.FACULTY = FACULTY.FACULTY
                    GROUP BY
                        FACULTY.FACULTY
                    ORDER BY AVG_SALARY DESC;
            CURSOR AVG_FACULTIES IS
                SELECT FLOOR(AVG(TEACHER.SALARY))AS AVG_SALARY FROM TEACHER
                    INNER JOIN PULPIT ON 
                        TEACHER.PULPIT=PULPIT.PULPIT
                    INNER JOIN FACULTY ON
                        PULPIT.FACULTY = FACULTY.FACULTY;
        BEGIN
            FOR AVG_PULP_ELEM IN AVG_PULP
            LOOP
                DBMS_OUTPUT.PUT_LINE('PULPIT: '||AVG_PULP_ELEM.PULPIT||' AVG_SALARY: '||AVG_PULP_ELEM.AVG_SALARY);
            END LOOP;
            -----
            FOR AVG_FACULTY_ELEM IN AVG_FACULTY
            LOOP
                DBMS_OUTPUT.PUT_LINE('FACULTY: '||AVG_FACULTY_ELEM.FACULTY||' AVG_SALARY: '||AVG_FACULTY_ELEM.AVG_SALARY);
            END LOOP;
            FOR AVG_FACULTY_ELEM IN AVG_FACULTIES
            LOOP
                DBMS_OUTPUT.PUT_LINE('AVERAGE FACULTY SALARY: '||AVG_FACULTY_ELEM.AVG_SALARY);
            END LOOP;
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#8
        DECLARE
            TYPE TEACHER IS RECORD(
                TEACHER VARCHAR(20),
                TEACHER_NAME VARCHAR(120)
            );
            TECH TEACHER;
        BEGIN
            SELECT TEACHER,TEACHER_NAME INTO TECH FROM TEACHER WHERE TEACHER='TCH001';
            DBMS_OUTPUT.PUT_LINE('TEACHER: '||TECH.TEACHER||' TEACHER_NAME:'||TECH.TEACHER_NAME||' ;');
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
        
        DECLARE
            TYPE ADRESS IS RECORD(
                ADDR1 VARCHAR(100),
                ADDR2 VARCHAR(100),
                ADDR3 VARCHAR(100)
            );
            TYPE PERSON IS RECORD(
                CODE VARCHAR(40),
                NAME VARCHAR(120),
                HOME_ADDR ADRESS
            );
            TECH PERSON;
        BEGIN
            TECH.CODE := 'TCH012';
            TECH.NAME:='¡≈ÀŒƒ≈ƒ Õ» ŒÀ¿… »¬¿ÕŒ¬»◊';
            TECH.HOME_ADDR.ADDR1 := 'ADDR1';
            TECH.HOME_ADDR.ADDR2 := 'ADDR2';
            TECH.HOME_ADDR.ADDR3 := 'ADDR3';
            DBMS_OUTPUT.PUT_LINE(TECH.NAME||' '||TECH.HOME_ADDR.ADDR1);
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
        