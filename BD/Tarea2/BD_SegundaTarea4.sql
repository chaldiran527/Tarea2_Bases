USE [master]
GO
/****** Object:  Database [SegundaTarea3]    Script Date: 6/4/2023 11:26:10 a. m. ******/
CREATE DATABASE [SegundaTarea3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SegundaTarea3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SegundaTarea3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SegundaTarea3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SegundaTarea3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SegundaTarea3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SegundaTarea3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SegundaTarea3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SegundaTarea3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SegundaTarea3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SegundaTarea3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SegundaTarea3] SET ARITHABORT OFF 
GO
ALTER DATABASE [SegundaTarea3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SegundaTarea3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SegundaTarea3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SegundaTarea3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SegundaTarea3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SegundaTarea3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SegundaTarea3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SegundaTarea3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SegundaTarea3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SegundaTarea3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SegundaTarea3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SegundaTarea3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SegundaTarea3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SegundaTarea3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SegundaTarea3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SegundaTarea3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SegundaTarea3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SegundaTarea3] SET RECOVERY FULL 
GO
ALTER DATABASE [SegundaTarea3] SET  MULTI_USER 
GO
ALTER DATABASE [SegundaTarea3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SegundaTarea3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SegundaTarea3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SegundaTarea3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SegundaTarea3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SegundaTarea3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SegundaTarea3', N'ON'
GO
ALTER DATABASE [SegundaTarea3] SET QUERY_STORE = ON
GO
ALTER DATABASE [SegundaTarea3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SegundaTarea3]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdClaseArticulo] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaseArticulo]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaseArticulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogDescription] [varchar](2000) NOT NULL,
	[PostIdUser] [int] NOT NULL,
	[PostIP] [varchar](64) NOT NULL,
	[PostTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](16) NOT NULL,
	[Password] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulo] ON 

INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (1, 3, N'Tachuela', 808.8200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (2, 3, N'Agarradera', 946.2600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (3, 3, N'Arandela PVC', 2789.6200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (4, 3, N'Bisagra', 8104.9800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (5, 3, N'Cinta', 1956.6600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (6, 3, N'Clavo Acero', 4422.4800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (7, 3, N'Clavo CTE', 2431.9600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (8, 3, N'Escuadra', 284.7100)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (9, 3, N'Grapa', 8208.3500)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (10, 3, N'Lija', 6410.1400)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (11, 3, N'Masking Tape', 9643.9800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (12, 3, N'Picaporte', 9833.2600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (13, 3, N'Plastico', 8016.0400)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (14, 3, N'Resbalon', 3718.8900)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (15, 3, N'Riel P', 1065.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (16, 3, N'Tachuelon', 4370.7600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (17, 3, N'Tiradera', 4643.2500)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (18, 3, N'Tope P', 405.6000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (19, 3, N'Cuchillas', 1035.1600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (20, 3, N'Esmeril', 8878.3800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (21, 2, N'Bombillo', 1544.9800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (22, 2, N'Lavadora', 5589.9600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (23, 2, N'Secadora', 7778.7000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (24, 2, N'Lavavajillas', 8352.7900)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (25, 2, N'Horno', 2945.7400)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (26, 2, N'Ventilador', 8494.1900)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (27, 2, N'Microondas', 7475.5100)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (28, 2, N'Aspiradora', 9276.3200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (29, 2, N'Tostadora', 1313.0600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (30, 2, N'Feidora', 3221.0700)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (31, 2, N'Cafetera', 1793.6200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (32, 2, N'Computadora', 2840.7300)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (33, 2, N'Impresora', 8991.7400)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (34, 2, N'Calculadora', 7788.0800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (35, 2, N'Radio', 709.7900)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (36, 2, N'Camara', 9701.4700)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (37, 2, N'Lampara', 162.7000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (38, 2, N'Congelador', 8547.5900)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (39, 2, N'Monitor', 874.1000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (40, 2, N'Licuadora', 9966.8100)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (41, 1, N'Sierra', 669.8100)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (42, 1, N'Pinza', 1404.4200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (43, 1, N'Cinta Telfon', 9631.5800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (44, 1, N'Llave Inglesa', 5240.8900)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (45, 1, N'Llave Stillson', 8989.0200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (46, 1, N'Terraja', 4368.2100)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (47, 1, N'Bomba', 5016.4800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (48, 1, N'Taladro', 7244.2300)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (49, 1, N'Desastacador', 7191.3200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (50, 1, N'Empaques', 1238.9800)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (51, 1, N'Llave Grifa', 3855.0300)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (52, 1, N'Tenazas', 3883.4600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (53, 1, N'Soplete', 1702.1500)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (54, 1, N'Abocinador', 8695.9600)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (55, 1, N'Mordaza Cadena', 8638.0300)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (56, 1, N'Cinta Aislante', 1620.8500)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (57, 1, N'Cinta Metrica', 3122.6200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (58, 1, N'Mordaza Grip', 1274.5400)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (59, 1, N'Tarraja', 680.1700)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (60, 1, N'Martillo', 494.9200)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (63, 3, N'Rastrillo', 10.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (65, 2, N'Humedecedor', 1423.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (66, 1, N'Llave-Inodoro', 1250.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (1066, 1, N'Cortador-Metalico', 1452.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (1067, 1, N'Tuerca', 421.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (1068, 3, N'Divan', 13151.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (1069, 3, N'Closet', 3317.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (1070, 1, N'Pegamento', 4500.0000)
INSERT [dbo].[Articulo] ([Id], [IdClaseArticulo], [Nombre], [Precio]) VALUES (1071, 3, N'Poster', 2500.0000)
SET IDENTITY_INSERT [dbo].[Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[ClaseArticulo] ON 

INSERT [dbo].[ClaseArticulo] ([id], [Nombre]) VALUES (1, N'Plomeria')
INSERT [dbo].[ClaseArticulo] ([id], [Nombre]) VALUES (2, N'Electricos')
INSERT [dbo].[ClaseArticulo] ([id], [Nombre]) VALUES (3, N'Ebanisteria')
SET IDENTITY_INSERT [dbo].[ClaseArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[DBErrors] ON 

INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 41, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-01T23:31:02.287' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 41, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-01T23:40:23.407' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (3, N'DESKTOP-38G492P\Usuario', 3902, 1, 16, 55, N'SP_InsertArticulo', N'The COMMIT TRANSACTION request has no corresponding BEGIN TRANSACTION.', CAST(N'2023-03-02T14:16:46.803' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (4, N'DESKTOP-38G492P\Usuario', 3902, 1, 16, 55, N'SP_InsertArticulo', N'The COMMIT TRANSACTION request has no corresponding BEGIN TRANSACTION.', CAST(N'2023-03-02T14:16:58.417' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (5, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:41:53.503' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (6, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:42:11.493' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1007, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T21:42:55.993' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1008, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 56, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T22:11:49.837' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1009, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 63, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T23:20:42.420' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1010, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 63, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T23:22:08.567' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (7, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:51:50.153' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (8, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "SegundaTarea3", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:55:31.877' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2007, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:16.117' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2008, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:16.123' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2009, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:24.497' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2010, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:24.507' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2011, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:32.747' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2012, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:32.750' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2013, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:53.807' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2014, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:53.810' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2015, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:13:59.993' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2016, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 64, N'SP_SeleccionarCantidad', N'Cannot insert the value NULL into column ''PostTime'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T11:14:00.007' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2017, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 62, N'SP_InsertarArticulo', N'Cannot insert the value NULL into column ''IdClaseArticulo'', table ''SegundaTarea3.dbo.Articulo''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T13:22:02.347' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2019, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:26:26.607' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2020, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:26:29.360' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2021, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:29:46.063' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2022, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:39:37.807' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2024, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:40:32.957' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2025, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:41:01.567' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2026, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 66, N'SP_SeleccionarClaseArt', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:43:51.953' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2027, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 66, N'SP_SeleccionarClaseArt', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:43:51.957' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2028, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 66, N'SP_SeleccionarClaseArt', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:43:57.673' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2029, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 66, N'SP_SeleccionarClaseArt', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:43:57.677' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2030, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 66, N'SP_SeleccionarClaseArt', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:44:02.033' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2031, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 66, N'SP_SeleccionarClaseArt', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:44:02.037' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2018, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 62, N'SP_InsertarArticulo', N'Cannot insert the value NULL into column ''IdClaseArticulo'', table ''SegundaTarea3.dbo.Articulo''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T13:22:06.197' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2023, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:40:20.807' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2032, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:46:44.553' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2033, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:46:45.550' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2034, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:46:46.447' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2035, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:46:46.930' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2039, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:55:35.893' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2040, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:55:37.610' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2036, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:49:26.710' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2037, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:50:52.083' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2038, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:52:37.860' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2041, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:55:50.167' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2042, N'DESKTOP-38G492P\Usuario', 515, 2, 16, 75, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-04T18:56:02.800' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2043, N'DESKTOP-38G492P\Usuario', 245, 1, 16, 79, N'SP_InsertarArticulo', N'Conversion failed when converting the varchar value ''{TipoAccion = "Insertar articulo exitoso"  Description = "'' to data type int.', CAST(N'2023-04-05T01:21:19.490' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2044, N'sa', 515, 2, 16, 68, N'SP_VerificarUsuario', N'Cannot insert the value NULL into column ''PostIdUser'', table ''SegundaTarea3.dbo.EventLog''; column does not allow nulls. INSERT fails.', CAST(N'2023-04-06T09:53:45.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[DBErrors] OFF
GO
SET IDENTITY_INSERT [dbo].[EventLog] ON 

INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T22:54:19.657' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (2, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T22:54:19.657' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (3, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-03T22:54:34.303' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (4, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-03T22:54:34.303' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (5, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-03T22:54:47.853' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (6, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-03T22:54:47.853' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (7, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T22:55:22.833' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (8, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T22:55:22.833' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (9, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T23:53:00.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (10, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T23:53:00.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (11, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T23:53:16.940' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (12, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-03T23:53:16.940' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (13, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:07:26.507' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (14, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:07:26.507' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (15, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:07:31.057' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (16, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:07:31.057' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (21, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:13:26.233' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (22, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:13:26.233' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (29, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:14:04.527' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (30, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:14:04.527' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (31, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T11:14:08.823' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (32, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T11:14:08.823' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (33, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T11:14:15.613' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (34, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T11:14:15.613' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (35, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:26:04.293' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (36, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:26:04.293' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (37, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:48:39.133' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (38, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:48:39.133' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (39, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:54:19.920' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (40, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:54:19.920' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (41, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:54:22.763' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (42, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:54:22.763' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (43, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:54:24.987' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (44, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T11:54:24.987' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (45, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T11:54:26.033' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (46, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T11:54:26.033' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (47, N'Selección por Cantidad: {Cantidad="30 "}', 9, N'::1', CAST(N'2023-04-04T11:54:57.480' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (48, N'Selección por Cantidad: {Cantidad="30 "}', 9, N'::1', CAST(N'2023-04-04T11:54:57.480' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (49, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T11:56:22.923' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (50, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T11:56:22.923' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (51, N'Selección por Cantidad: {Cantidad="1 "}', 9, N'::1', CAST(N'2023-04-04T11:56:30.453' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (52, N'Selección por Cantidad: {Cantidad="1 "}', 9, N'::1', CAST(N'2023-04-04T11:56:30.453' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (53, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T12:12:30.923' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (54, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T12:12:30.923' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (55, N'Selección por Cantidad: {Cantidad="300 "}', 9, N'::1', CAST(N'2023-04-04T12:12:38.590' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (56, N'Selección por Cantidad: {Cantidad="300 "}', 9, N'::1', CAST(N'2023-04-04T12:12:38.590' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (57, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T12:16:06.737' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (58, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T12:16:06.737' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (59, N'Selección por Cantidad: {Cantidad="4 "}', 9, N'::1', CAST(N'2023-04-04T12:16:12.557' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (60, N'Selección por Cantidad: {Cantidad="4 "}', 9, N'::1', CAST(N'2023-04-04T12:16:12.557' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (61, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T12:56:30.527' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (62, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T12:56:30.527' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (63, N'Selección por Cantidad: {Cantidad="323 "}', 9, N'::1', CAST(N'2023-04-04T12:56:36.250' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (64, N'Selección por Cantidad: {Cantidad="323 "}', 9, N'::1', CAST(N'2023-04-04T12:56:36.250' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (65, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T13:05:16.853' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (66, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T13:05:16.853' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (67, N'Selección por Cantidad: {Cantidad="100 "}', 9, N'::1', CAST(N'2023-04-04T13:05:24.473' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (68, N'Selección por Cantidad: {Cantidad="100 "}', 9, N'::1', CAST(N'2023-04-04T13:05:24.473' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (69, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:05:34.040' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (70, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:05:34.040' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (71, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T13:46:42.067' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (72, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T13:46:42.067' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (73, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T13:46:51.740' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (74, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T13:46:51.740' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (75, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:46:55.897' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (76, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:46:55.897' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (77, N'Selección por Cantidad: {Cantidad="21 "}', 9, N'::1', CAST(N'2023-04-04T13:47:07.343' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (78, N'Selección por Cantidad: {Cantidad="21 "}', 9, N'::1', CAST(N'2023-04-04T13:47:07.343' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (79, N'Selección por Cantidad: {Cantidad="210 "}', 9, N'::1', CAST(N'2023-04-04T13:47:10.243' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (80, N'Selección por Cantidad: {Cantidad="210 "}', 9, N'::1', CAST(N'2023-04-04T13:47:10.243' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (81, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:17.160' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (82, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:17.160' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (83, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:25.570' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (84, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:25.570' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (85, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:30.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (86, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:30.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (87, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:35.747' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (88, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T13:47:35.747' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (89, N'Selección por Cantidad: {Cantidad="200 "}', 9, N'::1', CAST(N'2023-04-04T13:47:44.433' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (90, N'Selección por Cantidad: {Cantidad="200 "}', 9, N'::1', CAST(N'2023-04-04T13:47:44.433' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (91, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T14:45:11.590' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (92, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T14:45:11.590' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (93, N'Selección por Cantidad: {Cantidad="200 "}', 9, N'::1', CAST(N'2023-04-04T14:45:27.163' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (94, N'Selección por Cantidad: {Cantidad="200 "}', 9, N'::1', CAST(N'2023-04-04T14:45:27.163' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (95, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T14:45:51.577' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (96, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T14:45:51.577' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (97, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T14:46:32.560' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (98, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T14:46:32.560' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (99, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-04T14:58:09.417' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (100, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-04T14:58:09.417' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (101, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-04T14:58:33.290' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (102, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-04T14:58:33.290' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (103, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T15:02:55.320' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (104, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T15:02:55.320' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (105, N'Selección por Cantidad: {Cantidad="30 "}', 9, N'::1', CAST(N'2023-04-04T15:28:42.927' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (106, N'Selección por Cantidad: {Cantidad="30 "}', 9, N'::1', CAST(N'2023-04-04T15:28:42.927' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (107, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-04T15:29:47.660' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (108, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-04T15:29:47.660' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (109, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T15:29:53.813' AS DateTime))
GO
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (110, N'Consulta por Clase de Artículo: {Clase="Plomeria "}', 9, N'::1', CAST(N'2023-04-04T15:29:53.813' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (111, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T15:30:22.800' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (112, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T15:30:22.800' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (113, N'Selección por Cantidad: {Cantidad="400 "}', 9, N'::1', CAST(N'2023-04-04T15:36:57.043' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (114, N'Selección por Cantidad: {Cantidad="400 "}', 9, N'::1', CAST(N'2023-04-04T15:36:57.043' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (115, N'Selección por Cantidad: {Cantidad="400 "}', 9, N'::1', CAST(N'2023-04-04T15:36:59.223' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (116, N'Selección por Cantidad: {Cantidad="400 "}', 9, N'::1', CAST(N'2023-04-04T15:36:59.223' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (117, N'Selección por Cantidad: {Cantidad="4 "}', 9, N'::1', CAST(N'2023-04-04T15:37:04.263' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (118, N'Selección por Cantidad: {Cantidad="4 "}', 9, N'::1', CAST(N'2023-04-04T15:37:04.263' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (119, N'Selección por Cantidad: {Cantidad="522 "}', 9, N'::1', CAST(N'2023-04-04T15:37:08.070' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (120, N'Selección por Cantidad: {Cantidad="522 "}', 9, N'::1', CAST(N'2023-04-04T15:37:08.070' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1099, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T16:51:13.543' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1100, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T16:51:13.543' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1101, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T16:53:51.950' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1102, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-04T16:53:51.950' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1106, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:29:48.133' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1107, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:29:52.953' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1111, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:40:38.060' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1112, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:40:43.267' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1124, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:46:49.543' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1125, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:48:41.480' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1127, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:49:38.043' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1128, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:49:48.683' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1129, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:50:42.130' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1130, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:50:43.317' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1135, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T18:55:40.227' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1138, N'Login exitoso', 9, N'::1', CAST(N'2023-04-04T19:04:31.383' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1139, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-04T19:46:26.170' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1140, N'Login exitoso', 9, N'::1', CAST(N'2023-04-04T19:46:30.787' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1141, N'Selección por Cantidad: {Cantidad="10 "}', 9, N'::1', CAST(N'2023-04-04T19:46:37.147' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1142, N'Selección por Cantidad: {Cantidad="10 "}', 9, N'::1', CAST(N'2023-04-04T19:46:37.147' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1143, N'Selección por Cantidad: {Cantidad="13 "}', 9, N'::1', CAST(N'2023-04-04T19:46:41.010' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1144, N'Selección por Cantidad: {Cantidad="13 "}', 9, N'::1', CAST(N'2023-04-04T19:46:41.010' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1145, N'Selección por Cantidad: {Cantidad="1 "}', 9, N'::1', CAST(N'2023-04-04T19:46:44.793' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1146, N'Selección por Cantidad: {Cantidad="1 "}', 9, N'::1', CAST(N'2023-04-04T19:46:44.793' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1147, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T19:46:49.243' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1148, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-04T19:46:49.243' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1149, N'Selección por Cantidad: {Cantidad="233 "}', 9, N'::1', CAST(N'2023-04-04T19:46:54.200' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1150, N'Selección por Cantidad: {Cantidad="233 "}', 9, N'::1', CAST(N'2023-04-04T19:46:54.200' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1151, N'Login exitoso', 9, N'::1', CAST(N'2023-04-04T19:49:31.167' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1152, N'Login exitoso', 9, N'::1', CAST(N'2023-04-04T19:53:21.003' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1153, N'Consulta por Nombre: {Nombre="nador "}', 9, N'::1', CAST(N'2023-04-04T19:53:29.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1154, N'Consulta por Nombre: {Nombre="nador "}', 9, N'::1', CAST(N'2023-04-04T19:53:29.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1155, N'Consulta por Nombre: {Nombre="nad "}', 9, N'::1', CAST(N'2023-04-04T19:53:33.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1156, N'Consulta por Nombre: {Nombre="nad "}', 9, N'::1', CAST(N'2023-04-04T19:53:33.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1157, N'Consulta por Nombre: {Nombre="or "}', 9, N'::1', CAST(N'2023-04-04T19:53:37.603' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1158, N'Consulta por Nombre: {Nombre="or "}', 9, N'::1', CAST(N'2023-04-04T19:53:37.603' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1159, N'Consulta por Nombre: {Nombre="met "}', 9, N'::1', CAST(N'2023-04-04T19:53:46.000' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1160, N'Consulta por Nombre: {Nombre="met "}', 9, N'::1', CAST(N'2023-04-04T19:53:46.000' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1161, N'Login exitoso', 9, N'::1', CAST(N'2023-04-04T21:10:19.480' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1162, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T21:10:58.550' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1163, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-04T21:10:58.550' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1164, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-05T01:14:10.413' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1165, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T01:14:18.663' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1166, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T01:16:18.773' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1167, N'Selección por Cantidad: {Cantidad="100 "}', 9, N'::1', CAST(N'2023-04-05T01:16:35.893' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1168, N'Selección por Cantidad: {Cantidad="100 "}', 9, N'::1', CAST(N'2023-04-05T01:16:35.893' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1169, N'Selección por Cantidad: {Cantidad="13 "}', 9, N'::1', CAST(N'2023-04-05T01:16:43.613' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1170, N'Selección por Cantidad: {Cantidad="13 "}', 9, N'::1', CAST(N'2023-04-05T01:16:43.613' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1171, N'Consulta por Nombre: {Nombre="abocina "}', 9, N'::1', CAST(N'2023-04-05T01:16:50.860' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1172, N'Consulta por Nombre: {Nombre="abocina "}', 9, N'::1', CAST(N'2023-04-05T01:16:50.860' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1173, N'Consulta por Nombre: {Nombre="abocinador "}', 9, N'::1', CAST(N'2023-04-05T01:16:55.490' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1174, N'Consulta por Nombre: {Nombre="abocinador "}', 9, N'::1', CAST(N'2023-04-05T01:16:55.490' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1175, N'Consulta por Nombre: {Nombre="Abocinador "}', 9, N'::1', CAST(N'2023-04-05T01:17:04.600' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1176, N'Consulta por Nombre: {Nombre="Abocinador "}', 9, N'::1', CAST(N'2023-04-05T01:17:04.600' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1177, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-05T01:17:09.713' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1178, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-05T01:17:09.713' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1179, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-05T01:17:12.343' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1180, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-05T01:17:12.343' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1181, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-05T01:17:15.167' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1182, N'Selección por Cantidad: {Cantidad="0 "}', 9, N'::1', CAST(N'2023-04-05T01:17:15.167' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1183, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-05T01:17:19.510' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1184, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-05T01:17:19.510' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1185, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T01:20:53.863' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1186, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T01:24:49.850' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1187, N'{TipoAccion = "Insertar articulo exitoso"  Description = "3", "Divan", "13151.00"}', 9, N'::1', CAST(N'2023-04-05T01:25:09.977' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1188, N'Consulta por Nombre: {Nombre="Divan "}', 9, N'::1', CAST(N'2023-04-05T01:25:16.470' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1189, N'Consulta por Nombre: {Nombre="Divan "}', 9, N'::1', CAST(N'2023-04-05T01:25:16.470' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1190, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-05T01:26:31.067' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1191, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-05T01:26:31.067' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1192, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T01:45:51.840' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1193, N'{TipoAccion = "Insertar articulo exitoso"  Description = "3", "Closet", "3317.00"}', 9, N'::1', CAST(N'2023-04-05T01:46:08.957' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1194, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T01:50:05.060' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1195, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T01:57:38.517' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1196, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-05T01:57:48.453' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1197, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-05T01:57:48.453' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1198, N'Selección por Cantidad: {Cantidad="11 "}', 9, N'::1', CAST(N'2023-04-05T01:57:53.410' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1199, N'Selección por Cantidad: {Cantidad="11 "}', 9, N'::1', CAST(N'2023-04-05T01:57:53.410' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1200, N'Consulta por Nombre: {Nombre="rra "}', 9, N'::1', CAST(N'2023-04-05T01:57:58.463' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1201, N'Consulta por Nombre: {Nombre="rra "}', 9, N'::1', CAST(N'2023-04-05T01:57:58.463' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1202, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T11:25:41.260' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1203, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-05T11:25:47.390' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1204, N'Selección por Cantidad: {Cantidad="12 "}', 9, N'::1', CAST(N'2023-04-05T11:25:47.390' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1205, N'Selección por Cantidad: {Cantidad="33 "}', 9, N'::1', CAST(N'2023-04-05T11:25:50.660' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1206, N'Selección por Cantidad: {Cantidad="33 "}', 9, N'::1', CAST(N'2023-04-05T11:25:50.660' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1207, N'Consulta por Nombre: {Nombre="la "}', 9, N'::1', CAST(N'2023-04-05T11:25:56.050' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1208, N'Consulta por Nombre: {Nombre="la "}', 9, N'::1', CAST(N'2023-04-05T11:25:56.050' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1209, N'Logout', 9, N'::1', CAST(N'2023-04-05T11:26:00.040' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1210, N'Logout', 9, N'::1', CAST(N'2023-04-05T11:26:13.710' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1211, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T11:27:00.630' AS DateTime))
GO
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1212, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T11:27:17.640' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1213, N'Login exitoso', 9, N'::1', CAST(N'2023-04-05T11:27:33.217' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1214, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-05T11:27:35.273' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1215, N'Consulta por Clase de Artículo: {Clase="Ebanisteria "}', 9, N'::1', CAST(N'2023-04-05T11:27:35.273' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1216, N'Logout', 9, N'::1', CAST(N'2023-04-05T11:27:36.510' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1217, N'Login exitoso', 9, N'::1', CAST(N'2023-04-06T09:47:11.203' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1218, N'Login exitoso', 9, N'::1', CAST(N'2023-04-06T09:48:46.903' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1219, N'Selección por Cantidad: {Cantidad="67 "}', 9, N'::1', CAST(N'2023-04-06T09:48:55.440' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1220, N'Selección por Cantidad: {Cantidad="67 "}', 9, N'::1', CAST(N'2023-04-06T09:48:55.440' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1221, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-06T09:48:58.183' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1222, N'Consulta por Nombre: {Nombre=" "}', 9, N'::1', CAST(N'2023-04-06T09:48:58.183' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1223, N'Consulta por Nombre: {Nombre="h "}', 9, N'::1', CAST(N'2023-04-06T09:49:00.467' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1224, N'Consulta por Nombre: {Nombre="h "}', 9, N'::1', CAST(N'2023-04-06T09:49:00.467' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1225, N'Consulta por Nombre: {Nombre="H "}', 9, N'::1', CAST(N'2023-04-06T09:49:13.640' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1226, N'Consulta por Nombre: {Nombre="H "}', 9, N'::1', CAST(N'2023-04-06T09:49:13.640' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1227, N'Consulta por Nombre: {Nombre="CTE "}', 9, N'::1', CAST(N'2023-04-06T09:49:27.437' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1228, N'Consulta por Nombre: {Nombre="CTE "}', 9, N'::1', CAST(N'2023-04-06T09:49:27.437' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1229, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-06T09:49:37.900' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1230, N'Consulta por Clase de Artículo: {Clase="Electricos "}', 9, N'::1', CAST(N'2023-04-06T09:49:37.900' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1231, N'Selección por Cantidad: {Cantidad="67 "}', 9, N'::1', CAST(N'2023-04-06T09:49:57.560' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1232, N'Selección por Cantidad: {Cantidad="67 "}', 9, N'::1', CAST(N'2023-04-06T09:49:57.560' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1233, N'Selección por Cantidad: {Cantidad="67 "}', 9, N'::1', CAST(N'2023-04-06T09:50:00.527' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1234, N'Selección por Cantidad: {Cantidad="67 "}', 9, N'::1', CAST(N'2023-04-06T09:50:00.527' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1235, N'Selección por Cantidad: {Cantidad="3 "}', 9, N'::1', CAST(N'2023-04-06T09:50:03.723' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1236, N'Selección por Cantidad: {Cantidad="3 "}', 9, N'::1', CAST(N'2023-04-06T09:50:03.723' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1237, N'Logout', 9, N'::1', CAST(N'2023-04-06T09:53:35.547' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1239, N'Login no exitoso', 0, N'::1', CAST(N'2023-04-06T09:53:51.220' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1240, N'Login exitoso', 7, N'::1', CAST(N'2023-04-06T09:54:03.127' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1241, N'Consulta por Nombre: {Nombre="Lija "}', 7, N'::1', CAST(N'2023-04-06T09:54:30.020' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1242, N'Consulta por Nombre: {Nombre="Lija "}', 7, N'::1', CAST(N'2023-04-06T09:54:30.020' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1243, N'{TipoAccion = "Insertar articulo exitoso"  Description = "1", "Pegamento", "4500.00"}', 7, N'::1', CAST(N'2023-04-06T09:54:55.327' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1244, N'Consulta por Nombre: {Nombre="Pega "}', 7, N'::1', CAST(N'2023-04-06T09:55:03.953' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1245, N'Consulta por Nombre: {Nombre="Pega "}', 7, N'::1', CAST(N'2023-04-06T09:55:03.953' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1246, N'{TipoAccion="Login exitoso", Description=""}', 7, N'::1', CAST(N'2023-04-06T10:26:24.740' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1247, N'{TipoAccion="Consulta por cantidad", Description="68"}', 7, N'::1', CAST(N'2023-04-06T10:26:35.127' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1248, N'{TipoAccion="Consulta por cantidad", Description="68"}', 7, N'::1', CAST(N'2023-04-06T10:26:35.127' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1249, N'{TipoAccion="Consulta por Nombre", Description=""}', 7, N'::1', CAST(N'2023-04-06T10:26:35.827' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1250, N'{TipoAccion="Consulta por Nombre", Description=""}', 7, N'::1', CAST(N'2023-04-06T10:26:35.827' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1251, N'{TipoAccion="Consulta por clase de articulo", Description="Ebanisteria"}', 7, N'::1', CAST(N'2023-04-06T10:26:36.870' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1252, N'{TipoAccion="Consulta por clase de articulo", Description="Ebanisteria"}', 7, N'::1', CAST(N'2023-04-06T10:26:36.870' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1253, N'{TipoAccion="Consulta por cantidad", Description="68"}', 7, N'::1', CAST(N'2023-04-06T10:26:57.167' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1254, N'{TipoAccion="Consulta por cantidad", Description="68"}', 7, N'::1', CAST(N'2023-04-06T10:26:57.167' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1255, N'{TipoAccion="Consulta por Nombre", Description="Micro"}', 7, N'::1', CAST(N'2023-04-06T10:27:09.157' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1256, N'{TipoAccion="Consulta por Nombre", Description="Micro"}', 7, N'::1', CAST(N'2023-04-06T10:27:09.157' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1257, N'{TipoAccion="Consulta por cantidad", Description="7"}', 7, N'::1', CAST(N'2023-04-06T10:27:27.413' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1258, N'{TipoAccion="Consulta por cantidad", Description="7"}', 7, N'::1', CAST(N'2023-04-06T10:27:27.413' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1259, N'{TipoAccion="Consulta por clase de articulo", Description="Plomeria"}', 7, N'::1', CAST(N'2023-04-06T10:27:36.537' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1260, N'{TipoAccion="Consulta por clase de articulo", Description="Plomeria"}', 7, N'::1', CAST(N'2023-04-06T10:27:36.537' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1261, N'{TipoAccion="Insertar articulo exitoso",  Description="3, Poster, 2500.00"}', 7, N'::1', CAST(N'2023-04-06T10:28:18.817' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1262, N'{TipoAccion="Logout", Description=""}', 7, N'::1', CAST(N'2023-04-06T10:28:41.143' AS DateTime))
INSERT [dbo].[EventLog] ([Id], [LogDescription], [PostIdUser], [PostIP], [PostTime]) VALUES (1263, N'{TipoAccion="Login no exitoso", Description=""}', 0, N'::1', CAST(N'2023-04-06T10:30:23.817' AS DateTime))
SET IDENTITY_INSERT [dbo].[EventLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (1, N'Adam', N'9Ydsy')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (2, N'Andrew', N'u5InA')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (3, N'Kimberly', N'2ISya')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (4, N'Lauren', N'n6EdD')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (5, N'Melissa', N'XD3Wb')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (6, N'Robert', N'6Aord')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (7, N'Sara', N'8WuYP')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (8, N'Terri', N'm7Bzw')
INSERT [dbo].[Usuario] ([id], [UserName], [Password]) VALUES (9, N'Tina', N'W1BVk')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_ClaseArticulo] FOREIGN KEY([IdClaseArticulo])
REFERENCES [dbo].[ClaseArticulo] ([id])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_ClaseArticulo]
GO
/****** Object:  StoredProcedure [dbo].[ImportarDatosXML]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ImportarDatosXML]
    @ArchivoXML NVARCHAR(255)
AS
BEGIN
    DECLARE @XmlData XML
    SELECT @XmlData = BulkColumn
    FROM OPENROWSET(BULK 'C:\Users\Usuario\Desktop\DB\Queries\DatosXML_ejemplo.xml', SINGLE_BLOB) AS x

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
/****** Object:  StoredProcedure [dbo].[InsertXML]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertXML]
    @xmlData nvarchar(MAX)
AS
BEGIN
    -- Procedimiento para insertar datos de XML en las tablas Usuario y ClaseArticulo

    DECLARE @xmlDoc xml;
    SET @xmlDoc = CAST(@xmlData AS xml);

    -- Insertar usuarios
    INSERT INTO Usuario (UserName, Password)
    SELECT
        u.value('@Nombre', 'nvarchar(50)') AS Nombre,
        u.value('@Password', 'nvarchar(50)') AS Password
    FROM
        @xmlDoc.nodes('/root/Usuarios/Usuario') AS Usuarios(u);

    -- Insertar clases de artículos
    INSERT INTO ClaseArticulo (Nombre)
    SELECT
        ca.value('@Nombre', 'nvarchar(50)') AS Nombre
    FROM
	@xmlDoc.nodes('/root/ClasesdeArticulos/ClasesdeArticulo') AS ClasesdeArticulos(ca);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FiltrarNombre]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FiltrarNombre]
	@inFiltroNombre VARCHAR(128)
	,@inUserName VARCHAR(30)
	,@inIP VARCHAR(64)
	,@inTime DATETIME
	, @outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @LogDescription VARCHAR(2000) = '{TipoAccion="Consulta por Nombre", Description="';
		DECLARE @UserID INT;
		SET @outResultCode = 0;  -- no error code

		-- SE HACEN VALIDACIONES

		IF (@inFiltroNombre IS NULL)
		BEGIN
			SET @outResultCode = 50002;  -- parametro de entrada es nulo
			RETURN;
		END;

		-- Pasamos los datos a mostrarse en el logger
		SET @LogDescription =
			@LogDescription + @inFiltroNombre
			+ '"}'

		BEGIN TRANSACTION tFiltrarNombre
	   
		SET @UserID = (SELECT U.id
						FROM [dbo].[Usuario] U
						WHERE LOWER(@inUserName) = LOWER(U.UserName))

		SELECT 	 A.[id]
				,A.[idClaseArticulo]
				,C.[Nombre] AS ClaseNombre
				,A.[Nombre]
				,A.[Precio]
			FROM [dbo].[Articulo] A
			INNER JOIN [dbo].[ClaseArticulo] C on A.idClaseArticulo = C.id
			WHERE A.[Nombre] LIKE '%'+@inFiltroNombre+'%'
			ORDER BY A.[Nombre] ASC
		
		-- Insertamos en el log
		INSERT [dbo].[EventLog](
			 [LogDescription]
			,[PostIdUser]
			,[PostIP]
			,[PostTime]
		) VALUES (
			 @LogDescription
			,@UserID
			,@inIP
			,@inTime
		)

		COMMIT TRANSACTION tFiltrarNombre

	END TRY
	BEGIN CATCH
		-- Validamos la transaccion en caso de errores
		IF @@TRANCOUNT>0    -- Si este valor es mayor 1, hay un error 
		BEGIN
			ROLLBACK TRANSACTION tSelectClaseArti  -- Se deshacen los cambios realizados
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
	RETURN @outResultCode
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ImportarDatosXML]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ImportarDatosXML]
	@inPatron VARCHAR(32)
	, @outResultCode INT OUTPUT
	, @ArchivoXML NVARCHAR(255)
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
		
		DECLARE @XmlData XML
		SELECT @XmlData = BulkColumn
		FROM OPENROWSET(BULK 'C:\Users\Usuario\Desktop\DB\Queries\DatosXML_ejemplo.xml', SINGLE_BLOB) AS x

		-- Importar datos a la tabla Usuarios
		INSERT INTO Usuario (UserName, Password)
		SELECT DISTINCT
			x.Usuario.value('@Nombre', 'NVARCHAR(50)') AS Nombre
			, x.Usuario.value('@Password', 'NVARCHAR(50)') AS Password
		FROM @XmlData.nodes('/root/Usuarios/Usuario') AS x(Usuario)
		WHERE x.Usuario.value('@Nombre','NVARCHAR(50)') NOT IN (SELECT UserName FROM Usuario)
		AND x.Usuario.value('@Password','NVARCHAR(50)') NOT IN (SELECT Password FROM Usuario)

		-- Importar datos a la tabla Clasesdrticulo
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
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarArticulo]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarArticulo]
	@inNombre VARCHAR(128)		-- Nuevo Nombre de articulo
	, @inPrecio MONEY				-- Nuevo Precio
	, @inClaseArticulo VARCHAR(30)  -- Clase del nuevo articulo
	,@inUserName VARCHAR(30)
	,@inIP VARCHAR (64)
	,@inTime DATETIME
	, @outResultCode INT OUTPUT			-- Codigo de resultado del SP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	-- Se validan los datos de entrada, pues no estamos seguros que se validaron en capa logica
	BEGIN TRY
		-- Inicia codigo en el cual se capturan errores
        DECLARE @LogDescription VARCHAR (2000)='{TipoAccion="'
		DECLARE @claseID INT
		DECLARE @UserID INT
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

		IF  (--Verificar si los nombres son nulos o su cantidad de caracteres no es mayor que cero
			@inNombre IS NULL OR NOT LEN(@inNombre) > 0	OR @inClaseArticulo IS NULL 
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
			
			IF(@outResultCode != 0)
			BEGIN 
				SET @LogDescription =  @LogDescription + 'Insertar articulo fallido" '
					+ ', Description=""}';
			END 
			
			ELSE IF (@outResultCode = 0)
			BEGIN 		
				SET @claseID = (SELECT cl.id FROM [dbo].[ClaseArticulo] cl 
					WHERE @inClaseArticulo = cl.Nombre);
			
				SET @LogDescription =  @LogDescription + 'Insertar articulo exitoso", '
					+ ' Description="' + CONVERT(VARCHAR(32),@claseID) 
					+ ', '+ @inNombre + ', ' + CONVERT(VARCHAR(32),@inPrecio) +'"}'

				INSERT [dbo].[Articulo] (
					[IdClaseArticulo]
					,[Nombre]
					,[Precio]
					)
				VALUES (
					@claseID
					,@inNombre
					, @inPrecio
				);
			END

			SET @UserID = (SELECT U.id
					FROM [dbo].[Usuario] U
					WHERE LOWER(@inUserName) = LOWER(U.UserName)
					)


			-- salvamos en evento log el evento de insertar el articulo
			INSERT [dbo].[EventLog](
					 [LogDescription]
					,[PostIdUser]
					,[PostIP]
					,[PostTime]
				) VALUES (
					 @LogDescription
					,@UserID
					,@inIP
					,@inTime
				)

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
/****** Object:  StoredProcedure [dbo].[SP_ListarArticulos]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_ListarArticulos]
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
		SELECT 	 A.[id]
				,A.[idClaseArticulo]
				,C.[Nombre] AS ClaseNombre
				,A.[Nombre]
				,A.[Precio]
			FROM [dbo].[Articulo] A
			INNER JOIN [dbo].[ClaseArticulo] C on A.idClaseArticulo = C.id
			WHERE A.[Nombre] LIKE '%'+@inPatron+'%'
			ORDER BY A.[Nombre] ASC
--		SELECT A.[Nombre]
--			, A.[Precio]
--		FROM dbo.Articulo A
--		WHERE A.Nombre LIKE '%'+@inPatron+'%'
--		ORDER BY A.Nombre;
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Logout]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Logout]
	--Parametros del procedimiento almacenado
	@inNombre VARCHAR(128) --Nombre del usuario que hizo logout
	,@inIP VARCHAR(64)	   --IP del servidor del usuario
	,@inTime DATETIME	   --Fecha y hora en que se esta ejecutando
	,@outResultCode INT OUTPUT --Codigo resultado de salida

AS
BEGIN
	--Iniciamos NOCOUNT ON
	SET NOCOUNT ON;
	BEGIN TRY
	DECLARE @LogDescription VARCHAR(120); --Descripcion del LogEvent
	DECLARE @UserID INT; --Entero que representa el id del usuario que hace logout
	
	BEGIN TRANSACTION tLogout--Se empieza el TRANSACTION tlogout
	
	SET @outResultCode = 0; --Por default el codigo de salida se define en 0
	SET @LogDescription = '{TipoAccion="Logout", Description=""}'; --Se define la descripcion del Eventlog
	--Se define el valor del id del usuario haciendo select de la tabla Usuario
	SET @UserID = (SELECT u.id FROM [dbo].[Usuario] u
				WHERE @inNombre = u.UserName)

	--Se hace la insercion a la tabla EventLog del logout
	INSERT [dbo].[EventLog](
			 [LogDescription]
			,[PostIdUser]
			,[PostIP]
			,[PostTime]
	) VALUES (
			 @LogDescription
			,@UserID
			,@inIP
			,@inTime
	)

	COMMIT TRANSACTION tLogout --Se finaliza el TRANSACTION

	END TRY
	--Se empieza el catch de errores 
	BEGIN CATCH
	-- Se procesan errores dentro del catch
		--Se verifica si es mayor que cero
		IF @@TRANCOUNT>0  -- error sucedio dentro de la transaccion
		BEGIN
			ROLLBACK TRANSACTION tLogout; -- se deshacen los cambios realizados
		END;
		--Se hace la insercion a la tabla de errores
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
		--Se define al codigo de salida en 50005 
		SET @outResultCode = 50005;--Codigo de salida de error
	END CATCH
	SET NOCOUNT OFF

	--Se retorna el codigo de salida con su valor respectivo
	RETURN @outResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SeleccionarCantidad]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SeleccionarCantidad]
	 @inCantidad INT
	,@inUserName VARCHAR(30)
	,@inIP VARCHAR(64)
	,@inTime DATETIME
	,@outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @intValue INT; -- Nueva variable
		DECLARE @LogDescription VARCHAR (2000)='{TipoAccion="Consulta por cantidad", Description="'
		DECLARE @UserID INT
		SET @outResultCode = 0    --  Asignamos ámbito de error a 0

		-- Se empieza a hacer validaciones

		-- Validacion valor nulo
		DECLARE @cantTemp INT
		SELECT @cantTemp = COUNT(*)
		FROM [dbo].[Articulo];
		--PRINT @cantTemp

		IF (@inCantidad = '')
		BEGIN
			SET @outResultCode = 50002   -- Error de entrada de valores nulos

			SET @inCantidad = @cantTemp;
			--SET @intValue = @cantTemp;

			--EXEC SP_ListarArticulos '',''
			--RETURN @outResultCode;
		END
		--PRINT @inCantidad

		-- Validación cantidad no numero
		IF (ISNUMERIC(@inCantidad) = 0)
		BEGIN
			SET @outResultCode = 50003
			RETURN;
		END

		--ELSE
		--BEGIN
		--	SET @intValue = CONVERT(INT, @inCantidad);
		--END

		-- Validación errores en la IP o en el usuario
		IF ((@inUserName = NULL)  or (@inIP = NULL))
		BEGIN
			SET @outResultCode = 50008  -- Error por valores de IP o usuario
			RETURN
		END

		SET @UserID = (SELECT U.id
					FROM [dbo].[Usuario] U
					WHERE LOWER(@inUserName) = LOWER(U.UserName)
					)

		SET @LogDescription =
			@LogDescription + CONVERT(VARCHAR(32), @inCantidad) --/
			+ '"}'

		BEGIN TRANSACTION tSeleccionarPorNombre
			-- La palabra clave TOP se encarga de solo mostrar la N cantidad primera mostrada por la tabla

			SELECT TOP (@inCantidad)--/
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
					,[PostTime]
				) VALUES (
					 @LogDescription
					,@UserID
					,@inIP
					,@inTime
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
		INSERT INTO [dbo].[DBErrors] VALUES(
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
		SET @outResultCode = 50005;
	END CATCH

	SET NOCOUNT OFF
	RETURN @outResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SeleccionarClaseArt]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SeleccionarClaseArt]
	 @inClaseArticulo VARCHAR(30)
	,@inUserName VARCHAR(30)
	,@inIP VARCHAR(64)
	,@inTime DATETIME
	,@outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @LogDescription VARCHAR (2000)='{TipoAccion="Consulta por clase de articulo", Description="'
		DECLARE @idClaseArticulo INT
		DECLARE @UserID INT
		SET @outResultCode = 0    --  Asignamos ámbito de error a 0

		-- Empezamos validaciones

		-- Validación entrada nula
		IF (@inClaseArticulo IS NULL)
		BEGIN
			SET @outResultCode = 50002   -- Error de entrada de valores nulos
			RETURN @outResultCode;
		END

		-- Validación error de valor IP o usuario
		IF ((@inUserName = NULL)  or (@inIP = NULL))
		BEGIN
			SET @outResultCode = 50008  -- Error por valores de IP o usuario
			RETURN
		END

		-- Empezamos código normal -- 
		
		-- Pasamos los datos a mostrarse en el logger
		SET @LogDescription =
			@LogDescription + @inClaseArticulo
			+ '"}'

		BEGIN TRANSACTION tSelectClaseArti

		-- Primero obtenemos la ID para identificar los valores a mostrar
		SET @idClaseArticulo = (SELECT C.id
							   FROM [dbo].[ClaseArticulo] C
							   WHERE LOWER(@inClaseArticulo) = LOWER(C.Nombre))
		
		--Obtenemos el id del usuario
		SET @UserID = (SELECT U.id
						FROM [dbo].[Usuario] U
						WHERE LOWER(@inUserName) = LOWER(U.UserName))


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
			,[PostTime]
		) VALUES (
			 @LogDescription
			,@UserID
			,@inIP
			,@inTime
		)

		COMMIT TRANSACTION tSelectClaseArti

	END TRY
	BEGIN CATCH
		-- Validamos la transaccion en caso de errores
		IF @@TRANCOUNT>0    -- Si este valor es mayor 1, hay un error 
		BEGIN
			ROLLBACK TRANSACTION tSelectClaseArti  -- Se deshacen los cambios realizados
		END;

		-- Insertamos el valor a la tabla de errores
		INSERT INTO [dbo].[DBErrors] VALUES(
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
		SET @outResultCode = 50005;
	END CATCH

	SET NOCOUNT OFF
	RETURN @outResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuario]    Script Date: 6/4/2023 11:26:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarUsuario] 
	-- Add the parameters for the stored procedure here
	@inNombre VARCHAR(128)		-- Nombre de usuario ingresado a verificar
	,@inContraseña VARCHAR(128) -- Contraseña ingresada a verificar
	,@inIP VARCHAR(64)
	,@inTime DATETIME
	,@outResultCode INT OUTPUT	-- Código de resultado del SP
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @LogDescription VARCHAR(120);
	DECLARE @UserID INT = -999;
	--Llamar al Store procedure para cargar datos xml
	 --EXEC SP_ImportarDatosXML '','','';

	--Validar que nombre y contraseña no sean hileras vacías
	BEGIN TRY

	SET @outResultCode = 0; --Valor inicial predeterminado del resultado de salida

	--Validar nombre ingresado 
	IF	(
		@inNombre IS NULL OR NOT LEN(@inNombre) > 0	 --Verificar si es nulo o tiene cero caracteres
		)

	BEGIN
		SET @LogDescription = '{TipoAccion="Login no exitoso", Description=""}';
		SET @outResultCode = 50001 --Nombre no se ha ingresado
		GOTO Insertar_EventLog;
	END;

	--Validar contraseña ingresada
		IF	(
		@inContraseña iS NULL OR NOT LEN(@inContraseña) > 0 --Verificar si es nulo o tiene cero caracteres
		)

	BEGIN
		-- procesar error
		SET @LogDescription = '{TipoAccion="Login no exitoso", Description=""}';
		SET @outResultCode = 50002 --Contraseña no se ha ingresado
		GOTO Insertar_EventLog;
	END;

	IF NOT EXISTS (
			SELECT 1 FROM Usuario WHERE UserName = @InNombre
			AND Password = @inContraseña
			)
	BEGIN
		-- procesar error
		SET @LogDescription = '{TipoAccion="Login no exitoso", Description=""}';
		SET @UserID = 0;
		SET @outResultCode = 50003; --Combinación de nombre y contraseña invalida
		GOTO Insertar_EventLog;
	END
	
	SET @LogDescription = '{TipoAccion="Login exitoso", Description=""}';

	Insertar_EventLog: --Label en donde se inserta a la tabla log el resultado del login 
		
		BEGIN TRANSACTION tVerificarUsuario

			IF(@UserID != 0)
				SET @UserID = (SELECT U.id FROM [dbo].[Usuario] U 
				WHERE LOWER(@inNombre) = LOWER(U.UserName));


		INSERT [dbo].[EventLog](
			 [LogDescription]
			,[PostIdUser]
			,[PostIP]
			,[PostTime]
		) VALUES (
			 @LogDescription
			,@UserID
			,@inIP
			,@inTime
		)

		COMMIT TRANSACTION tVerificarUsuario
	
		END TRY
		BEGIN CATCH

			-- Validamos la transaccion en caso de errores
			IF @@TRANCOUNT>0    -- Si este valor es mayor 1, hay un error 
			BEGIN
				ROLLBACK TRANSACTION tVerificarUsuario  -- Se deshacen los cambios realizados
			END;

			INSERT INTO [dbo].[DBErrors] VALUES (
				SUSER_NAME()
				, ERROR_NUMBER()
				, ERROR_STATE()
				, ERROR_SEVERITY()
				, ERROR_LINE()
				, ERROR_PROCEDURE()
				, ERROR_MESSAGE()
				, GETDATE()
			);

			-- Procesar errores dentro del catch
			SET @outResultCode = 50005;  

		END CATCH

	SET NOCOUNT OFF
	RETURN @outResultCode; 
END
GO
USE [master]
GO
ALTER DATABASE [SegundaTarea3] SET  READ_WRITE 
GO
