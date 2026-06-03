-- inserção de dados e queries

use ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)
values ('Maria', 'M', 'Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
       ('Matheus', 'O', 'Pimentel', 987654321, 'rua alameda 289, Centro - Cidade das flores'),
       ('Ricardo', 'F', 'Silva', 45678913, 'avenida alameda vinha 1009, Centro - Cidade das flores'),
       ('Julia', 'S', 'França', 789123456, 'rua laranjeiras 861, Centro - Cidade das flores'),
       ('Roberta', 'G', 'Assis', 98745631, 'avenida koller 19, Centro - Cidade das flores'),
       ('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, classification_kids boolean, category('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliation, size) values
							('Fone de ouvido', false, 'Eletrônico', '4', null),
							('Barbie Elsa', true, 'Brinquedos', '3', null),
							('Body Carters', true, 'Vestimenta', '5', null),
							('Microfone Vedo - Youtuber', false, 'Eletrônico', '4', null),
							('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
							('Farinha de arroz', false, 'Alimentos', '2', null),
							('Fire Stick Amazon', false, 'Eletrônico', '3', null);
                            
select * from clients;
select * from product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

-- delete from orders where idOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
							(1, default, 'compra via aplicativo', null, 1),
							(2, default, 'compra via aplicativo', 50, 0),
							(3, 'Confirmado', null, null, 1),
                            (4,null,'compra via web site','150',0);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
							(1,1,2,null),
							(2,1,1,null),
							(3,2,1,null);

-- storageLocation, quantity
insert into productStorage (StorageLocation, quantity) values
							('Rio de Janeiro', 50),
							('São Paulo', 40),
							('Minas Gerais', 30),
							('Rio Grande do Sul', 25),
							('Bahia', 60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						(1, 1, 'RJ'),
						(2, 1, 'RJ'),
						(3, 2, 'SP'),
						(4, 2, 'SP'),
						(5, 3, 'MG'),
						(6, 3, 'MG'),
						(7, 4, 'RS');

-- IdSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
							('Fornecedor Alpha','11111111000111','11988880001'),
							('Fornecedor Beta','22222222000122','11988880002'),
							('Fornecedor Gamma','33333333000133','11988880003'),
							('Fornecedor Delta','44444444000144','11988880004'),
							('Fornecedor Epsilon','55555555000155','11988880005');

select * from supplier;

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						(1, 1, 50),
						(1, 2, 30),
						(2, 3, 40),
						(2, 4, 20),
						(3, 5, 15),
						(3, 6, 25),
						(4, 7, 35);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
('Botique Durgas', null,1396018000000, 123456783, 'Rio de Janeiro', 219567895),
('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idProduct,prodQuantity) values
						(4, 6, 50),
						(5, 7, 30);

select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

-- Especificar os pedidos
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
							(2, default, 'compra via aplicativo', null,1);

select count(*) from clients c, orders o
			where c.idClient = idOrderClient;

-- Recuperação de pedido com produto associado
select * from clients c
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p ON p.idPOorder = o.idOrder
			group by idClient;

-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_orders from clients c
					inner join orders o ON c.idClient = o.IdOrderClient
		group by idClient;

insert into payments (idClient, id_payment, typePayment, limitAvaliable) values
					(1, 2, 'Cartão', 5000.00),
					(1, 3, 'Boleto', 2000.00),
					(2, 4, 'Cartão', 7000.00),
					(3, 5, 'Boleto', 1500.00),
					(4, 6, 'Dois cartões', 12000.00),
					(5, 7, 'Cartão', 8000.00);


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


