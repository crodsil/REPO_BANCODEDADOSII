CREATE SCHEMA `banco_visa`;

CREATE TABLE `banco_visa`.`clientes`(
		`cliente_id` INT NOT NULL AUTO_INCREMENT,
        `clente_nome` VARCHAR(150),
        PRIMARY KEY (`cliente_id`)
);

CREATE TABLE `banco_visa`.`cartoes`(
		`cartao_id` INT NOT NULL AUTO_INCREMENT,
        `cartao_numero` BIGINT,
        `cartao_vencimento` DATE,
        `cartao_codigo` SMALLINT,
        `cliente_id` INT,
        PRIMARY KEY (`cartao_id`),
        CONSTRAINT `FKcliente`
			FOREIGN KEY (`cliente_id`)
            REFERENCES `banco_visa`.`clientes`(`cliente_id`)
);
