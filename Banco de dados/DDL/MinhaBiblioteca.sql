-- =========================================================================
-- BANCO DE DADOS BIBLIOTECABD_ATHENA
-- Biblioteca Athena 
-- =========================================================================

-- Cria um banco de dados 
CREATE DATABASE IF NOT EXISTS bibliotecabd_athena;

-- Seleciona o Banco de Dados para uso 
USE bibliotecabd_athena;

-- =========================================================================
-- DDL - CRIAÇÃO DAS TABELAS (ESTRUTURA)
-- =========================================================================

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
    especizacao_autor VARCHAR(100),
    email_autor VARCHAR(100) UNIQUE,
    senha_autor VARCHAR(255),
    quantidade_livros INT DEFAULT 0,
    nacionalidade VARCHAR(25),
    dataautor_nascimento DATE
);

-- 3. Tabela de Gêneros (Corrigida: alterada de ID para campo descritivo)
CREATE TABLE Generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nome_genero VARCHAR(100) NOT NULL,
    faixa_etaria VARCHAR(50) NOT NULL
);

-- 4. Tabela de Livros (Corrigida: removido id_editora inexistente)
CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    id_autor INT,
    ano_publicacao INT NOT NULL,
    sinopse_livro TEXT,
    CONSTRAINT fk_livro_autor FOREIGN KEY (id_autor) REFERENCES Autores(id_autor) ON DELETE CASCADE
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
    CONSTRAINT fk_emp_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE,
    CONSTRAINT fk_emp_livro FOREIGN KEY (id_livro) REFERENCES Livros(id_livro) ON DELETE CASCADE
);

-- =========================================================================
-- INSERÇÃO DE DADOS (INSERT INTO)
-- Irei colocar pelo menos 5 registros em cada tabela principal do projeto
-- =========================================================================

-- Inserindo Clientes
INSERT INTO Clientes (nome_cliente, datacliente_nascimento, cpf_cliente, email, telefone, senha) VALUES
('Ester Almeida', '2009-12-06', '111.222.333-44', 'ester@email.com', '11999998888', 'hash1'),
('Mateus Rodrigues', '2000-11-03', '222.333.444-55', 'mateus@email.com', '11988887777', 'hash2'),
('Davi Félix', '2010-11-4', '333.444.555-66', 'davi@email.com', '11977776666', 'hash3'),
('Joao Paulo', '2009-07-30', '444.555.666-77', 'jpaulo@email.com', '11966665555', 'hash4'),
('Kauam', '2007-12-05', '555.666.777-88', 'kauam@email.com', '11955554444', 'hash5');

-- Inserindo Autores
INSERT INTO Autores (nome_autor, especizacao_autor, email_autor, senha_autor, quantidade_livros, nacionalidade, dataautor_nascimento) VALUES
('Machado de Assis', 'Literatura Clássica', 'machado@academia.org', 'hashm1', 30, 'Brasileira', '1839-06-21'),
('J.K. Rowling', 'Fantasia', 'jk@magic.com', 'hashj2', 7, 'Britânica', '1965-07-31'),
('Stephen King', 'Terror/Suspense', 'king@horror.com', 'hashs3', 60, 'Americana', '1947-09-21'),
('George R.R. Martin', 'Alta Fantasia', 'grrm@westeros.com', 'hashg4', 15, 'Americana', '1948-09-20'),
('Clarice Lispector', 'Romance/Contos', 'clarice@literatura.br', 'hashc5', 18, 'Brasileira', '1920-12-10');

-- Inserindo Gêneros
INSERT INTO Generos (nome_genero, faixa_etaria) VALUES
('Romance', 'Livre'),
('Fantasia', '12 anos'),
('Terror', '16 anos'),
('Ficção Científica', '10 anos'),
('Drama', 'Livre');

-- Inserindo Livros (Apontando para os IDs gerados de 1 a 5 em Autores)
INSERT INTO Livros (titulo, id_autor, ano_publicacao, sinopse_livro) VALUES
('Dom Casmurro', 1, 1899, 'A história de Capitu e Bentinho.'),
('Harry Potter e a Pedra Filosofal', 2, 1997, 'O início da jornada do bruxo.'),
('O Iluminado', 3, 1977, 'O inverno em um hotel isolado.'),
('A Guerra dos Tronos', 4, 1996, 'A disputa pelo Trono de Ferro.'),
('A Hora da Estrela', 5, 1977, 'A vida de Macabéa no Rio de Janeiro.');

