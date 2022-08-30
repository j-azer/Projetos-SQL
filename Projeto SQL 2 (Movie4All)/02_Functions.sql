USE Movies4All
GO

CREATE OR ALTER FUNCTION CalcularValorSerie
(
	@NumEpisodios TINYINT,
	@Preco DECIMAL(8,4)
)
RETURNS DECIMAL(9,5)
AS
BEGIN				
	RETURN @Preco*@NumEpisodios
END
GO

-- Test
-- EXEC CalcularValorSerie @NumEpisodios = 10, @Preco = 1
-- SELECT  dbo.CalcularValorSerie (10, 1)
