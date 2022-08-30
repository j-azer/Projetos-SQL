USE Movies4All
GO

/*
A seguinte vista serve para mostrar o atributo derivado NumVezesAlugado, 
que permite saber quantas vezes um Show foi alugado.
*/

DROP VIEW IF EXISTS NumVezesAlugado
GO

CREATE VIEW NumVezesAlugado
AS
	-- opção 1
	--SELECT s.Id, s.TipoShow, s.Titulo, s.Descricao, s.AnoLancamento, s.CodPais, COUNT(a.IdShow) AS NumVezesAlugado
	--FROM Show s
	--LEFT JOIN Aluguer a ON a.IdShow=s.Id
	--GROUP BY s.Id, s.TipoShow, s.Titulo, s.Descricao, s.AnoLancamento, s.CodPais

	-- opção 2
	SELECT s.*, sc.NumVezesAlugado 
	FROM Show s,  
		(SELECT s.Id, COUNT(a.IdShow) AS NumVezesAlugado
		FROM Show s
		LEFT JOIN Aluguer a ON a.IdShow=s.Id
		GROUP BY s.Id) sc
	WHERE s.Id = sc.Id
GO

/*
A seguinte vista serve para mostrar o atributo derivado NumeroDias, 
que permite saber quantos dias o Aluguer estará disponível para visualização.
*/

DROP VIEW IF exists NumeroDiasAluguer
GO

CREATE VIEW NumeroAlugueres
AS
	
	SELECT s.*, sc.[# Alugueres] 
	FROM Show s, (
		SELECT IdShow, COUNT(*) '# Alugueres'
		FROM Aluguer 
		GROUP BY IdShow
		) sc
	WHERE sc.IdShow = s.Id
GO

