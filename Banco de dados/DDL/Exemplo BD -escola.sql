-- Criação do Bando de Dados
CREATE DATABASE escola;
-- selecionar o BD para uso
USE escola;

-- Criar tabela aluno
-- Armasena os dados dos estudantes
CREATE TABLE aluno (
	-- Indentificador único (chave primária)
	id_aluno INT auto_increment primary key,
    
    -- Nome completo do aluno (obrigatório)
    nome VARCHAR(100) NOT NULL,
    
    -- Data de nascimento do aluno
    data_nascimento DATE NOT NULL,
    
    -- CPF
    cpf VARCHAR(14) UNIQUE,
    
    -- Email  do aluno
    email VARCHAR(100) NOT NULL UNIQUE,
	
    -- Telefone para contato
    telefone VARCHAR(20) NOT NULL,
    
    -- Data da matricula
    matricula_date DATE NOT NULL,
    
    -- Matricula do aluno
    matricula INT NOT NULL
);

-- Tabela de professores
CREATE TABLE professores(
	-- Indentificador único do professor
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome do professor
    nome VARCHAR(100) NOT NULL,
	
    -- Área de especialização
    especialização VARCHAR(100),
    
    -- Email do professor
    email VARCHAR(100) NOT NULL,
    
    -- Telefone de contato
    telefone VARCHAR(20)
);

-- Tabela de Cursos
-- Representa os cursos 
CREATE TABLE cursos(
-- identeficador único do curso
id_cursos INT AUTO_INCREMENT PRIMARY KEY,

-- Nome do curso (obrigatorio - NOT NULL)
   nome VARCHAR(100) NOT NULL,
   
   -- carga hprária total do curso em horas
   carga_horaria INT NOT NULL,
);

REATE TABLE turmas  (
    --Indentificador único da turma
    id_turma INT AUTO_INCREMENT PRIMARY KEY

    -- FK para cursos (cada turma pertence a um curso
    id_cursos INT NOT NULL,

    --Série 1º, 2º, 3º ano
    serie INT NOT NULL,

    -- Chave estrangeira - cursos (1 curso tem varias turmas)
    FOREIGN KEY (id_cursos)
        REFERENCES cursos(id_curso)
        ON DELETE RESTRICT,
        -- Restrict impede apagar curso com turmas vinculadas

        --Chave estrangeira - professores (1 prof pode ter várias turmas)
        FOREIGN KEY (id_professor)
        REFERENCES professores(id_professor)
        ON DELETE RESTRICT

        --Impede excluir professor se ele estiver vinculado a uma turma 

        -- Tabela disciplina
        CREATE TABLE disciplinas
        --identificador da disciplina
        id_disciplina INT AUTO_INCREMENT PRIMARY KEY,

        --Nome da Disciplina
        nome VARCHAR(100) NOT NUL,

        -- Carga Horária da disciplina
        carga_horaria INT NOT NULL
);

--Tabela: curso_disciplinas
--Relacionamento N:N entre cursos e diciplinas

CREATE TABLE curso_disciplinas(
    --FK para curso
    id_curso INT NOT NULL

    --FK para disciplina
    id_disciplina INT NOT NULL

    --Chave primária composta (evita duplicidade)
    PRIMARY KEY (id_curso, id_disciplina),

    --FK /CURSOS
    FOREIGN KEY(id_curso)
    REFERENCES cursos(id_curso)
    ON DELETE CASCADE,
    --Ao excluir curso, remove automaticamente relações 

     --FK /Disciplina
    FOREIGN KEY(id_diciplina)
    REFERENCES disciplinas(id_diciplina)
    ON DELETE CASCADE
    --Ao excluir curso, remove automaticamente relações
);

CREATE TABLE notas(
    --Indentificador da nota
    id_nota INT AUTO_INCREMENT PRIMARY KEY,

    --FK para aluno
    id_aluno INT NOT NULL,

    --FK para disciplina
    id_disciplina INT NOT NULL,

    --Nota (ex:7,5)
    nota DECIMAL(5,2),

    --FK -> Alunos (1 aluno pode ter varias notas)
    FOREIGN KEY (id_aluno)
        REFERENCES alunos(id_aluno)
        ON DELETE CASCADE,
        --Se o aluno for excluido, suas notas tambem serao

        --FK -> Disciplinas 
    FOREIGN KEY (id_diciplina)
        REFERENCES disciplinas(id_disciplina)
        ON DELETE RESTRICT
        --Impede de excluir disciplinas com notas cadastradas

        -- Garante que o naluno tenha apenas uma nota por disciplina
        UNIQUE (id_aluno, id_disciplina)

);

--CODIGO CORRIGIDO

-- Tabela aluno
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    matricula_date DATE NOT NULL,
    matricula INT NOT NULL
);

-- Tabela de professores
CREATE TABLE professores(
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especializacao VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de Cursos
CREATE TABLE cursos(
    id_cursos INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

-- Tabela turmas (Corrigido: REATE -> CREATE, vírgulas e referências)
CREATE TABLE turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_cursos INT NOT NULL,
    id_professor INT NOT NULL, -- Faltava esta coluna para a FK abaixo
    serie INT NOT NULL,
    FOREIGN KEY (id_cursos) REFERENCES cursos(id_cursos) ON DELETE RESTRICT,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor) ON DELETE RESTRICT
);

-- Tabela disciplina (Estava dentro da tabela turmas no seu código, tirei para fora)
CREATE TABLE disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, -- Corrigido: NUL -> NULL
    carga_horaria INT NOT NULL
);

-- Tabela: curso_disciplinas (Adicionado vírgulas e corrigido nomes)
CREATE TABLE curso_disciplinas(
    id_curso INT NOT NULL,
    id_disciplina INT NOT NULL,
    PRIMARY KEY (id_curso, id_disciplina),
    FOREIGN KEY(id_curso) REFERENCES cursos(id_cursos) ON DELETE CASCADE,
    FOREIGN KEY(id_disciplina) REFERENCES disciplinas(id_disciplina) ON DELETE CASCADE
);

-- Tabela notas (Corrigido referências e nomes de colunas)
CREATE TABLE notas(
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina) ON DELETE RESTRICT,
    UNIQUE (id_aluno, id_disciplina)
);
