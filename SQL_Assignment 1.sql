
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
/* Basics Questions:- */
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------


/* 1) Create two Databases Name :- Brands, and  Products */

CREATE DATABASE BRANDS

CREATE DATABASE PRODUCTS

------------------------------------------------------------------------------------

/* 2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database. */

CREATE TABLE ITEMS_TABLE
(
ITEM_ID INT,
ITEM_DESCRIPTION VARCHAR(255),
VENDOR_NOS INT,
VENDOR_NAME CHAR(255),
BOTTLE_SIZE INT,
BOTTLE_PRICE DECIMAL
)


CREATE TABLE PRODUCTS_TABLE
(
PRODUCT_ID INT PRIMARY KEY,
COUNTRY CHAR(150),
PRODUCT VARCHAR(100),
UNIT_SOLD MONEY,
MANUFACTURING_PRICE MONEY,
SALE_PRICE MONEY,
GROSS_SALES MONEY,
SALES MONEY,
COGS MONEY,
PROFIT MONEY,
DATE DATE,
MONTH_NUMBER INT,
MONTH_NAME VARCHAR(100),
YEAR INT
)

----------------------------------------------------------------------------------

/* HANDY QUERY */

SELECT * FROM ITEMS_TABLE

SELECT * FROM PRODUCTS_TABLE

-----------------------------------------------------------------------------------


/*  3) After Creating both the tables Add records in that tables (records are available above)  */


INSERT INTO ITEMS_TABLE VALUES(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77)
INSERT INTO ITEMS_TABLE VALUES (2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12), (3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50), (4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33), (5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97), 
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37), (7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06), (8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61)



INSERT INTO PRODUCTS_TABLE VALUES (1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014);
INSERT INTO PRODUCTS_TABLE VALUES (2, 'Germany', ' Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1, 'January', 2015), 
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016), 
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017), 
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018), 
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, ' December', 2019), 
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, ' March', 2020), 
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);


-----------------------------------------------------------------------------------

/*   4) Delete those product having the Units Sold 1618.5 , 888 and 2470.  */


DELETE FROM PRODUCTS_TABLE
WHERE UNIT_SOLD IN (1618.5, 888, 2470);


-----------------------------------------------------------------------------------

/*  5) DROP the table and Create it again.  */

DROP TABLE ITEMS_TABLE

DROP TABLE PRODUCTS_TABLE

-- For creating tables again, execute the above-mentioned queries again which is create table and insert data.


-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
/* INTERMEDIATE QUESTIONS  */
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

/*  Big Table :--
1) Find the Total Sale Price  and  Gross Sales */

SELECT 
	SUM(SALE_PRICE) AS TOTAL_SALE_PRICE,
	SUM(GROSS_SALES) AS TOTAL_GROSS_SALES
FROM [dbo].[PRODUCTS_TABLE]
 
-----------------------------------------------------------------------------------

/*  2) In which year we have got the highest sales  */

SELECT YEAR
FROM PRODUCTS_TABLE
WHERE SALES = (SELECT MAX(SALES) FROM PRODUCTS_TABLE)

-----------------------------------------------------------------------------------

/*  3) Which Product having the sales of $ 37,050.00  */

SELECT * FROM PRODUCTS_TABLE WHERE SALES = 37050

-----------------------------------------------------------------------------------

/*  4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00  */

SELECT DISTINCT COUNTRY FROM PRODUCTS_TABLE WHERE PROFIT BETWEEN 4605 AND 22662

-----------------------------------------------------------------------------------

/*  5) Which Product Id having the sales of $ 24,700.00  */

SELECT PRODUCT_ID 
FROM PRODUCTS_TABLE
WHERE SALES = 24700;

-----------------------------------------------------------------------------------

/*  Small Table :--
1) Find the item_description having the bottle size of 750  */

SELECT ITEM_DESCRIPTION FROM [dbo].[ITEMS_TABLE]
WHERE BOTTLE_SIZE = 750

-----------------------------------------------------------------------------------

/*  2) Find the vendor Name having the vendor_nos 305 , 380 , 391  */

