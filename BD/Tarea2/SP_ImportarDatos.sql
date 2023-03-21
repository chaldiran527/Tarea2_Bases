CREATE PROCEDURE ImportarDatosXML
    @ArchivoXML NVARCHAR(255)
AS
BEGIN
    DECLARE @XmlData XML

    SELECT @XmlData = BulkColumn
    FROM OPENROWSET(BULK @ArchivoXML, SINGLE_BLOB) AS x

    -- Importar datos a la tabla Usuarios
    INSERT INTO Usuarios (Nombre, Password)
    SELECT 
        x.Usuario.value('@Nombre', 'NVARCHAR(50)') AS Nombre,
        x.Usuario.value('@Password', 'NVARCHAR(50)') AS Password
    FROM @XmlData.nodes('/root/Usuarios/Usuario') AS x(Usuario)

    -- Importar datos a la tabla ClasesdeArticulos
    INSERT INTO ClasesdeArticulos (Nombre)
    SELECT 
        x.ClasesdeArticulo.value('@Nombre', 'NVARCHAR(50)') AS Nombre
    FROM @XmlData.nodes('/root/ClasesdeArticulos/ClasesdeArticulo') AS x(ClasesdeArticulo)

    -- Importar datos a la tabla Articulos
    INSERT INTO Articulos (Nombre, ClasesdeArticulo, Precio)
    SELECT 
        x.Articulo.value('@Nombre', 'NVARCHAR(50)') AS Nombre,
        x.Articulo.value('@ClasesdeArticulo', 'NVARCHAR(50)') AS ClasesdeArticulo,
        x.Articulo.value('@precio', 'DECIMAL(10, 2)') AS Precio
    FROM @XmlData.nodes('/root/Articulos/Articulo') AS x(Articulo)
END