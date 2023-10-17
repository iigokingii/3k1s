CREATE TABLE SOUVENIER(
	SOUVENIER_ID INT PRIMARY KEY,
	SOUVENIER_NAME NVARCHAR(MAX),
	MANUFACTURER_ID INT FOREIGN KEY REFERENCES MANUFACTURER(MANUFACTURER_ID),
	DATE NVARCHAR(MAX),
	PRICE INT
)
CREATE TABLE MANUFACTURER(
	MANUFACTURER_ID INT PRIMARY KEY,
	MANUFACTURER_NAME NVARCHAR(MAX),
	COUNTRY NVARCHAR(MAX)
)

INSERT INTO MANUFACTURER VALUES(0,'MINSJ','BELARUS');
INSERT INTO MANUFACTURER VALUES(1,'VITEBSK','BELARUS');
INSERT INTO MANUFACTURER VALUES(2,'MSK','RUSSIA');
INSERT INTO MANUFACTURER VALUES(3,'KFC','USA');

INSERT INTO SOUVENIER VALUES(0,'SOUVENIER1',0,'2020',15);
INSERT INTO SOUVENIER VALUES(1,'SOUVENIER2',1,'2023',25);
INSERT INTO SOUVENIER VALUES(2,'SOUVENIER3',0,'2020',45);
INSERT INTO SOUVENIER VALUES(3,'SOUVENIER4',1,'2023',55);

DELETE FROM SOUVENIER WHERE SOUVENIER_ID = 0;
DELETE FROM MANUFACTURER WHERE ID = 0;

DROP TABLE MANUFACTURER
DROP TABLE SOUVENIER

SELECT * FROM MANUFACTURER INNER JOIN SOUVENIER ON MANUFACTURER.MANUFACTURER_ID=SOUVENIER.MANUFACTURER_ID where PRICE<20;
SELECT * FROM MANUFACTURER INNER JOIN SOUVENIER ON MANUFACTURER.MANUFACTURER_ID=SOUVENIER.MANUFACTURER_ID where COUNTRY like '%BELARUS%';
SELECT * FROM MANUFACTURER INNER JOIN SOUVENIER ON MANUFACTURER.MANUFACTURER_ID=SOUVENIER.MANUFACTURER_ID WHERE DATE LIKE '2020' AND SOUVENIER_NAME LIKE 'SOUVENIER1';