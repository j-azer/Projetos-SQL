USE Movies4All
GO

/**********************************************************************
1. Liste os �ltimos 10 utilizadores que alugaram um determinado show, 
	listando tamb�m o t�tulo e o c�digo do pa�s.
***********************************************************************/

SELECT TOP(10) u.*, a.Data, s.Titulo, s.CodPais 
FROM Utilizador u
	INNER JOIN Aluguer a ON a.IdUtilizador = u.Id
	INNER JOIN Show s ON s.Id = a.IdShow
 -- WHERE a.IdShow = {numero do show que se pretende pesquisar}
ORDER BY a.Data DESC

/**********************************************************************
2. Liste os shows que ainda n�o tiveram qualquer avalia��o;
***********************************************************************/

SELECT s.*
FROM Show s
WHERE s.Id NOT IN (
		SELECT DISTINCT IdShow
		FROM Avaliar
	)
GO


/**********************************************************************
3. Crie uma consulta para listar os utilizadores que fizeram mais avalia��es.
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
4. Crie uma consulta para listar os Shows com melhor avalia��o. 
	Considere como crit�rio, a m�dia das avalia��es.
***********************************************************************/


SELECT s.Id, TipoShow, Titulo, s.Descricao, AnoLancamento, CodPais, AVG(Stars) 'Avalia��o M�dia'
FROM Show s
INNER JOIN Avaliar a ON a.IdShow = s.Id
GROUP BY s.Id, TipoShow, Titulo, s.Descricao, AnoLancamento, CodPais
ORDER BY 'Avalia��o M�dia' DESC


/**********************************************************************
5. Crie uma consulta que permita listar o n�mero de utilizadores 
	que usam cart�o de d�bito e cr�dito;
***********************************************************************/

SELECT MetodoPag, COUNT(DISTINCT u.Id) 'NumUtilizadores'
FROM Utilizador u
INNER JOIN Aluguer a ON a.IdUtilizador = u.Id
GROUP BY MetodoPag
ORDER BY 2


/**********************************************************************
6. Liste os shows por ordem decrescente do n�mero de alugueres.
***********************************************************************/

SELECT *
FROM NumVezesAlugado
ORDER BY NumVezesAlugado DESC

GO

