USE [PruebaConcepto]
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuario]    Script Date: 24/3/2023 18:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Autores:		Pablo Agüero, Juan Mallma 
-- Fecha de creación: 21/3/2023
-- Descripción:	Store procedure que valida hilera de un nombre y una contraseña en tabla Usuario
-- =============================================

CREATE PROCEDURE [dbo].[SP_VerificarUsuario] 
	-- Add the parameters for the stored procedure here
	@inNombre VARCHAR(128)		-- Nombre de usuario ingresado a verificar
	,@inContraseña VARCHAR(128) -- Contraseña ingresada a verificar
	,@outResultCode INT OUTPUT	-- Código de resultado del SP
AS
BEGIN

	SET NOCOUNT ON;

	--Llamar a SP para cargar xml datos
	 EXECUTE SP_ImportarDatosXML 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DatosXML.xml';

	--Validar que nombre y contraseña no sean hileras vacías
	BEGIN TRY

	SET @outResultCode = 0;

	IF	(
		@inNombre IS NULL OR NOT LEN(@inNombre) > 0
		)

	BEGIN
		-- procesar error
		SET @outResultCode = 50001 --Nombre no se ha ingresado
		RETURN;
	END;

		IF	(
		@inContraseña iS NULL OR NOT LEN(@inContraseña) > 0
		)

	BEGIN
		-- procesar error
		SET @outResultCode = 50002 --Contraseña no se ha ingresado
		RETURN;
	END;

	IF NOT EXISTS (
			SELECT 1 FROM Usuario WHERE UserName = @InNombre
			AND Password = @inContraseña
			)
	BEGIN
		-- procesar error
		SET @outResultCode = 50003 --Combinación de nombre y contraseña invalida
		RETURN;
	END
	
--	ELSE
--			SELECT 'false' AS UsuarioExiste --SET @outResultCode = 50003
	
	END TRY
	BEGIN CATCH

		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_NAME()
			, ERROR_NUMBER()
			, ERROR_STATE()
			, ERROR_SEVERITY()
			, ERROR_LINE()
			, ERROR_PROCEDURE()
			, ERROR_MESSAGE()
			, GETDATE()
		);

		SET @outResultCode = 50005;  --Store Procedure realizado exitosamente

	END CATCH

	SET NOCOUNT OFF;
END;
GO
