CREATE DATABASE db_hospital;
USE db_hospital;

CREATE TABLE tbl_usuario (
    numeroBeneficiario  INT IDENTITY(1,1) PRIMARY KEY,
    nome                VARCHAR(50) NOT NULL,
    endereco            VARCHAR(150) NOT NULL,
    telefone            VARCHAR(18) NOT NULL,
    doencaPrev          CHAR(150) NOT NULL,
    remedioUsoContinuo  CHAR(90) NOT NULL
)

INSERT INTO tbl_usuario (nome, endereco, telefone, doencaPrev, remedioUsoContinuo)
VALUES
('Jader', 'R. Igarapé Água Azul', '+55 (11) 982746524', 'Asma', 'Nenhum'),
('Jader', 'R. Igarapé Água Azul', '+55 (11) 125463297', 'Rinite', 'Nenhum'),
('Jader', 'R. Igarapé Água Azul', '+55 (11) 125463297', 'Sinusite', 'Nenhum'),
('Jader', 'R. Igarapé Água Azul', '+55 (11) 125463297', 'Rinite', 'Nenhum'),
('Jader', 'R. Igarapé Água Azul', '+55 (11) 125463297', 'Rinite', 'Nenhum')

CREATE TABLE tblEspecialidade (
    numeroRegistro  INT IDENTITY(1,1) PRIMARY KEY,
    nome            CHAR(50) NOT NULL,
    publicoAlvo     CHAR(100) NOT NULL
)

INSERT INTO tblEspecialidade (nome, publicoAlvo)
VALUES
('Ortopedista', 'Público com complicações nos ossos')

CREATE TABLE tblMedico (
    crm             VARCHAR(12) PRIMARY KEY,
    nome            CHAR(50) NOT NULL,
    endereco        VARCHAR(150) NOT NULL,
    telefone        VARCHAR(18) NOT NULL,
    especialidade   CHAR(50) NOT NULL,
    FOREIGN KEY (especialidade) REFERENCES tblEspecialidade(nome)
)

INSERT INTO tblMedico (crm, nome, endereco, telefone, especialidade)
VALUES
('CRM/SP465269', 'Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'Ortopedista'),
('CRM/SP478269', 'Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'Ortopedista'),
('CRM/SP463269', 'Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'Ortopedista'),
('CRM/SP464269', 'Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'Ortopedista'),
('CRM/SP460269', 'Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'Ortopedista')

CREATE TABLE tblAgendamento (
    numeroAgendamento   INT IDENTITY(1,1) PRIMARY KEY,
    dma                 DATE NOT NULL,
    hora                TIME NOT NULL,
    queixa              CHAR(100) NOT NULL,
    gravidade           CHAR(50) NOT NULL
)

INSERT INTO tblAgendamento (dma, hora, queixa, gravidade)
VALUES
('2023-09-23', '12:20', 'Dengue', 'Alta'),
('2023-09-23', '12:20', 'Dengue', 'Alta'),
('2023-09-23', '12:20', 'Dengue', 'Alta'),
('2023-09-23', '12:20', 'Dengue', 'Alta'),
('2023-09-23', '12:20', 'Dengue', 'Alta')

CREATE TABLE tblConsulta (
    numeroConsulta      INT IDENTITY(1,1) PRIMARY KEY,
    dma                 DATE NOT NULL,
    hora                TIME NOT NULL,
    numeroAgendamento   INT NOT NULL,
    crm                 VARCHAR(12) NOT NULL,
    numeroBeneficiario  INT NOT NULL,
    FOREIGN KEY (numeroAgendamento) REFERENCES tblAgendamento(numeroAgendamento),
    FOREIGN KEY (crm) REFERENCES tblMedico(crm),
    FOREIGN KEY (numeroBeneficiario) REFERENCES tblUsuario(numeroBeneficiario)
);

INSERT INTO tblConsulta (dma, hora, numeroAgendamento, crm, numeroBeneficiario)
VALUES
('2023-08-23', '12:20', 1, 'CRM/SP465269', 1),
('2023-09-23', '12:20', 2, 'CRM/SP478269', 2),
('2023-09-23', '12:20', 3, 'CRM/SP463269', 3),
('2023-09-23', '12:20', 4, 'CRM/SP464269', 4),
('2023-09-23', '12:20', 5, 'CRM/SP460269', 5);

SELECT * FROM tblAgendamento;
SELECT * FROM tblConsulta;
SELECT * FROM tblEspecialidade;
SELECT * FROM tblMedico;
SELECT * FROM tblUsuario;
