use ecommerce;

-- Mostra toda tabela clientes
SELECT * FROM clients;

-- Lista os produtos disponíveis 
SELECT Pname, category, assessment, size 
FROM product
WHERE idProduct IN (SELECT idproduct FROM productOrder WHERE Status = 'Disponível');

-- 
--  Lista pedidos confirmado de um cliente em específico 

SELECT o.idOrder, o.orderDescription, o.orderStatus, c.Fname, c.Lname
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
WHERE c.idClient = 1 AND o.orderStatus = 'Confirmado';

-- Lista produtos com avaliação acima de cima 
SELECT Pname, category, assessment
FROM product
WHERE assessment > 4.7
ORDER BY assessment DESC;

-- Lista o nome completo do cliente com o total de produtos por pedido 

SELECT 
    o.idOrder,
    concat(c.Fname, ' ', c.Lname) as Complet_name,
    SUM(po.Quantity) AS totalProdutos  -- atributo derivado
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
JOIN productOrder po ON o.idOrder = po.idorder
GROUP BY o.idOrder, c.Fname, c.Lname;

-- Total de pedidos por cliente 
SELECT 
    c.idClient,
    concat(c.Fname, ' ', c.Lname) as Complet_name,
    COUNT(o.idOrder) AS totalPedidos 
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, c.Fname, c.Lname;

-- Lista os pedidos com produtos associados e dados do cliente

SELECT c.Fname, c.Lname, o.idOrder, o.orderDescription, p.Pname, po.Quantity, po.Status
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
JOIN productOrder po ON o.idOrder = po.idorder
JOIN product p ON po.idproduct = p.idProduct
ORDER BY o.idOrder;