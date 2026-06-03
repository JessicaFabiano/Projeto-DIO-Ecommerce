USE ecommerce;

INSERT INTO clients (Fname, Minit, Lname, Address, CPF, CNPJ)
VALUES
-- Pessoas físicas
('Ana', 'M', 'Silva', 'Rua das Flores, 123 - São Paulo', '12345678901', NULL),
('Bruno', 'C', 'Almeida', 'Av. Brasil, 456 - Rio de Janeiro', '23456789012', NULL),
('Carla', 'T', 'Souza', 'Rua Central, 789 - Porto Alegre', '34567890123', NULL),
('Daniel', 'R', 'Oliveira', 'Rua do Sol, 321 - Curitiba', '45678901234', NULL),
('Eduarda', 'G', 'Pereira', 'Av. das Américas, 654 - Florianópolis', '56789012345', NULL),
('Felipe', 'J', 'Costa', 'Rua Bela Vista, 555 - Belo Horizonte', '67890123456', NULL),

-- Empresas
('TechHouse', NULL, NULL, 'Rua da Inovação, 1000 - São Paulo', NULL, '12345678000199'),
('SuperMarket', NULL, NULL, 'Av. Comercial, 2020 - Porto Alegre', NULL, '98765432000188'),
('AgroVale', NULL, NULL, 'Rodovia BR-290, km 45 - Bagé', NULL, '11222333000144'),
('EduTech', NULL, NULL, 'Rua Digital, 707 - Recife', NULL, '55666777000155');


INSERT INTO NaturalPerson (idClient, CPF, birthDate)
VALUES
(1, '12345678901', '1990-05-12'),
(2, '23456789012', '1988-09-23'),
(3, '34567890123', '1995-02-10'),
(4, '45678901234', '1985-07-15'),
(5, '56789012345', '1992-11-02'),
(6, '67890123456', '1998-03-27');

INSERT INTO LegalPerson (idClient, CNPJ, companyName)
VALUES
(7, '12345678000199', 'TechHouse Tecnologia LTDA'),
(8, '23456789000155', 'SuperMarket Comércio de Alimentos SA'),
(9, '34567890000144', 'AgroVale Agropecuária ME'),
(10, '45678901000133', 'EduTech Educação Digital LTDA');



INSERT INTO product (Pname, classification_kids, category, assessment, size)
VALUES
('Notebook Dell', 0, 'Eletrônico', 4.8, '15 polegadas'),
('Smartphone Samsung', 0, 'Eletrônico', 4.7, '6.5 polegadas'),
('Camiseta Polo', 0, 'Vestimenta', 4.5, 'M'),
('Calça Jeans', 0, 'Vestimenta', 4.4, 'G'),
('Carrinho de Brinquedo', 1, 'Brinquedos', 4.9, 'Médio'),
('Boneca Barbie', 1, 'Brinquedos', 4.8, 'Pequeno'),
('Chocolate Ao Leite', 0, 'Alimentos', 4.6, '200g'),
('Biscoito Integral', 0, 'Alimentos', 4.5, '150g'),
('Mesa de Escritório', 0, 'Móveis', 4.7, '1.5m x 0.8m');


INSERT INTO payments (idClient, typePayment, limitAvailable, paymentDate)
VALUES
(1, 'Cartão', 5000.00, '2025-01-10'),
(1, 'Boleto', 2000.00, '2025-02-15'),
(2, 'Cartão', 7000.00, '2025-03-01'),
(3, 'Boleto', 1500.00, '2025-03-20'),
(4, 'Dois cartões', 12000.00, '2025-04-05'),
(5, 'Cartão', 8000.00, '2025-04-15'),
(6, 'Boleto', 1000.00, '2025-05-10'),
(7, 'Cartão', 4000.00, '2025-05-20'),
(8, 'Cartão', 9000.00, '2025-06-01'),
(9, 'Dois cartões', 15000.00, '2025-06-10');

INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, orderDate, idPayment)
VALUES
(1, 'Confirmado', 'Compra de Notebook Dell', 50, FALSE, '2025-10-01', 1),
(1, DEFAULT, 'Compra de Livro Clean Code', DEFAULT, TRUE, '2025-10-02', 2),
(2, 'Cancelado', 'Compra de Smartphone Samsung', 30, FALSE, '2025-10-03', 3),
(2, DEFAULT, 'Compra de Camiseta Polo', DEFAULT, FALSE, '2025-10-04', 4),
(3, 'Confirmado', 'Compra de Calça Jeans', 25, TRUE, '2025-10-05', 5),
(4, DEFAULT, 'Compra de Carrinho de Brinquedo', DEFAULT, FALSE, '2025-10-06', 6),
(4, 'Cancelado', 'Compra de Boneca Barbie', 15, TRUE, '2025-10-07', 7),
(5, 'Confirmado', 'Compra de Chocolate Ao Leite', 20, FALSE, '2025-10-08', 8),
(5, DEFAULT, 'Compra de Biscoito Integral', DEFAULT, FALSE, '2025-10-09', 9),
(6, 'Confirmado', 'Compra de Mesa de Escritório', 150, TRUE, '2025-10-10', 10);


