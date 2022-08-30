
USE BioCoop_JonathasAzer
GO

/*****************************************************************************************
1) Crie a vista v_TotalClientes para o atributo derivado TotalClientes da tabela Associado.
*****************************************************************************************/


DROP VIEW IF EXISTS v_TotalCliente
GO

CREATE VIEW v_TotalCliente 
AS


SELECT COUNT (IdCLiente) AS 'Total Clientes Associados'
FROM Associar ar 
	JOIN Associado a ON ar.IdAssociado = a.Id
GO


/*****************************************************************************************
2) Crie uma vista que apresente informação sobre os clientes que se registaram nos últimos 
30 dias, incluindo também a cooperativa, e em que associado. Ordene por cooperativa, 
associado e cliente, por essa mesma ordem
*****************************************************************************************/

DROP VIEW IF EXISTS Registados_Ult_30dias
GO

CREATE VIEW Registados_Ult_30dias
AS

SELECT a.CodigoCooperativa, c.IdAssociado, c.IdCliente, c.Data 
FROM Cabaz c 
	JOIN Associado a ON c.IdAssociado = a.Id

WHERE CAST (DATA AS DATE) 
	BETWEEN CAST (DATEADD (DAY,-30,GETDATE()) as DATE) 
	AND CAST (GETDATE() AS DATE)

GO



/****************************************************************************************** 
3) Crie uma vista para listar todos os clientes que já subscreveram um plano, mas que nunca 
receberam nenhum cabaz. 
*****************************************************************************************/


DROP VIEW IF EXISTS ClientesNuncaReceberamCabaz
GO

CREATE VIEW ClientesNuncaReceberamCabaz 
AS

SELECT  s.IdCliente , c.Id
FROM Subscrever s 
JOIN Cliente c ON s.IdCliente IS NULL

--OBS: Todos os clientes desta tabela possuiem um plano, porém todos receberam um cabaz. Com isso o resultado é 0 clientes.

GO




 /*********************************************************************************
 4) Crie uma vista para listar, para cada plano e cooperativa, o número de clientes 
atualmente ativos.
**********************************************************************************/

DROP VIEW IF EXISTS ClientesPlanoAtivo
GO

CREATE VIEW ClientesPlanoAtivo 
AS

SELECT a.IdCliente, a.Ativo, c.Id, c.CodigoCooperativa
FROM Associar a
INNER JOIN CLiente c ON Ativo = 'Sim' and c.Id = a.IdCliente

/*
SELECT a.IdCliente, a.Ativo, c.Id, c.CodigoCooperativa
FROM Associar a
INNER JOIN CLiente c ON Ativo = 'Não' and c.Id = a.IdCliente
*/

GO
