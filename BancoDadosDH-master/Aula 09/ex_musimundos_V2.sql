-- Grupo 2: Ailla Freire, Carolina Montesinos, Eduardo Marcondes, Fernando Bruno, Flávio Matto, Jonathan Coutinho
CREATE SCHEMA `musimundos_V2`;

-- Feita importação do bd musimundos_V2

-- Exercícios tabela faturas
SELECT * FROM `faturas`;

-- 1
SELECT MAX(`valor_total`) FROM `faturas` WHERE `cidade_cobranca` = 'Oslo';
-- 2
SELECT MIN(`valor_total`) FROM `faturas`;
-- 3
SELECT AVG(`valor_total`) FROM `faturas` WHERE `pais_cobranca` = 'Canada';
-- 4
SELECT COUNT(*) FROM `faturas` WHERE `pais_cobranca` = 'Canada';
-- 5
SELECT SUM(`valor_total`) FROM `faturas`;
-- 6
SELECT `id`,`data_fatura`,`valor_total` FROM `faturas` WHERE `valor_total` < (SELECT AVG(`valor_total`) FROM `faturas`);

-- Exercícios tabela empregados 
SELECT * FROM `empregados`;

-- 7
SELECT MAX(`data_nascimento`) FROM `empregados`;
-- 8
SELECT MIN(`data_nascimento`) FROM `empregados`;
-- 9
SELECT DATE_FORMAT(`data_nascimento`, "%d %M %Y") FROM `empregados`;

-- Exercícios tabela cancoes
SELECT * FROM `cancoes`;
-- 10
SELECT COUNT(*) FROM `cancoes` WHERE `compositor` = 'AC/DC';
-- 11
SELECT AVG(`duracao_segundos`) FROM `cancoes`;
-- 12
SELECT AVG(`bytes`) FROM `cancoes` WHERE `compositor` = 'AC/DC';

-- Exercícios tabela clientes
SELECT * FROM `clientes`;
-- 13
SELECT COUNT(*) FROM `clientes` WHERE `cidade` = 'São Paulo';
-- 14
SELECT COUNT(*) FROM `clientes` WHERE `cidade` = 'Paris';
-- 15
SELECT COUNT(*) FROM `clientes` WHERE `email` LIKE '%yahoo%';