-- Inserindo na tabela associativa Livro_Gênero
INSERT INTO livro_genero (id_genero, id_livro) VALUES
(1, 1), -- Dom Casmurro é Romance
(2, 2), -- Harry Potter é Fantasia
(3, 3), -- O Iluminado é Terror
(2, 4), -- A Guerra dos Tronos é Fantasia
(5, 5); -- A Hora da Estrela é Drama

-- Inserindo Empréstimos
INSERT INTO Emprestimos (id_cliente, id_livro, data_emprestimo, data_devolucaoprevista, data_devolucaoreal, status) VALUES
(1, 1, '2026-06-01', '2026-06-15', '2026-06-14', 'Devolvido'),
(2, 2, '2026-06-10', '2026-06-24', NULL, 'Pendente'),
(3, 3, '2026-06-12', '2026-06-26', NULL, 'Pendente'),
(4, 4, '2026-06-13', '2026-06-27', NULL, 'Atrasado'),
(5, 5, '2026-06-15', '2026-06-29', NULL, 'Pendente');


-- =========================================================================
-- CONSULTA DE DADOS (SELECT)
-- =========================================================================

-- a) Uma consulta exibindo todos os registros de uma tabela
SELECT * FROM Clientes;

-- b) Uma consulta exibindo apenas alguns campos (ex: nome do autor e nacionalidade)
SELECT nome_autor, nacionalidade FROM Autores;

-- c) Uma consulta utilizando a cláusula WHERE (ex: apenas livros publicados após 1990)
SELECT id_livro, titulo, ano_publicacao 
FROM Livros 
WHERE ano_publicacao > 1990;


-- =========================================================================
-- ATUALIZAÇÃO DE DADOS (UPDATE)
-- =========================================================================

-- Atualização alterando apenas um campo (Corrigindo o ano de publicação de Dom Casmurro)
UPDATE Livros 
SET ano_publicacao = 1900 
WHERE id_livro = 1;

-- Atualização alterando dois ou mais campos (Mudando e-mail e telefone de um cliente)
UPDATE Clientes 
SET email = 'ester.almeida.novo@email.com', telefone = '11911112222' 
WHERE id_cliente = 1;

-- Consulta aos registros modificados para verificar o resultado das alterações
SELECT * FROM Livros WHERE id_livro = 1;
SELECT * FROM Clientes WHERE id_cliente = 1;


-- =========================================================================
-- EXCLUSÃO DE DADOS (DELETE)
-- =========================================================================

-- Realizar duas exclusões de registros 
-- (Nota: Deletando registros específicos de empréstimo/livro para não ferir chaves sem CASCADE)
DELETE FROM Emprestimos WHERE id_emprestimo = 1;
DELETE FROM Livros WHERE id_livro = 5; -- O ON DELETE CASCADE cuidará das tabelas filhas vinculadas a este livro

-- Consulta após as exclusões para verificar o resultado
SELECT * FROM Emprestimos;
SELECT * FROM Livros;

-- =========================================================================
-- DESAFIO - INNER JOIN
-- =========================================================================

-- Consulta 1 utilizando INNER JOIN:
-- Objetivo: Esta consulta retorna a lista de todos os livros e o nome de seus respectivos autores.
SELECT 
    L.id_livro, 
    L.titulo AS nome_do_livro, 
    A.nome_autor AS escritor
FROM Livros L
INNER JOIN Autores A ON L.id_autor = A.id_autor;


-- Consulta 2 utilizando INNER JOIN (Desafio Extra - Três tabelas + Cláusula WHERE):
-- OBJETIVO: Esta consulta retorna quais clientes possuem empréstimos ativos em aberto ('Pendente'),
-- mostrando o nome do cliente, o título do livro que ele pegou e a data que ele precisa devolver.
SELECT 
    C.nome_cliente AS leitor, 
    L.titulo AS livro_emprestado, 
    E.data_devolucaoprevista AS prazo_final,
    E.status
FROM Emprestimos E
INNER JOIN Clientes C ON E.id_cliente = C.id_cliente
INNER JOIN Livros L ON E.id_livro = L.id_livro
WHERE E.status = 'Pendente';