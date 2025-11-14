drop database if exists projetoFiel;
CREATE DATABASE projetoFiel;

USE projetoFiel;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    senha VARCHAR(50)
);

CREATE TABLE aviso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao VARCHAR(150),
    fk_usuario INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

CREATE TABLE quiz (
    id INT PRIMARY KEY AUTO_INCREMENT,
    qtdPontos INT,
    fkUsuario INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(id)
);

SELECT * FROM usuario;
SELECT * FROM quiz;


-- Select para ver a média geral da pontuação
select avg(qtdPontos) from quiz;


-- Select para ver quantas tentativas
select count(fkUsuario) from quiz where fkusuario = 1;

select qtdPontos from quiz;

-- Select 
select (select count(qtdPontos) as 'Até 10' from quiz where qtdPontos <=10) as 'Até 10', 
(select count(qtdPontos) as 'Até 15' from quiz where qtdPontos >10 and qtdPontos <= 15) as 'Até 15', 
(select count(qtdPontos) as '16' from quiz where qtdPontos = 16) as '16' from quiz limit 1;

select count(qtdPontos) as 'Até 10' from quiz where qtdPontos <=10;
select count(qtdPontos) as 'Até 15' from quiz where qtdPontos >10 and qtdPontos <= 15;
select count(qtdPontos) as '16' from quiz where qtdPontos = 16;

