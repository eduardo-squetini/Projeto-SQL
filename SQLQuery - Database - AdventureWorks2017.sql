/*SELECT:

SELECT coluna 1, coluna 2
FROM tabela

SELECT * (TODAS COLUNAS)
FROM tabela*/

SELECT*
FROM person.Person;

SELECT Title
FROM person.PERSON;

SELECT*
FROM person.EmailAddress;

/*Pesquisa de nomes mais comuns entre os clientes e o nome e sobrenome de todos eles:*/

SELECT firstName, lastName
FROM person.Person;

/*Neste comando, quantidade é um alias para COUNT(*), que representa a contagem de cada firstName. 
A cláusula ORDER BY quantidade DESC ordena os nomes pelo número de ocorrências em ordem decrescente, mostrando os mais frequentes no topo.*/
SELECT firstName, COUNT(*) as quantidade
FROM person.Person
GROUP BY FirstName
HAVING COUNT(*) > 1
ORDER BY quantidade DESC;

--Pesquisa de sobrenomes distintos

SELECT DISTINCT LastName
FROM person.Person

/*  WHERE:
	SELECT coluna1
	FROM tabela
	WHERE condição

	Operador       Descrição                                       Exemplo
=======        =========                                       =======
=              Igualdade                                       WHERE idade = 21
<> ou !=       Desigualdade                                    WHERE idade <> 21
<              Menor que                                       WHERE idade < 21
>              Maior que                                       WHERE idade > 21
<=             Menor ou igual a                                WHERE idade <= 21
>=             Maior ou igual a                                WHERE idade >= 21
BETWEEN        Entre um intervalo (inclusive)                  WHERE idade BETWEEN 18 AND 21
NOT BETWEEN    Fora de um intervalo                            WHERE idade NOT BETWEEN 18 AND 21
IN             Em um conjunto de valores                       WHERE nome IN ('Ana', 'João')
NOT IN         Não em um conjunto de valores                   WHERE nome NOT IN ('Ana', 'João')
LIKE           Correspondência de padrão (comodins % e _)      WHERE nome LIKE 'A_a%'
NOT LIKE       Não corresponde ao padrão                       WHERE nome NOT LIKE 'A_a%'
IS NULL        É nulo                                          WHERE nome IS NULL
IS NOT NULL    Não é nulo                                      WHERE nome IS NOT NULL
AND            E lógico (todas as condições verdadeiras)       WHERE idade > 18 AND nome LIKE 'A%'
OR             Ou lógico (qualquer condição pode ser verdadeira)   WHERE idade < 18 OR nome LIKE 'A%'

*/

/*PESQUISANDO DADOS EM "LOCAIS" ESPECÍFICOS*/

SELECT*
FROM person.Person
WHERE LastName = 'miller' and FirstName = 'anna';

SELECT*
FROM Production.Product
WHERE Color = 'blue' or Color = 'black'

SELECT*
FROM Production.Product
WHERE Weight > 500 and ListPrice < 700;

SELECT*
FROM Production.Product
WHERE Color != 'red' and Color != 'black';


/*RELAÇÃO DE EMPREGADOS CASADOS E ASSALARIADOS*/
SELECT*
FROM HumanResources.Employee
WHERE MaritalStatus != 'S' and SalariedFlag = '1';

/*PESQUISAR EMAIL DE PETER KUMAR*/
SELECT*
FROM Person.Person
WHERE FirstName = 'peter' and LastName = 'kumar'

SELECT*
FROM Person.EmailAddress
WHERE BusinessEntityID = 20415;

/*COUNT: contagem
	SELECT COUNT(* OR coluna)
	FROM TABELA
*/

SELECT count(distinct FirstName)
from Person.Person;

/*QUANTIDADE DE PRODUTOS CADASTRADOS / TAMANHOS DIFERENTES*/

SELECT count(*)
FROM Production.Product;

SELECT count(distinct Size)
FROM Production.Product;

