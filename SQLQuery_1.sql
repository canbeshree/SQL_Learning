SELECT * from customer

SELECT * from product

SELECT * from sales

--4 Select all products with the brand “Cacti Plus”
SELECT * from product
where brand = 'Cacti Plus' 

--5 Count of total products with product category=” Skin Care”
SELECT COUNT (*)
FROM product
WHERE category = 'Skin Care'

--6 Count of total products with MRP more than 100
SELECT COUNT (*)
FROM product
WHERE mrp > 100

--7 Count of total products with product category=” Skin Care” and MRP more than 100
SELECT COUNT (*)
FROM product
WHERE category = 'Skin Care' AND mrp > 100  

--8 Brandwise product count
SELECT product.brand, count (product.product_id) 
FROM product	
GROUP BY brand

--9 Brandwise as well as Active/Inactive Status wise product count
SELECT product.brand,
	SUM(case when active = 'Y' then 1 else 0 end) as active,
	SUM(case when active = 'N' then 1 else 0 end) as inactive,
	COUNT(*) AS totals
FROM product
GROUP BY brand

--10 Display all columns with Product category in Skin Care or Hair Care
SELECT * 
FROM product
WHERE category = 'Skin Care' or category ='Hair Care'

--11 Display all columns with Product category in Skin Care or Hair Care, and MRP more than 100
SELECT * 
FROM product
WHERE (category = 'Skin Care' or category ='Hair Care' ) and mrp >100

--12 Product category=”Skin Care” and Brand=”Pondy”, and MRP more than 100

SELECT *
FROM product
WHERE category = 'Skin Care' and brand = 'Pondy' and mrp >100

--13 Display all columns with Product category =” Skin Care” or Brand=” Pondy”, and more than 100
SELECT *
FROM product
WHERE (category ='Skin Care' or brand = 'Pondy') and mrp >100

--14 Display all product names only with names starting from the letter P
SELECT product_name
FROM product
WHERE product_name LIKE 'P%'

--15 Display all product names only with names Having letters “Bar” in Between
SELECT product_name
FROM product
WHERE product_name LIKE '%Bar%'

--16 Sales of those products which have been sold in more than two quantities in a bill
SELECT *
FROM sales
WHERE qty > 2

--17 Sales of those products which have been sold in more than two quantities throughout the bill
SELECT product_id, SUM(qty)
FROM sales
GROUP BY product_id
HAVING SUM(qty) >2 

--18 Create a new table with columns username and birthday, and dump data from dates file

CREATE TABLE person(
    name varchar(50),
    birthdate DATE
)

BULK INSERT dbo.person
FROM 'C:/Users/shree/OneDrive/Desktop/QA_SQL/DatabaseProjectecommerce/dates.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
)

SELECT* From person

/*19  find no of people sharing
Birth date(full date)
Birth month
Weekday
*/
SELECT COUNT(name) 
FROM person 
WHERE birthdate 
    IN (
     SELECT birthdate
     FROM person
     GROUP BY birthdate
     HAVING COUNT(birthdate) > 1
    )

SELECT DATEPART(MONTH, birthdate) as Week, COUNT(*) as Number_of_People 
FROM person
GROUP BY DATEPART(MONTH, birthdate) 
HAVING count(*)>1

SELECT DATEPART(WEEKDAY, birthdate) as week, COUNT(*) as Number_of_People 
FROM person
GROUP BY DATEPART(WEEKDAY, birthdate) 
HAVING count(*)>1

--19 Find the current age of all people
SELECT   *, DATEDIFF(year, birthdate, GETDATE()) Age
FROM     person
