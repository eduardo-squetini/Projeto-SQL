/*INNER JOIN - relação de dados de uma mesma tabela*/
/*CLIENTES DA MESMA REGIÃO*/
SELECT a.contactname, b.contactname, b.ContactName,b.Region
from Customers a, Customers b
where a.Region = b.Region;

/*NOME E DATA DE CONTRATAÇÃO DE TODOS OS FUNCIONÁRIOS ENCONTRADOS NO MESMO ANO*/

SELECT A.Firstname, A.hiredate, b.firstname, b.hiredate
FROM Employees A, Employees B
WHERE DATEPART(YEAR, A.hiredate) = DATEPART(YEAR,B.HireDate);

/*QUAIS PRODUTOS TEM O MESMO PERCENTUAL DE DESCONTO (ORDER DETAILS)*/

SELECT a.ProductID, a.Discount, b.ProductID, b.Discount
FROM [Order Details] a, [Order Details] b
WHERE a.Discount = b.Discount
/*
Tipo de Dado | Descrição                                                  | Exemplo
-------------|------------------------------------------------------------|---------
Booleanos    | Representa verdadeiro ou falso.                            | TRUE, FALSE
Tinyint      | Inteiro pequeno de 0 a 255.                                | 150
Smallint     | Inteiro de -32,768 a 32,767.                               | 32767
Int          | Inteiro de -2,147,483,648 a 2,147,483,647.                 | -2147483648
Numeric      | Número exato com precisão e escala fixas.                  | 12345.6789
Real         | Número de ponto flutuante de precisão simples.             | 12345.6789
Float        | Número de ponto flutuante de precisão dupla.               | -123.456789
Date         | Data no formato AAAA-MM-DD.                                | 2024-03-20
Datetime     | Data e hora no formato AAAA-MM-DD HH:MM:SS.                | 2024-03-20 21:48:37
Datetime2    | Data e hora com precisão fracionária adicional.            | 2024-03-20 21:48:37.1234567
Time         | Hora no formato HH:MM:SS.                                  | 21:48:37
*/

/*CHAVE PRIMÁRIA:
	CREATE TABLE nome_tabela(
	nomeColuna tipoDados PRIMARY KEY
	)

	CHAVE ESTRANGEIRA:
	ALTER TABLE NomeTabela
	ADD CONSTRAINT NomeChavePrimaria
	PRIMARY KEY (ColunaOuColunas);

*/

/*CREATE TABLE
	CREATE TABLE nomeTabela
	coluna1 tipo restrição coluna
	coluna2 tipo restrição coluna
	coluna3 tipo restrição coluna
	....

CONSTRAINTS:
	Restrição   | Descrição
------------|--------------------------------------------------------------
NOT NULL    | Garante que a coluna não possa ter um valor nulo.
UNIQUE      | Assegura que todos os valores na coluna sejam únicos.
PRIMARY KEY | Identifica de forma única cada registro na tabela.
FOREIGN KEY | Estabelece uma relação entre colunas de diferentes tabelas.
CHECK       | Define uma condição que os valores da coluna devem satisfazer.
DEFAULT     | Define um valor padrão para a coluna quando um registro é inserido.

*/

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



