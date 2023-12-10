CREATE TABLE AGENT1
(
AGENTS VARCHAR(100),
CITY VARCHAR(50),
OCCUPATION CHAR(100),
AMOUNT MONEY
)

CREATE TABLE AGENT2
(
AGENTS_NAMES VARCHAR(100),
AGENTS_CITY VARCHAR(50),
OCCUPATION CHAR(100),
AMOUNT MONEY
)

SELECT * FROM AGENT1
SELECT * FROM AGENT2
-------------------------------------------------------

INSERT INTO AGENT1 VALUES ('JOHN', 'PUNE', 'CLERK', 100),
						  ('LEE', 'CHENNAI', 'SERVICE', 200), 
						  ('MIKE', 'MUMBAI', 'CONTRACTOR', 300), 
						  ('KING', 'KOLKATA', 'BUSINESS', 400);

INSERT INTO AGENT2 VALUES ('JOHN', 'PUNE', 'CLERK', 100),
						  ('KING', 'KOLKATA', 'BUSINESS', 400),
						  ('CHARLIE', 'NOIDA', 'BUSINESS', 10000), 
						  ('TOM', 'DELHI', 'SERVICE', 2500);

------------------------------------------------------------
SELECT * FROM AGENT1
UNION
SELECT * FROM AGENT2
-------------------------------------------------------------

-------------------------------------------------------------
SELECT * FROM AGENT1
UNION ALL
SELECT * FROM AGENT2
-------------------------------------------------------------

-------------------------------------------------------------
SELECT * FROM AGENT1
INTERSECT
SELECT * FROM AGENT2
-------------------------------------------------------------

-------------------------------------------------------------
SELECT * FROM AGENT1
EXCEPT
SELECT * FROM AGENT2
-------------------------------------------------------------