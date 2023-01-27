use Northwind

-- 1. Find the Territory names that contain the word 'Santa'
select TerritoryDescription from Territories where TerritoryDescription like '%santa%';

-- 2. Display the Territory names tha begin with the letter 'C'
select TerritoryDescription from Territories where TerritoryDescription like 'c%';

-- 3. Display the territory names that contain 'boro'
select TerritoryDescription from Territories where TerritoryDescription like '%boro%';

-- 4. Display the names and job titles (ContactTitle) of contacts who are also owners
select ContactName,ContactTitle from Customers where ContactTitle like '%owner%';

-- 5. Display the company names and the URLs of those suppliers that have websites.
select CompanyName,HomePage from Suppliers where homepage is not null;

-- 6. Display the company names and the URL column of those suppliers that dont have websites
select CompanyName, HomePage from Suppliers where HomePage is null;

-- 7. Display the names and prices of those products with prices of $50 or more.
select ProductName, UnitPrice from Products where UnitPrice >= 50;

-- 8. Display the names and prices of those products with prices less than $10
select ProductName,UnitPrice from Products where UnitPrice < 10;

-- 9. Display the names and prices of those products with prices of $10 or less
SELECT ProductName,UnitPrice from Products where UnitPrice <= 10;

-- 10. Display the names and prices of those products wiht prices greater than or $15 but less than or equal to $20
select ProductName,UnitPrice from Products where UnitPrice >= 15 and UnitPrice <= 20;

-- 11. Display the product names and UnitsOnOrder of prodcuts with orders pending (UnitsOnOrder greater than zero).
select ProductName,UnitsOnOrder from Products where UnitsOnOrder > 0;

-- 12. Display the names and ages of all emplyees
select FirstName,LastName,DATEDIFF(YEAR,BirthDate,GETDATE()) as [Age] from Employees;

-- 13. Display the number of years each employee has been with Northwind
SELECT firstname, lastname, DATEDIFF(YEAR, HireDate,GETDATE()) as [Years with Northwind] from Employees; 

-- 14. Display the freight total
select SUM(Freight) as [Freight Total] from Orders;

-- 15. Display the 1996 firght total
select SUM(Freight) as [Freight Total] from Orders where YEAR(OrderDate) = '1996' GROUP by YEAR(OrderDate);
/* Should be using
SELECT DATEPART(year,OrderDate) as [Year]
*/

-- 16. Display the 1997 firght total
select SUM(Freight) as [Freight Total] from Orders where YEAR(OrderDate) = '1997' GROUP by YEAR(OrderDate);

-- 17. Display the 1998 firght total
select SUM(Freight) as [Freight Total] from Orders where YEAR(OrderDate) = '1998' GROUP by YEAR(OrderDate);

-- 18. Display the OrderID, and ShipCpuntry of orders to Switerland, Venezuela, and Austria.
select OrderID, ShipCountry from Orders where ShipCountry IN ('Switzerland', 'Venezuela', 'Austria');

-- 19. Display the names of cites, (just once each city) in Belgium, Mexico, and Sweden to which orders were shipped.
select  distinct ShipCity from Orders where ShipCountry in ('Belgium', 'Mexico', 'Sweden');

-- 20. Display the names of all products in the Dairy Products, Seafood, and Beverages categories.
SELECT categoryname, ProductName from categories c JOIN products p on c.categoryid = p.categoryid
where categoryname;
