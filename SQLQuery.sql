
---#1
--Select all column for all customers
SELECT *
FROM dbo.Customers

---#2
--Select distinct countries in Customers
SELECT DISTINCT Country
FROM Customers

--#3
-- Select all column for customer id beginning with BL
SELECT *
FROM Customers
WHERE CustomerID LIKE 'BL%'

--#4
--Select top 100 orders
SELECT TOP (100) 
		[OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Northwind].[dbo].[Orders]

  --#5
  --Select all column in customers whose postal code includes 1010 3012 12209 05023
  SELECT *
  FROM dbo.Customers
  WHERE PostalCode IN ('1010','3012','12209','05023')

  --#6
  --Select all column in customers which has a value for region
  SELECT *
  FROM dbo.Customers
  WHERE Region IS NOT NULL

  --#7
  --Select all from customer and order by country then by city
  SELECT *
  FROM Customers
  ORDER BY Country, City


  --#8
  -- Insert a new record into the customer table
  INSERT INTO dbo.Customers
  (CustomerID, CompanyName, ContactName, ContactTitle, [Address], City, Region, PostalCode, Country, Phone)
  VALUES
  ('TCC01','TenderCall Care', 'Sean Mattis', 'CEO', '1722 W 17TH Street', 'Panama City', 'FL', '32405', 'USA', '555-555-5555')


  --#9
  --Update oder and set ship zone equal EuroZone for shipcountry equal France
  UPDATE dbo.Orders
  SET ShipRegion = 'EuroZone'
  WHERE ShipCountry = 'France'


  --#10
  -- Delete all from order details where quantity is 1
  DELETE 
  FROM [Order Details]
  WHERE Quantity = 1


  --#11
  --Select the max, min and average of quantity in order details
  SELECT 
	MIN(Quantity) AS [Quantity Min],
	MAX(Quantity) AS [Quantity Max],
	AVG(Quantity) AS [Quantity Average]
  FROM [Order Details]

SELECT COUNT(Quantity) AS [COUNT]
FROM [Order Details]

  --#12
  --Find the max, min and average quantity in the order table
  SELECT 
	O.OrderID AS [Order Id],
	MIN(O.Quantity) AS [Quantity Min],
	MAX(O.Quantity) AS [Quantity Max],
	AVG(O.Quantity) AS [Quantity Average]
  FROM [Order Details] AS O
  GROUP BY O.OrderID

  --#13
  --Find the customer id for order id equal 10290
  SELECT C.CustomerID AS [Customer ID]
  FROM Customers AS C
  LEFT JOIN dbo.Orders AS O
  ON C.CustomerID = O.CustomerID
  WHERE O.OrderID = '10290'


  --#14
  --Find customer id for order id 10290 using left join
  SELECT C.CustomerID AS [Customer ID]
  FROM dbo.Orders AS O
  LEFT JOIN Customers AS C
  ON O.CustomerID = C.CustomerID
  WHERE O.OrderID = '10290'

  SELECT
	C.ContactName AS [Contact],
	C.CompanyName AS [Company],	
	O.OrderID [Order No.],
	O.OrderDate AS [Date of Order]
  FROM dbo.Orders AS O
  RiGHT JOIN Customers AS C
  ON O.CustomerID = C.CustomerID

   SELECT TOP (10)
	C.ContactName AS [Contact],
	C.CompanyName AS [Company],	
	O.OrderID [Order No.],
	O.OrderDate AS [Date of Order]
  FROM Customers AS C
  INNER JOIN dbo.Orders AS O
  ON C.CustomerID = O.CustomerID

  --#15
  --Select first name of employee who reports to no one
  SELECT FirstName AS [First Name]
  FROM dbo.Employees
  WHERE ReportsTo IS NULL

  --#16
  --Select employees who reported to Andrew
  SELECT FirstName AS [First Name]
  FROM dbo.Employees 
  WHERE ReportsTo = 2

--Select all orders with quantity between 10 and 15 (EXTRA!!!!!!!!!!!!)

SELECT *
FROM dbo.[Order Details]
WHERE Quantity BETWEEN 10 AND 15

