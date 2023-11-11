/*Introdução ao SQL
	Comandos utilizados 
		</> ORDER BY
		</> WHERE
		</> WHERE ... LIKE
		</> WHERE ... OR/AND
		</> WHERE ... IN
		</> WHERE ... (NOT) BETWEEN
		</> WHERE ... IS (NOT) NULL
		</> Exercícios
*/

-- Exemplos utilizados comando ORDER BY

--1. Retorna informações do Maior para o Menor
SELECT TOP(100) * 
FROM 
	DimStore
ORDER BY 
	EmployeeCount DESC


--2. Ordena as colunas UnitCost do maior para menor e a coluna Weight do maior para o menor
SELECT
	TOP(10) 
	ProductName,
	UnitCost,
	Weight
FROM 
	DimProduct
ORDER BY UnitCost DESC, Weight DESC


--3. Ordena o maior valor de uma unica linha e coluna
SELECT TOP(1) 
	UnitPrice 
FROM 
	DimProduct
ORDER BY 
	UnitPrice DESC






-- Exemplos utilizados comando WHERE

--4. Selecionando produtos que tem um preco unitario maior de $1000?
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Preco'
FROM
	DimProduct
WHERE 
	UnitPrice >= 1000

--5. Filtrando argumentos com texto

--ex 1 retorna somente o argumento selecionado na coluna BrandName
SELECT * FROM 
	DimProduct
WHERE 
	BrandName = 'Fabrikam'

--ex 2 retorna somente a cor selecionada na coluna ColorName
SELECT * FROM DimProduct
WHERE ColorName = 'Black'


-- Filtrando Datas
--Ex. clientes nasceram apos o dia 31/12/1970

SELECT * FROM 
	DimCustomer
WHERE 
	BirthDate >= '1970-12-31'
ORDER BY 
	BirthDate DESC



-- Exemplos utilizados comando WHERE ... AND

-- Retorna apenas as condições estabelecidas
SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver'


SELECt * FROM DimProduct
WHERE BrandName = 'Fabrikam' AND ColorName = 'Black'

SELECT * FROM DimEmployee
WHERE Gender = 'F' AND DepartmentName = 'Finance'

SELECT * FROM DimProduct
WHERE BrandName='Contoso' AND ColorName='Red' AND UnitPrice >= 100







-- Exemplos utilizados comando WHERE ... OR

-- Retorna uma condição OU outra ou as duas estabelecidas
SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' OR ColorName = 'White'


SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' OR BrandName = 'Fabrikam' OR BrandName = 'Litware'



SELECT * FROM DimProduct
WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'









-- Exemplos utilizados comando WHERE NOT
-- Não retorna a condição estipulada
SELECT EmergencyContactName, DepartmentName
FROM DimEmployee
WHERE NOT DepartmentName = 'Marketing'


SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy'








-- Exemplos utilizados com diferentes condições juntas
SELECT * FROM DimProduct
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'






-- Exemplos utilizados Comando IN - Comando que filtra apenas os valores informados dentro da categoria

SELECT * FROM DimProduct
WHERE ColorName IN ('Silver', 'Blue', 'White', 'Red', 'Black')

SELECT * FROM DimEmployee
Where DepartmentName IN ('Production', 'Marketing', 'Engineering')