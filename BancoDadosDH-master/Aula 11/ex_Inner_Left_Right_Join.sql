-- Ex 1
-- Consulta A 
CREATE VIEW `artistas_com_albuns` AS
	SELECT `artistas`.`nome` AS `NomeArtista`, `albuns`.`titulo`
		FROM `artistas` 
		INNER JOIN `albuns` 
		ON `artistas`.`id` = `albuns`.`id_artista`
		ORDER BY `artistas`.`id`;

SELECT * FROM `artistas_com_albuns`;
-- 347 resultados

-- Consulta B 
CREATE VIEW `artistas_com_e_sem_albuns` AS
	SELECT `artistas`.`nome` AS `NomeArtista`, `albuns`.`titulo`
		FROM `artistas` 
		LEFT JOIN `albuns` 
		ON `artistas`.`id` = `albuns`.`id_artista`
		ORDER BY `artistas`.`id`;

SELECT * FROM `artistas_com_e_sem_albuns`;
-- 418 resultados

-- Ex 2 

-- Consulta A - 
CREATE VIEW `faturas_com_clientes` AS
	SELECT `C`.`id` AS `Cliente_id`, `C`.`nome` AS `NomeCliente`, `F`.`valor_total` AS `ValorFaturas`
		FROM `clientes` AS `C`
		INNER JOIN `faturas` AS `F`
		ON `C`.`id` = `F`.`id_cliente`;

SELECT * FROM `faturas_com_clientes`;
-- 350 resultados 

-- Consulta B  

CREATE VIEW `todas_as_faturas` AS
	SELECT `C`.`id` AS `Cliente_id`, `C`.`nome` AS `NomeCliente`, `F`.`valor_total` AS `ValorFaturas`
		FROM `clientes` AS `C`
		RIGHT JOIN `faturas` AS `F`
		ON `C`.`id` = `F`.`id_cliente`;

SELECT * FROM `todas_as_faturas`;
-- 412 resultados

-- Ex 3 

-- Consulta A 
CREATE VIEW `cancoes_com_tipo` AS
	SELECT `C`.`nome` AS `nomeCancao`, `T`.`nome` AS `ArquivoTipo`
		FROM `cancoes` AS `C` 
		INNER JOIN `tipos_de_arquivo` AS `T`
		ON `T`.`id` = `C`.`id_tipo_de_arquivo`;

SELECT * FROM `cancoes_com_tipo`;
-- 850 resultados

-- Consulta B
CREATE VIEW `todos_os_tipos` AS
	SELECT `C`.`nome` AS `nomeCancao`, `T`.`nome` AS `ArquivoTipo`
		FROM `cancoes` AS `C` 
		RIGHT JOIN `tipos_de_arquivo` AS `T`
		ON `T`.`id` = `C`.`id_tipo_de_arquivo`;
 
SELECT * FROM `todos_os_tipos`;

-- 853 resultados

-- Consulta C

CREATE VIEW `todos_as_cancoes` AS
	SELECT `C`.`nome` AS `nomeCancao`, `T`.`nome` AS `ArquivoTipo`
		FROM `cancoes` AS `C` 
		LEFT JOIN `tipos_de_arquivo` AS `T`
		ON `T`.`id` = `C`.`id_tipo_de_arquivo`;

SELECT * FROM `todos_as_cancoes`;

-- 3503 resultados

-- Ex 4 Views
-- I - Transformar tudo em view

-- 2 - Criar diferentes views

-- I
CREATE VIEW `todas_as_cancoes` AS
	SELECT * FROM `cancoes`;

SELECT * FROM `todas_as_cancoes`;

-- II
    
CREATE VIEW `valor_fatura_maior5` AS 
	SELECT * FROM `faturas`
    WHERE `faturas`.`valor_total` > 5;

SELECT * FROM `valor_fatura_maior5`;

-- III

CREATE VIEW `artistas_comecam_com_B` AS
	SELECT * FROM `artistas`
    WHERE `artistas`.`nome` LIKE 'B%';

SELECT * FROM `artistas_comecam_com_B`;




