SELECT * FROM Orders;
USE Northwind;

--Qual o custo total de cada tipo de frete?
SELECT ShipVia, SUM(Freight) AS FreteTotal
FROM Orders 
GROUP BY ShipVia
ORDER BY ShipVia;

SELECT * FROM Products;

--Mostre quantos produtos cada fornecedor disponibiliza em cada categoria
SELECT SupplierId, CategoryId,
COUNT(DISTINCT ProductId) AS QuantidadeProduto
FROM Products
Where Discontinued=0
GROUP BY SupplierID, CategoryId
ORDER BY SupplierID, CategoryId;

-- O gerente de vendas da Northwind pede uma serie temporal (mensal) com volume
-- de pedidos e o valor de venda
SELECT * FROM [Order Details]

SELECT FORMAT(o.OrderDate, 'yyyy-MM') AS Mes,
COUNT(DISTINCT(o.OrderID)) AS NumeroPedidos,
ROUND(SUM(od.Quantity*UnitPrice*(1-od.Discount)), 2) AS ValorTotalPedidos
FROM Orders AS o
JOIN [Order Details] AS od ON od.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM');

CREATE FUNCTION EmpregadoNome(@empregadoId int)
RETURNS TABLE
RETURN (
	SELECT FirstName, LastName, HomePhone
	FROM Employees 
	WHERE EmployeeID = @empregadoId
)

SELECT * FROM EmpregadoNome(5)

CREATE FUNCTION funcao_teste(@valor int)
RETURNS INT 
AS
BEGIN
	SET @valor = @valor + 5
RETURN @valor
END
GO;

SELECT dbo.funcao_teste(45)