/*TOP(LISTA DE QUANTIDADE ESPECÍFICA)
	SELECT TOP 10 *
	FROM TABELA
*/

SELECT TOP 10*
FROM Production.Product;

/*ORDER BY (CRESCENTE OU DECRESCENTE)
	SELECT coluna
	FROM tabela
	ORDER BY coluna ASC/DESC
*/

SELECT FirstName, LastName
FROM person.Person
ORDER BY FirstName ASC , LastName DESC;

/*10 PREÇOS DOS PRODUTOS MAIS CAROS DESC*/
SELECT TOP 10ListPrice 
from Production.Product
ORDER BY ListPrice DESC;

/*OBTER O NOME DOS PRODUTOS QUE CUSTAM ENTRE 2000 E 3000*/
SELECT NAME, ListPrice
FROM Production.Product
WHERE ListPrice >= 2000 and ListPrice <= 3000
ORDER BY ListPrice DESC;

/*BETWEEN (encontrar valor entre mínimo e máximo)
	valor BETWEEN mínimo AND máximo;
*/

/*LISTA DE PRODUTOS ENTRE VALORES OU  QUE NÃO ESTÃO ENTRE VALORES*/
SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 1000 and 1500;

SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 and 1500;

/*DATA DE PESSOAS CONTRATADAS*/
SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate;

/*IN utiliza-se junto com WHERE

	Verificação de algum valor na lista de valores passada

	valor IN (valor1,valor2)
*/

SELECT *
FROM person.Person /* OU NOT IN*/
WHERE BusinessEntityID IN (2,7,13);

/*LIKE (encontrar um valor parecido ao que foi passado)
	% - valor desconhecido
	_ - apenas um caracter
*/

SELECT*
FROM Person.Person
WHERE FirstName like 'ovi%';

SELECT*
FROM Person.Person
WHERE FirstName like'%essa%';

SELECT*
FROM Person.Person
WHERE FirstName like '%ro_';

/*QUANTIDADE DE PRODUTOS CADASTRADOS NO SISTEMA QUE CUSTAM MAIS QUE 1500*/

SELECT COUNT(*)
FROM Production.Product
WHERE ListPrice > 1500;

/*QUANTIDADE DE PESSOAS QUE INICIAM O SOBRENOME COM A LETRA P*/
SELECT COUNT(*)
FROM Person.Person
WHERE LastName LIKE 'p%';

/*QUANTIDADE DE CIDADES DIFERENTES QUE ESTÃO CADASTRADOS OS CLIENTES*/
SELECT COUNT(DISTINCT city)
FROM Person.Address

/*NOME DAS CIDADES DIFERENTES NO SISTEMA*/
SELECT DISTINCT city
FROM Person.Address;

/*QUANTIDADE DE PRODUTOS VERMELHOS QUE CUSTAM ENTRE 500 A 1000*/
SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red' and ListPrice BETWEEN 500 and 1000;

/*MIN, MAX, SUM, AVG
	AGREGAM DADOS DE UMA TABELA EM UM ÚNICO RESULTADO
*/

/*AGREGANDO O VALOR DE VENDAS*/
SELECT TOP 10 sum(LineTotal) AS "soma"
FROM sales.SalesOrderDetail;

SELECT TOP 10 MIN(LineTotal) as "valor mínimo"
FROM sales.SalesOrderDetail;

SELECT TOP 10 MAX(LineTotal) as "valor máximo"
FROM sales.SalesOrderDetail;

SELECT TOP 10 AVG(LineTotal) as "valor médio"
FROM sales.SalesOrderDetail;

/*GROUP BY (divide o resultado da pesquisa em grupos)
	SELECT coluna1, funçãoAgregação(coluna2)
	FROM nomeTabela
	GROUP BY coluna1;
*/

/*AGRUPANDO O PREÇO UNITÁRIO DE PRODUTOS BASEADO NO ID DE PROMOÇÃO*/

