CREATE PROCEDURE [dbo].[SP_SeleccionarCantidad]
	 @inCantidad INT
	,@inUserID INT
	,@inIP VARCHAR(64)
	,@outResultadoCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @LogDescription VARCHAR (2000)='Selección por Cantidad: {Cantidad="'
		SET @outResultadoCode = 0    --  Asignamos ámbito de error a 0

		-- Se empieza a hacer validaciones

		-- Validacion valor nulo
		IF (@inCantidad IS NULL)
		BEGIN
			SET @outResultadoCode = 50002   -- Error de entrada de valores nulos
			RETURN @outResultadoCode;
		END

		-- Validación cantidad no numero
		IF (ISNUMERIC(@inCantidad) = 0)
		BEGIN
			SET @outResultadoCode = 50003
			RETURN @outResultadoCode;
		END

		-- Validación errores en la IP o en el usuario
		IF ((@inUserID = NULL)  or (@inIP = NULL))
		BEGIN
			SET @outResultadoCode = 50008  -- Error por valores de IP o usuario
			RETURN
		END


		SET @LogDescription =
			@LogDescription + CONVERT(VARCHAR(32), @inCantidad)
			+ ' "}'

		BEGIN TRANSACTION tSeleccionarPorNombre
			-- La palabra clave TOP se encarga de solo mostrar la N cantidad primera mostrada por la tabla

			SELECT TOP (@inCantidad)
				 A.[id]
				,A.[idClaseArticulo]
				,C.[Nombre] AS ClaseNombre
				,A.[Nombre]
				,A.[Precio]
			FROM [dbo].[Articulo] A
			INNER JOIN [dbo].[ClaseArticulo] C on A.idClaseArticulo = C.id
			ORDER BY A.[Nombre] ASC   -- Pasamos el patrón, de modo que aparezcan letras antes o después y se encuentre dicho dato
		
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
		COMMIT TRANSACTION tSeleccionarPorNombre
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