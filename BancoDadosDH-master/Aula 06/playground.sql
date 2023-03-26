CREATE SCHEMA `playground`;

CREATE TABLE `categorias`(
	`categoria_id` INT NOT NULL AUTO_INCREMENT,
    `categoria_nome` VARCHAR (20),
    PRIMARY KEY (`categoria_id`)
);
CREATE TABLE `usuarios`(
	`usuario_id` INT NOT NULL AUTO_INCREMENT,
    `usuario_nome` VARCHAR (100),
    `usuario_login` VARCHAR (100),
    `usuario_email` VARCHAR (50),
    `categoria_id` INT,
    PRIMARY KEY (`usuario_id`),
    CONSTRAINT `FKcategoria`
		FOREIGN KEY (`categoria_id`)
		REFERENCES `categorias`(`categoria_id`)
);
CREATE TABLE `cursos`(
	`curso_id` INT NOT NULL AUTO_INCREMENT,
    `curso_nome` VARCHAR (45),
    `curso_descricao` VARCHAR (100),
    PRIMARY KEY (`curso_id`)
);
CREATE TABLE `usuarios_cursos`(
	`usuarios_cursos_id` INT NOT NULL AUTO_INCREMENT,
    `usuario_id` INT,
    `curso_id` INT,
    `usuarios_cursos_data_inscricao` DATE,
    PRIMARY KEY (`usuarios_cursos_id`),
    CONSTRAINT `FKusuario`
		FOREIGN KEY (`usuario_id`)
        REFERENCES `usuarios`(`usuario_id`),
	CONSTRAINT `FKcurso`
		FOREIGN KEY (`curso_id`)
        REFERENCES `cursos`(`curso_id`)
);
INSERT INTO `categorias` (`categoria_nome`)
VALUES 
('Aluno'),
('Docente'),
('Administrador'),
('Editor');
INSERT INTO `usuarios` (`usuario_nome`,`usuario_login`,`usuario_email`,`categoria_id`)
VALUES
('Jonathan Quintal','Jhonny','jqcoutinho.eng@gmail.com',1);

SELECT `usuario_nome`,`usuario_login`,`usuario_email`,`categoria_id` FROM `usuarios`