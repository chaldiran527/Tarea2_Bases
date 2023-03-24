CREATE PROCEDURE [dbo].[SP_FiltrarNombre]
	@inPatron VARCHAR(32)
	, @outResultCode INT OUTPUT
	, @FiltroNombre VARCHAR(128)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SET @outResultCode = 0;  -- no error code

		-- SE HACEN VALIDACIONES

		IF (@inPatron IS NULL)
		BEGIN
			SET @outResultCode = 50002;  -- parametro de entrada es nulo
			RETURN;
		END;

		SELECT A.[Nombre]
			, A.[Precio]
		FROM dbo.Articulo A
		WHERE A.Nombre LIKE '%'+@FiltroNombre+'%'
		ORDER BY A.Nombre;

	END TRY
	BEGIN CATCH

		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME()
			, ERROR_NUMBER()
			, ERROR_STATE()
			, ERROR_SEVERITY()
			, ERROR_LINE()
			, ERROR_PROCEDURE()
			, ERROR_MESSAGE()
			, GETDATE()
		);

		Set @outResultCode=50005;
	
	END CATCH


	SET NOCOUNT OFF;
END;
GO

EXECUTE SP_FiltrarNombre '','','adora'