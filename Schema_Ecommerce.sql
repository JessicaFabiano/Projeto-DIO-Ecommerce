-- Criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Minit CHAR(3),
    Lname VARCHAR(50),
    Address VARCHAR(100),
    BirthDate DATE,
    CPF CHAR(11),
    CNPJ CHAR(14),
    CONSTRAINT chk_tipo_cliente CHECK (
        (CPF IS NOT NULL AND CNPJ IS NULL) 
        OR 
        (CPF IS NULL AND CNPJ IS NOT NULL)
    ),
    CONSTRAINT unique_cpf UNIQUE (CPF),
    CONSTRAINT unique_cnpj UNIQUE (CNPJ)
);

CREATE TABLE NaturalPerson (
    idClient INT PRIMARY KEY,
    CPF CHAR(11) NOT NULL,
    birthDate DATE,

    CONSTRAINT fk_naturalperson_client 
        FOREIGN KEY (idClient) REFERENCES clients(idClient),

    CONSTRAINT unique_cpf UNIQUE (CPF)
);

CREATE TABLE LegalPerson (
    idClient INT PRIMARY KEY,
    CNPJ CHAR(14) NOT NULL,
    companyName VARCHAR(100) NOT NULL,

    CONSTRAINT fk_legalperson_client 
        FOREIGN KEY (idClient) REFERENCES clients(idClient),

    CONSTRAINT unique_cnpj UNIQUE (CNPJ)
);

CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    assessment FLOAT DEFAULT 0,
    size VARCHAR(20)
);

CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailable FLOAT,
    paymentDate DATE,
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    orderDate DATE DEFAULT (CURRENT_DATE),
    idPayment INT,
    CONSTRAINT fk_order_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_order_payment FOREIGN KEY (idPayment) REFERENCES payments(idPayment)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE delivery (
    idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    idOrder INT,
    deliveryStatus ENUM('Pendente', 'Em trânsito', 'Entregue', 'Cancelado') DEFAULT 'Pendente',
    trackingCode VARCHAR(30),
    deliveryDate DATE,
    CONSTRAINT fk_delivery_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    contact CHAR(11)
);

CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) UNIQUE,
    CPF CHAR(11) UNIQUE,
    contact CHAR(11)
);

CREATE TABLE productSeller (
    idSeller INT,
    idProduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idSeller, idProduct),
    CONSTRAINT fk_productSeller_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_productSeller_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE productOrder (
    idProduct INT,
    idOrder INT,
    quantity INT DEFAULT 1,
    status ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idProduct, idOrder),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_productOrder_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE storageLocation (
    idProduct INT,
    idStorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProduct, idStorage),
    CONSTRAINT fk_storageLocation_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_storageLocation_storage FOREIGN KEY (idStorage) REFERENCES productStorage(idProdStorage)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE productSupplier (
    idSupplier INT,
    idProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idSupplier, idProduct),
    CONSTRAINT fk_productSupplier_supplier FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_productSupplier_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
        ON UPDATE CASCADE ON DELETE CASCADE
);