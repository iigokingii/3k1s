--lab9
SELECT table_name FROM user_tables;
    
    SELECT * FROM AUDITORIUM;
    --#1
        DECLARE
            AUDITORIUM_CURS AUDITORIUM%ROWTYPE;
        BEGIN
            SELECT * INTO AUDITORIUM_CURS FROM AUDITORIUM WHERE AUDITORIUM='AUD001';
        EXCEPTION
            WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#2
        DECLARE 
            AUDITORIUM_CURS AUDITORIUM%ROWTYPE;
        BEGIN
            SELECT * INTO AUDITORIUM_CURS FROM AUDITORIUM;
        EXCEPTION
            WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('SQLCODE: '||SQLCODE||' SQLERRM: ' || SQLERRM);
        END;
    --#3
        DECLARE 
            AUDITORIUM_CURS AUDITORIUM%ROWTYPE;
        BEGIN
            SELECT * INTO AUDITORIUM_CURS FROM AUDITORIUM;
        EXCEPTION
            WHEN TOO_MANY_ROWS
                THEN DBMS_OUTPUT.PUT_LINE('TOO MANY ROWS');
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE('SQLCODE: '||SQLCODE||' SQLERRM: ' || SQLERRM);
        END;
    --#4
        DECLARE
            AUDITORIUM_CURS AUDITORIUM%ROWTYPE;
        BEGIN
            SELECT * INTO AUDITORIUM_CURS FROM AUDITORIUM WHERE AUDITORIUM='AUD101';
        EXCEPTION
            WHEN NO_DATA_FOUND
                THEN DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
        END;
        
        DECLARE 
            AUDITORIUM_CURS AUDITORIUM%ROWTYPE;
        BEGIN
            SELECT * INTO AUDITORIUM_CURS FROM AUDITORIUM WHERE AUDITORIUM = 'AUD002';
            IF SQL%ISOPEN
                THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
            ELSE
                DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED');
            END IF;
            IF SQL%FOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            END IF;
            IF SQL%NOTFOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            END IF;
            DBMS_OUTPUT.PUT_LINE('NUMBER OF SELECTED ROWS: '||SQL%ROWCOUNT);
        EXCEPTION
            WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#5
        DECLARE
        BEGIN
            UPDATE AUDITORIUM SET 
                    auditorium = 'AUD010',
                    auditorium_name = 'LABORATORY CLASS',
                    auditorium_capacity = 90,
                    auditorium_type = 'Type3'
                WHERE auditorium = 'AUD002';
            IF SQL%ISOPEN
                THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
            ELSE
                DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED');
            END IF;
            IF SQL%FOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            END IF;
            IF SQL%NOTFOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            END IF;
            DBMS_OUTPUT.PUT_LINE('NUMBER OF SELECTED ROWS: '||SQL%ROWCOUNT);
            ROLLBACK;
            --COMMIT;                      
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#6
        DECLARE
        BEGIN
            UPDATE AUDITORIUM SET 
                    auditorium = 'AUD001',
                    auditorium_name = 'LABORATORY CLASS',
                    auditorium_capacity = 90,
                    auditorium_type = 'Type3'
                WHERE auditorium = 'AUD003';
            IF SQL%ISOPEN
                THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
            ELSE
                DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED');
            END IF;
            IF SQL%FOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            END IF;
            IF SQL%NOTFOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            END IF;
            DBMS_OUTPUT.PUT_LINE('NUMBER OF SELECTED ROWS: '||SQL%ROWCOUNT);
            ROLLBACK;
            --COMMIT;                      
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#7
        BEGIN
            INSERT INTO AUDITORIUM 
            VALUES('AUD020','Lecture Hall 101',120,'Type1');
            IF SQL%ISOPEN
                THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
            ELSE
                DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED');
            END IF;
            IF SQL%FOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            END IF;
            IF SQL%NOTFOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            END IF;
            DBMS_OUTPUT.PUT_LINE('NUMBER OF SELECTED ROWS: '||SQL%ROWCOUNT);
            ROLLBACK;
            --COMMIT;                      
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
        select * from auditorium;
    --#8
         BEGIN
            INSERT INTO AUDITORIUM 
            VALUES('AUD001','Lecture Hall 101',120,'Type1');
            IF SQL%ISOPEN
                THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
            ELSE
                DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED');
            END IF;
            IF SQL%FOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            END IF;
            IF SQL%NOTFOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            END IF;
            DBMS_OUTPUT.PUT_LINE('NUMBER OF SELECTED ROWS: '||SQL%ROWCOUNT);
            ROLLBACK;
            --COMMIT;                      
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#9
        BEGIN
            DELETE AUDITORIUM WHERE auditorium = 'AUD003';
            IF SQL%ISOPEN
                THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
            ELSE
                DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED');
            END IF;
            IF SQL%FOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            END IF;
            IF SQL%NOTFOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            END IF;
            DBMS_OUTPUT.PUT_LINE('NUMBER OF SELECTED ROWS: '||SQL%ROWCOUNT);
            ROLLBACK;
            --COMMIT;                      
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
        /
        select * from auditorium;
    --#10
        BEGIN
            DELETE AUDITORIUM WHERE auditorium = 'AXSS';
            IF SQL%ISOPEN
                THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
            ELSE
                DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED');
            END IF;
            IF SQL%FOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            END IF;
            IF SQL%NOTFOUND
                THEN DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DATA FOUND');
            END IF;
            DBMS_OUTPUT.PUT_LINE('NUMBER OF SELECTED ROWS: '||SQL%ROWCOUNT);
            ROLLBACK;
            --COMMIT;                      
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#11
        SELECT * FROM TEACHER;
        DECLARE
            CURSOR TEACH_CURS IS SELECT TEACHER,TEACHER_NAME FROM TEACHER;
            V_TEACHER TEACHER.TEACHER%TYPE;
            V_TEACHER_NAME TEACHER.TEACHER_NAME%TYPE;
        BEGIN
            OPEN TEACH_CURS;
            LOOP
                FETCH TEACH_CURS INTO V_TEACHER,V_TEACHER_NAME;
                EXIT WHEN TEACH_CURS%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('V_TEACHER: '||V_TEACHER||' V_TEACHER_NAME:'|| V_TEACHER_NAME);
            END LOOP;
            CLOSE TEACH_CURS;
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#12
        --SELECT * FROM SUBJECT;
        DECLARE
            CURSOR SUBJECT_CURS IS SELECT * FROM SUBJECT;
            RECORD_SUBJECT SUBJECT%ROWTYPE;
        BEGIN
            OPEN SUBJECT_CURS;
            FETCH SUBJECT_CURS INTO RECORD_SUBJECT;
            WHILE SUBJECT_CURS%FOUND
            LOOP
                DBMS_OUTPUT.PUT_LINE('RECORD_SUBJECT.SUBJECT: '||RECORD_SUBJECT.SUBJECT ||' RECORD_SUBJECT.SUBJECT_NAME: '|| RECORD_SUBJECT.SUBJECT_NAME||' RECORD_SUBJECT.PULPIT: '||RECORD_SUBJECT.PULPIT);
                FETCH SUBJECT_CURS INTO RECORD_SUBJECT;
            END LOOP;
            CLOSE SUBJECT_CURS;
        
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#13
        SELECT * FROM TEACHER;
        SELECT * FROM PULPIT;
        
        DECLARE
            CURSOR INNER_CURS IS 
                SELECT TEACHER_NAME,PULPIT_NAME FROM TEACHER
                    INNER JOIN PULPIT 
                        ON TEACHER.PULPIT = PULPIT.PULPIT;
                        
            V_RECORD INNER_CURS%ROWTYPE;
        BEGIN
            FOR V_RECORD IN INNER_CURS
            LOOP
                DBMS_OUTPUT.PUT_LINE('V_TEACHER_NAME: '||V_RECORD.TEACHER_NAME ||' V_PULPIT_NAME: '||V_RECORD.PULPIT_NAME);
            END LOOP;
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#14
        SELECT * FROM AUDITORIUM;
        INSERT INTO AUDITORIUM VALUES('AUD009','LECT',19,'Type1');
        INSERT INTO AUDITORIUM VALUES('AUD0019','LECT',24,'Type2');
        DECLARE
        CURSOR CURS_LIST(HIGHER_THAN AUDITORIUM.AUDITORIUM_CAPACITY%TYPE,LOWER_THAN AUDITORIUM.AUDITORIUM_CAPACITY%TYPE)
            IS SELECT AUDITORIUM FROM AUDITORIUM WHERE HIGHER_THAN<=AUDITORIUM_CAPACITY AND AUDITORIUM_CAPACITY<LOWER_THAN;
            CURS_ELEM CURS_LIST%ROWTYPE;
        BEGIN
        ---------
        FOR CURS_ELEM IN CURS_LIST(0,20)
        LOOP
            DBMS_OUTPUT.PUT_LINE('FOR LOOP AUDITORIUM(0-20): '||CURS_ELEM.AUDITORIUM);
        END LOOP;
        ---------
        OPEN CURS_LIST(21,30);
        FETCH CURS_LIST INTO CURS_ELEM;
        WHILE CURS_LIST%FOUND
        LOOP
            DBMS_OUTPUT.PUT_LINE('WHILE LOOP AUDITORIUM(21-30): '||CURS_ELEM.AUDITORIUM);
            FETCH CURS_LIST INTO CURS_ELEM;
        END LOOP;
        CLOSE CURS_LIST;
        ---------
        OPEN CURS_LIST(31,60);
        LOOP
            FETCH CURS_LIST INTO CURS_ELEM;
            EXIT WHEN CURS_LIST%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('LOOP AUDITORIUM(31-60): '||CURS_ELEM.AUDITORIUM);
        END LOOP;
        CLOSE CURS_LIST;
        ---------
        OPEN CURS_LIST(61,80);
        FETCH CURS_LIST INTO CURS_ELEM;
        WHILE CURS_LIST%FOUND
        LOOP
            DBMS_OUTPUT.PUT_LINE('WHILE LOOP AUDITORIUM(61-80): '||CURS_ELEM.AUDITORIUM);
            FETCH CURS_LIST INTO CURS_ELEM;
        END LOOP;
        CLOSE CURS_LIST;
        ---------
        OPEN CURS_LIST(80,1000);
        FETCH CURS_LIST INTO CURS_ELEM;
        WHILE CURS_LIST%FOUND
        LOOP
            DBMS_OUTPUT.PUT_LINE('WHILE LOOP AUDITORIUM(>80): '||CURS_ELEM.AUDITORIUM);
            FETCH CURS_LIST INTO CURS_ELEM;
        END LOOP;
        CLOSE CURS_LIST;
        
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#15
        DECLARE
        XCURS SYS_REFCURSOR;
        RECORD_XCURS AUDITORIUM%ROWTYPE;
        BEGIN
            OPEN XCURS FOR SELECT * FROM AUDITORIUM;
            FETCH XCURS INTO RECORD_XCURS;
            WHILE XCURS%FOUND
            LOOP
                DBMS_OUTPUT.PUT_LINE(RECORD_XCURS.AUDITORIUM);
                FETCH XCURS INTO RECORD_XCURS;
            END LOOP;
        
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#16
        DECLARE
            CURSOR CURS_AUT
            IS SELECT AUDITORIUM_TYPE,
                        CURSOR(
                            SELECT AUDITORIUM
                            FROM AUDITORIUM AUM
                            WHERE AUT.AUDITORIUM_TYPE = AUM.AUDITORIUM_TYPE
                        )
                    FROM AUDITORIUM_TYPE AUT;
            CURS_AUM SYS_REFCURSOR;
            AUT AUDITORIUM_TYPE.AUDITORIUM_TYPE%TYPE;
            TXT VARCHAR2(1000):='';
            AUM AUDITORIUM.AUDITORIUM%TYPE;
        BEGIN
            OPEN CURS_AUT;
            FETCH CURS_AUT INTO AUT,CURS_AUM;
            WHILE CURS_AUT%FOUND
            LOOP
                TXT:=RTRIM(AUT)||':';
                LOOP
                    FETCH CURS_AUM INTO AUM;
                EXIT WHEN CURS_AUM%NOTFOUND;
                    TXT:=TXT||','||RTRIM(AUM);
                END LOOP;
                DBMS_OUTPUT.PUT_LINE(TXT);
                FETCH CURS_AUT INTO AUT,CURS_AUM;
            END LOOP;
            CLOSE CURS_AUT;
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    --#17
        INSERT INTO AUDITORIUM VALUES('AUD109','LECT',70,'Type1');
        INSERT INTO AUDITORIUM VALUES('AUD122','LECT',75,'Type2');
    
        DECLARE
            CURSOR CURS_LIST(HIGHER_THAN AUDITORIUM.AUDITORIUM_CAPACITY%TYPE,LOWER_THAN AUDITORIUM.AUDITORIUM_CAPACITY%TYPE)
                IS SELECT AUDITORIUM,AUDITORIUM_CAPACITY FROM AUDITORIUM WHERE HIGHER_THAN<=AUDITORIUM_CAPACITY AND AUDITORIUM_CAPACITY<LOWER_THAN FOR UPDATE;
                CURS_ELEM CURS_LIST%ROWTYPE;
            TEMP NUMBER;
        BEGIN
            FOR CURS_ELEM IN CURS_LIST(40,80)
            LOOP
                TEMP:=CURS_ELEM.AUDITORIUM_CAPACITY;
                TEMP:=TEMP*0.9;
                DBMS_OUTPUT.PUT_LINE('AUDITORIUM: '||CURS_ELEM.AUDITORIUM||' CAPACITY: '||CURS_ELEM.AUDITORIUM_CAPACITY);
                UPDATE AUDITORIUM
                    SET AUDITORIUM_CAPACITY = TEMP
                        WHERE CURRENT OF CURS_LIST;
            END LOOP;
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
        
        SELECT * FROM AUDITORIUM;
        ROLLBACK;
        --COMMIT;
    --#19
        DECLARE
            CURSOR CURS_LIST(HIGHER_THAN AUDITORIUM.AUDITORIUM_CAPACITY%TYPE,LOWER_THAN AUDITORIUM.AUDITORIUM_CAPACITY%TYPE)
                IS SELECT AUDITORIUM,AUDITORIUM_CAPACITY FROM AUDITORIUM WHERE HIGHER_THAN<=AUDITORIUM_CAPACITY AND AUDITORIUM_CAPACITY<LOWER_THAN FOR UPDATE;
                CURS_ELEM CURS_LIST%ROWTYPE;
            TEMP NUMBER;
        BEGIN
            OPEN CURS_LIST(0,20);
            FETCH CURS_LIST INTO CURS_ELEM;
            WHILE CURS_LIST%FOUND
            LOOP
                DBMS_OUTPUT.PUT_LINE('WHILE LOOP AUDITORIUM(>80): '||CURS_ELEM.AUDITORIUM);
                DELETE AUDITORIUM
                WHERE CURRENT OF CURS_LIST;
                FETCH CURS_LIST INTO CURS_ELEM;
            END LOOP;
            CLOSE CURS_LIST;
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
        
        SELECT * FROM AUDITORIUM;
        ROLLBACK;
        --COMMIT;
    --#19
        DECLARE 
            CURSOR CURS_AUDITORIUM(CAPACITY AUDITORIUM.AUDITORIUM_CAPACITY%TYPE)
                IS SELECT AUDITORIUM,AUDITORIUM_CAPACITY,ROWID
                    FROM AUDITORIUM
                    WHERE AUDITORIUM_CAPACITY>=CAPACITY FOR UPDATE;
            AUM AUDITORIUM.AUDITORIUM%TYPE;
            CTY AUDITORIUM.AUDITORIUM_CAPACITY%TYPE;
        BEGIN
            FOR XXX IN CURS_AUDITORIUM(40)
            LOOP
                CASE
                WHEN XXX.AUDITORIUM_CAPACITY>=90
                    THEN DELETE AUDITORIUM
                        WHERE ROWID = XXX.ROWID;
                WHEN XXX.AUDITORIUM_CAPACITY>=80
                    THEN UPDATE AUDITORIUM
                        SET AUDITORIUM_CAPACITY = AUDITORIUM_CAPACITY + 3
                            WHERE ROWID = XXX.ROWID;
            END LOOP;
        
        EXCEPTION
                WHEN OTHERS
                    THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
        
        SELECT * FROM AUDITORIUM;
        ROLLBACK;
        --COMMIT;
    --#20
        SELECT *FROM TEACHER;
        DECLARE 
          CURSOR TEACHER_CURS IS SELECT TEACHER_NAME FROM TEACHER;
          V_TEACHER_NAME TEACHER.TEACHER_NAME%TYPE;
          TXT VARCHAR2(1000) := '';
          ITERATION NUMBER := 0;
        BEGIN
          FOR TEACHER_REC IN TEACHER_CURS
          LOOP
            IF (MOD(ITERATION, 3) = 0) THEN
              DBMS_OUTPUT.PUT_LINE(TXT);
              DBMS_OUTPUT.PUT_LINE('------------------------');
              TXT := '';
            END IF;
            ITERATION := ITERATION + 1;
            TXT := TXT || TEACHER_REC.TEACHER_NAME || ' ';
            END LOOP;
        EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
        END;
    ROLLBACK;
    --COMMIT;