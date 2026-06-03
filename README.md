# Desafio DIO - Projeto E-commerce

Este projeto faz parte de um **desafio proposto pela DIO (Digital Innovation One)**, cujo objetivo foi **implementar um banco de dados completo para um e-commerce**, desde a modelagem relacional até a persistência de dados e consultas SQL.

---

## 📌 Objetivo do Projeto

- Criar o **modelo relacional** para um cenário de e-commerce.
- Implementar todas as **tabelas com suas relações**, incluindo:
  - Clientes (Pessoa Física e Jurídica)
  - Produtos
  - Pedidos
  - Pagamentos
  - Delivery
  - Fornecedores e Vendedores
  - Estoques e Localização de produtos
  - Relacionamentos N:N (produto x pedido, produto x vendedor, produto x fornecedor)
- Popular o banco de dados com **dados fictícios** para testes.
- Criar **queries SQL** que demonstram:
  - Recuperações simples (`SELECT`)
  - Filtros (`WHERE`)
  - Atributos derivados
  - Ordenações (`ORDER BY`)
  - Agrupamentos e filtros por grupos (`GROUP BY` e `HAVING`)
  - Junções de tabelas (`JOIN`) para consultas mais complexas

---

## 🗂 Estrutura do Banco

- **clients** – tabela base de clientes
- **naturalPerson** – clientes Pessoa Física
- **legalPerson** – clientes Pessoa Jurídica
- **product** – produtos disponíveis
- **orders** – pedidos realizados
- **payments** – formas de pagamento
- **delivery** – informações de entrega
- **seller** – vendedores
- **supplier** – fornecedores
- **productOrder** – relação N:N entre produtos e pedidos
- **productSeller** – relação N:N entre produtos e vendedores
- **productSupplier** – relação N:N entre produtos e fornecedores
- **productStorage** – estoque de produtos
- **storageLocation** – localização física dos produtos

--- 

## 💻 Tecnologias Utilizadas

- **MySQL** – para criação do banco de dados e execução de queries.
- **Git & GitHub** – para versionamento e controle do projeto.


# Desafio DIO - Projeto E-commerce

Este projeto faz parte de um **desafio proposto pela DIO (Digital Innovation One)**, cujo objetivo foi **implementar um banco de dados completo para um e-commerce**, desde a modelagem relacional até a persistência de dados e consultas SQL.

---

## 📌 Objetivo do Projeto

- Criar o **modelo relacional** para um cenário de e-commerce.
- Implementar todas as **tabelas com suas relações**, incluindo:
  - Clientes (Pessoa Física e Jurídica)
  - Produtos
  - Pedidos
  - Pagamentos
  - Delivery
  - Fornecedores e Vendedores
  - Estoques e Localização de produtos
  - Relacionamentos N:N (produto x pedido, produto x vendedor, produto x fornecedor)
- Popular o banco de dados com **dados fictícios** para testes.
- Criar **queries SQL** que demonstram:
  - Recuperações simples (`SELECT`)
  - Filtros (`WHERE`)
  - Atributos derivados
  - Ordenações (`ORDER BY`)
  - Agrupamentos e filtros por grupos (`GROUP BY` e `HAVING`)
  - Junções de tabelas (`JOIN`) para consultas mais complexas

---

## 🗂 Estrutura do Banco

- **clients** – tabela base de clientes
- **naturalPerson** – clientes Pessoa Física
- **legalPerson** – clientes Pessoa Jurídica
- **product** – produtos disponíveis
- **orders** – pedidos realizados
- **payments** – formas de pagamento
- **delivery** – informações de entrega
- **seller** – vendedores
- **supplier** – fornecedores
- **productOrder** – relação N:N entre produtos e pedidos
- **productSeller** – relação N:N entre produtos e vendedores
- **productSupplier** – relação N:N entre produtos e fornecedores
- **productStorage** – estoque de produtos
- **storageLocation** – localização física dos produtos

--- 

## 💻 Tecnologias Utilizadas

- **MySQL** – para criação do banco de dados e execução de queries.
- **Git & GitHub** – para versionamento e controle do projeto.


![Modelo Relacional](EcommerceMOdeloRelacional.png)