SELECT SpecialOfferID, SUM(UnitPrice) AS "SOMA"
FROM sales.SalesOrderDetail
GROUP BY SpecialOfferID;

/*QUANTOs produtos com o mesmo ID existem*/
SELECT ProductId, count(ProductId)
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

/*MÉDIA DE PREÇO DOS PRODUTOS PRATAS*/
SELECT Color, AVG(ListPrice) AS "MÉDIA DE PREÇO"
FROM Production.Product
WHERE color = 'silver'
GROUP BY Color;

/*MÉDIA DA QUANTIDADE DE PEDIDOS DE CADA PRODUTO*/

SELECT ProductId,AVG(OrderQty) AS "MÉDIA"
FROM sales.SalesOrderDetail
GROUP BY ProductID;

/*TOP 10 PRODUTOS COM VENDAS DE MAIOR VALOR*/

SELECT TOP 10 ProductID, SUM(lineTotal) as "SOMA DE VENDAS"
FROM sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC;

/*QUANTIDADE DE PRODUTOS E A MÉDIA DELES NAS ORDENS DE SERVIÇO*/
SELECT ProductID , COUNT(ProductId) "contagem", 
AVG(OrderQty) as 'média de ordem de serviço'
FROM Production.WorkOrder
GROUP BY ProductID;

/*HAVING (Utilizado com o GROUP BY para filtrar os dados agrupados)

	SELECT coluna1, funçãoAgregação(coluna2)
	FROM nomeTabela
	GROUP BY coluna1
	HAVING condição;

*/

/*NOMES QUE SE REPETEM MAIS DE 10 VEZES*/
SELECT FirstName,COUNT(FirstName) as "quantidade"
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10;

/*PRODUTOS COM TOTAL DE VENDAS ENTRE 162K E 500K*/
SELECT ProductID, sum(lineTotal) as "Total de Venda"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING sum(LineTotal) between 162000 and 500000;

/*IDENTIFICAR AS PROVINCIAS COM O MAIOR NUMERO DE CADASTROS NO SISTEMA*/
SELECT stateProvinceId, count(stateProvinceId) as "quantidade"
FROM person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID)>1000
ORDER BY COUNT(StateProvinceID) DESC;

/*IDENTIFICAR PRODUTOS QUE NÃO TRAZEM NO MÍNIMO 1 MILHÃO NA MÉDIA DO TOTAL DE VENDAS*/
SELECT ProductID, AVG(LineTotal) as "Média do Total de Vendas"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000;

/*INNER JOIN - retorna apenas os resultados que existem tanto na tabela A como na B

	SELECT*
	FROM TABELA A 
	INNER JOIN TABELA B ON tabelaA.nome = tabelaB.nome

FULL OUTER JOIN - retorna um conjunto de todos os registros correspondentes da Tabela A e Tabela B quando são iguais
e se não houver valores correspondentes retorna com "null"

	SELECT*
	FROM tabelaA
	FULL OUTER JOIN tabelaB
	ON TabelaA.nome = TabelaB.nome

LEFT JOIN - retorna um conjunto de todos os registros da Tabela A e os registros correspondentes (quando disponíveis) da Tabela B
e se não houver valores correspondentes retorna com "null"

	SELECT*
	FROM TabelaA
	LEFT JOIN TabelaB ON TabelaA.nome = TabelaB.nome
*/

/*BusinessEntityId, FirstName, LastName, EmailAdress
	TABELA PERSON.PERSON & TABELA PERSON.EMAILADDRESS
	CHAVE ESTRANGEIRA: BusinnesEntityId
*/

SELECT p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress
FROM Person.Person as p
INNER JOIN Person.EmailAddress PE on p.BusinessEntityID = pe.BusinessEntityID;

/*ListPrice, Nome do Produto, Nome da Subcategoria
	TABELA PRODUCTION.PRODUCT & TABELA PRODUCTION.PRODUCTSUBCATEGORY
	CHAVE ESTRANGEIRA: ProductSubcategoryID
*/

