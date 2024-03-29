USE [master]
GO
/****** Object:  Database [Whell]    Script Date: 08.09.2023 14:09:57 ******/
CREATE DATABASE [Whell]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Whell', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Whell.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Whell_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Whell_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Whell] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Whell].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Whell] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Whell] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Whell] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Whell] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Whell] SET ARITHABORT OFF 
GO
ALTER DATABASE [Whell] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Whell] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Whell] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Whell] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Whell] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Whell] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Whell] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Whell] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Whell] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Whell] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Whell] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Whell] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Whell] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Whell] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Whell] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Whell] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Whell] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Whell] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Whell] SET  MULTI_USER 
GO
ALTER DATABASE [Whell] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Whell] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Whell] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Whell] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Whell] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Whell] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Whell] SET QUERY_STORE = OFF
GO
USE [Whell]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 08.09.2023 14:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[IDGoods] [int] IDENTITY(1,1) NOT NULL,
	[NazvGoods] [varchar](max) NULL,
	[Price] [int] NULL,
	[Discription] [varchar](max) NULL,
	[Manufuctured] [varchar](max) NULL,
	[Photo] [varchar](max) NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[IDGoods] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08.09.2023 14:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IDOrder] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NULL,
	[NumerOrder] [int] NULL,
	[DeliverPost] [varchar](max) NULL,
	[Code] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 08.09.2023 14:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[IDTicket] [int] IDENTITY(1,1) NOT NULL,
	[IDGoods] [int] NULL,
	[IDOrder] [int] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[IDTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeUsers]    Script Date: 08.09.2023 14:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUsers](
	[IDTypeUsers] [int] IDENTITY(1,1) NOT NULL,
	[NazvTypeUsers] [varchar](max) NULL,
 CONSTRAINT [PK_TypeUsers] PRIMARY KEY CLUSTERED 
(
	[IDTypeUsers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08.09.2023 14:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUsers] [int] IDENTITY(1,1) NOT NULL,
	[FIOUsers] [varchar](max) NULL,
	[Login] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[IDTypeUsers] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IDUsers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([IDGoods], [NazvGoods], [Price], [Discription], [Manufuctured], [Photo]) VALUES (1, N'Шины', 5000, N'Один из наиболее важных элементов колеса, представляющий собой упругую резино-металло-тканевую оболочку, установленную на обод диска', N'Michelin', N'/Photo/img1.png')
INSERT [dbo].[Goods] ([IDGoods], [NazvGoods], [Price], [Discription], [Manufuctured], [Photo]) VALUES (2, N'Коробка передач', 200000, N'Механизм, применяемый в основном в автомобилях, для изменения передаточного отношения', N'JATCO', N'/Photo/img2.png')
INSERT [dbo].[Goods] ([IDGoods], [NazvGoods], [Price], [Discription], [Manufuctured], [Photo]) VALUES (3, N'Фары', 15000, N'Источник направленного света с отражателем, установленный в передней части транспортного средства и предназначенный для освещения дороги и окружающей местности', N'DEPO', N'/Photo/img3.png')
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IDOrder], [DateOrder], [NumerOrder], [DeliverPost], [Code]) VALUES (1, CAST(N'2023-11-09' AS Date), 1, N'Олимпийский проспект', 333)
INSERT [dbo].[Order] ([IDOrder], [DateOrder], [NumerOrder], [DeliverPost], [Code]) VALUES (2, CAST(N'2023-11-05' AS Date), 2, N' Новорязанское шоссе', 444)
INSERT [dbo].[Order] ([IDOrder], [DateOrder], [NumerOrder], [DeliverPost], [Code]) VALUES (3, CAST(N'2023-11-03' AS Date), 3, N' Савёловская линия', 555)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([IDTicket], [IDGoods], [IDOrder]) VALUES (1, 1, 1)
INSERT [dbo].[Ticket] ([IDTicket], [IDGoods], [IDOrder]) VALUES (2, 2, 2)
INSERT [dbo].[Ticket] ([IDTicket], [IDGoods], [IDOrder]) VALUES (3, 3, 3)
INSERT [dbo].[Ticket] ([IDTicket], [IDGoods], [IDOrder]) VALUES (4, 1, 2)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Goods] FOREIGN KEY([IDGoods])
REFERENCES [dbo].[Goods] ([IDGoods])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Goods]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Order] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[Order] ([IDOrder])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Order]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypeUsers] FOREIGN KEY([IDTypeUsers])
REFERENCES [dbo].[TypeUsers] ([IDTypeUsers])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypeUsers]
GO
USE [master]
GO
ALTER DATABASE [Whell] SET  READ_WRITE 
GO
