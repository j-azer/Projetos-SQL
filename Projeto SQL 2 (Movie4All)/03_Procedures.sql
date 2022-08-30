USE Movies4All
GO

CREATE OR ALTER PROCEDURE uspYearMonth
AS
BEGIN
	SELECT CONCAT(YEAR(GetDate()), '-', RIGHT(CONCAT('0',MONTH(GETDATE())),2))
END
GO

-- Test
-- execute uspYearMonth
