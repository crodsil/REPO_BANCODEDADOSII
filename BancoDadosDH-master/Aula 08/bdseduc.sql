-- Cria o banco de dados seduc e fazer a importação do seduc.sql
CREATE SCHEMA `seduc`;

-- 2) Utiizando a tabela Estudantes, liste apenas 5 alunos;
SELECT * 
FROM `estudantes`
LIMIT 5;

-- 3) Liste todos os estudantes a partir do id nr. 10;
SELECT * 
FROM `estudantes`
LIMIT 25
OFFSET 9;

-- 4) Liste apenas a coluna Nome da tabela Estudantes;
SELECT `estudante_nome` FROM `estudantes`;

-- 5) liste todos os estudantes com idade = 18 anos;
SELECT * FROM `estudantes` WHERE `estudante_idade` = 18;

-- 6. Liste todos os Estudantes com idade acima de 40 anos;
SELECT * FROM `estudantes` WHERE `estudante_idade` > 40;

-- 7. Liste todos os Estudantes com idade >= 65 anos;
SELECT * FROM `estudantes` WHERE `estudante_idade` >= 65;

-- 8. Liste todos os Estudantes com idade < 35 anos;
SELECT * FROM `estudantes` WHERE `estudante_idade` < 35;

-- 9. Liste todos os Estudantes com idade <= 30 anos;
SELECT * FROM `estudantes` WHERE `estudante_idade` >= 30;

-- 10. Liste todos os Estudantes com idade <> 40 anos;
SELECT * FROM `estudantes` WHERE `estudante_idade` != 40;

-- 11.Liste todos os campos cujo campo escola_id é "Nulo";
SELECT * FROM `estudantes` WHERE `escola_id` IS NULL;

-- 12.Liste todos os Estudantes  com idade entre 32 e 45 anos;
SELECT * FROM `estudantes` WHERE `estudante_idade` BETWEEN 32 AND 45;

-- 13. Liste todos os Estudantes que tenham as seguinte idades: 18, 35 e 52;
SELECT * FROM `estudantes` WHERE `estudante_idade` IN (18,35,52);

-- 14. Liste todos os Estudantes cujo nome comece com "A";
SELECT * FROM `estudantes` WHERE `estudante_nome` LIKE 'A%';

-- 15. Liste todos os Estudantes em ordem decrescente de idade;
SELECT * FROM `estudantes` ORDER BY `estudante_idade` DESC;

-- 16. iste todos os Estudantes em ordem crescente de idade;
SELECT * FROM `estudantes` ORDER BY `estudante_idade` ASC;

-- 17 Liste 15 Estudantes a partir da 20ª posição.
SELECT * FROM `estudantes` LIMIT 15 OFFSET 19;

-- 18. Exclua todos os Estudantes com idade = 18 anos
DELETE FROM `estudantes` WHERE `estudante_idade` = 18;

-- 18.5 Nova lista de estudantes 
SELECT * FROM `estudantes` 