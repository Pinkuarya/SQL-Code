SELECT * FROM EMPLOYEE
SELECT * FROM DEPARTMENT
---------------------------------------------------------

SELECT * FROM EMPLOYEE  ---------LEFT TABLE
INNER JOIN  ------INNER JOIN
DEPARTMENT  -------RIGHT TABLE
ON
EMPLOYEE.EMP_ID=DEPARTMENT.EMP_ID

SELECT * FROM EMPLOYEE  ---------LEFT TABLE
LEFT JOIN  ------LEFT JOIN
DEPARTMENT  -------RIGHT TABLE
ON
EMPLOYEE.EMP_ID=DEPARTMENT.EMP_ID

SELECT * FROM EMPLOYEE  ---------LEFT TABLE
RIGHT JOIN  ------RIGHT JOIN
DEPARTMENT  -------RIGHT TABLE
ON
EMPLOYEE.EMP_ID=DEPARTMENT.EMP_ID

SELECT * FROM EMPLOYEE  ---------LEFT TABLE
FULL OUTER JOIN  ------FULL OUTER JOIN
DEPARTMENT  -------RIGHT TABLE
ON
EMPLOYEE.EMP_ID=DEPARTMENT.EMP_ID

SELECT * FROM EMPLOYEE
CROSS JOIN -------CROSS JOIN (IT IS ALSO KNOWN AS CATERISAN PRODUCT AND M * N PRODUCT)
DEPARTMENT
---------------------------------------------------------------------------------------

/* ALIASES

TEMPORARY NAME TO THE TABLE
FRIENDLY NAME TO THE TABLE
SQL QUERY IS EXECUTED, THE TEMPORARY WILL BE TAKEN AWAY 
*/

SELECT * FROM EMPLOYEE AS E ---------LEFT TABLE
RIGHT JOIN  ------FULL OUTER JOIN
DEPARTMENT AS D -------RIGHT TABLE
ON
E.EMP_ID=D.EMP_ID

SELECT * FROM EMPLOYEE E ---------LEFT TABLE
RIGHT JOIN  ------FULL OUTER JOIN
DEPARTMENT D -------RIGHT TABLE
ON
E.EMP_ID=D.EMP_ID
--------------------------------------------

UPDATE EMPLOYEE
SET SALARY = 40000
WHERE EMP_ID = 101

UPDATE EMPLOYEE
SET EMP_NAME = 'ELENA', CITY = 'BANGLORE'
WHERE EMP_ID = 102
----------------------------------------------------------

DELETE FROM EMPLOYEE
WHERE EMP_NAME = 'SWETA';

---------------------------------------------------
SELECT * FROM DEPARTMENT

ALTER TABLE DEPARTMENT
ADD EMP_NAME VARCHAR(100);

ALTER TABLE DEPARTMENT
DROP COLUMN EMP_NAME;