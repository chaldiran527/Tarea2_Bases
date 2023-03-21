CREATE PROCEDURE SP_Insert1
	@ParNombre as varchar(128)
	, @ParPrecio as money
AS
INSERT INTO dbo.Articulo VALUES (@ParNombre,@ParPrecio)
GO

EXECUTE SP_Insert1 'Cinta',1500.00
GO

EXECUTE ShowData1
GO

