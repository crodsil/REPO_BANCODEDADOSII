-- Exercicios inner join e having

SELECT `artistas`.`nome` AS Artista, `albuns`.`titulo` AS Álbum 
FROM `artistas`
INNER JOIN `albuns`
ON `artistas`.`id` = `albuns`.`id_artista`
ORDER BY `artistas`.`id`; 

SELECT `clientes`.`nome` AS ClienteNome, `faturas`.`valor_total` AS ValorFatura
FROM `clientes`
INNER JOIN `faturas`
ON `clientes`.`id` = `faturas`.`id_cliente`
HAVING ValorFatura > 5 
ORDER BY ValorFatura DESC;

SELECT `cancoes`.`nome` AS NomeMusica, `tipos_de_arquivo`.`nome` AS ArquivoTipo
FROM `cancoes`
INNER JOIN `tipos_de_arquivo`
ON `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id`
ORDER BY `cancoes`.`id`; 




