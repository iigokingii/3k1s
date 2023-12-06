--lab11
    --#1
        GRANT CREATE PROCEDURE TO C##SVA;
        SELECT * FROM TEACHER;
        DECLARE
            PROCEDURE GET_TEACHERS (
                PCODE TEACHER.PULPIT%TYPE
            )IS
                CURSOR TEACHER_CURS IS SELECT * FROM TEACHER 
                    WHERE TEACHER.PULPIT = PCODE;
            BEGIN
                FOR TEACHER IN TEACHER_CURS
                LOOP
                   DBMS_OUTPUT.PUT_LINE(TEACHER.TEACHER_NAME); 
                END LOOP;
            END GET_TEACHERS;
        BEGIN
            GET_TEACHERS('PUL002');
        EXCEPTION
            WHEN OTHERS THEN 
                DBMS_OUTPUT.PUT_LINE(SQLERRM);   
        END;
    --#2
        DECLARE
            RESULT_OF_FUNCTION NUMBER;
            FUNCTION GET_NUM_TEACHERS (
                PCODE TEACHER.PULPIT%TYPE
            ) RETURN NUMBER IS
                RESULT NUMBER;
            BEGIN
                SELECT COUNT(*) INTO RESULT FROM TEACHER 
                    WHERE TEACHER.PULPIT = PCODE;
                RETURN RESULT;
            END GET_NUM_TEACHERS;
        BEGIN
            RESULT_OF_FUNCTION:=GET_NUM_TEACHERS('PUL002');
            DBMS_OUTPUT.PUT_LINE('RESULT OF FUNCTION: '||RESULT_OF_FUNCTION);
        EXCEPTION
            WHEN OTHERS THEN 
                DBMS_OUTPUT.PUT_LINE(SQLERRM); 
        END;
    --#3
        --3A
        --SELECT * FROM TEACHER;
        --SELECT * FROM FACULTY;
        --SELECT * FROM PULPIT;
        CREATE OR REPLACE PROCEDURE GET_TEACHERS (
            FCODE FACULTY.FACULTY%TYPE
        )IS
        CURSOR TEACHER_CURS IS 
            SELECT * FROM TEACHER
                INNER JOIN PULPIT 
                    ON teacher.pulpit = PULPIT.PULPIT
                INNER JOIN FACULTY
                    ON FACULTY.FACULTY=PULPIT.FACULTY
                        WHERE FACULTY.FACULTY = FCODE;
        BEGIN
            FOR TEACHER IN TEACHER_CURS
            LOOP
               DBMS_OUTPUT.PUT_LINE(TEACHER.TEACHER_NAME); 
            END LOOP;
        END GET_TEACHERS;
        --3B
        --SELECT * FROM SUBJECT;
        --SELECT * FROM PULPIT;
        CREATE OR REPLACE PROCEDURE GET_SUBJECTS (
            PCODE SUBJECT.PULPIT%TYPE
        )IS
            CURSOR SUBJECT_CURS IS 
                SELECT * FROM SUBJECT 
                    INNER JOIN PULPIT 
                        ON PULPIT.PULPIT = SUBJECT.PULPIT
                            WHERE SUBJECT.PULPIT = PCODE;
        BEGIN
            FOR SUBJECT IN SUBJECT_CURS
            LOOP
               DBMS_OUTPUT.PUT_LINE(SUBJECT.SUBJECT_NAME); 
            END LOOP;
        END GET_SUBJECTS;
        
        BEGIN
            DBMS_OUTPUT.PUT_LINE('GET_TEACHERS:'); 
            GET_TEACHERS('FAC001');
            DBMS_OUTPUT.PUT_LINE('GET_SUBJECTS:'); 
            GET_SUBJECTS('PUL002');
        EXCEPTION 
            WHEN OTHERS THEN 
                DBMS_OUTPUT.PUT_LINE(SQLERRM); 
        END;
    --#4
        DECLARE
            R1 NUMBER;
            R2 NUMBER;
            FUNCTION GET_NUM_TEACHERS (
                FCODE FACULTY.FACULTY%TYPE
            ) RETURN NUMBER IS
                RESULT NUMBER;
            BEGIN
                SELECT COUNT(*)INTO RESULT 
                    FROM TEACHER
                        INNER JOIN PULPIT 
                    ON teacher.pulpit = PULPIT.PULPIT
                        INNER JOIN FACULTY
                    ON FACULTY.FACULTY=PULPIT.FACULTY
                        WHERE FACULTY.FACULTY = FCODE;
                RETURN RESULT;
            END GET_NUM_TEACHERS;
            
            FUNCTION GET_NUM_SUBJECTS (
                PCODE SUBJECT.PULPIT%TYPE
            ) RETURN NUMBER IS
                RESULT NUMBER;
            BEGIN
                SELECT COUNT(*)INTO RESULT FROM SUBJECT 
                    INNER JOIN PULPIT 
                        ON PULPIT.PULPIT = SUBJECT.PULPIT
                            WHERE SUBJECT.PULPIT = PCODE;
                RETURN RESULT;
            END GET_NUM_SUBJECTS;
        BEGIN
            R1:=GET_NUM_TEACHERS('FAC001');
            DBMS_OUTPUT.PUT_LINE('GET_NUM_TEACHERS RESULT: '||R1); 
            R2:=GET_NUM_SUBJECTS('PUL002');
            DBMS_OUTPUT.PUT_LINE('GET_NUM_SUBJECTS RESULT: '||R2);
        EXCEPTION 
            WHEN OTHERS THEN 
                DBMS_OUTPUT.PUT_LINE(SQLERRM); 
        END;
        
        
    --#5
        CREATE OR REPLACE PACKAGE TEACHERS AS
            PROCEDURE GET_TEACHERS (
                FCODE FACULTY.FACULTY%TYPE
            );
            
            PROCEDURE GET_SUBJECTS (
                PCODE SUBJECT.PULPIT%TYPE
            );
            
            FUNCTION GET_NUM_TEACHERS (
                FCODE FACULTY.FACULTY%TYPE
            ) RETURN NUMBER;
            
            FUNCTION GET_NUM_SUBJECTS (
                PCODE SUBJECT.PULPIT%TYPE
            ) RETURN NUMBER;
            
        END TEACHERS;
        /
        
        CREATE OR REPLACE PACKAGE BODY TEACHERS AS
            PROCEDURE GET_TEACHERS (
                FCODE FACULTY.FACULTY%TYPE
            )IS
            CURSOR TEACHER_CURS IS 
                SELECT * FROM TEACHER
                    INNER JOIN PULPIT 
                        ON teacher.pulpit = PULPIT.PULPIT
                    INNER JOIN FACULTY
                        ON FACULTY.FACULTY=PULPIT.FACULTY
                            WHERE FACULTY.FACULTY = FCODE;
            BEGIN
                FOR TEACHER IN TEACHER_CURS
                LOOP
                   DBMS_OUTPUT.PUT_LINE(TEACHER.TEACHER_NAME); 
                END LOOP;
            END GET_TEACHERS;
            
            PROCEDURE GET_SUBJECTS (
                PCODE SUBJECT.PULPIT%TYPE
            )IS
                CURSOR SUBJECT_CURS IS 
                    SELECT * FROM SUBJECT 
                        INNER JOIN PULPIT 
                            ON PULPIT.PULPIT = SUBJECT.PULPIT
                                WHERE SUBJECT.PULPIT = PCODE;
            BEGIN
                FOR SUBJECT IN SUBJECT_CURS
                LOOP
                   DBMS_OUTPUT.PUT_LINE(SUBJECT.SUBJECT_NAME); 
                END LOOP;
            END GET_SUBJECTS;
            
            FUNCTION GET_NUM_TEACHERS (
                FCODE FACULTY.FACULTY%TYPE
            ) RETURN NUMBER IS
                RESULT NUMBER;
            BEGIN
                SELECT COUNT(*)INTO RESULT 
                    FROM TEACHER
                        INNER JOIN PULPIT 
                    ON teacher.pulpit = PULPIT.PULPIT
                        INNER JOIN FACULTY
                    ON FACULTY.FACULTY=PULPIT.FACULTY
                        WHERE FACULTY.FACULTY = FCODE;
                RETURN RESULT;
            END GET_NUM_TEACHERS;
        
            FUNCTION GET_NUM_SUBJECTS (
                PCODE SUBJECT.PULPIT%TYPE
            ) RETURN NUMBER IS
                RESULT NUMBER;
            BEGIN
                SELECT COUNT(*)INTO RESULT FROM SUBJECT 
                    INNER JOIN PULPIT 
                        ON PULPIT.PULPIT = SUBJECT.PULPIT
                            WHERE SUBJECT.PULPIT = PCODE;
                RETURN RESULT;
            END GET_NUM_SUBJECTS;
        END TEACHERS;
        /
    --#6
        DECLARE
            FCODE FACULTY.FACULTY%TYPE := 'FAC001';
            PCODE PULPIT.PULPIT%TYPE := 'PUL002';
            R1 NUMBER;
            R2 NUMBER;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('TEACHERS.GET_TEACHERS(FCODE): '); 
            TEACHERS.GET_TEACHERS(FCODE);
            R1:=TEACHERS.GET_NUM_TEACHERS(FCODE);
            DBMS_OUTPUT.PUT_LINE('TEACHERS.GET_NUM_TEACHERS(FCODE): '||R1); 
            DBMS_OUTPUT.PUT_LINE('TEACHERS.GET_SUBJECTS(PCODE): ');
            TEACHERS.GET_SUBJECTS(PCODE);
            R2:=TEACHERS.GET_NUM_SUBJECTS(PCODE);
            DBMS_OUTPUT.PUT_LINE('TEACHERS.GET_NUM_SUBJECTS(PCODE): '||R2);
        EXCEPTION
            WHEN OTHERS 
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    