SELECT DISTINCT VENDOR_NAME FROM ITEMS_TABLE
WHERE VENDOR_NOS IN (305, 380, 391);

-----------------------------------------------------------------------------------

/*  3) What is total Bottle_price  */

SELECT SUM(BOTTLE_PRICE) AS TOTAL_BOTTLE_PRICE FROM [dbo].[ITEMS_TABLE]

-----------------------------------------------------------------------------------

/*  4) Make Primary Key to Item_id  */

ALTER TABLE ITEMS_TABLE
ADD CONSTRAINT PK_ITEMS_TABLE PRIMARY KEY (ITEM_ID);

-----------------------------------------------------------------------------------

/*  5) Which item id having the bottle_price of $ 5.06  */

SELECT ITEM_ID FROM ITEMS_TABLE
WHERE BOTTLE_PRICE = 5.06;


-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
/* ADVANCE QUESTIONS  */
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


/*  1) Apply INNER , FULL OUTER , LEFT JOIN types on both the table  */

----INNER JOIN
SELECT * FROM BRANDS.[dbo].[ITEMS_TABLE] 
INNER JOIN 
PRODUCTS.[dbo].[PRODUCTS_TABLE] 
ON
BRANDS.[dbo].[ITEMS_TABLE].ITEM_ID = PRODUCTS.[dbo].[PRODUCTS_TABLE].PRODUCT_ID;


----FULL OUTER JOIN
SELECT * FROM BRANDS.[dbo].[ITEMS_TABLE] 
FULL OUTER JOIN 
PRODUCTS.[dbo].[PRODUCTS_TABLE] 
ON
BRANDS.[dbo].[ITEMS_TABLE].ITEM_ID = PRODUCTS.[dbo].[PRODUCTS_TABLE].PRODUCT_ID;


----LEFT JOIN
SELECT * FROM BRANDS.[dbo].[ITEMS_TABLE] 
LEFT JOIN 
PRODUCTS.[dbo].[PRODUCTS_TABLE] 
ON
BRANDS.[dbo].[ITEMS_TABLE].ITEM_ID = PRODUCTS.[dbo].[PRODUCTS_TABLE].PRODUCT_ID;

-----------------------------------------------------------------------------------

/*  2) Apply  OUTER,  RIGHT JOIN , CROSS JOIN types  on both the table  */

----OUTER JOIN
SELECT * FROM BRANDS.[dbo].[ITEMS_TABLE] AS I
FULL OUTER JOIN
PRODUCTS.[dbo].[PRODUCTS_TABLE] AS P
ON
I.ITEM_ID = P.PRODUCT_ID


----RIGHT JOIN
SELECT * FROM BRANDS.[dbo].[ITEMS_TABLE] I
RIGHT JOIN
PRODUCTS.[dbo].[PRODUCTS_TABLE] P
ON
I.ITEM_ID = P.PRODUCT_ID


----CROSS JOIN
SELECT * FROM BRANDS.[dbo].[ITEMS_TABLE] I
CROSS JOIN
PRODUCTS.[dbo].[PRODUCTS_TABLE] P

-----------------------------------------------------------------------------------

3) Find the item_description and Product having the gross sales of 13,320.00

SELECT I.ITEM_DESCRIPTION, P.PRODUCT FROM BRANDS.[dbo].[ITEMS_TABLE] AS I
INNER JOIN
PRODUCTS.[dbo].[PRODUCTS_TABLE] AS P ON I.ITEM_ID = P.PRODUCT_ID
WHERE P.GROSS_SALES = 13320;

-----------------------------------------------------------------------------------

4) Split the Item_description Column into Columns Item_desc1 and Item_desc2

SELECT
	SUBSTRING(ITEM_DESCRIPTION, 1, CHARINDEX(' ', ITEM_DESCRIPTION) - 1) AS ITEM_DES1,
	SUBSTRING(ITEM_DESCRIPTION, CHARINDEX(' ', ITEM_DESCRIPTION) + 1, LEN(ITEM_DESCRIPTION)) AS ITEM_DESC2
FROM ITEMS_TABLE;

-----------------------------------------------------------------------------------
