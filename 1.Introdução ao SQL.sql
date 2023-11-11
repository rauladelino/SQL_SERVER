
/* 
Introdução ao SQL
	Comandos utilizados 
		</> SELECT
		</> SELECT *
		</> SELECT ... TOP e TOP PERCENT
		</> SELECT ... DISTINCT
		</> Comentando o código
		</> Renomenado coluna (Alias)
		</> Exercícios
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


-- Exemplos utilizando a função Renomeando coluna (Alias)

-- 1. Retorna os valores de colunas selecionas e o 'AS' , Renomeia as colunas conforme o novo nome proposto.
-- Lembrando que essa renomeção não altera toda a base de dados.
SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct




--EXERCICIOS
--Questão 1
--Você é responsável por controlar os dados de clientes e de produtos da sua empresa. O que você precisará fazer é confirmar se:

/*a. Existem 2.517 produtos cadastrados na base e, se não tiver, você
deverá reportar ao seu gestor para saber se existe alguma defasagem
no controle dos produtos.*/

--Resposta
SELECT
	DISTINCT ProductName
FROM
	DimProduct


/*b. Até o mês passado, a empresa tinha um total de 19.500 clientes na
base de controle. Verifique se esse número aumentou ou reduziu. */

-- Resposta
SELECT * from DimCustomer



--Questão 2
/*Você trabalha no setor de marketing da empresa Contoso e acaba de ter
uma ideia de oferecer descontos especiais para os clientes no dia de seus
aniversários. Para isso, você vai precisar listar todos os clientes e as suas
respectivas datas de nascimento, além de um contato.*/

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



/* Questão 3
A Contoso está comemorando aniversário de inauguração de 10 anos e
pretende fazer uma ação de premiação para os clientes. A empresa quer
presentear os primeiros clientes desde a inauguração.
Você foi alocado para levar adiante essa ação. Para isso, você terá que
fazer o seguinte:*/

/*a. A Contoso decidiu presentear os primeiros 100 clientes da história
com um vale compras de R$ 10.000. Utilize um comando em SQL para
retornar uma tabela com os primeiros 100 primeiros clientes da
tabela dimCustomer (selecione todas as colunas).*/

--Resposta
SELECT TOP (100) *
FROM
	DimCustomer


/*b. A Contoso decidiu presentear os primeiros 20% de clientes da
história com um vale compras de R$ 2.000. Utilize um comando em
SQL para retornar 10% das linhas da sua tabela dimCustomer
(selecione todas as colunas).*/

--Resposta
SELECT TOP (20) PERCENT *
FROM
	DimCustomer
	


/*c. Adapte o código do item a) para retornar apenas as 100 primeiras
linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate.*/

--Resposta
SELECT TOP (100) 
	FirstName,
	EmailAddress,
	BirthDate
FROM
	DimCustomer

/*d. Renomeie as colunas anteriores para nomes em português*/

--Resposta
SELECT TOP (100) 
	FirstName AS 'Nome',
	EmailAddress AS 'Email',
	BirthDate AS 'Data nascimento'
FROM
	DimCustomer





--Questão 4
/*A empresa Contoso precisa fazer contato com os fornecedores de
produtos para repor o estoque. Você é da área de compras e precisa
descobrir quem são esses fornecedores.
Utilize um comando em SQL para retornar apenas os nomes dos
fornecedores na tabela dimProduct e renomeie essa nova coluna da
tabela.*/

--Resposta
SELECT DISTINCT
	Manufacturer AS 'Fornecedores'
FROM
	DimProduct



--Questão 5
/*O seu trabalho de investigação não para. Você precisa descobrir se existe
algum produto registrado na base de produtos que ainda não tenha sido
vendido. Tente chegar nessa informação.
Obs: caso tenha algum produto que ainda não tenha sido vendido, você
não precisa descobrir qual é, é suficiente saber se teve ou não algum
produto que ainda não foi vendido.
INTRODUÇÃO AO SQL*/

--Resposta
SELECT DISTINCT 
	ProductKey 
FROM 
	FactSales

SELECT DISTINCT 
	ProductKey 
FROM 
	DimProduct

