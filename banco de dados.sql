-- BANCO DE DADOS: CAFETERIA AROMA CAFÉ
-- Autor: João (atividade SENAC)
-- Objetivo: Praticar comandos DDL e DML em SQL

-- 🧱 CRIAÇÃO DO BANCO DE DADOS (DDL)
CREATE DATABASE cafeteria_aroma;
USE cafeteria_aroma;
-- TABELA: CLIENTES
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15)
);
-- TABELA: PRODUTOS
CREATE TABLE Produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);
-- TABELA: PEDIDOS
CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE DEFAULT (CURRENT_DATE),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
-- TABELA: ITENS DO PEDIDO
CREATE TABLE Itens_Pedido (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT DEFAULT 1,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- INSERÇÃO DE DADOS (DML)

-- CLIENTES
INSERT INTO Clientes (nome, email, telefone) VALUES
('Ana Souza', 'ana@email.com', '11988887777'),
('Carlos Lima', 'carlos@email.com', '11999995555'),
('Beatriz Oliveira', 'bia@email.com', '11977776666');

-- PRODUTOS
INSERT INTO Produtos (nome, preco, estoque) VALUES
('Café Expresso', 7.50, 100),
('Cappuccino', 9.00, 80),
('Pão de Queijo', 5.00, 50),
('Bolo de Chocolate', 6.50, 30);

-- PEDIDOS
INSERT INTO Pedidos (cliente_id, valor_total) VALUES
(1, 22.00),
(3, 15.50);

-- ITENS DO PEDIDO
INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 4, 1);

-- CONSULTAS E ATUALIZAÇÕES (DML)
-- Visualizar todos os clientes
SELECT * FROM Clientes;

-- Ver produtos disponíveis
SELECT * FROM Produtos;

-- Atualizar estoque após venda
UPDATE Produtos 
SET estoque = estoque - 3 
WHERE produto_id IN (1,3);

-- Excluir cliente (exemplo)
DELETE FROM Clientes WHERE cliente_id = 2;

-- Mostrar pedidos e clientes
SELECT 
    p.pedido_id,
    c.nome AS cliente,
    p.data_pedido,
    p.valor_total
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.cliente_id;

-- Mostrar itens de um pedido
SELECT 
    i.pedido_id,
    pr.nome AS produto,
    i.quantidade
FROM Itens_Pedido i
JOIN Produtos pr ON i.produto_id = pr.produto_id;