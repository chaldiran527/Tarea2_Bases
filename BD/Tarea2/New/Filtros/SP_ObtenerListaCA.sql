CREATE PROCEDURE [dbo].[SP_ObtenerListaCA]
	--Parametro de errores internos
	@outResultadoCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON  -- Asignamos modo de contado de modificación de tablas apagado
	BEGIN TRY
		SET @outResultadoCode = 0; -- No errores en el código
		
		SELECT id, Nombre
		FROM [dbo].[ClaseArticulo] CA
		ORDER BY CA.id ASC;
	END TRY

	BEGIN CATCH
		-- Insertamos el valor a la tabla de errores
		INSERT INTO [dbo].[DBError] VALUES(
			 SUSER_NAME()
			,ERROR_NUMBER()
			,ERROR_STATE()
			,ERROR_SEVERITY()
			,ERROR_LINE()
			,ERROR_PROCEDURE()
			,ERROR_MESSAGE()
			,GETDATE()
		)

		-- Procesar errores dentro del catch
		Set @outResultadoCode = 50005;
	END CATCH

	SET NOCOUNT OFF
	RETURN @outResultadoCode;
END