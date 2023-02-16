-- 1 Filtro para contagem de territorios por região
SELECT RegionID, COUNT(*) AS TotalTerritories
FROM Territories
GROUP BY RegionID;

-- 2 Selecione da tabela order_details todas as ordens que tiveram pelo menos um
-- Item com mais de 50 unidades vendidas

SELECT * FROM [Order Details];

SELECT OrderID
    FROM [Order Details] AS orde
    WHERE orde.OrderID = orde.OrderID
    AND Quantity > 50

SELECT * FROM Employees;

-- 3 qual o tempo medio de envio por cidade de destino?

SELECT Orders.ShipCity AS Cidade, 
  AVG(DATEDIFF(DAY, Orders.OrderDate, Orders.ShippedDate)) AS	tempo_medio_dias
FROM Orders 
GROUP BY Orders.ShipCity
ORDER BY Orders.ShipCity;

-- 4 Para cada empregado exiba seu total de vendas em cada país.

SELECT 
  Employees.FirstName, 
  Customers.Country, 
  SUM([Order Details].Quantity * [Order Details].UnitPrice) AS VendaTotal
FROM 
  Employees 
  JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
  JOIN Customers ON Orders.CustomerID = Customers.CustomerID 
  JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
GROUP BY 
  Employees.FirstName, 
  Customers.Country
ORDER BY Employees.FirstName;

-- 5 Calcule o preço de cada pedido apos os preços serem aplicados.

SELECT orde.OrderID,[Order Details].UnitPrice * ( 1 - [Order Details].Discount) AS ValorTotal
FROM Orders AS orde
  JOIN [Order Details] ON orde.OrderID = [Order Details].OrderID 
  JOIN Products ON [Order Details].ProductID = Products.ProductID;

-- 6 Crie uma view chamada ProductDetails que mostre ProductID, Company-name, 
--CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsIntStock, UnitOnOrder, 
--ReorderLevel, Discontinued das tabelas Supplier, Products a Categories

CREATE VIEW ProductDetails AS (
SELECT p.ProductID, s.CompanyName, c.CategoryName,c.Description, p.QuantityPerUnit, 
       p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
FROM Products p
	JOIN Suppliers s ON p.SupplierID = s.SupplierID
	JOIN Categories c ON p.CategoryID = c.CategoryID);

DROP VIEW ProductDetails;

SELECT * FROM ProductDetails;
