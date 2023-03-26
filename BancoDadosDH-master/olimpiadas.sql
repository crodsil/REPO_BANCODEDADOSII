CREATE SCHEMA `olimpiadas`;

CREATE TABLE `olimpiadas`.`eventos`(
	`evento_id` INT NOT NULL AUTO_INCREMENT,
	`evento_nome` VARCHAR (100),
	PRIMARY KEY (`evento_id`)
);

CREATE TABLE `olimpiadas`.`competidores`(
	`competidor_id` INT NOT NULL AUTO_INCREMENT,
    `competidor_nome` VARCHAR (100),
    PRIMARY KEY (`competidor_id`)
);

CREATE TABLE `olimpiadas`.`evento_competidor`(
	`evento_competidor_id` INT NOT NULL AUTO_INCREMENT,
	`evento_id` INT,
    `competidor_id` INT,
	PRIMARY KEY (`evento_competidor_id`),
    CONSTRAINT `FKevento`
		FOREIGN KEY (`evento_id`)
        REFERENCES `olimpiadas`.`eventos` (`evento_id`),
    CONSTRAINT `FKcompetidor`
		FOREIGN KEY (`competidor_id`)
        REFERENCES `olimpiadas`.`competidores` (`competidor_id`)
);