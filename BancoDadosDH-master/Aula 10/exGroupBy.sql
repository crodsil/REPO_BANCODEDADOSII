-- Exercicios group by

SELECT `C`.`pais`, COUNT(`C`.`id`) AS `qtd_clientes`, AVG(`F`.`valor_total`) AS `medias_faturas`
FROM `clientes` AS `C`
INNER JOIN `faturas` AS `F`
ON `C`.`id` = `F`.`id_cliente`
GROUP BY `F`.`pais_cobranca`
ORDER BY `medias_faturas` DESC;

-- Exercícios Playground
-- 1- Liste a qntd de canções existem para cada gênero musical agrupando a consulta por gênero e ordenando da maior qntd pra menor 

SELECT `G`.`nome` AS `Genero`, COUNT(`C`.`id`) AS `qntd_musicas`
FROM `generos` AS `G`
INNER JOIN `cancoes` AS `C`
ON `G`.`id` = `C`.`id_genero`
GROUP BY `Genero`
ORDER BY `qntd_musicas` DESC;

-- 2 Liste a quantidade de canções existentes para gênero musical, agrupando por gênero. Exiba apenas os gêneros que tem mais de 10 canções 

SELECT `G`.`nome` AS `Genero`, COUNT(`C`.`id`) AS `qntd_musicas`
FROM `generos` AS `G`
INNER JOIN `cancoes` AS `C`
ON `G`.`id` = `C`.`id_genero`
GROUP BY `Genero`
HAVING `qntd_musicas` > 10;

-- 3 Utilizando clientes e faturas, liste os países, a quantidade de clientes e a soma das faturas por país,
-- ordenando do maior para o menor, limitando a consulta a 7 registros

SELECT `C`.`Pais`, COUNT(`C`.`id`) AS `qntd_clientes`, SUM(`F`.`valor_total`) AS `valor_faturas`
FROM `clientes` AS `C`
INNER JOIN `faturas` AS `F`
ON `C`.`id` = `F`.`id_cliente`
GROUP BY `F`.`pais_cobranca`
ORDER BY `valor_faturas` DESC
LIMIT 7;
