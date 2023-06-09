USE [master]
GO
/****** Object:  Database [prueba_tecnica]    Script Date: 24/05/2023 14:04:45 ******/
CREATE DATABASE [prueba_tecnica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba_tecnica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\prueba_tecnica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_tecnica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\prueba_tecnica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [prueba_tecnica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba_tecnica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba_tecnica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba_tecnica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba_tecnica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba_tecnica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba_tecnica] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba_tecnica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [prueba_tecnica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba_tecnica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba_tecnica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba_tecnica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba_tecnica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba_tecnica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba_tecnica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba_tecnica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba_tecnica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prueba_tecnica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba_tecnica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba_tecnica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba_tecnica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba_tecnica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba_tecnica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba_tecnica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba_tecnica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba_tecnica] SET  MULTI_USER 
GO
ALTER DATABASE [prueba_tecnica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba_tecnica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba_tecnica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba_tecnica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prueba_tecnica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prueba_tecnica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [prueba_tecnica] SET QUERY_STORE = ON
GO
ALTER DATABASE [prueba_tecnica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [prueba_tecnica]
GO
/****** Object:  User [admin]    Script Date: 24/05/2023 14:04:46 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[detalles]    Script Date: 24/05/2023 14:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles](
	[iddetalle] [int] NOT NULL,
	[idfactura] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[cantidad] [bigint] NOT NULL,
	[preciounitario] [int] NOT NULL,
 CONSTRAINT [PK_detalles] PRIMARY KEY CLUSTERED 
(
	[iddetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 24/05/2023 14:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[idfactura] [int] NOT NULL,
	[numerofactura] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipodepago] [varchar](50) NOT NULL,
	[documentocliente] [bigint] NOT NULL,
	[nombrecliente] [varchar](50) NOT NULL,
	[subtotal] [int] NOT NULL,
	[descuento] [int] NOT NULL,
	[iva] [int] NOT NULL,
	[totaldescuento] [int] NOT NULL,
	[totalimpuesto] [int] NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_facturas] PRIMARY KEY CLUSTERED 
(
	[idfactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 24/05/2023 14:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[idproducto] [int] NOT NULL,
	[producto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[detalles] ([iddetalle], [idfactura], [idproducto], [cantidad], [preciounitario]) VALUES (1, 1, 1, 1, 60000)
INSERT [dbo].[detalles] ([iddetalle], [idfactura], [idproducto], [cantidad], [preciounitario]) VALUES (2, 1, 3, 1, 40000)
INSERT [dbo].[detalles] ([iddetalle], [idfactura], [idproducto], [cantidad], [preciounitario]) VALUES (3, 1, 1, 1, 50000)
INSERT [dbo].[detalles] ([iddetalle], [idfactura], [idproducto], [cantidad], [preciounitario]) VALUES (4, 2, 1, 1, 60000)
INSERT [dbo].[detalles] ([iddetalle], [idfactura], [idproducto], [cantidad], [preciounitario]) VALUES (5, 3, 1, 1, 50000)
INSERT [dbo].[detalles] ([iddetalle], [idfactura], [idproducto], [cantidad], [preciounitario]) VALUES (6, 3, 4, 1, 40000)
INSERT [dbo].[detalles] ([iddetalle], [idfactura], [idproducto], [cantidad], [preciounitario]) VALUES (7, 4, 2, 1, 13123)
GO
INSERT [dbo].[facturas] ([idfactura], [numerofactura], [fecha], [tipodepago], [documentocliente], [nombrecliente], [subtotal], [descuento], [iva], [totaldescuento], [totalimpuesto], [total]) VALUES (1, 10001, CAST(N'2023-05-19' AS Date), N'Credito', 2312, N'Luciana Alvares', 150000, 0, 20, 0, 30000, 180000)
INSERT [dbo].[facturas] ([idfactura], [numerofactura], [fecha], [tipodepago], [documentocliente], [nombrecliente], [subtotal], [descuento], [iva], [totaldescuento], [totalimpuesto], [total]) VALUES (2, 10002, CAST(N'2023-05-19' AS Date), N'Contado', 3423432, N'Ronaldo Sinning', 60000, 0, 20, 0, 12000, 72000)
INSERT [dbo].[facturas] ([idfactura], [numerofactura], [fecha], [tipodepago], [documentocliente], [nombrecliente], [subtotal], [descuento], [iva], [totaldescuento], [totalimpuesto], [total]) VALUES (3, 10004, CAST(N'2023-05-19' AS Date), N'Contado', 54354534, N'Juancho Perez', 90000, 5, 20, 4500, 18000, 107995)
INSERT [dbo].[facturas] ([idfactura], [numerofactura], [fecha], [tipodepago], [documentocliente], [nombrecliente], [subtotal], [descuento], [iva], [totaldescuento], [totalimpuesto], [total]) VALUES (4, 123123123, CAST(N'2023-05-19' AS Date), N'Contado', 123123213, N'asdasdasdas', 13123, 0, 20, 0, 2624, 15747)
GO
INSERT [dbo].[productos] ([idproducto], [producto]) VALUES (1, N'Zapatos X')
INSERT [dbo].[productos] ([idproducto], [producto]) VALUES (2, N'Pantalones X')
INSERT [dbo].[productos] ([idproducto], [producto]) VALUES (3, N'Suetes X')
INSERT [dbo].[productos] ([idproducto], [producto]) VALUES (4, N'Camisa X')
INSERT [dbo].[productos] ([idproducto], [producto]) VALUES (5, N'Traje Z')
INSERT [dbo].[productos] ([idproducto], [producto]) VALUES (6, N'Sombrero Y')
GO
ALTER TABLE [dbo].[detalles]  WITH CHECK ADD  CONSTRAINT [FK_detalles_facturas] FOREIGN KEY([idfactura])
REFERENCES [dbo].[facturas] ([idfactura])
GO
ALTER TABLE [dbo].[detalles] CHECK CONSTRAINT [FK_detalles_facturas]
GO
ALTER TABLE [dbo].[detalles]  WITH CHECK ADD  CONSTRAINT [FK_detalles_productos] FOREIGN KEY([idproducto])
REFERENCES [dbo].[productos] ([idproducto])
GO
ALTER TABLE [dbo].[detalles] CHECK CONSTRAINT [FK_detalles_productos]
GO
USE [master]
GO
ALTER DATABASE [prueba_tecnica] SET  READ_WRITE 
GO
