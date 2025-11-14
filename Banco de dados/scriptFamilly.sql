CREATE DATABASE FamillyAd;

USE FamillyAd;

CREATE TABLE Usuario(
idUsuario int primary key auto_increment, 
nome varchar(45), 
dtCadastro DATETIME, 
email VARCHAR(45), 
senha VARCHAR(45) );


CREATE TABLE Caracteristicas(
idCaracteristicas int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);

CREATE TABLE Personagens (
idPersonagens INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(45));

CREATE TABLE Respostas(
idResposta INT PRIMARY KEY auto_increment, 
fkUsuario INT,
fkCaracteristicas INT,
CONSTRAINT pkComposta
	PRIMARY KEY (idResposta, fkUsuario, fkCaracteristicas),
    dataResposta datetime,
CONSTRAINT fkUsuarioCaracteristicas
	FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario),

);