INSERT INTO delivery (idOrder, deliveryStatus, trackingCode, deliveryDate)
VALUES
(1, 'Entregue', 'BR123456789BR', '2025-01-15'),
(2, 'Em trânsito', 'BR987654321BR', '2025-02-05'),
(3, 'Pendente', 'BR555666777BR', NULL),
(4, 'Entregue', 'BR111222333BR', '2025-03-01'),
(5, 'Entregue', 'BR444555666BR', '2025-03-20'),
(6, 'Em trânsito', 'BR888999000BR', NULL),
(7, 'Pendente', 'BR112233445BR', NULL),
(8, 'Entregue', 'BR556677889BR', '2025-04-10'),
(9, 'Em trânsito', 'BR778899001BR', NULL),
(10, 'Entregue', 'BR990011223BR', '2025-04-25');


INSERT INTO seller (CNPJ, CPF, SocialName, contact)
VALUES
('11111111111111', '11111111111', 'Vendedor Alpha', '11999990001'),
('22222222222222', '22222222222', 'Vendedor Beta', '11999990002'),
('33333333333333', '33333333333', 'Vendedor Gamma', '11999990003'),
('44444444444444', '44444444444', 'Vendedor Delta', '11999990004'),
('55555555555555', '55555555555', 'Vendedor Epsilon', '11999990005');

INSERT INTO supplier (CNPJ, SocialName, contact)
VALUES
('11111111000111', 'Fornecedor Alpha', '11988880001'),
('22222222000122', 'Fornecedor Beta', '11988880002'),
('33333333000133', 'Fornecedor Gamma', '11988880003'),
('44444444000144', 'Fornecedor Delta', '11988880004'),
('55555555000155', 'Fornecedor Epsilon', '11988880005');


INSERT INTO productSeller (idSeller, idProduct, quantity)
VALUES 
(1, 11, 5),
(1, 12, 3),
(2, 13, 2),
(2, 14, 4),
(3, 15, 10),
(3, 16, 6),
(4, 17, 3),
(4, 18, 2),
(5, 19, 5),
(5, 20, 8);

INSERT INTO productStorage (StorageLocation, quantity)
VALUES
('Rio de Janeiro', 50),
('São Paulo', 40),
('Minas Gerais', 30),
('Rio Grande do Sul', 25),
('Bahia', 60);

INSERT INTO productSupplier (idSupplier, idProduct, quantity)
VALUES
(1, 1, 50),
(1, 2, 30),
(2, 3, 40),
(2, 4, 20),
(3, 5, 15),
(3, 6, 25),
(4, 7, 35),
(4, 8, 10),
(5, 9, 45),
(5, 10, 50);

INSERT INTO storageLocation (idProduct, idStorage, location)
VALUES
(11, 1, 'RJ'),
(12, 1, 'RJ'),
(13, 2, 'SP'),
(14, 2, 'SP'),
(15, 3, 'MG'),
(16, 3, 'MG'),
(17, 4, 'RS'),
(18, 4, 'RS'),
(19, 5, 'BA'),
(20, 5, 'BA');

INSERT INTO productOrder (idproduct, idorder, Quantity, Status)
VALUES
(11, 1, DEFAULT, 'Disponível'),
(12, 1, 2, 'Disponível'),
(13, 2, DEFAULT, 'Sem estoque'),
(14, 2, 1, 'Disponível'),
(15, 3, DEFAULT, 'Disponível'),
(16, 3, 2, 'Disponível'),
(17, 4, DEFAULT, 'Sem estoque'),
(18, 5, 1, 'Disponível'),
(19, 6, DEFAULT, 'Disponível'),
(20, 6, 2, 'Disponível'),
(11, 7, DEFAULT, 'Disponível'),
(12, 7, 1, 'Sem estoque'),
(13, 8, 2, 'Disponível'),
(14, 8, DEFAULT, 'Disponível'),
(15, 9, 1, 'Disponível'),
(16, 10, DEFAULT, 'Sem estoque');



select * from product;


desc product;
show tables;