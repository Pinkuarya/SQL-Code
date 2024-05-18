

/*  Q1) Create   Database Name as Order_Stores_Data  */

USE ORDER_STORES_DATA

----------------------------------------------------------------------

/*  Q2) Create two Table names as Orders_Table and Stores_Table  */

CREATE TABLE ORDERS_TABLE
(
ORDER_DATE DATE,
REGION CHAR(50),
REP VARCHAR(50),
ORDER_ITEM VARCHAR(100),
UNITS INT,
UNIT_COST DECIMAL(5,2),
TOTAL_PRICE MONEY,
ORDER_ID INT
)


CREATE TABLE STORES_TABLE
(
STORE_ID INT,
STORE_TYPE CHAR(10),
ASSORTMENT INT,
COMPETITION_DISTANCE INT,
MONTH INT,
YEAR INT,
PROMOINTERVAL VARCHAR(50)
)

----------------------------------------------------------------------

SELECT * FROM ORDERS_TABLE

SELECT * FROM STORES_TABLE

----------------------------------------------------------------------

/*  Q3) Insert All records present here in the Orders_table and Stores_Table.  */

INSERT INTO ORDERS_TABLE VALUES ('2021-01-06', 'EAST', 'ARUNA', 'PENCIL', 95, 1.99, 189.05, 1), ('2021-01-23', 'CENTRAL', 'KIVELL', 'ERASER', 50, 19.99, 999.50, 2), 
('2021-02-09', 'CENTRAL', 'GANESH', '', 36, 4.99,  179.64, 3), ('2021-02-26', 'CENTRAL', 'PAYAL', '', 27, 19.99, 539.73, 4), ('2021-03-15', 'WEST', 'SORVINO', '', 56, 2.99, 167.44, 5),
('2021-04-01', 'EAST', 'HITESH', 'PENCIL', 60, 4.99, 299.40, 6),
('2021-04-18', 'CENTRAL', 'AKSHITA', '', 75, 1.99, 149.25, 7), ('2021-05-05', 'CENTRAL', 'RUCHIKA', 'BOOKS', 90, 4.99, 449.10, 8),
('2021-05-22', 'WEST', 'SURBHI', '', 32, 1.99, 63.68, 9), ('2021-06-08', 'EAST', 'JONES', 'SUITCASE', 60, 8.99, 539.40, 10)


INSERT INTO STORES_TABLE VALUES (1, 'C', 27, 1270, 9, 2008, 'JAN'), (2, 'A', 46, 570, 11, 2007, 'FEB'),
(3, 'A', 21, 14130, 12, 2006, 'MAR'), (4, 'C', 11, 620, 9, 2009, ''),
(5, 'A', 47, 29910, 4, 2015, 'MAY'), (6, 'A', 36, 310, 12, 2013, 'JUNE'),
(7, 'A', 44, 24000, 4, 2013, ''), (8, 'A', 31, 7520, 10, 2014, 'AUG'),
(9, 'A', 43, 2030, 8, 2000, ''), (10, 'A', 10, 3160, 9, 2009, 'OCT')

----------------------------------------------------------------------

/*  Q3) Make Order_Id  Column as Primary Key.  */

-- Alter the column to make it not nullable
ALTER TABLE ORDERS_TABLE
ALTER COLUMN ORDER_ID INT NOT NULL;

-- Add the primary key constraint
ALTER TABLE ORDERS_TABLE
ADD CONSTRAINT PK_ORDERS_TABLE PRIMARY KEY (ORDER_ID)

----------------------------------------------------------------------

/*  Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.  */

ALTER TABLE STORES_TABLE
ADD STORE_NAMES VARCHAR(50)

UPDATE STORES_TABLE
SET STORE_NAMES = CASE STORE_ID
                    WHEN 1 THEN 'CAR'
                    WHEN 2 THEN 'BIKES'
                    WHEN 3 THEN 'HARDWARE'
                    WHEN 4 THEN 'ELECTRICS'
                    WHEN 5 THEN 'FIBERS'
                    WHEN 6 THEN 'ELASTICS'
                    WHEN 7 THEN 'BOOKS'
                    WHEN 8 THEN 'SHOES'
                    WHEN 9 THEN 'CLOTHES'
                    WHEN 10 THEN 'SCRAPS'
                    ELSE NULL
                  END
WHERE STORE_ID BETWEEN 1 AND 10;

----------------------------------------------------------------------

/*  Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table  */

ALTER TABLE STORES_TABLE
ALTER COLUMN STORE_ID INT NOT NULL;

ALTER TABLE STORES_TABLE
ADD CONSTRAINT FK_STORES_TABLE
FOREIGN KEY (STORE_ID) REFERENCES ORDERS_TABLE (ORDER_ID)

----------------------------------------------------------------------

/*  Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet  */

UPDATE ORDERS_TABLE
SET ORDER_ITEM = 'COMPASS'
WHERE ORDER_ID = 3;

UPDATE ORDERS_TABLE
SET ORDER_ITEM = 'TORCH'
WHERE ORDER_ID = 4;

