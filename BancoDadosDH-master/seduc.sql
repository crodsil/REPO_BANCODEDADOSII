CREATE SCHEMA `seduc`;

CREATE TABLE `seduc`.`escola`(
`escola_id` INT NOT NULL AUTO_INCREMENT,
`escola_nome` VARCHAR(100),
PRIMARY KEY (`escola_id`)
);

CREATE TABLE `seduc`.`estudante`(
`estudante_id` INT NOT NULL AUTO_INCREMENT,
`estudante_nome` VARCHAR(100),
`escola_id` INT,
PRIMARY KEY (`estudante_id`),
CONSTRAINT `FKescola`
	FOREIGN KEY (`escola_id`)
    REFERENCES `seduc`.`escola`(`escola_id`)
);

