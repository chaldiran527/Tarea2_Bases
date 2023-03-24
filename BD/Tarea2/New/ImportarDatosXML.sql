CREATE PROCEDURE [dbo].[ImportarDatosXML]
    @ArchivoXML NVARCHAR(255)
AS
BEGIN
    DECLARE @XmlData XML
    SELECT @XmlData = BulkColumn
    FROM OPENROWSET(BULK 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DatosXML.xml', SINGLE_BLOB) AS x

    -- Importar datos a la tabla Usuarios
    INSERT INTO Usuario (UserName, Password)
    SELECT 
        x.Usuario.value('@Nombre', 'NVARCHAR(50)') AS Nombre,
        x.Usuario.value('@Password', 'NVARCHAR(50)') AS Password
    FROM @XmlData.nodes('/root/Usuarios/Usuario') AS x(Usuario)

    -- Importar datos a la tabla ClasesdeArticulos
    INSERT INTO ClaseArticulo (Nombre)
    SELECT 
        x.ClasesdeArticulo.value('@Nombre', 'NVARCHAR(50)') AS Nombre
    FROM @XmlData.nodes('/root/ClasesdeArticulos/ClasesdeArticulo') AS x(ClasesdeArticulo)

    -- Importar datos a la tabla Articulos
    INSERT INTO Articulo (Nombre, IdClaseArticulo, Precio)
    SELECT 
        x.Articulo.value('@Nombre', 'NVARCHAR(50)') AS Nombre,
		clase.id AS IdClaseArticulo
        ,x.Articulo.value('@precio', 'DECIMAL(10, 2)') AS Precio
    FROM @XmlData.nodes('/root/Articulos/Articulo') AS x(Articulo)
	INNER JOIN ClaseArticulo clase ON x.Articulo.value('@ClasesdeArticulo','NVarchar(50)') = clase.Nombre
END
GO

EXECUTE ImportarDatosXML 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DatosXML.xml'