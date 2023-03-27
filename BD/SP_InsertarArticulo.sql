CREATE PROCEDURE [dbo].[SP_InsertarArticulo]
	@inNombre VARCHAR(128)		-- Nuevo Nombre de articulo
	, @claseArticulo INT
	, @inPrecio MONEY				-- Nuevo Precio
	, @outResultCode INT OUTPUT			-- Codigo de resultado del SP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Se validan los datos de entrada, pues no estamos seguros que se validaron en capa logica.
	-- Validar que articulo exista.

	BEGIN TRY
		-- Inicia codigo en el cual se capturan errores
		
		SET @outResultCode=0;  -- Por default codigo de salida error en 0 significa que no hubo error

		IF ( -- Verificar que el nombre solo contenga guiones o valores alfabeticos
			@inNombre like '%[^A-Za-z-]%'
		)
		BEGIN 
			-- procesar error
			SET @outResultCode=50001		-- Articulo tiene caracteres invalidos
			RETURN;
		END;

		IF EXISTS (	-- Verificar por medio del nombre si el articulo ya existe
			SELECT 1 
			FROM dbo.Articulo A 
			WHERE A.Nombre=@inNombre
			)
		BEGIN
			-- procesar error
			SET @outResultCode=50002;		-- Articulo ya existe 
			RETURN;
		END; 

		IF  (--Verificar si el string del nombre es nulo o su cantidad de caracteres no es mayor que cero
			@inNombre IS NULL OR NOT LEN(@inNombre) > 0	
			)
		BEGIN
			-- procesar error
			SET @outResultCode=50003;		-- Codigo de salida del nombre no ingresado
			RETURN;
		END; 

		IF(--Verificar si el precio es un valor cero, es decir un valor mnonetario invalido 
			@inPrecio = 0					
			)
		BEGIN
			-- procesar error
			SET @outResultCode=50004;		-- Valor monetario invalido 
			RETURN;
		END; 

		-- siempre que vamos a actualizar tablas (y son 2 o mas tablas se inicia transaccion de BD)_
		BEGIN TRANSACTION tInsertArticulo
			
			INSERT [dbo].[Articulo] (
				[IdClaseArticulo]
				, [Nombre]
				, [Precio])
			VALUES (
				@claseArticulo
				, @inNombre
				, @inPrecio
			);

			-- salvamos en evento log el evento de actualizar el articulo
		COMMIT TRANSACTION tInsertArticulo

	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT>0  -- error sucedio dentro de la transaccion
		BEGIN
			ROLLBACK TRANSACTION tInsertArticulo; -- se deshacen los cambios realizados
		END;
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

EXECUTE SP_InsertarArticulo 'Teclado','1','18000',''