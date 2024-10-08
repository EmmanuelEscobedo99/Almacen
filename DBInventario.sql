USE [master]
GO
/****** Object:  Database [DBInventario]    Script Date: 25/08/2024 07:19:56 p. m. ******/
CREATE DATABASE [DBInventario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBInventario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBInventario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBInventario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBInventario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBInventario] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBInventario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBInventario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBInventario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBInventario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBInventario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBInventario] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBInventario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBInventario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBInventario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBInventario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBInventario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBInventario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBInventario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBInventario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBInventario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBInventario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBInventario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBInventario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBInventario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBInventario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBInventario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBInventario] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBInventario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBInventario] SET RECOVERY FULL 
GO
ALTER DATABASE [DBInventario] SET  MULTI_USER 
GO
ALTER DATABASE [DBInventario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBInventario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBInventario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBInventario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBInventario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBInventario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBInventario', N'ON'
GO
ALTER DATABASE [DBInventario] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBInventario] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBInventario]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25/08/2024 07:19:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 25/08/2024 07:19:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[ClaveArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[UbicacionId] [int] NOT NULL,
	[FechaEntrada] [datetime2](7) NOT NULL,
	[CategoriaId] [int] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[ClaveArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/08/2024 07:19:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 25/08/2024 07:19:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticuloId] [int] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Tipo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 25/08/2024 07:19:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Ubicacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articulo_CategoriaId]    Script Date: 25/08/2024 07:19:56 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Articulo_CategoriaId] ON [dbo].[Articulo]
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articulo_UbicacionId]    Script Date: 25/08/2024 07:19:56 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Articulo_UbicacionId] ON [dbo].[Articulo]
(
	[UbicacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movimiento_ArticuloId]    Script Date: 25/08/2024 07:19:56 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Movimiento_ArticuloId] ON [dbo].[Movimiento]
(
	[ArticuloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [FechaEntrada]
GO
ALTER TABLE [dbo].[Articulo] ADD  DEFAULT ((0)) FOR [CategoriaId]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoria_CategoriaId] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Categoria_CategoriaId]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Ubicacion_UbicacionId] FOREIGN KEY([UbicacionId])
REFERENCES [dbo].[Ubicacion] ([Id])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Ubicacion_UbicacionId]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_Articulo_ArticuloId] FOREIGN KEY([ArticuloId])
REFERENCES [dbo].[Articulo] ([ClaveArticulo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_Articulo_ArticuloId]
GO
USE [master]
GO
ALTER DATABASE [DBInventario] SET  READ_WRITE 
GO
