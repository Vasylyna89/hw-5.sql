
Задача 1.
Вывести общее ко-во поставщиков не из UK и не из China

SELECT
	COUNT(*) AS total_not_uk_china_suppliers
FROM Suppliers

WHERE
	NOT Country IN ('UK', 'China')


Задача 2.
Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT 
  COUNT(*) AS total_orders,  
  MAX(Price) AS max_price,
  MIN(Price) AS min_price,
	AVG(Price) AS avg_price
FROM Products

WHERE
CategoryID IN (3, 5)


Задача 3.
Вывести общую сумму проданных товаров

 SELECT 
   SUM(Price) AS total_sales_amount
 FROM Products


Задача 4.
Вывести данные о заказах (номер заказа, имя клиента, страна клиента, фамилия менеджера, название компании перевозчика)

SELECT 
 Orders.OrderID,
 Customers.CustomerName,
 Customers.Country,
 Employees.LastName,
 Shippers.ShipperName

FROM Orders

JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN 
    Shippers ON Orders.ShipperID = Shippers.ShipperID;

Задача 5.
Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT 
 Suppliers.Country,
 SUM(Products.Price) AS total_sales_germany
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

WHERE
	Suppliers.Country = 'Germany'