UPDATE ORDERS_TABLE
SET ORDER_ITEM = 'PHONE'
WHERE ORDER_ID = 5;

UPDATE ORDERS_TABLE
SET ORDER_ITEM = 'LAPTOP'
WHERE ORDER_ID = 7;

UPDATE ORDERS_TABLE
SET ORDER_ITEM = 'BOX'
WHERE ORDER_ID = 9;

----------------------------------------------------------------------

/*  Q7) Update the missing records in the PromoInterval Column in Stores Table.  */

UPDATE STORES_TABLE
SET PROMOINTERVAL = CASE
WHEN STORE_ID=4 THEN 'APRIL'
WHEN STORE_ID=7 THEN 'JULY'
WHEN STORE_ID=9 THEN 'SEP'
ELSE PROMOINTERVAL
END

----------------------------------------------------------------------

/*  Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.  */

-- Step 1: Add a new column with the new name
ALTER TABLE STORES_TABLE
ADD STORE_NOS INT;

-- Step 2: Update the new column with data from the old column
UPDATE Stores_Table
SET STORE_NOS = ASSORTMENT;

-- Step 3: Drop the old column
ALTER TABLE Stores_Table
DROP COLUMN Assortment;

----------------------------------------------------------------------

/*  Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.  */

ALTER TABLE ORDERS_TABLE
ADD ITEM_NAME VARCHAR(50);

UPDATE ORDERS_TABLE
SET ITEM_NAME = ORDER_ITEM

ALTER TABLE ORDERS_TABLE
DROP COLUMN ORDER_ITEM

ALTER TABLE ORDERS_TABLE
ADD CUSTOMERS_NAME VARCHAR(50);

UPDATE ORDERS_TABLE
SET CUSTOMERS_NAME = REP;

ALTER TABLE ORDERS_TABLE
DROP COLUMN REP;

----------------------------------------------------------------------

/*  Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.  */

SELECT * FROM ORDERS_TABLE
ORDER BY UNIT_COST  DESC;

SELECT * FROM ORDERS_TABLE
ORDER BY TOTAL_PRICE ASC;

----------------------------------------------------------------------

/*  Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.  */

ALTER TABLE ORDERS_TABLE
ADD CUS_NAME VARCHAR(50);

UPDATE ORDERS_TABLE
SET CUS_NAME = CUSTOMERS_NAME;

ALTER TABLE ORDERS_TABLE
DROP COLUMN CUSTOMERS_NAME;

SELECT REGION, COUNT(CUS_NAME) AS NUM_CUS_NAME
FROM ORDERS_TABLE
GROUP BY Region;

----------------------------------------------------------------------

/*  Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table.  */

SELECT SUM(TOTAL_PRICE) AS TOTAL_PRICE_SUM, SUM(UNIT_COST) AS UNIT_COST_SUM FROM ORDERS_TABLE;

----------------------------------------------------------------------

/*  Q13) Show me OrderDate, Unit Cost, StoreType and Year in One table and names that table as Order_Stores_Table.  */

SELECT O.ORDER_DATE AS ORDERDATE, O.UNIT_COST AS UNITCOST, S.STORE_TYPE AS STORETYPE, S.YEAR AS Year
INTO ORDER_STORES_TABLE
FROM ORDERS_TABLE O
JOIN STORES_TABLE S ON O.ORDER_ID = S.STORE_ID;

----------------------------------------------------------------------

/*  Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9  */

SELECT ITEM_NAME, REGION FROM ORDERS_TABLE
WHERE ORDER_ID IN (4, 5, 6, 9);

----------------------------------------------------------------------

/*  Q15) Show me year whose ComptetitionDistance is 29910  , 310 , 3160.  */

SELECT YEAR FROM STORES_TABLE 
WHERE COMPETITION_DISTANCE IN (29910, 310, 3160);

----------------------------------------------------------------------

/*  Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400.  */

SELECT ITEM_NAME FROM ORDERS_TABLE
WHERE TOTAL_PRICE > 200 AND TOTAL_PRICE < 400;

----------------------------------------------------------------------

/*  Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.  */

ALTER TABLE STORES_TABLE
ADD CD INT;

UPDATE STORES_TABLE
SET CD = COMPETITION_DISTANCE

ALTER TABLE STORES_TABLE
DROP COLUMN COMPETITION_DISTANCE

SELECT SUM(CD) AS TOTAL_CD FROM STORES_TABLE;
----------------------------------------------------------------------

/*  Q18) What is the Total Count of Stores_Type and CD columns.  */

SELECT COUNT(STORE_TYPE) AS TOTAL_STORES_TYPE, COUNT(CD) AS TOTAL_CD
FROM STORES_TABLE;

----------------------------------------------------------------------

/*  Q19) Apply the Cross Join in  Orders_Table and Stores_Table.  */

SELECT * FROM ORDERS_TABLE
CROSS JOIN 
STORES_TABLE;

----------------------------------------------------------------------

/*  Q20) DROP both the databases.  */

DROP DATABASE ORDER_STORES_DATA

----------------------------------------------------------------------