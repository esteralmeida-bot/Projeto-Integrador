-- criação do Banco de Dados
CREATE DATABASE escola;
-- Selecionar o BD para uso
USE escola;

-- Criar Tabela aluno
-- Armazena os dados dos estudantes
CREATE TABLE alunos(
    -- Identificador único (chave primária)
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    -- Nome Completo do Aluno, obrigatório - N0T NULL
    nome VARCHAR(100) NOT NULL,

    -- Data de nascimento
    data_nascimento DATE,
    -- CPF do Aluno
    cpf VARCHAR(14) UNIQUE,
    -- Email
    email VARCHAR(100) NOT NULL,
    -- Telefone
    telefone VARCHAR(20),
     data_matricula DATE NOT NULL

-- CRIAR TABELA PROFESSORES
CREATE TABLE Professores(
    -- Criar Indentificador único p/professores
    id_professor INT AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(100),
    especialidade VARCHAR(100) NOT NULL
    email VARCHAR(20) NOT NULL
    telefone VARCHAR(20)
    )
 -- TABELA DE CURSOS
    CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY
    nome VARCHAR (100) NOT NULL,

    carga_horaria INT NOT NULL 
    )
    );
