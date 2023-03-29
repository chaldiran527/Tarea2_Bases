CREATE PROCEDURE [dbo].[SP_SeleccionarClaseArt]
	 @inClaseArticulo VARCHAR(30)
	,@inUserID INT
	,@inIP VARCHAR(64)
	,@outResultadoCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @LogDescription VARCHAR (2000)='Selección por Clase de Artículo: {Clase="'
		DECLARE @idClaseArticulo INT
		SET @outResultadoCode = 0    --  Asignamos ámbito de error a 0

		-- Empezamos validaciones

		-- Validación entrada nula
		IF (@inClaseArticulo IS NULL)
		BEGIN
			SET @outResultadoCode = 50002   -- Error de entrada de valores nulos
			RETURN @outResultadoCode;
		END

		-- Validación error de valor IP o usuario
		IF ((@inUserID = NULL)  or (@inIP = NULL))
		BEGIN
			SET @outResultadoCode = 50008  -- Error por valores de IP o usuario
			RETURN
		END

		-- Empezamos código normal -- 
		
		-- Pasamos los datos a mostrarse en el logger
		SET @LogDescription =
			@LogDescription + @inClaseArticulo
			+ ' "}'

		BEGIN TRANSACTION tSelectClaseArti

		-- Primero obtenemos la ID para identificar los valores a mostrar
		SET @idClaseArticulo = (SELECT C.id
							   FROM [dbo].[ClaseArticulo] C
							   WHERE LOWER(@inClaseArticulo) = LOWER(C.Nombre))
		
		-- Hacemos la selección usando la id y los demás valores
		SELECT  A.id
			   ,A.idClaseArticulo
			   ,C.Nombre AS ClaseNombre
			   ,A.Nombre
			   ,A.Precio
		FROM [dbo].[Articulo] A
		INNER JOIN [dbo].[ClaseArticulo] C on A.idClaseArticulo = C.id
		WHERE @idClaseArticulo = A.idClaseArticulo
		ORDER BY A.Nombre ASC

		-- Insertamos en el log
		INSERT [dbo].[EventLog](
			 [LogDescription]
			,[PostIdUser]
			,[PostIP]
		) VALUES (
			 @LogDescription
			,@inUserID
			,@inIP
		)

		COMMIT TRANSACTION tSelectClaseArti

	END TRY
	BEGIN CATCH
		-- Validamos la transaccion en caso de errores
		IF @@TRANCOUNT>0    -- Si este valor es mayor 1, hay un error 
		BEGIN
			ROLLBACK TRANSACTION tSeleccionarPorNombre  -- Se deshacen los cambios realizados
		END;

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
		SET @outResultadoCode = 50005;
	END CATCH

	SET NOCOUNT OFF
	RETURN @outResultadoCode;
END