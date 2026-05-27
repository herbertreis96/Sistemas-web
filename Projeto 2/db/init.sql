DROP DATABASE IF EXISTS universidade;

CREATE DATABASE universidade
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE universidade;
-- =========================================
-- TABELA PROFESSOR
-- =========================================
CREATE TABLE professor (

    id INT AUTO_INCREMENT PRIMARY KEY,

    matricula VARCHAR(20) UNIQUE NOT NULL,

    nome VARCHAR(100) NOT NULL,

    email VARCHAR(100),

    telefone VARCHAR(20)

);

-- =========================================
-- TABELA DISCIPLINA
-- =========================================
CREATE TABLE disciplina (

    id INT AUTO_INCREMENT PRIMARY KEY,

    codigo VARCHAR(20) UNIQUE NOT NULL,

    nome VARCHAR(100) NOT NULL,

    carga_horaria INT NOT NULL

);

-- =========================================
-- RELAÇÃO PROFESSOR x DISCIPLINA
-- =========================================
CREATE TABLE professor_disciplina (

    id INT AUTO_INCREMENT PRIMARY KEY,

    professor_id INT NOT NULL,

    disciplina_id INT NOT NULL,

    FOREIGN KEY (professor_id)
        REFERENCES professor(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (disciplina_id)
        REFERENCES disciplina(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

);

-- =========================================
-- TABELA TURMA
-- =========================================
CREATE TABLE turma (

    id INT AUTO_INCREMENT PRIMARY KEY,

    codigo_turma VARCHAR(20) UNIQUE NOT NULL,

    professor_id INT NOT NULL,

    disciplina_id INT NOT NULL,

    semestre VARCHAR(10) NOT NULL,

    numero_alunos INT NOT NULL,

    horario ENUM('manha','tarde','noite') NOT NULL,

    FOREIGN KEY (professor_id)
        REFERENCES professor(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (disciplina_id)
        REFERENCES disciplina(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

);

-- =========================================
-- INSERINDO PROFESSORES
-- =========================================
INSERT INTO professor
(matricula, nome, email, telefone)
VALUES

('P001', 'Joao Silva', 'joao@uni.com', '99999-1111'),

('P002', 'Maria Souza', 'maria@uni.com', '99999-2222'),

('P003', 'Carlos Lima', 'carlos@uni.com', '99999-3333');

-- =========================================
-- INSERINDO DISCIPLINAS
-- =========================================
INSERT INTO disciplina
(codigo, nome, carga_horaria)
VALUES

('BD01', 'Banco de Dados', 60),

('SO01', 'Sistemas Operacionais', 60),

('RED01', 'Redes de Computadores', 60);

-- =========================================
-- RELAÇÃO PROFESSOR x DISCIPLINA
-- =========================================
INSERT INTO professor_disciplina
(professor_id, disciplina_id)
VALUES

(1,1), -- João -> Banco de Dados

(1,2), -- João -> POO

(2,2), -- Maria -> POO

(2,3), -- Maria -> Redes

(3,1), -- Carlos -> Banco de Dados

(3,3); -- Carlos -> Redes

-- =========================================
-- TURMAS (HISTÓRICO)
-- =========================================
INSERT INTO turma
(codigo_turma,
 professor_id,
 disciplina_id,
 semestre,
 numero_alunos,
 horario)
VALUES

('T001', 1,1,'2024.1',40,'noite'),

('T002', 1,2,'2024.2',35,'manha'),

('T003', 2,2,'2024.1',30,'tarde'),

('T004', 2,3,'2024.2',25,'noite'),

('T005', 3,1,'2024.2',45,'manha'),

('T006', 3,3,'2025.1',50,'noite');

-- =========================================
-- CONSULTA:
-- PROFESSORES APTOS A MINISTRAR
-- UMA DISCIPLINA
-- =========================================
SELECT
    p.nome AS professor,
    d.nome AS disciplina

FROM professor p

JOIN professor_disciplina pd
ON p.id = pd.professor_id

JOIN disciplina d
ON d.id = pd.disciplina_id;

-- =========================================
-- CONSULTA:
-- DISCIPLINAS JÁ MINISTRADAS
-- POR UM PROFESSOR
-- =========================================
SELECT

    p.nome AS professor,

    d.nome AS disciplina,

    SUM(d.carga_horaria) AS carga_total,

    SUM(t.numero_alunos) AS total_alunos

FROM turma t

JOIN professor p
ON p.id = t.professor_id

JOIN disciplina d
ON d.id = t.disciplina_id

GROUP BY p.nome, d.nome;
```
