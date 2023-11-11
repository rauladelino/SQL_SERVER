
/* 
Introdu��o ao SQL
	Comandos utilizados 
		</> SELECT
		</> SELECT *
		</> SELECT ... TOP e TOP PERCENT
		</> SELECT ... DISTINCT
		</> Comentando o c�digo
		</> Renomenado coluna (Alias)
		</> Exerc�cios
*/

-- Exemplos utilizando comando SELECT

--1. Retorna toda a tabela selecionada
SELECT
	* 
FROM
	DimStore 

--2. Retorna apenas as colunas selecionadas de uma tabela
SELECT 
	StoreKey, 
	StoreName, 
	StorePhone 
FROM
	DimStore



-- Exemplos utilizando SELECT ... TOP e TOP PERCENT

-- 1. Retorna as 10 primeiras linhas da tabela de Produtos.
SELECT TOP(10) * 
FROM 
	DimProduct

-- 2. Retorna 10% das primeiras linhas da tabela de Clientes.
SELECT TOP(10) PERCENT * 
FROM 
	DimCustomer


-- Exemplos utilizando	SELECT ... DISTINCT

-- 1. Retorna os valores distintos da coluna ColorName da tabela dimProduct
SELECT DISTINCT 
	ColorName 
FROM 
	DimProduct


-- Exemplos utilizando a fun��o Renomeando coluna (Alias)

-- 1. Retorna os valores de colunas selecionas e o 'AS' , Renomeia as colunas conforme o novo nome proposto.
-- Lembrando que essa renome��o n�o altera toda a base de dados.
SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct




--EXERCICIOS
--Quest�o 1
--Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa. O que voc� precisar� fazer � confirmar se:

/*a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc�
dever� reportar ao seu gestor para saber se existe alguma defasagem
no controle dos produtos.*/

--Resposta
SELECT
	DISTINCT ProductName
FROM
	DimProduct


/*b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na
base de controle. Verifique se esse n�mero aumentou ou reduziu. */

-- Resposta
SELECT * from DimCustomer



--Quest�o 2
/*Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter
uma ideia de oferecer descontos especiais para os clientes no dia de seus
anivers�rios. Para isso, voc� vai precisar listar todos os clientes e as suas
respectivas datas de nascimento, al�m de um contato.*/

--a. Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.

-- Resposta
SELECT 
	CustomerKey,
	FirstName,
	EmailAddress,
	BirthDate
From
	DimCustomer

--b. Renomeie as colunas dessa tabela usando o alias (comando AS).

-- Resposta
SELECT 
	CustomerKey AS 'ID CLIENTE',
	FirstName AS 'NOME CLIENTE',
	EmailAddress AS 'E-MAIL',
	BirthDate AS 'DATA DE NASCIMENTO'
From
	DimCustomer



/* Quest�o 3
A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e
pretende fazer uma a��o de premia��o para os clientes. A empresa quer
presentear os primeiros clientes desde a inaugura��o.
Voc� foi alocado para levar adiante essa a��o. Para isso, voc� ter� que
fazer o seguinte:*/

/*a. A Contoso decidiu presentear os primeiros 100 clientes da hist�ria
com um vale compras de R$ 10.000. Utilize um comando em SQL para
retornar uma tabela com os primeiros 100 primeiros clientes da
tabela dimCustomer (selecione todas as colunas).*/

--Resposta
SELECT TOP (100) *
FROM
	DimCustomer


/*b. A Contoso decidiu presentear os primeiros 20% de clientes da
hist�ria com um vale compras de R$ 2.000. Utilize um comando em
SQL para retornar 10% das linhas da sua tabela dimCustomer
(selecione todas as colunas).*/

--Resposta
SELECT TOP (20) PERCENT *
FROM
	DimCustomer
	


/*c. Adapte o c�digo do item a) para retornar apenas as 100 primeiras
linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate.*/

--Resposta
SELECT TOP (100) 
	FirstName,
	EmailAddress,
	BirthDate
FROM
	DimCustomer

/*d. Renomeie as colunas anteriores para nomes em portugu�s*/

--Resposta
SELECT TOP (100) 
	FirstName AS 'Nome',
	EmailAddress AS 'Email',
	BirthDate AS 'Data nascimento'
FROM
	DimCustomer





--Quest�o 4
/*A empresa Contoso precisa fazer contato com os fornecedores de
produtos para repor o estoque. Voc� � da �rea de compras e precisa
descobrir quem s�o esses fornecedores.
Utilize um comando em SQL para retornar apenas os nomes dos
fornecedores na tabela dimProduct e renomeie essa nova coluna da
tabela.*/

--Resposta
SELECT DISTINCT
	Manufacturer AS 'Fornecedores'
FROM
	DimProduct



--Quest�o 5
/*O seu trabalho de investiga��o n�o para. Voc� precisa descobrir se existe
algum produto registrado na base de produtos que ainda n�o tenha sido
vendido. Tente chegar nessa informa��o.
Obs: caso tenha algum produto que ainda n�o tenha sido vendido, voc�
n�o precisa descobrir qual �, � suficiente saber se teve ou n�o algum
produto que ainda n�o foi vendido.
INTRODU��O AO SQL*/

--Resposta
SELECT DISTINCT 
	ProductKey 
FROM 
	FactSales

SELECT DISTINCT 
	ProductKey 
FROM 
	DimProduct

