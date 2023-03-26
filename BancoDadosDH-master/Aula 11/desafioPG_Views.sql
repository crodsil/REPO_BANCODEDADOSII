SELECT cancoes.nome, COUNT(itens_da_faturas.quantidade)
FROM cancoes 
INNER JOIN itens_da_faturas
ON cancoes.id = itens_da_faturas.id_cancao
GROUP BY cancoes.id
HAVING cancoes.nome = 'Overdose';

CREATE VIEW FATURAS_NACIONAIS AS
	SELECT faturas.id AS idFaturas, faturas.data_fatura, faturas.valor_total, clientes.id AS idCliente, clientes.sobrenome
    FROM faturas
    LEFT JOIN clientes
    ON faturas.id_cliente = clientes.id
	WHERE faturas.pais_cobranca = 'Argentina';
    
DROP VIEW FATURAS_NACIONAIS;
SELECT * FROM FATURAS_NACIONAIS;

CREATE VIEW LATINOS AS 
	SELECT artistas.nome AS NomeArtista, albuns.titulo, cancoes.nome AS Música, generos.nome AS Gênero
    FROM albuns 
    INNER JOIN artistas
    ON artistas.id = albuns.id_artista
    INNER JOIN cancoes 
    ON albuns.id = cancoes.id_album
    INNER JOIN generos
    ON generos.id = cancoes.id_genero
    HAVING generos.nome = 'latin';
    
DROP VIEW LATINOS;   
SELECT * FROM LATINOS
ORDER BY NomeArtista,Música;


SELECT cancoes.nome AS Música, generos.nome AS Gênero
FROM generos
INNER JOIN cancoes
ON generos.id = cancoes.id_genero


