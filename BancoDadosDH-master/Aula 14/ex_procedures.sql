-- Exercícios Playground 
-- I - tabela faturas
-- 1) Crie uma procedure que selecione a fatura com o valor mais baixo de todas.

DELIMITER $$
CREATE PROCEDURE faturaMinima ()
BEGIN
SELECT id, MIN(valor_total) FROM faturas;
END $$
DELIMITER ; 

CALL faturaMinima();

-- 2) Crie uma procedure que retorna a quantidade de faturas que tem o país de cobrança como “Canada”.

DELIMITER $$
CREATE PROCEDURE faturasCanada()
BEGIN
SELECT COUNT(*) FROM faturas WHERE pais_cobranca = 'Canada';
END $$
DELIMITER ;

CALL faturasCanada();
-- 56 resultados

-- 3) Uma procedure que retorna o valor somado de todas as faturas.
DELIMITER $$
CREATE PROCEDURE valorTotalFaturas()
BEGIN
SELECT SUM(valor_total) AS ValorTotalFaturas FROM faturas;
END $$
DELIMITER ;

CALL valorTotalFaturas();

-- 3) Uma procedure que retorna o valor médio de todas as faturas.

DELIMITER $$
CREATE PROCEDURE mediaFaturas()
BEGIN
SELECT AVG(valor_total) AS ValorMedio FROM faturas;
END $$
DELIMITER ;

CALL mediaFaturas();

-- II - tabela cancoes

-- 1) Crie uma procedure que retorna o tamanho em bytes e a duração de uma canção pelo seu id.

DELIMITER $$
CREATE PROCEDURE tamanho_duracao(IN i INT)
BEGIN
SELECT nome AS Música,bytes, duracao_segundos FROM cancoes WHERE id = i;
END $$
DELIMITER ;

CALL tamanho_duracao(1);

-- 2) Crie uma procedure que retorna o preço unitário uma canção pelo seu id.

DELIMITER $$
CREATE PROCEDURE precoCancao(IN i INT)
BEGIN
SELECT nome AS Música, preco_unitario FROM cancoes WHERE id = i;
END $$
DELIMITER ;

CALL precoCancao(1);

-- 3) Crie uma procedure que retorna o id da canção, o nome da canção e o tipo de arquivo(table tipos_de_arquivo)
-- desta canção á partir de um id da canção informado.

DELIMITER $$
CREATE PROCEDURE nomeTipoCancao(IN i INT)
BEGIN
	SELECT C.id AS idCancao, C.nome AS Música, T.nome AS TipoArquivo
	FROM cancoes AS C INNER JOIN tipos_de_arquivo AS T
	ON T.id = C.id_tipo_de_arquivo
    WHERE C.id = i;
END $$
DELIMITER ;

CALL nomeTipoCancao(1);

-- III - tabela clientes

-- 1) Crie uma procedure que retorna o nome e sobrenome concatenados e também o email de todos os clientes.

DELIMITER $$
CREATE PROCEDURE dadosClientes()
BEGIN
SELECT CONCAT(nome,' ',sobrenome) AS Nome, email FROM clientes;
END $$
DELIMITER ;

CALL dadosClientes();

-- 2) Crie uma procedure que retorna o nome completo (nome e sobrenome concatenados)  e 
-- também o endereço completo (endereço, cidade, estado e país) de um cliente pelo id informado.

DELIMITER $$
CREATE PROCEDURE nomeEnderecoCliente(IN i INT)
BEGIN
SELECT CONCAT(nome,' ',sobrenome) AS Nome, endereco, cidade, estado, pais FROM clientes
WHERE id = i;
END $$
DELIMITER ;

CALL nomeEnderecoCliente(10);

-- 3) Crie uma procedure que retorna o nome do cliente e o valor total de 
-- cada uma das suas faturas pelo id do cliente informado

DELIMITER $$
CREATE PROCEDURE faturaCliente(IN i INT)
BEGIN
SELECT CONCAT(C.nome,' ',C.sobrenome) AS Nome, F.valor_total
FROM clientes AS C INNER JOIN faturas AS F
ON C.id = F.id_cliente
WHERE C.id = i;
END $$
DELIMITER ; 

CALL faturaCliente(1);




