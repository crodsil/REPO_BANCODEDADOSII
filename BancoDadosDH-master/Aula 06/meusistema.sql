CREATE SCHEMA `meusistema`;

CREATE TABLE `meusistema`.`usuarios` (
	`usuario_id` INT NOT NULL AUTO_INCREMENT,
    `usuario_nome` VARCHAR(150),
    `usuario_login` VARCHAR(20),
    `usuario_senha` VARCHAR (50),
    PRIMARY KEY (`usuario_id`)
);

INSERT INTO `meusistema`.`usuarios` (`usuario_nome`,`usuario_login`,`usuario_senha`) 
VALUES ('Pedro Henrique','pedro','ph12345');

INSERT INTO `meusistema`.`usuarios` (`usuario_nome`,`usuario_login`,`usuario_senha`) 
VALUES ('Maria Santos','maria','ms12345');

INSERT INTO `meusistema`.`usuarios` (`usuario_nome`,`usuario_login`,`usuario_senha`) 
VALUES ('Manoel Silva','manoel','ms67890');

INSERT INTO `meusistema`.`usuarios` (`usuario_nome`,`usuario_login`,`usuario_senha`) 
VALUES ('Michelle Andrade','michelle','ma12345');

SELECT `usuario_nome`,`usuario_login`,`usuario_senha`
FROM `meusistema`.`usuarios`;

UPDATE `meusistema`.`usuarios` SET `usuario_nome` = 'Michelle'
WHERE `usuario_nome` = 'Michelle Andrade';

DELETE FROM `meusistema`.`usuarios`WHERE `usuario_nome` = 'Michelle';