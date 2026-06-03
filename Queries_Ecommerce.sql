use ecommerce;

-- Mostra toda tabela clientes
SELECT * FROM clients;

-- Lista os produtos disponíveis 
SELECT Pname, category, size 
FROM product
WHERE idProduct IN (SELECT idproduct FROM productOrder WHERE poStatus = 'Disponível');

-- 
--  Lista pedidos confirmado de um cliente em específico 

SELECT o.idOrder, o.orderDescription, o.orderStatus, c.Fname, c.Lname
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
WHERE c.idClient = 1 AND o.orderStatus = 'Confirmado';

-- Total de pedidos por cliente 
SELECT 
    c.idClient,
    concat(c.Fname, ' ', c.Lname) as Complet_name,
    COUNT(o.idOrder) AS totalPedidos 
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, c.Fname, c.Lname;