SELECT p.ListPrice, p.Name, pe.Name
FROM Production.Product as p
INNER JOIN Production.ProductSubcategory PE on p.ProductSubcategoryID = pe.ProductSubcategoryID;

/*JUNTANDO TODAS INFORMAÇÕES DE COLUNAS
	TABELA Person.BusinessEntityAddress & TABELA Person.Address
	CHAVE ESTRANGEIRA: AddressID
*/

SELECT TOP 10 *
FROM Person.BusinessEntityAddress P
INNER JOIN Person.Address PE ON P.AddressID = PE.AddressID;

/*BusinessEntityID, Name, PhoneNumbeTypeID, PhoneNumber
	TABELA PERSON.PHONENUMBERTYPE & TABELA PERSON.PERSONPHONE
	CHAVE ESTRANGEIRA: PhoneNumberTypeID
*/

SELECT p.BusinessEntityID, pe.Name, pe.PhoneNumberTypeID, p.PhoneNumber
FROM Person.PersonPhone p
INNER JOIN Person.PhoneNumberType pe on p.PhoneNumberTypeID = pe.PhoneNumberTypeID;

/*REGISTRO DE PESSOAS COM CARTÃO DE CRÉDITO NO SISTEMA*/

SELECT*
FROM Person.Person p
INNER JOIN Sales.PersonCreditCard pe on pe.BusinessEntityID = p.BusinessEntityID
/*INNER JOIN: 19.118 resultados - retorna somente pessoas com cartão de creditp*/

SELECT*
FROM Person.Person p
LEFT JOIN Sales.PersonCreditCard pe on pe.BusinessEntityID = p.BusinessEntityID
/*LEFT JOIN: 19.972 resultados - retorna todas as pessoas e as que nn tem cartão retorna com "null"*/

/*PESSOAS QUE NÃO TEM CARTÃO NO SISTEMAS:*/

SELECT p.FirstName, pe.CreditCardID
FROM Person.Person p
LEFT JOIN Sales.PersonCreditCard pe on pe.BusinessEntityID = p.BusinessEntityID
WHERE pe.CreditCardID IS NULL;

/*UNION - Junção de dois ou mais resultados de um select e remove os dados duplicados

	SELECT coluna1, coluna2
	FROM tabela1
	UNION
	SELECT coluna1, coluna2
	FROM tabela2
*/

/*SELEÇÃO DE PRODUTOS COM NOME %DECAL% E %CHAIN%*/

SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE Name like '%DECAL%'
UNION
SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE Name like '%CHAIN%'
ORDER BY Name;

/*DATEPART
	DATEPART(condição de tempo, coluna)

| Função  | Descrição                              | Exemplo de Uso                         |
|---------|-----------------------------------     |----------------------------------------|
| YEAR    | Retorna o ano da data especificada     | SELECT DATEPART(YEAR, '2023-03-20');   |
| MONTH   | Retorna o mês da data especificada     | SELECT DATEPART(MONTH, '2023-03-20');  |
| DAY     | Retorna o dia da data especificada     | SELECT DATEPART(DAY, '2023-03-20');    |
| HOUR    | Retorna a hora da data especificada    | SELECT DATEPART(HOUR, '2023-03-20 19:34:30');|
| MINUTE  | Retorna os minutos da data especificada| SELECT DATEPART(MINUTE, '2023-03-20 19:34:30');|

*/

/*MÊS EM QUE FORAM FEITOS OS PEDIDOS DE VENDA*/
SELECT SalesOrderID, DATEPART(month, OrderDate) as 'mês'
FROM Sales.SalesOrderHeader

/*ANO EM QUE FORAM FEITOS OS PEDIDOS DE VENDA*/
SELECT SalesOrderID, DATEPART(YEAR, OrderDate) as 'ano'
FROM Sales.SalesOrderHeader

/*MÉDIA DE VALOR DEVIDO(TOTAL DUE) POR MÊS*/

