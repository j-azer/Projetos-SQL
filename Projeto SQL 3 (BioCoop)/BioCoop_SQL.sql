
USE BioCoop_JonathasAzer

GO


/****************************************************************
1. Para cada cooperativa, apresente o n�mero total de associados.*****************************************************************/

SELECT a.CodigoCooperativa, COUNT(a.Id) 'NumAssociados'
FROM Associado a
GROUP BY a.CodigoCooperativa

GO

/************************************************************************************
2. Para uma determinada cooperativa, liste todas as categorias que s�o elas pr�prias 
subcategorias, apresentando a informa��o da seguinte forma.
(12) Vegetais > (21) Batatas 
(10) Vegetais > (12) Cenouras 
A listagem deve estar ordenada por categoria e subcategoria.
Os n�meros que precedem o nome da categoria representam o id.
***********************************************************************************/



-- N�o Consegui...



/******************************************************************************************
 3) Liste todos os clientes que j� receberam mais cabazes. Se o m�ximo de cabazes enviados 
a um determinado cliente for 7, queremos listar todos os clientes que receberam tamb�m 
eles, 7 cabazes.
******************************************************************************************/

SELECT TOP (4) c.Id, COUNT(ca.IdCliente) 'Cabaz Recebido'
FROM Cabaz ca
JOIN Cliente c ON c.Id = ca.IdCliente
GROUP BY c.Id

GO




/*****************************************************************************************
4) Liste os 10 produtos que mais vezes foram inclu�dos em cabazes durante o �ltimo ano. 
****************************************************************************************/


SELECT TOP (10) dc.IdProduto, COUNT(dc.IdProduto) 'N� Total de Inclus�es' 
		FROM DetalheCabaz dc
		GROUP BY dc.IdProduto
		ORDER BY [N� Total de Inclus�es] DESC
		
GO

/*
SELECT TOP (15) dc.IdProduto, COUNT(dc.IdProduto) 'N� Total de Inclus�es' 
FROM DetalheCabaz dc
GROUP BY dc.IdProduto
ORDER BY [N� Total de Inclus�es] DESC

GO
*/



/*******************************************************************************************
5) Crie uma consulta para apresentar o total faturado pelos clientes de cada cooperativa ao 
longo do tempo. Ordene por ordem descendente do valor faturado.
*******************************************************************************************/


SELECT  cb.IdCliente, SUM (cb.PrecoTotal) 'Total Faturado'
		FROM Cabaz cb
		JOIN Cliente c ON c.Id = cb.IdCliente
		JOIN Cooperativa co ON c.CodigoCooperativa = co.Codigo
		GROUP BY cb.IdCliente, c.CodigoCooperativa
		ORDER BY [Total Faturado] DESC
		
GO

