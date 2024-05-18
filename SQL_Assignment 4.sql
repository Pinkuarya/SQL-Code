
/*  Create a Student table and ADD 20 records in them.  */

CREATE DATABASE STUDENTS

CREATE TABLE STUDENT_TABLE
(
STUDENT_ID INT,
NAME VARCHAR(50),
SURNAME VARCHAR(50),
BIRTHDATE DATE,
GENDER CHAR(50),
CLASS VARCHAR(20),
POINT INT
);

INSERT INTO STUDENT_TABLE VALUES (1, 'JOHN', 'DOE', '2000-05-15', 'MALE', 'GRADE 10', 85),
(2, 'JANE', 'SMITH', '2001-08-20', 'FEMALE', 'GRADE 11', 92),
(3, 'MICHAEL', 'JOHNSON', '2000-03-10', 'MALE', 'GRADE 10', 78),
(4, 'EMILY', 'WILLIAMS', '2002-01-25', 'FEMALE', 'GRADE 11', 88),
(5, 'DAVID', 'BROWN', '2001-06-30', 'MALE', 'GRADE 10', 91),
(6, 'EMMA', 'JONES', '2000-11-05', 'FEMALE', 'GRADE 12', 95),
(7, 'MATTHEW', 'DAVIS', '2002-04-18', 'MALE', 'GRADE 11', 87),
(8, 'OLIVIA', 'MILLER', '2001-09-12', 'FEMALE', 'GRADE 12', 90),
(9, 'DANIEL', 'WILSON', '2000-07-22', 'MALE', 'GRADE 10', 82),
(10, 'SOPHIA', 'TAYLOR', '2002-02-28', 'FEMALE', 'GRADE 11', 89),
(11, 'ETHAN', 'ANDERSON', '2001-05-08', 'MALE', 'GRADE 12', 93),
(12, 'AVA', 'MARTINEZ', '2000-10-15', 'FEMALE', 'GRADE 10', 85),
(13, 'ALEXANDER', 'HERNANDEZ', '2002-03-20', 'MALE', 'GRADE 12', 94),
(14, 'ISABELLA', 'GARCIA', '2001-08-10', 'FEMALE', 'GRADE 11', 88),
(15, 'WILLIAM', 'LOPEZ', '2000-12-05', 'MALE', 'GRADE 10', 79),
(16, 'MIA', 'LEE', '2002-05-18', 'FEMALE', 'GRADE 12', 96),
(17, 'JAMES', 'CLARK', '2001-09-30', 'MALE', 'GRADE 11', 90),
(18, 'CHARLOTTE', 'RODRIGUEZ', '2000-11-25', 'FEMALE', 'GRADE 10', 83),
(19, 'BENJAMIN', 'LEWIS', '2002-04-03', 'MALE', 'GRADE 11', 86),
(20, 'AMELIA', 'WALKER', '2001-07-14', 'FEMALE', 'GRADE 12', 92);

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

/*  Example 1:  List all the records in the student chart.  */

SELECT * FROM STUDENT_TABLE

-----------------------------------------------------------------------------------

/*  Example 2: List the name surname and class of the student in the student table.  */

SELECT NAME, SURNAME, CLASS FROM STUDENT_TABLE;

-----------------------------------------------------------------------------------

/*  Example 3: List the gender Female (F) records in the student table.  */

SELECT * FROM STUDENT_TABLE
WHERE GENDER = 'FEMALE';

-----------------------------------------------------------------------------------

/*  Example 4: List the names of each class in the way of being seen once in the student table.  */

SELECT DISTINCT CLASS FROM STUDENT_TABLE;

-----------------------------------------------------------------------------------

/*  Example 5: List the students with Female gender and the class 10 Math in the student table.  */

SELECT * FROM STUDENT_TABLE
WHERE GENDER = 'FEMALE' AND CLASS = 'GRADE 10';
-----------------------------------------------------------------------------------

/*  Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table.  */

SELECT NAME, SURNAME, CLASS
FROM STUDENT_TABLE
WHERE CLASS LIKE 'GRADE 10%';

-----------------------------------------------------------------------------------

/*  Example 7: List the students name surname and school number in the student table.  */

SELECT NAME, SURNAME, STUDENT_ID FROM STUDENT_TABLE;
-----------------------------------------------------------------------------------

/*  Example 8: List the students name and surname by combining them as name surname in the student table.  */

SELECT CONCAT(NAME, ' ', SURNAME) AS STU_FULLNAME FROM STUDENT_TABLE;

-----------------------------------------------------------------------------------

/*  Example 9: List the students with the names starting with “A” letter in the student table.  */

SELECT * FROM STUDENT_TABLE
WHERE NAME LIKE 'A%';

-----------------------------------------------------------------------------------

/*  Example 11: List the students with names Emma, Sophia and Robert in the student table.  */

SELECT * FROM STUDENT_TABLE
WHERE NAME IN ('EMMA', 'SOPHIA', 'ROBERT');

-----------------------------------------------------------------------------------

/*  Example 12: List the students with names starting with A D and K in the student table.  */

SELECT * FROM STUDENT_TABLE
WHERE NAME LIKE 'A%' OR NAME LIKE 'D%' OR NAME LIKE 'K%';

-----------------------------------------------------------------------------------

/*  Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table.  */

SELECT NAME, SURNAME, CLASS, GENDER FROM STUDENT_TABLE
WHERE (CLASS = '9MATH' AND GENDER = 'MALE') OR (CLASS = '9HIS' AND GENDER = 'FEMALE');

-----------------------------------------------------------------------------------

/*  Example 14: List the males whose classes are 10Math or 10Bio.  */

SELECT NAME, SURNAME, CLASS FROM STUDENT_TABLE
WHERE GENDER = 'MALE' AND (CLASS = '10Math' OR CLASS = '10Bio');

-----------------------------------------------------------------------------------

/*  Example 15: List the students with birth year 1989 in the student table.  */

SELECT * FROM STUDENT_TABLE
WHERE YEAR(BIRTHDATE) = 1989;

-----------------------------------------------------------------------------------