--Banco de Dados da Biblioteca feito pelo grupo
-- Criação do Banco de Dados
CREATE DATABASE biblioteca;

-- Selecionar o BD para uso
USE biblioteca;

-- Criar tabela cliente
-- Armazena os dados dos Clientes
CREATE TABLE Clientes(
    -- Identificador único (PK - chave primária)
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    -- Nome completo do cliente (obrigatório)
    nome VARCHAR(100) NOT NULL,
    -- Data de nascimento
    data_nascimento DATE,
    -- CPF único para cada cliente (Restrição de unicidade - UNIQUE)
    cpf VARCHAR(14) UNIQUE,
    -- Email do Cliente
    email VARCHAR(100),
    -- Telefone pra contato
    telefone VARCHAR(100) NOT NULL,
    -- Data de Cadastro
    data_cadastro DATE NOT NULL
);

CREATE TABLE autores(
    -- Identificador único autores
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    -- Nome do Autor (Obrigatório - NOT NULL)
    nome VARCHAR(100) NOT NULL,
    -- Área de especialização
    especialidade VARCHAR(100) NOT NULL,
    -- Email do autor
    email VARCHAR(100) NOT NULL UNIQUE,
    -- Telefone para contato
    telefone VARCHAR(20)
);

CREATE TABLE Livros(
    -- Identificador Único do livro
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    -- Título do livro
    nome VARCHAR(100) NOT NULL,
    -- Preço do Livro em reais
    preco_livro DECIMAL(10,2) NOT NULL
);

-- Tabela Gêneros
CREATE TABLE generos (
    -- Identificador Único de generos
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    -- Nome do gênero
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livro_autor_genero(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    id_genero INT NOT NULL,
    ano INT NOT NULL,
    faixaetaria INT NOT NULL,
    
    FOREIGN KEY(id_livro) REFERENCES Livros(id_livro) ON DELETE RESTRICT,
    FOREIGN KEY(id_autor) REFERENCES autores(id_autor) ON DELETE RESTRICT,
    FOREIGN KEY(id_genero) REFERENCES generos(id_genero) ON DELETE RESTRICT
);

-- ===================================================================================================================================================================
-- INSERÇÃO DE DADOS

INSERT INTO Clientes(nome, data_nascimento, cpf, email, telefone, data_cadastro)
VALUES
('kalliny Gomes', '2000-12-12', '000.777,333-99', 'kalliny@gmail.com', '(63) 99999-9888', '2026-06-16'),
('Adriana Gomes', '1987-10-04', '777.999.222-11', 'adriana@gmail.com', '(63) 11111-2222', '2026-04-18'),
('Daniel Gomes', '2015-09-01', '666.667.777-88', 'daniel@gmail.com', '(63) 22222-3333', '2021-09-04');

-- Como id_autor é AUTO_INCREMENT, não passamos o número 1 no início, deixamos o banco gerar, ou listamos o id_autor na declaração.
INSERT INTO autores(nome, especialidade, email, telefone)
VALUES
('Fernando Paz', 'escritor', 'fernandopaz@mail.com', '(63) 99999-8787'),
('Joaquim Manuel De Macedo', 'escritora', 'joaquimmanuel@email.com', '(63) 99999-1111');

INSERT INTO Livros(nome, preco_livro)
VALUES
('O Fantasma da Opera', 150.00), -- O separador decimal em SQL é o PONTO, não a vírgula
('A Moreninha', 36.61);

INSERT INTO generos(nome)
VALUES
('Romance'),
('Fantasia');

-- Ajustado os IDs para corresponderem aos dados gerados acima
INSERT INTO livro_autor_genero(id_autor, id_livro, id_genero, ano, faixaetaria)
VALUES
(1, 1, 2, 1909, 14),
(2, 2, 1, 1844, 12);

-- ====================================================================================================================================================================================================
-- CONSULTAS (SELECTS)

-- Selecionar todos os gêneros
SELECT * FROM generos;


