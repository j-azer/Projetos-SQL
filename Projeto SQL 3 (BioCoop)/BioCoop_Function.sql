
USE BioCoop_JonathasAzer
GO

CREATE OR ALTER FUNCTION PrecoDetalheCabaz

(
	@Qtd NUMERIC (8,2),
	@PrecoUnit DECIMAL (8,2)
)

RETURNS DECIMAL (8,2)
AS
BEGIN
	RETURN @Qtd*@PrecoUnit
END
GO

--Comprovação

--EXEC PrecoDetalheCabaz @Qtd = 2, @PrecoUnit = 7.82
--SELECT dbo.PrecoDetalheCabaz (2, 7.82) 'Preço Total por Produto'