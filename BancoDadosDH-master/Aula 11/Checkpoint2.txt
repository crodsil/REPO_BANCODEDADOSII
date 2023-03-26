-- Checkpoint 2 - Banco de dados
-- Aluno: Jonathan Quintal Coutinho

-- Criação do schema principal
CREATE SCHEMA just_chilling;

-- Criação das tabelas
CREATE TABLE categoria (
	categoria_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoria_nome VARCHAR (20)
);

CREATE TABLE plano (
	plano_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	plano_nome VARCHAR (20),
    plano_descricao VARCHAR (255),
    plano_preco DECIMAL (5,2)
);

CREATE TABLE usuario (
	usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario_nome VARCHAR(100),
    usuario_email VARCHAR(100),
    usuario_telefone BIGINT,
    categoria_id TINYINT,
    plano_id TINYINT,
    CONSTRAINT fk_usuario_categoria
		FOREIGN KEY (categoria_id)
        REFERENCES categoria(categoria_id),
    CONSTRAINT fk_usuario_plano
		FOREIGN KEY (plano_id)
        REFERENCES plano(plano_id)      
);

CREATE TABLE cartao (
	cartao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cartao_tipo VARCHAR(10),
    cartao_numero BIGINT,
    cartao_validade DATE,
    cartao_codigo SMALLINT,
    cartao_titular VARCHAR(100),
    cartao_cpf BIGINT,
    usuario_id INT,
    CONSTRAINT fk_cartao_usuario
		FOREIGN KEY (usuario_id)
		REFERENCES usuario(usuario_id)
);

CREATE TABLE produto (
	produto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    produto_nome VARCHAR(50),
    produto_descricao VARCHAR(255),
	produto_preco DECIMAL(4,2)
);

CREATE TABLE cabine (
	cabine_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cabine_numero TINYINT,
    cabine_reserva VARCHAR(10),
    cabine_contador TIME,
    cabine_internet VARCHAR(10),
    cabine_disponivel VARCHAR(10),
    usuario_id INT,
    CONSTRAINT fk_cabine_usuario
		FOREIGN KEY (usuario_id)
		REFERENCES usuario(usuario_id)
);
-- Nome modificado para localizacao pois local é palavra reservada do workbench
CREATE TABLE localizacao (
	localizacao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    localizacao_secao VARCHAR(10),
    localizacao_estante TINYINT,
    localizacao_prateleira TINYINT
);

CREATE TABLE autor (
	autor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    autor_nome VARCHAR(100)
);

CREATE TABLE editora (
	editora_id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    editora_nome VARCHAR(100)
);

CREATE TABLE classificacao (
	classificacao_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    classificacao_tipo VARCHAR(2)
);

CREATE TABLE manga (
	manga_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    manga_titulo VARCHAR(100),
    manga_volume TINYINT,
    manga_disponivel VARCHAR(10),
    autor_id INT,
    editora_id MEDIUMINT,
    classificacao_id TINYINT,
    localizacao_id INT,
    CONSTRAINT fk_manga_autor
		FOREIGN KEY (autor_id)
        REFERENCES autor(autor_id),
    CONSTRAINT fk_manga_editora
		FOREIGN KEY (editora_id)
        REFERENCES editora(editora_id),
    CONSTRAINT fk_manga_classificacao
		FOREIGN KEY (classificacao_id)
        REFERENCES classificacao(classificacao_id),
    CONSTRAINT fk_manga_localizacao
		FOREIGN KEY (localizacao_id)
        REFERENCES localizacao(localizacao_id)
);

CREATE TABLE genero (
	genero_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    genero_nome VARCHAR(20)
);

CREATE TABLE manga_genero (
	manga_genero_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    manga_id INT,
    genero_id INT,
    CONSTRAINT fk_manga_genero_manga
		FOREIGN KEY (manga_id)
        REFERENCES manga(manga_id),
    CONSTRAINT fk_manga_genero_genero
		FOREIGN KEY (genero_id)
        REFERENCES genero(genero_id)
);
-- Operações CRUD
-- C - Create
INSERT INTO autor (autor_nome)
VALUES ('Masashi Kishimoto'),
	   ('Eiichiro Oda'),
       ('Coolkyousinnjya'),
       ('Akashi');
       
INSERT INTO editora (editora_nome)
VALUES ('Shueisha'),
	   ('Futabasha'),
       ('TOKYOPOP');

INSERT INTO classificacao(classificacao_tipo)
VALUES ('L'),(10),(12),(14),(16),(18); 


INSERT INTO manga (manga_titulo,manga_volume,manga_disponivel,autor_id,editora_id,classificacao_id,localizacao_id) 
VALUES ('Naruto',1,'Sim',1,1,3,1),
	   ('One Piece',1,'Sim',2,1,3,2),
       ('Kobayashi-san Chi no Maid Dragon',1,'Sim',3,2,4,3),
       ('Still Sick',1,'Sim',4,3,5,4);

-- R - Read
SELECT M.manga_titulo AS Título, A.autor_nome AS Autor, E.editora_nome AS Editora, C.classificacao_tipo AS Classificação
FROM manga AS M
INNER JOIN autor AS A
ON M.autor_id = A.autor_id
INNER JOIN editora AS E
ON M.editora_id = E.editora_id
INNER JOIN classificacao AS C
ON M.classificacao_id = C.classificacao_id;

-- U - Update
UPDATE manga SET classificacao_id = 5
WHERE manga.manga_id = 3;
UPDATE editora SET editora_nome = 'TokyoPop'
WHERE editora_id = 3;

-- D - Delete
-- Inserção de dado dummy 
INSERT INTO manga(manga_titulo,manga_volume,manga_disponivel)
VALUES ('Bleach',1,'Não');
-- Exclusão dado dummy
DELETE FROM manga WHERE manga_id = 5;

-- Leitura final dos dados
SELECT M.manga_titulo AS Título, A.autor_nome AS Autor, E.editora_nome AS Editora, C.classificacao_tipo AS Classificação
FROM manga AS M
INNER JOIN autor AS A
ON M.autor_id = A.autor_id
INNER JOIN editora AS E
ON M.editora_id = E.editora_id
INNER JOIN classificacao AS C
ON M.classificacao_id = C.classificacao_id;