USE Movies4All
GO

/**********************************************************************
1. Liste os últimos 10 utilizadores que alugaram um determinado show, 
	listando também o título e o código do país.
***********************************************************************/

SELECT TOP(10) u.*, a.Data, s.Titulo, s.CodPais 
FROM Utilizador u
	INNER JOIN Aluguer a ON a.IdUtilizador = u.Id
	INNER JOIN Show s ON s.Id = a.IdShow
 -- WHERE a.IdShow = {numero do show que se pretende pesquisar}
ORDER BY a.Data DESC

/**********************************************************************
2. Liste os shows que ainda não tiveram qualquer avaliação;
***********************************************************************/

SELECT s.*
FROM Show s
WHERE s.Id NOT IN (
		SELECT DISTINCT IdShow
		FROM Avaliar
	)
GO


/**********************************************************************
3. Crie uma consulta para listar os utilizadores que fizeram mais avaliações.
***********************************************************************/

SELECT * 
FROM Utilizador u,
	(SELECT IdUtilizador, COUNT(*) 'NumAvaliacoes'
	FROM Avaliar
	GROUP BY IdUtilizador
	) sc
WHERE u.Id = sc.IdUtilizador
ORDER BY sc.NumAvaliacoes DESC

/**********************************************************************
4. Crie uma consulta para listar os Shows com melhor avaliação. 
	Considere como critério, a média das avaliações.
***********************************************************************/


SELECT s.Id, TipoShow, Titulo, s.Descricao, AnoLancamento, CodPais, AVG(Stars) 'Avaliação Média'
FROM Show s
INNER JOIN Avaliar a ON a.IdShow = s.Id
GROUP BY s.Id, TipoShow, Titulo, s.Descricao, AnoLancamento, CodPais
ORDER BY 'Avaliação Média' DESC


/**********************************************************************
5. Crie uma consulta que permita listar o número de utilizadores 
	que usam cartão de débito e crédito;
***********************************************************************/

SELECT MetodoPag, COUNT(DISTINCT u.Id) 'NumUtilizadores'
FROM Utilizador u
INNER JOIN Aluguer a ON a.IdUtilizador = u.Id
GROUP BY MetodoPag
ORDER BY 2


/**********************************************************************
6. Liste os shows por ordem decrescente do número de alugueres.
***********************************************************************/

SELECT *
FROM NumVezesAlugado
ORDER BY NumVezesAlugado DESC

GO

