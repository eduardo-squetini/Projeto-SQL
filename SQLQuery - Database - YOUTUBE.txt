CREATE TABLE Canal(
	CanalID INT PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	ContagemInscritos INT DEFAULT 0,
	DataCriacao DATETIME NOT NULL
)

CREATE TABLE Video(
	VideoID INT PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	Visualizacoes INT DEFAULT(0),
	Likes INT DEFAULT(0),
	Dislikes INT DEFAULT(0),
	Duracao INT NOT NULL,
	CanalID INT FOREIGN KEY REFERENCES Canal(CanalID)
);

/*INSERT INTO

	inserir dados em uma tabela
	INSERT INTO nomeTABELA(coluna1, coluna2 ...)
	VALUES(valor1,valor2)

	inserir dados de uma tabela na outra
	INSERT INTO TabelaA (coluna1)
	SELECT coluna2
	FROM TabelaB
*/

CREATE TABLE aula(
	ID INT PRIMARY KEY,
	Nome VARCHAR(200)
);

INSERT INTO aula(ID,Nome)
VALUES(1, 'aula1');

INSERT INTO aula(ID,Nome)
VALUES  (2, 'Aula2'),
		(3, 'Aula2'),
		(4, 'Aula2'),
		(5, 'Aula2');


SELECT* INTO tabelaCLASSE
FROM aula;

/*UPDATE - ATUALIZAR LINHAS DOS BANCOS DE DADOS
	UPDATE nomeTabela
	SET coluna1 = valor1
		coluna2 = valor2
	WHERE condicao
*/

UPDATE aula
SET Nome  = 'Aula3'
WHERE ID = 3;

/*SET NomeDaColuna = CASE
    WHEN Condicao1 THEN 'Valor1'
    WHEN Condicao2 THEN 'Valor2'

*/

/*mais de um UPDATE*/
UPDATE aula
SET Nome = CASE
    WHEN ID = '3' THEN 'AULA3'
    WHEN ID = '4' THEN 'AULA4'
	WHEN ID = '1' THEN 'AULA1'
	WHEN ID = '2' THEN 'AULA2'
	WHEN ID = '5' THEN 'AULA5'
	END;

/*DELETE - LINHAS DA TABELA
	DELETE FROM nomeTabela
	WHERE condicao
*/

DELETE FROM aula
WHERE Nome = 'AULA3'

/*ALTER TABLE 
	ALTER TABLE nomeTabela
	ACAO

	ACOES: ADD, SET, 
*/

ALTER TABLE Canal
add Descrição VARCHAR(500);

ALTER TABLE Canal 
ALTER COLUMN categoria VARCHAR(150) NOT NULL

/*ALTERAR NOME DE COLUNA
	EXEC sp_RENAME 'nomeTABELA.nomeCounaATUAL1', 'nomeColunaNova', 'COLUMN'

  ALTERAR NOME TABELA
		EXEC sp_RENAME 'nomeTABELA', 'nomeTabelaNova'
*/

EXEC sp_RENAME 'Canal.Nome', 'nomeCHANNEL', 'COLUMN';

EXEC sp_RENAME 'Canal', 'MeuCanal';