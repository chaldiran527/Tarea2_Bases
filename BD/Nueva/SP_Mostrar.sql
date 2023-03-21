CREATE PROCEDURE dbo.SP_Mostrar
	@inPatron VARCHAR(32)
	, @outResultCode INT OUTPUT
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
		WHERE A.Nombre like '%'+@inPatron+'%'
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