use Northwind

-- 1. Get USA and UK Customer's List and their Contact Information. (Table:Customers)
select CompanyName, ContactName, Phone, Fax from Customers where Country in ('USA','UK');

-- 2. Get Customer List who are from USA or from SP Region of Brazil(Table:Customers)
select CompanyName from Customers where Country in ('USA') or Region in ('Brazil');

-- 3. Gell all the CustomerID and OrderID for order placed in third quarter of 1997.(Table:Orders) 
select CustomerID, OrderID, OrderDate from Orders where year(orderdate) = 1997 and DATEPART(quarter,orderdate)=3;

-- 4. Get the Customer who's Company Name starts with either A, B, C, D, E, F or G and ends with N or E.(Table:Customers)
select CompanyName from Customers where CompanyName like '[abcdefg]%' and CompanyName like '%[ne]';

-- 5. Get the list of Customers where Company Name's 2nd letter Consonant.(table:Customers) 
select CompanyName, ContactName from Customers where CompanyName like '_[^aeiou]%';

-- 7. We acquire new Shipper and it does not ship to PO Box. Generate the list of Customers which has PO Box Address.(Table:Customers)
select companyname, Address from Customers where Address like '%P.O%';

-- 8. Get the Customer Count by (Table:Customers) i. Country ii. Country, Region iii. Country, Region, City
-- i. Country
select Country, COUNT(*) as [No. of Customers] from Customers GROUP BY Country;

-- ii. Country, Region
select Country, region, COUNT(*) as [No. of Customers] from Customers GROUP BY Country, Region;

-- iii. Country Region City
select Country, region, City, COUNT(*) as [No. of Customers] from Customers GROUP BY Country, Region, City;


-- 9. The Company wants to increase its relationship with higher ranking officers of Customer. Get the Count of Contact's person by their title.(Table:Customers)
select ContactTitle, COUNT(ContactName) from Customers group by ContactTitle;

-- 10. Get the list of Customers and Numbers of Orders place by each customer till date.(Table: Orders)
select CustomerID, count(OrderID) as [Order Number] from Orders group by CustomerID;

-- 11. Get the top 10 Customers who has placed most order till date. (Table: Orders)
select top 10 CustomerID, COUNT(Orderid) as [Order Number] from Orders GROUP BY CustomerID order by count(orderid) desc; 

-- 12. Get Customers list who has placed 5 or more order till date (Table: Orders)
SELECT CustomerID, COUNT(OrderID) as [Order Number] from Orders GROUP BY CustomerID HAVING COUNT(OrderID) >= 5;  

-- 13. Get the Order Count by (Table: Orders)
-- i. Each Year (Hint: YEAR() function)
SELECT YEAR(OrderDate) as [Year], COUNT(OrderID) as [Order Count] from Orders group by YEAR(OrderDate); 

-- ii. Each quarter in each year (Hint: research on DATEPART() function)
SELECT year(OrderDate) as [Year],DATEPART(QUARTER,OrderDate) as [Quarter] , COUNT(OrderID) as [Order Count] FROM Orders GROUP by YEAR(OrderDate),DATEPART(QUARTER,OrderDate) order by count(orderid) desc;
 
-- iii. -- ii. Each Month in each year (Hint: research on DATEPART() function)
SELECT YEAR(OrderDate) as [Year], DATEPART(MONTH,OrderDate) as [Month], COUNT(OrderiD) as [Order Count] from Orders group by YEAR(OrderDate), DATEPART(month,OrderDate) order by YEAR(OrderDate) desc;


-- 14. Calculate Average, Total, Minimum, and Maximum Frieght paid (Table:Orders) 
-- i. For each Order
SELECT orderid, AVG(freight) as [Average Paid], sum(freight) as [Total Paid], min(freight) as [Minimum Paid], max(freight) as [Maximum Paid] from Orders GROUP by OrderID;

-- ii. For each Company
SELECT CustomerID, AVG(Freight) as [Average Paid], SUM(Freight) as [Total Paid], MIN(Freight) as [Minimum Paid], MAX(Freight) as [Maximum Paid] from Orders GROUP BY CustomerID;

-- iii. For each Country on all Orders
SELECT ShipCountry, AVG(Freight) as [Average Paid], SUM(Freight) as [Total Paid], MIN(Freight) as [Minimum Paid], MAX(Freight) as [Maximum Paid] from Orders GROUP BY ShipCountry;

-- iv. For Each Carrier
SELECT ShipVia, AVG(Freight) as [Average Paid], SUM(Freight) as [Total Paid], MIN(Freight) as [Minimum Paid], MAX(Freight) as [Maximum Paid] from Orders GROUP BY ShipVia;

-- 15.List Total Sale for each Product in each Order (Hint: UnitPrice * Quantity - UnitPrice * Quantity * Discount)
SELECT ProductID, SUM((UnitPrice * Quantity) - (UnitPrice * Quantity * Discount)) as [Total Sale] from [Order Details] GROUP BY ProductID;

-- 16. For each Order Calculate (Table: [Order Details]) 
-- i. Types of Products Ordered (Hint: Count on Product)
SELECT ProductID, COUNT(*) as [Product count] from [Order Details] GROUP BY ProductID;

-- ii. Total Sale for each order
SELECT ProductID, SUM((UnitPrice * Quantity) - (UnitPrice * Quantity * Discount)) as [Total Sale] from [Order Details] GROUP BY ProductID;

-- 17. List total Quantity Ordered for Each Product on all orders.(Table:[Orders Details])
SELECT ProductID, SUM(Quantity) as [Total Quantity Sold] from [Order Details] GROUP by ProductID;

-- 18. List top 10 Most Sold products in quantity in an order.(Table:[Orders Details])
SELECT top 10 ProductID, SUM(Quantity) as [Most Sold Products] from [Order Details] GROUP BY ProductID order by SUM(Quantity) desc;

-- 19. Provide a SQL statement and sample result set that will count orders for all Customers within the Brazil state during the 1997 calendar year sorted by customer name
SELECT c.CompanyName, Count(o.OrderID) as [Order Count] from Customers c left join Orders o on c.CustomerID = o.CustomerID where YEAR(OrderDate) = '1997' and o.ShipCountry IN ('Brazil') GROUP by c.CompanyName order by c.CompanyName;

-- 20. Provide a SQL statement and sample result set that will list all Customers within the SP (Brazil) state that have placed 7 or more orders during the 1998 calendar year. 
SELECT CustomerID, COUNT(OrderID) as [Order Count] from Orders where YEAR(OrderDate)='1998' and ShipCountry = 'Brazil' and shipRegion = 'SP' GROUP by CustomerID HAVING COUNT(OrderID) >=7;
 
