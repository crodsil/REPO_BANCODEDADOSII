-- Exercicios aula Aprofundamentos
-- 
-- Revisão índices
-- 1: Na tabela canções liste todos os índices criados.
-- 2: Caso exista um índice criado na coluna nome, exclua-o.
-- 3: Agora, crie um índice para a coluna nome.

SHOW INDEX FROM cancoes;

CREATE INDEX I_cancoes_nome ON cancoes(nome);

-- Explain 
-- 1: Use o comando Explain para fazer uma pesquisa (select) na tabela canções que retorne o tamanho
-- da música chamada “Be Yourself”. E verifique o número de rows percorridas (deve ser 1);

SELECT cancoes.bytes FROM cancoes WHERE cancoes.nome = 'Be Yourself';
EXPLAIN SELECT cancoes.bytes FROM cancoes WHERE cancoes.nome = 'Be Yourself';

-- Priority
-- 1: Selecione todos os campos da tabela canções com alta prioridade.
-- 2: Atualize o nome da canção “Crazy” para “I am Crazy” com baixa prioridade.

SELECT HIGH_PRIORITY * FROM cancoes;

UPDATE LOW_PRIORITY cancoes SET cancoes.nome = 'I am Crazy' WHERE cancoes.nome = 'Crazy';

-- 4) Benchmark
-- a) Faça o benchmark de uma consulta que retorne o compositor da canção “I am Crazy” limitado a 1
-- registro realizada 100 milhões de vezes.

SELECT BENCHMARK(100000000,(SELECT cancoes.compositor FROM cancoes WHERE cancoes.nome = 'I am Crazy'));
-- 2,984 segundos

-- Permissões
-- a) Exiba todos os usuários dos bancos de dados.
SELECT * FROM mysql.user;

-- b) Crie três usuários, um com o seu primeiro nome e outros dois com nomes fictícios.
CREATE USER 'jonathan'@'localhost' IDENTIFIED BY 'uma_Senha_Muito!Loucaç';
CREATE USER 'mariane'@'localhost' IDENTIFIED BY 'essaesuaSenha';
CREATE USER 'rodolfo'@'localhost' IDENTIFIED BY 'CTD2021';

-- c) Exiba novamente os usuários dos bancos de dados para se certificar de que foram criados.
SELECT * FROM mysql.user;

-- d) Conceda todos os privilégios, em todos os bancos e tabelas para o usuário com o seu nome.
GRANT ALL PRIVILEGES ON *.* TO 'jonathan'@'localhost';

-- e) Para o segundo usuário criado conceda a permissão de inserir dados em todos os bancos e tabelas.
GRANT INSERT ON *.* TO 'mariane'@'localhost';

-- f) Para o terceiro usuário conceda apenas a permissão de selecionar dados da tabela canções
-- do banco musimundos_v2.
GRANT SELECT ON musimundos_V2.cancoes TO 'rodolfo'@'localhost';

-- g) Exiba os privilégios do usuário com o seu nome.
SHOW GRANTS FOR 'jonathan'@'localhost';

-- h) Revogue a permissão de atualizar dados (update) do usuário com o seu nome, para todos os bancos
-- de dados e tabelas.
REVOKE UPDATE ON *.* FROM 'jonathan'@'localhost';

-- i) Exiba novamente os privilégios do usuário com o seu nome.
SHOW GRANTS FOR 'jonathan'@'localhost';

-- j) Exclua o usuário com o seu nome e exiba novamente os usuários.
DROP USER 'jonathan'@'localhost';
SELECT * FROM mysql.user;
