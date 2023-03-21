CREATE PROCEDURE dbo.SP_InsertArticulo
	@inNombre VARCHAR(128)		-- Nuevo Nombre de articulo
	, @inPrecio MONEY				-- Nuevo Precion
	, @outResultCode INT OUTPUT			-- Codigo de resultado del SP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Se validan los datos de entrada, pues no estamos seguros que se validaron en capa logica.
	-- Validar que articulo exista.

	BEGIN TRY
		-- Inicia codigo en el cual se captura errores

		DECLARE @LogDescription VARCHAR(2000)='Insertando en tabla Articulo: {Nombre="'
		
		SET @outResultCode=0;  -- Por default codigo error 0 es que no hubo error

		-- IF NOT EXISTS (SELECT 1 FROM dbo.Articulo A WHERE A.id=@inIdArticulo)
		-- BEGIN
			-- procesar error
			-- SET @outResultCode=50001;		-- Articulo no exist
			-- RETURN;
		-- END; 
		-- Se hacen otras validaciones ....

		-- se preprocesa lo que luego se actualiza, si es necesario se guarda informacion en variables o en tablas variable

		Set @LogDescription = 
					@LogDescription+@inNombre
					+'", Precio="'
					+CONVERT(VARCHAR, @inPrecio)
					+'IdClaseArticulo="';
					-- +CONVERT(VARCHAR, @inIdClaseArticulo)+'}';


		-- siempre que vamos a actualizar tablas (y son 2 o mas tablas se inicia transaccion de BD)_
		BEGIN TRANSACTION tInsertArticulo
			
			INSERT [dbo].[Articulo] (
				[Nombre]
				, [Precio])
			VALUES (
				@inNombre
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

EXECUTE SP_InsertArticulo 'Puerta', 20000.00, 0

EXECUTE SP_Mostrar '', 0