SELECT AVG(TotalDUE) as MEDIA, DATEPART(MONTH, OrderDate) as MES
from sales.SalesOrderHeader
GROUP BY DATEPART(MONTH,OrderDate)
ORDER BY MES;

/*MANIPULAÇÃO DE STRING

| Função   | Descrição                                      | Exemplo de Uso                    |
|----------|------------------------------------------------|-----------------------------------|
| CHARINDEX| Localiza a posição de um caractere             | SELECT CHARINDEX('a', 'Maçã');    |
| LEFT     | Seleciona caracteres da esquerda               | SELECT LEFT('Maçã', 2);           |
| RIGHT    | Seleciona caracteres da direita                | SELECT RIGHT('Maçã', 2);          |
| LEN      | Conta a quantidade de caracteres               | SELECT LEN('Maçã');               |
| REPLACE  | Substitui um caractere por outro               | SELECT REPLACE('Maçã', 'a', 'o'); |

*/
 
/*CONCATENAR INFORMAÇÕES*/
SELECT CONCAT(FirstName,' ', LastName) as nome_completo
FROM Person.Person;

/* DEIXAR DADOS EM MAIÚSCULO*/
SELECT UPPER(FirstName) as nomes
FROM Person.Person;

/* DEIXAR DADOS EM MINÚSCULO*/
SELECT LOWER(FirstName) as nomes
FROM Person.Person;

/*CONTAGEM DE CARACTERES*/
SELECT firstname, LEN(FirstName) as quantidade_de_caracteres
FROM Person.Person;

/*SUBSTITUIÇÃO DE CARACTERES*/
SELECT productNumber, REPLACE(ProductNumber,'-','*') as troca
FROM Production.Product;

/*FUNÇÕES MATEMÁTICAS

| Função   | Descrição                                      | Exemplo de Uso                 |
|----------|------------------------------------------------|--------------------------------|
| ABS      | Retorna o valor absoluto de um número          | SELECT ABS(-15);               |
| CEILING  | Arredonda para cima até o inteiro mais próximo | SELECT CEILING(15.75);         |
| FLOOR    | Arredonda para baixo até o inteiro mais próximo| SELECT FLOOR(15.75);           |
| POWER    | Retorna um número elevado a uma potência       | SELECT POWER(2, 3);            |
| SQRT     | Retorna a raiz quadrada de um número           | SELECT SQRT(16);               |

*/

/*ARREDONDAR VALORES
	 ROUND(LineTotal,2) 
	 (coluna, precisão decimal)
*/

SELECT ROUND(LineTotal,2) as arrendondamento , LineTotal
FROM Sales.SalesOrderDetail;

/*SUBQUERY OU SUBSELECT*/

/*RELATÓRIO DE PRODUTOS CADASTRADOS COM PREÇO ACIMA DA MÉDIA*/

/*FORMA INICIAL*/
SELECT AVG(ListPrice)
FROM Production.Product;

SELECT*
FROM Production.Product
WHERE ListPrice > 438.66;

/*UTILIZANDO SUBSELECT*/

SELECT*
FROM Production.Product
WHERE ListPrice > (SELECT AVG(listPrice) From Production.Product );

/*NOME DOS FUNCIONÁRIOS QUE SÃO DESIGN ENGINEER*/
SELECT Firstname
FROM Person.Person
WHERE BusinessEntityID IN (
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer');

SELECT Firstname, JobTitle
FROM Person.Person p
INNER JOIN HumanResources.Employee pe on p.BusinessEntityID = pe.BusinessEntityID
WHERE JobTitle = 'Design Engineer';

/*TODAS AS CIDADES CADASTRADAS QUE ESTÃO NO ESTADO DE 'ALBERTA'*/

SELECT DISTINCT City
FROM Person.Address
WHERE StateProvinceID IN(
SELECT StateProvinceID FROM Person.StateProvince
WHERE NAME = 'ALBERTA');
