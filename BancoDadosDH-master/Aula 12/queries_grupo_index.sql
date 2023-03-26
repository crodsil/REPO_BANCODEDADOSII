-- Exercicio Slack 
-- Grupo 6 - Felipe Gonçalves, Felipe Reusch, Jonathan Coutinho, Leonardo Vinicius, Leshly Ontiveros, 
SELECT `cancoes`.`nome` as `NomeCancao`, `tipos_de_arquivo`.`nome` as `TipoArquivo` 
FROM `cancoes` left join `tipos_de_arquivo`
on `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id`
order by `cancoes`.`id` DESC
limit 4000;

-- O limit não é necessário, pois a quantidade total de dados da tabela é de 3503. 
-- Os comandos em minúsculo podem atrapalhar a leitura em alguns casos 

SELECT `cancoes`.`nome` AS `NomeCancao`, `tipos_de_arquivo`.`nome` AS `TipoArquivo` 
	FROM `cancoes` LEFT JOIN `tipos_de_arquivo`
	ON `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id`
	ORDER BY `cancoes`.`id` DESC;

-- Ordem do processamento:
-- FROM `cancoes` -> ON `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id` -> LEFT JOIN `tipos_de_arquivo` -> 
-- -> SELECT `cancoes`.nome, `tipos_de_arquivo`.`nome` -> ORDER BY `cancoes`.`id` DESC -> LIMIT 

-- Exercício 1 - Index

SHOW INDEX FROM cancoes;

EXPLAIN SELECT cancoes.nome AS NomeCancao FROM cancoes WHERE cancoes.nome = 'Hero';
-- 3503 rows sem index
-- 1 row com index

CREATE INDEX I_cancoes_nome ON cancoes(nome);

ALTER TABLE cancoes
DROP INDEX I_cancoes_nome;

-- Exercicio 2 - Index

SHOW INDEX FROM albuns;

EXPLAIN SELECT albuns.titulo FROM albuns WHERE albuns.titulo = 'Na Pista';
-- 347 rows sem index
-- 1 row com index

CREATE INDEX I_albuns_titulo ON albuns(titulo);

ALTER TABLE albuns
DROP INDEX I_albuns_titulo;
