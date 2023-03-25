USE [PruebaConcepto]
GO

/****** Object:  StoredProcedure [dbo].[SP_ImportarDatosXML]    Script Date: 24/3/2023 19:09:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Autores:		Pablo Agüero, Juan Mallma 
-- Fecha de creación: 22/3/2023
-- Descripción:	Store procedure que importa los datos de un archivo xml para ingresarlos en una tabla
-- =============================================

CREATE PROCEDURE [dbo].[SP_ImportarDatosXML]
    @ArchivoXML NVARCHAR(255)
AS
BEGIN
    DECLARE @XmlData XML
    SELECT @XmlData = BulkColumn
    FROM OPENROWSET(BULK 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DatosXML.xml', SINGLE_BLOB) AS x

    -- Importar datos a la tabla Usuarios
    INSERT INTO Usuario (UserName, Password)
    SELECT DISTINCT
        x.Usuario.value('@Nombre', 'NVARCHAR(50)') AS Nombre
		, x.Usuario.value('@Password', 'NVARCHAR(50)') AS Password
    FROM @XmlData.nodes('/root/Usuarios/Usuario') AS x(Usuario)
	WHERE x.Usuario.value('@Nombre','NVARCHAR(50)') NOT IN (SELECT UserName FROM Usuario)
	AND x.Usuario.value('@Password','NVARCHAR(50)') NOT IN (SELECT Password FROM Usuario)

    -- Importar datos a la tabla ClasesdeArticulo
    INSERT INTO ClaseArticulo (Nombre)
    SELECT 
        x.ClasesdeArticulo.value('@Nombre', 'NVARCHAR(50)') AS Nombre
    FROM @XmlData.nodes('/root/ClasesdeArticulos/ClasesdeArticulo') AS x(ClasesdeArticulo)
	WHERE  x.ClasesdeArticulo.value('@ClasesdeArticulo','NVarchar(50)')  NOT IN (SELECT Nombre FROM ClaseArticulo)


    -- Importar datos a la tabla Articulos
    INSERT INTO Articulo (Nombre, IdClaseArticulo, Precio)
    SELECT 
        x.Articulo.value('@Nombre', 'NVARCHAR(50)') AS Nombre
		,clase.id AS IdClaseArticulo
        ,x.Articulo.value('@precio', 'DECIMAL(10, 2)') AS Precio
    FROM @XmlData.nodes('/root/Articulos/Articulo') AS x(Articulo)
	INNER JOIN ClaseArticulo clase ON x.Articulo.value('@ClasesdeArticulo','NVarchar(50)') = clase.Nombre --Unir las tablas en donde el valor del nombre es igual al del xml
	WHERE x.Articulo.value('@Nombre','NVARCHAR(50)') NOT IN (SELECT Nombre FROM Articulo) -- No debe existir este nombre del xml en la tabla 
END
GO


EXECUTE SP_ImportarDatosXML 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DatosXML.xml'