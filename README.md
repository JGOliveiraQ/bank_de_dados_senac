# **📚 Modelo de Banco de Dados – Sistema de Cadastro**

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange)
![Workbench](https://img.shields.io/badge/Workbench-EER%20Modeling-lightgrey)

Este projeto apresenta um **modelo de banco de dados relacional** criado para estudo, utilizando o **MySQL Workbench**.  
O sistema simula um pequeno cadastro contendo dados pessoais, contatos e endereços — ideal para quem está aprendendo modelagem, chaves primárias e estrangeiras.

---

## **📑 Índice**
1. [Descrição do Projeto](#-descrição-do-projeto)  
2. [Estrutura do Banco de Dados](#-estrutura-do-banco-de-dados)  
3. [Modelo Conceitual / DER](#-modelo-conceitual--der)  
4. [Script SQL](#-script-sql)  
5. [Como Criar no MySQL Workbench](#-como-criar-no-mysql-workbench)  
6. [Tecnologias Utilizadas](#-tecnologias-utilizadas)  
7. [Licença](#-licença)

---

## **📝 Descrição do Projeto**
Este banco de dados foi desenvolvido com foco em **organização, boas práticas e estrutura clara**.  
Ele é composto por três entidades principais:

- **Pessoas** – dados gerais do usuário  
- **Contatos** – informações de contato vinculadas a uma pessoa  
- **Endereços** – dados de localização física relacionados a cada pessoa  

O objetivo é fortalecer o entendimento de modelagem relacional e relacionamentos 1:N.

---

## **🧱 Estrutura do Banco de Dados**

### **🟦 Tabela: Pessoas**
| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | INT (PK) | Identificador único |
| `nome` | VARCHAR(100) | Nome completo |
| `cpf` | VARCHAR(14) | Documento |
| `data_nascimento` | DATE | Data de nascimento |

---

### **🟩 Tabela: Contatos**
| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | INT (PK) | Identificador único |
| `pessoa_id` | INT (FK) | Relacionado a Pessoas |
| `email` | VARCHAR(100) | Email |
| `telefone` | VARCHAR(20) | Número de telefone |

---

### **🟧 Tabela: Endereços**
| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | INT (PK) | Identificador único |
| `pessoa_id` | INT (FK) | Relacionado a Pessoas |
| `rua` | VARCHAR(100) | Nome da rua |
| `numero` | INT | Número da residência |
| `cidade` | VARCHAR(100) | Cidade |
| `estado` | VARCHAR(50) | Estado |

---

## **🗺️ Modelo Conceitual / DER**

> *(Insira aqui o print do seu diagrama do MySQL Workbench)*  
> Exemplo de estrutura:  
- Pessoas (1) → (N) Contatos  
- Pessoas (1) → (N) Endereços  

---

## **💻 Script SQL**

```sql
CREATE DATABASE modelo_estudo;
USE modelo_estudo;

CREATE TABLE pessoas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    data_nascimento DATE
);

CREATE TABLE contatos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pessoa_id INT,
    email VARCHAR(100),
    telefone VARCHAR(20),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

CREATE TABLE enderecos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pessoa_id INT,
    rua VARCHAR(100),
    numero INT,
    cidade VARCHAR(100),
    estado VARCHAR(50),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

