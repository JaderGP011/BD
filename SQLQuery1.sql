CREATE DATABASE db_hospital
--DROP TABLE tbl_agendamento

USE db_hospital

--usuario

--DROP TABLE tbl_usuario


CREATE TABLE tbl_usuario(

    nome                varchar(50) NOT NULL,

    endereco            varchar(150) NOT NULL,

    telefone            VARCHAR(18) NOT NULL,

    numeroBeneficiario  FLOAT NOT NULL,

    doencaPrev          CHAR(150) NOT NULL,

    remedioUsoContinuo  CHAR(90) NOT NULL

    PRIMARY KEY (numeroBeneficiario)

)

INSERT INTO tbl_usuario(nome, endereco, telefone, numeroBeneficiario, doencaPrev, remedioUsoContinuo) VALUES

('Jader', 'R.igarapé água azul', '+55 (11) 982746524', 654976167, 'Asma', 'Nenhum'),

('Jader', 'R.igarapé água azul', '+55 (11) 125463297', 010265748, 'Rinite', 'Nenhum'),

('Jader', 'R.igarapé água azul', '+55 (11) 125463297', 029265748, 'sinusite', 'Nenhum'),

('Jader', 'R.igarapé água azul', '+55 (11) 125463297', 019565748, 'Rinite', 'Nenhum'),

('Jader', 'R.igarapé água azul', '+55 (11) 125463297', 016265748, 'Rinite', 'Nenhum')



--ESPECIALIDADE


--DROP TABLE tblEspecialidade

CREATE TABLE tblEspecialidade(

    nome            CHAR(50) NOT NULL,

    numeroRegistro  INT NOT NULL,

    publicoAlvo     CHAR(100) NOT NULL
	
	PRIMARY KEY (numeroRegistro)

)

INSERT INTO tblEspecialidade(nome, numeroRegistro, publicoAlvo) VALUES

('Ortopedista', 13254697, 'Publico com complicaões nos ossos'),

('Ortopedista', 13254697, 'Publico com complicaões nos ossos'),

('Ortopedista', 13254697, 'Publico com complicaões nos ossos'),

('Ortopedista', 13254697, 'Publico com complicaões nos ossos'),

('Ortopedista', 13254697, 'Publico com complicaões nos ossos')



--MÉDICO


--DROP TABLE tblmedico

CREATE TABLE tblmedico(

    nome            CHAR(50) NOT NULL,

    endereco        VARCHAR(150) NOT NULL,

    telefone        VARCHAR(18) NOT NULL,

    crm             VARCHAR(12) NOT NULL,

    especialidade   CHAR(50) NOT NULL

    PRIMARY KEY (crm)
	FOREIGN KEY (especialidade) REFERENCES tblEspecialidade(nome)


) 

INSERT INTO tblmedico(nome, endereco, telefone, crm, especialidade) VALUES

('Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'CRM/SP465269', 'Clinico Geral' ),

('Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'CRM/SP478269', 'Clinico Geral' ),

('Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'CRM/SP463269', 'Clinico Geral' ),

('Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'CRM/SP464269', 'Clinico Geral' ),

('Everson Willian Bacelli', 'Avenida Paulista 234', '+55 (11) 312465798', 'CRM/SP460269', 'Clinico Geral' )


--agendamento

CREATE TABLE tblAgendamento(

    numeroAgendamento   FLOAT NOT NULL,

    data				DATE NOT NULL,

    hora				FLOAT NOT NULL,

    queixa				CHAR(100) NOT NULL,

    gravidade			CHAR(50) NOT NULL

    PRIMARY KEY (numeroAgendamento)

)

INSERT INTO tblAgendamento(numeroAgendamento, data, hora, queixa,gravidade) VALUES

(151645318, '23/09/2023', 1220, 'Dengue', 'Alta'),

(154645318, '23/09/2023', 1220, 'Dengue', 'Alta'),

(184645318,	'23/09/2023', 1220, 'Dengue', 'Alta'),

(154645358, '23/09/2023', 1220, 'Dengue', 'Alta'),

(154645618, '23/09/2023', 1220, 'Dengue', 'Alta')






--CONSULTA



DROP TABLE tbl_consulta

CREATE TABLE tbl_consulta(

    numeroConsulta  FLOAT(10) NOT NULL,

    data            DATE NOT NULL,

    hora            FLOAT NOT NULL,

    numeroAgendamento   FLOAT NOT NULL,

    crm             VARCHAR(12) NOT NULL,

    numeroBeneficiario  FLOAT NOT NULL,


    PRIMARY KEY (numeroConsulta),
	FOREIGN KEY (numeroBeneficiario) REFERENCES tbl_usuario(numeroBeneficiario),
	FOREIGN KEY () 


)

INSERT INTO tbl_consulta(numeroConsulta, data, hora, numeroAgendamento, crm, numeroBeneficiario) VALUES

(3565898785, '23/08/2023', 1220, 154975318, 'CRM/SP128269', 069265748),

(6453195785, '23/09/2023', 1220, 154645318, 'CRM/SP468269', 019265748),

(6453198285, '23/09/2023', 1220, 154645318, 'CRM/SP468269', 019265748),

(6453158785, '23/09/2023', 1220, 154645318, 'CRM/SP468269', 019265748),

(6453148785, '23/09/2023', 1220, 154645318, 'CRM/SP468269', 019265748)




--USUÁRIO




SELECT * FROM tblAgendamento
SELECT * FROM tbl_consulta
SELECT * FROM tblEspecialidade
SELECT * FROM tblmedico
SELECT * FROM tbl_usuario

