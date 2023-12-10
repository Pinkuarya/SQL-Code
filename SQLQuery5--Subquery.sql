
CREATE TABLE EMPLOYESS_DETAIL
(
E_ID INT PRIMARY KEY,
E_NAME VARCHAR(100),
DEPT_NAME VARCHAR(50),
SALARY MONEY
)

INSERT EMPLOYESS_DETAIL VALUES (1, 'RAM', 'HR', 1000),
(2, 'AMIT', 'HR', 2000),
(3, 'MIKE', 'MRKT', 3000),
(4, 'VARUN', 'MRKT', 5000),
(5, 'TOM', 'MRKT', 65000)

SELECT * FROM EMPLOYESS_DETAIL

----WRITE A SQL QUERY TO DISPLAY THE MAX SALATY FROM THE TABLE----

SELECT * FROM EMPLOYESS_DETAIL

SELECT MAX(SALARY) FROM EMPLOYESS_DETAIL ---------65000

----WRITE A SQL QUERY TO DISPLAY THE MAX SALARY AND DEPT----
SELECT DEPT_NAME, MAX(SALARY) AS MAX_OF_SALARY FROM EMPLOYESS_DETAIL
GROUP BY DEPT_NAME
ORDER BY MAX_OF_SALARY DESC

-----WRITE A SQL QUERY TO DISPLAY EMP_NAME WHO IS TAKING MAX SALARY------


SELECT E_NAME, SALARY FROM EMPLOYESS_DETAIL
WHERE SALARY =
(SELECT MAX(SALARY) FROM EMPLOYESS_DETAIL) ----65000----- INNER QUERY

SELECT * FROM EMPLOYESS_DETAIL -------------One more sub-query
-----------------------------------------------------------

SELECT E_NAME, MAX(SALARY) FROM EMPLOYESS_DETAIL
WHERE SALARY <>
(SELECT MAX(SALARY) FROM EMPLOYESS_DETAIL)
GROUP BY E_NAME

---------------------------------------------
SELECT E_NAME, SALARY FROM EMPLOYESS_DETAIL
WHERE SALARY=
(
SELECT MAX(SALARY) FROM EMPLOYESS_DETAIL
WHERE SALARY<>
(SELECT MAX(SALARY) FROM EMPLOYESS_DETAIL)
)