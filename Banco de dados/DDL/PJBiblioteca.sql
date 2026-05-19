Campus Formoso do Araguaia 
Nome: Ester Almeida, Davi Félix, Kauan Gomes, João Paulo, Elizângela e Kalliny Gomes.
Professor: Mateus Rodrigues         Data: 14/05/2026

Desenvolvimento Banco de Dados do Projeto

--Cria um banco de dados 
CREATE DATABASE bibliotecabd_athena;

--Seleciona o banco de dados para uso
USE bibliotecabd_athena;

CREATE TABLE Clientes(

	-- Identificador único (PK- chave primária)
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	-- Nome completo do cliente (obrigatório - NOT NULL)
    nome_cliente VARCHAR (100) NOT NULL,
	  -- Data de nascimento
    datacliente_nascimento DATE,
     -- CPF unico p/ cada clientes (restrição de unidade- UNIQUE)
    cpf_cliente VARCHAR (14) UNIQUE, 
	-- Email do cliente
    email VARCHAR(100) UNIQUE NOT NULL, 
	  -- Telefone de contato
    telefone VARCHAR (100) NOT NULL
     -- Senha do cliente
    senha VARCHAR(255) NOT NULL,

);

CREATE TABLE Autores(

-- Número único de cada autor (gerado automático) 
id_autor INT AUTO_INCREMENT PRIMARY KEY,
-- Nome completo do autor (obrigatório) 
nome_autor VARCHAR(100) NOT NULL,
-- Área de especialização do autor (obrigatório) 
especializacao_autor VARCHAR (100) NOT NULL,
-- Email único e obrigatório 
email_autor VARCHAR(100) UNIQUE NOT NULL,
-- Senha criptografada (obrigatório) 
senha_autor VARCHAR (255) NOT NULL,
-- Quantidade de livros publicados (pode ficar vazio) 
quantidade_livros INT,
-- País de origem do autor 
nacionalidade VARCHAR (25),
-- Data de nascimento do autor 
dataautor_nascimento DATE
);


CREATE TABLE Generos (
    -- Número único de cada gênero (gerado automático) 
    id_genero INT PRIMARY KEY AUTO_INCREMENT,

    -- Nome do gênero ex: Romance, Fantasia, Terror 
	nome_genero VARCHAR(100) NOT NULL,
	
	-- Número que representa a faixa etária (obrigatório) 
    id_faixaetaria INT NOT NULL ,
);

CREATE TABLE Livros (
-- Número único de cada livro (gerado automático) 
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
-- Título do livro (obrigatório) 
    titulo VARCHAR (200) NOT NULL,
-- Gênero escrito por extenso ex: Fantasia (pode ficar vazio) 
    genero TEXT,
-- Número do gênero, conecta com a tabela Gêneros 
    id_genero INT FOREIGN KEY,
-- Número do autor, conecta com a tabela Autores 
    id_autor INT FOREIGN KEY,
-- Número da editora, conecta com a tabela Editoras (obrigatório) 
    id_editora VARCHAR(100) FOREIGN KEY NOT NULL,
-- Ano de publicação do livro (obrigatório) 
    ano_publicacao INT NOT NULL,
-- Resumo do livro 
    sinopse_livro TEXT

);

-- TABELA PONTE: livro_genero 
-- Liga a tabela Livros com a tabela Gêneros
 -- Um livro pode ter vários gêneros 
CREATE TABLE  livro_genero(
    -- Número do gênero, vem da tabela Gêneros (obrigatório) 
    id_genero INT NOT NULL,
	-- Número do livro, vem da tabela Livros (obrigatório) 
    id_livro INT NOT NULL,
	-- Os dois juntos não podem repetir 
PRIMARY KEY  (id_genero, id_livro),
-- Conecta com a tabela Gêneros 
-- Se deletar o gênero, apaga aqui também 
 FOREIGN KEY(id_genero),
 REFERENCES Generos(id_genero),
 ON DELETE CASCADE,

-- Conecta com a tabela Livros 
-- Se deletar o livro, apaga aqui também 
 FOREIGN KEY(id_livros)
 REFERENCES Livros(id_livros),
 ON DELETE CASCADE,
); 

CREATE TABLE livro_autor(
	-- Número do livro, vem da tabela Livros (obrigatório) 
    id_livro INT NOT NULL,
	id_autor INT NOT NULL,
	PRIMARY KEY (id_livro, id_autor)
);

ALTER TABLE Generos
ADD COLUMN id_livros 
ALTER TABLE Generos
    ADD CONSTRAINT fk_livro_genero
    FOREIGN KEY (id_genero)
    REFERENCES Generos(id_genero)
    ON DELETE RESTRICT;
 INT;

CREATE TABLE Emprestimos
id_emprestimo INT PRIMARY KEY NOT NULL,
id_cliente INT FOREIGN KEY,
id_livro INT FOREIGN KEY, 
data_emprestimo DATE NOT NULL
data_devolucaoprevista DATE NOT NULL
data_devolucaoreal DATE NULL
status VARCHAR (35) NOT NULL

CREATE TABLE emprestimo_clienty(
id_emprestimo INT NOT NULL,

	id_cliente INT NOT NULL,

	PRIMARY KEY (id_emprestimo, id_cliente)
);

ALTER TABLE Clientes
ADD COLUMN id_emprestimos

ALTER TABLE Clientes
    ADD CONSTRAINT fk_emprestimo_clienty
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes(id_cliente)
    ON DELETE RESTRICT;
 INT;

--CODIGO CORRIGIDO COM AUXILIO DA IA
CREATE DATABASE bibliotecabd_athena;
USE bibliotecabd_athena;

-- 1. Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    datacliente_nascimento DATE,
    cpf_cliente VARCHAR(14) UNIQUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- 2. Tabela de Autores
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL,
    especializacao_autor VARCHAR(100),
    email_autor VARCHAR(100) UNIQUE,
    senha_autor VARCHAR(255),
    quantidade_livros INT DEFAULT 0,
    nacionalidade VARCHAR(25),
    dataautor_nascimento DATE
);

-- 3. Tabela de Gêneros (Criada antes de Livros para permitir a FK)
CREATE TABLE Generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nome_genero VARCHAR(100) NOT NULL,
    id_faixaetaria INT NOT NULL
);

-- 4. Tabela de Livros
CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    id_autor INT,
    id_editora INT, -- Alterado para INT para seguir padrão de ID
    ano_publicacao INT NOT NULL,
    sinopse_livro TEXT,
    CONSTRAINT fk_livro_autor FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

-- 5. Tabela Associativa: Livro e Gênero (Muitos para Muitos)
CREATE TABLE livro_genero (
    id_genero INT NOT NULL,
    id_livro INT NOT NULL,
    PRIMARY KEY (id_genero, id_livro),
    CONSTRAINT fk_genero_vinculo FOREIGN KEY (id_genero) REFERENCES Generos(id_genero) ON DELETE CASCADE,
    CONSTRAINT fk_livro_vinculo FOREIGN KEY (id_livro) REFERENCES Livros(id_livro) ON DELETE CASCADE
);

-- 6. Tabela de Empréstimos
CREATE TABLE Emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucaoprevista DATE NOT NULL,
    data_devolucaoreal DATE NULL,
    status VARCHAR(35) NOT NULL,
    CONSTRAINT fk_emp_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_emp_livro FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);