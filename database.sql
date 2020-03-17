USE [master]
GO
/****** Object:  Database [TheIndianMarket]    Script Date: 2020-03-16 10:48:31 PM ******/
CREATE DATABASE [TheIndianMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheIndianMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TheIndianMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TheIndianMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TheIndianMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TheIndianMarket] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheIndianMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheIndianMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheIndianMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheIndianMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheIndianMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheIndianMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheIndianMarket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TheIndianMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheIndianMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheIndianMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheIndianMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheIndianMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheIndianMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheIndianMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheIndianMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheIndianMarket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TheIndianMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheIndianMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheIndianMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheIndianMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheIndianMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheIndianMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheIndianMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheIndianMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TheIndianMarket] SET  MULTI_USER 
GO
ALTER DATABASE [TheIndianMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheIndianMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheIndianMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheIndianMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TheIndianMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TheIndianMarket] SET QUERY_STORE = OFF
GO
USE [TheIndianMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TheIndianMarket]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[PricePerCostUnit] [float] NOT NULL,
	[CostUnit] [varchar](255) NOT NULL,
	[DepartmentName] [varchar](255) NOT NULL,
	[QuantityInStock] [int] NULL,
	[Brand] [varchar](255) NULL,
	[ProductionDate] [varchar](255) NULL,
	[BestBeforeDate] [varchar](255) NULL,
	[PLU] [int] NULL,
	[UPC] [bigint] NULL,
	[Organic] [int] NULL,
	[Cut] [varchar](255) NULL,
	[Animal] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LowStock]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LowStock] AS
SELECT ProductID, ProductName, DepartmentName, QuantityInStock
FROM Products
WHERE QuantityInStock < 7;
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AisleContains]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AisleContains](
	[AisleNumber] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AisleNumber] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aisles]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aisles](
	[AisleNumber] [int] NOT NULL,
	[AisleName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AisleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](255) NULL,
	[CustomerPhone] [varchar](255) NULL,
	[CustomerEmail] [varchar](255) NULL,
	[Password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [varchar](255) NOT NULL,
	[DepartmentName] [varchar](255) NULL,
	[Position] [varchar](255) NULL,
	[sinumber] [bigint] NOT NULL,
	[EmployeeAddress] [varchar](255) NULL,
	[EmployeePhone] [varchar](255) NULL,
	[Wage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProvidedBy]    Script Date: 2020-03-16 10:48:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvidedBy](
	[ProductID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProvidesDelivery]    Script Date: 2020-03-16 10:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvidesDelivery](
	[DeliveryID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 2020-03-16 10:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[TransactionID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[CustomerID] [int] NULL,
	[PurchaseDate] [varchar](255) NULL,
	[Total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceivedFrom]    Script Date: 2020-03-16 10:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivedFrom](
	[ProductID] [int] NOT NULL,
	[DeliveryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[DeliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2020-03-16 10:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[SupplierName] [varchar](255) NOT NULL,
	[SupplierAddress] [varchar](255) NULL,
	[SupplierPhone] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([AdminID], [Name], [Password]) VALUES (1, N'dhara', N'dhara123')
INSERT [dbo].[Admin] ([AdminID], [Name], [Password]) VALUES (2, N'dhara@gmail.com', N'dhara123')
INSERT [dbo].[Admin] ([AdminID], [Name], [Password]) VALUES (3, N'vivekshah@gmail.com', N'vivek')
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 1)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 2)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 3)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 4)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 5)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 6)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 7)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 8)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 9)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 10)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 11)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (1, 12)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 13)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 14)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 15)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 16)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 17)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 18)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 19)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 20)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 21)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 22)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 23)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 24)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 25)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 26)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 27)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 28)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 29)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 30)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 31)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (2, 32)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 100)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 101)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 102)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 103)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 104)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 105)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 106)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 107)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 108)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 109)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 110)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 111)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 112)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 113)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 114)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 115)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 116)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 117)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 118)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 119)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (3, 120)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (4, 150)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (4, 151)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (4, 152)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 200)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 201)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 202)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 203)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 204)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 205)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 206)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (5, 207)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (6, 208)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (6, 209)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (6, 210)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (6, 211)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (6, 212)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 300)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 301)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 302)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 303)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 304)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 305)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 306)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (7, 307)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 400)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 401)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 402)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 403)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 404)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 405)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 406)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 407)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 408)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 409)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 410)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 411)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 412)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 413)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 414)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 415)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 416)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 417)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 418)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 419)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 420)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 421)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 422)
GO
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 423)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 424)
INSERT [dbo].[AisleContains] ([AisleNumber], [ProductID]) VALUES (8, 425)
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (1, N'Fruits')
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (2, N'Vegetables')
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (3, N'Dairy')
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (4, N'Eggs')
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (5, N'Meats')
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (6, N'Seafood')
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (7, N'Baked Goods')
INSERT [dbo].[Aisles] ([AisleNumber], [AisleName]) VALUES (8, N'Pantry Items')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (1, N'Harry Potter', N'000 731 1980', N'theboywholived@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (2, N'Lily Potter', N'000 731 1980', N'lpotter@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (3, N'James Potter', N'000 731 1980', N'jpotter@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (4, N'Hermione Granger', N'555 123 1979', N'hgranger@icloud.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (5, N'Ron Weasley', N'604 301 1979', N'roonilwazlib@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (6, N'Ginny Weasley', N'778 872 1928', N'ginnyw@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (7, N'Fred Weasley', N'604 976 3693', N'fweasley@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (8, N'George Weasley', N'604 976 3693', N'gweasley@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (9, N'Arthur Weasley', N'604 976 3693', N'aweasley@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (10, N'Molly Weasley', N'604 976 3693', N'mweasley@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (11, N'Percy Weasley', N'604 976 3693', N'pweasley@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (12, N'Bill Weasley', N'604 976 3693', N'bweasley@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (13, N'Charlie Weasley', N'604 976 3693', N'cweasley@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (14, N'Lord Voldemort', N'778 192 3928', N'tmriddle@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (15, N'Draco Malfoy', N'908 392 1928', N'mini_mr_malfoy@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (16, N'Lucius Malfoy', N'908 392 1928', N'lmalfoy@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (17, N'Narcissa Malfoy', N'908 392 1928', N'nmalfoy@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (18, N'Neville Longbottom', N'498 192 3091', N'longbottom@live.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (19, N'Dudley Dursley', N'930 409 9380', N'ddursley@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (20, N'Vernon Dursley', N'930 409 9380', N'vdursley@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (21, N'Petunia Dursley', N'930 409 9380', N'pdursley@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (22, N'Severus Snape', N'928 182 0493', N'snivellus@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (23, N'Rubeus Hagrid', N'458 392 1029', N'rhagrid@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (24, N'Minverva McGonagall', N'893 928 0933', N'mmcgonagall@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (25, N'Albus Dumbledore', N'920 849 9145', N'adumbledore@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (26, N'Hedwig', N'839 920 1234', N'im_actually_an_owl@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (27, N'Crookshanks', N'555 983 0298', N'cat@icloud.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (28, N'Sirius Black', N'649 563 4723', N'sblack@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (29, N'Lavender Brown', N'604 983 6941', N'lbrown@hotmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (30, N'Colin Creevey', N'778 961 6435', N'ccreevey@gmail.com', N'abc')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [Password]) VALUES (31, N'Dhara Narola', N'1 234 5678', N'dhara@gmail.com', N'dhara123')
INSERT [dbo].[Departments] ([DepartmentName]) VALUES (N'Baked Goods')
INSERT [dbo].[Departments] ([DepartmentName]) VALUES (N'Eggs and Dairy')
INSERT [dbo].[Departments] ([DepartmentName]) VALUES (N'Meat and Seafood')
INSERT [dbo].[Departments] ([DepartmentName]) VALUES (N'Pantry Items')
INSERT [dbo].[Departments] ([DepartmentName]) VALUES (N'Produce')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (1, N'Ben Ling', N'Eggs and Dairy', N'Stocker', 948398198, N'2366 Main Mall, Vancouver, BC VH3 0A2', N'604 822 3061', 0)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (2, N'Daenerys Targaryen', N'Eggs and Dairy', N'Manager', 7685437775, N'123 House Targaryen, Dragonstone, BC VK8 2H9', N'777 777 7777', 0)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (3, N'Jon Snow', N'Meat and Seafood', N'Manager', 901982091, N'224 Winter Is Coming, North, BC, VA7 4K8', N'783 309 1923', 0)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (4, N'Samwell Tarly', N'Meat and Seafood', N'Stocker', 971361789, N'3366 Main Mall, Vancouver, BC V1M 3A0', N'604 699 6993', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (5, N'Eddard Stark', N'Produce', N'Stocker', 993156678, N'9899 East Mall, Vancouver, BC V0A 9L6', N'778 896 3644', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (6, N'Sansa Stark', N'Pantry Items', N'Manager', 935986412, N'9899 East Mall, Vancouver, BC V0A 9L6', N'778 896 3644', 20)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (7, N'Arya Stark', N'Eggs and Dairy', N'Manager', 964799315, N'9899 East Mall, Vancouver, BC V0A 9L6', N'778 896 3644', 20)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (8, N'Bran Stark', N'Produce', N'Stocker', 911364899, N'9899 East Mall, Vancouver, BC V0A 9L6', N'778 896 3644', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (9, N'Robb Stark', N'Pantry Items', N'Stocker', 944651997, N'9899 East Mall, Vancouver, BC V0A 9L6', N'778 896 3644', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (10, N'Margaery Tyrell', N'Baked Goods', N'Manager', 961694366, N'226 Main Street, Highgarden, BC, V7L 3H7', N'778 962 2264', 20)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (11, N'Khal Drogo', N'Eggs and Dairy', N'Stocker', 943116456, N'6324 West Mall, Vancouver, BC, V7A 5M5', N'604 443 6187', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (12, N'Yuchen Lin', N'Pantry Items', N'Stocker', 986456189, N'999 Brilliant Boy Ave, Vancouver, BC, V8P 9L1', N'976 359 1659', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (13, N'Hannah Lin', N'Produce', N'Manager', 933641391, N'1616 East Mall, Vancouver, BC, V0L 3M1', N'604 919 3136', 25)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (14, N'Jordan De Mello', N'Baked Goods', N'Manager', 976131971, N'2525 West Mall, Vancouver, BC, V0L 3A3', N'778 689 1369', 25)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentName], [Position], [sinumber], [EmployeeAddress], [EmployeePhone], [Wage]) VALUES (15, N'Ed Knorr', N'Produce', N'Stocker', 931236761, N'988 Database Drive, Vancouver, BC, V0L 9A3', N'604 977 2163', 15)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (1, N'All in One', 1.59, N'lb', N'Produce', 256, NULL, N'12-01-2017', N'12-15-2017', 3438, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (2, N'Aloo Bujia', 1.49, N'lb', N'Produce', 31, NULL, N'12-09-2017', N'12-23-2017', 4129, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (3, N'Chakki Atta', 1.19, N'lb', N'Produce', 30, NULL, N'12-07-2017', N'12-21-2017', 4133, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (4, N'Chana Chor', 1.29, N'lb', N'Produce', 5, NULL, N'12-05-2017', N'12-19-2017', 94133, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (5, N'Chilli Powder', 1.39, N'lb', N'Produce', 15, NULL, N'12-05-2017', N'12-19-2017', 4017, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (6, N'Coriander Powder', 0.79, N'lb', N'Produce', 50, NULL, N'12-19-2017', N'12-23-2017', 4011, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (7, N'Garam Masala', 0.99, N'lb', N'Produce', 50, NULL, N'12-19-2017', N'12-23-2017', 94011, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (8, N'Masala Kaju', 1.19, N'lb', N'Produce', 3, NULL, N'12-10-2017', N'12-24-2017', 4012, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (9, N'Parle G', 1.29, N'lb', N'Produce', 21, NULL, N'12-06-2017', N'12-25-2017', 4013, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (10, N'Plain Paratha', 4.99, N'lb', N'Produce', 20, NULL, N'12-10-2017', N'12-13-2017', 3355, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (11, N'TurmericPowder', 3.99, N'lb', N'Produce', 60, NULL, N'12-10-2017', N'12-13-2017', 4240, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (12, N'Mint', 3.49, N'lb', N'Produce', 2, NULL, N'12-10-2017', N'12-13-2017', 4244, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (13, N'Cauli Flower', 0.99, N'ct', N'Produce', 20, NULL, N'12-01-2017', N'12-08-2017', 4061, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (14, N'Tomato', 1.29, N'ct', N'Produce', 23, NULL, N'12-02-2017', N'12-09-2017', 3097, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (15, N'Spinach', 1.59, N'bunch', N'Produce', 21, NULL, N'12-10-2017', N'12-13-2017', 4090, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (16, N'Watercress', 1.99, N'bunch', N'Produce', 2, NULL, N'12-10-2017', N'12-13-2017', 4815, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (17, N'Bok Choy (Baby)', 1.29, N'bunch', N'Produce', 14, NULL, N'12-10-2017', N'12-13-2017', 4545, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (18, N'Bok Choy (Shanghai)', 0.99, N'bunch', N'Produce', 15, NULL, N'12-10-2017', N'12-13-2017', 3163, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (19, N'Potatoes (Russet)', 0.99, N'lb', N'Produce', 2, NULL, N'12-01-2017', N'12-30-2017', 4072, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (20, N'Potatoes (Red)', 1.29, N'lb', N'Produce', 22, NULL, N'12-02-2017', N'12-31-2017', 4073, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (21, N'Potatoes (Sweet)', 1.49, N'lb', N'Produce', 10, NULL, N'12-01-2017', N'12-30-2017', 4726, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (22, N'Squash (Acorn)', 0.99, N'lb', N'Produce', 14, NULL, N'11-01-2017', N'12-31-2017', 3143, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (23, N'Squash (Kabocha)', 0.99, N'lb', N'Produce', 10, NULL, N'11-01-2017', N'12-31-2017', 4769, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (24, N'Squash (Butternut)', 0.99, N'lb', N'Produce', 4, NULL, N'11-01-2017', N'12-31-2017', 4759, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (25, N'Carrots (Loose)', 1.29, N'lb', N'Produce', 20, NULL, N'12-01-2017', N'12-30-2017', 4562, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (26, N'Carrots (Loose)', 1.49, N'lb', N'Produce', 34, NULL, N'12-01-2017', N'12-30-2017', 94562, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (27, N'Onions (Red)', 1.29, N'lb', N'Produce', 20, NULL, N'11-01-2017', N'12-31-2017', 4082, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (28, N'Onions (Yellow)', 1.29, N'lb', N'Produce', 5, NULL, N'11-01-2017', N'12-31-2017', 4093, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (29, N'Onions (White)', 1.19, N'lb', N'Produce', 4, NULL, N'11-01-2017', N'12-31-2017', 4663, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (30, N'Onions (Pearl)', 2.49, N'lb', N'Produce', 27, NULL, N'11-01-2017', N'12-31-2017', 4660, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (31, N'Garlic', 3.99, N'lb', N'Produce', 20, NULL, N'11-01-2017', N'12-31-2017', 3399, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (32, N'Ginger', 2.49, N'lb', N'Produce', 12, NULL, N'11-01-2017', N'12-31-2017', 4612, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (100, N'Milk (Skim)', 2.29, N'L', N'Eggs and Dairy', 7, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125003, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (101, N'Milk (1%)', 2.29, N'L', N'Eggs and Dairy', 8, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125004, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (102, N'Milk (2%)', 2.29, N'L', N'Eggs and Dairy', 3, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125005, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (103, N'Milk (Whole)', 2.29, N'L', N'Eggs and Dairy', 4, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125006, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (104, N'Half and Half (10%)', 2.99, N'L', N'Eggs and Dairy', 10, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125007, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (105, N'Milk (Skim)', 2.29, N'L', N'Eggs and Dairy', 10, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125008, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (106, N'Milk (1%)', 2.29, N'L', N'Eggs and Dairy', 1, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125009, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (107, N'Milk (2%)', 2.29, N'L', N'Eggs and Dairy', 11, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125010, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (108, N'Milk (Whole)', 2.29, N'L', N'Eggs and Dairy', 12, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125011, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (109, N'Milk (2% Chocolate)', 2.99, N'L', N'Eggs and Dairy', 100, N'Dairyland', N'12-01-2017', N'12-14-2017', NULL, 68700125011, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (110, N'Milk (Soy)', 2.29, N'L', N'Eggs and Dairy', 5, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125012, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (111, N'Milk (Unsweetened Soy)', 2.29, N'L', N'Eggs and Dairy', 4, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125013, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (112, N'Yogurt (Vanilla, 6-pack)', 3.97, N'ct', N'Eggs and Dairy', 1, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125012, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (113, N'Yogurt (Vanilla, 6-pack)', 4.97, N'ct', N'Eggs and Dairy', 3, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125012, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (114, N'Yogurt (Strawberry, 6-pack)', 3.97, N'ct', N'Eggs and Dairy', 10, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125013, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (115, N'Yogurt (Fat-free, 6-pack)', 3.97, N'ct', N'Eggs and Dairy', 10, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125012, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (116, N'Butter (Salted)', 3.29, N'L', N'Eggs and Dairy', 10, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125013, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (117, N'Butter (Unsalted)', 3.29, N'L', N'Eggs and Dairy', 16, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125012, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (118, N'Cheese (Mozzarella)', 2.29, N'L', N'Eggs and Dairy', 17, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125013, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (119, N'Cheese (Cheddar)', 2.29, N'L', N'Eggs and Dairy', 12, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125013, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (120, N'Cheese (Parmesan)', 2.29, N'L', N'Eggs and Dairy', 10, N'Silk', N'12-01-2017', N'12-20-2017', NULL, 68700125013, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (150, N'Eggs (12 count)', 3.99, N'pack', N'Eggs and Dairy', 11, N'Kirkland Signature', N'12-01-2017', N'12-20-2017', NULL, 62639410124, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (151, N'Eggs (Brown, 12 count)', 4.99, N'pack', N'Eggs and Dairy', 10, N'Golden Valley', N'12-01-2017', N'12-20-2017', NULL, 62639410125, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (152, N'Eggs (Omega-3, 12 count)', 5.99, N'pack', N'Eggs and Dairy', 32, N'Born 3 Omega-3', N'12-01-2017', N'12-20-2017', NULL, 666933900420, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (200, N'Chicken Breast', 5.99, N'lb', N'Meat and Seafood', 11, N'Kirkland Signature', N'12-01-2017', N'12-03-2017', NULL, 233841823921, 0, NULL, N'Chicken')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (201, N'Chicken Breast', 6.99, N'lb', N'Meat and Seafood', 2, N'Green Way', N'12-05-2017', N'12-07-2017', NULL, 233841823920, 1, NULL, N'Chicken')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (202, N'Chicken Thighs', 4.99, N'lb', N'Meat and Seafood', 13, N'Kirkland Signature', N'12-01-2017', N'12-03-2017', NULL, 233841823919, 0, NULL, N'Chicken')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (203, N'Stew Meat', 7.99, N'lb', N'Meat and Seafood', 15, N'Kirkland Signature', N'12-05-2017', N'12-08-2017', NULL, 233841823910, 0, N'Chuck', N'Beef')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (204, N'Ground Beef', 4.99, N'lb', N'Meat and Seafood', 16, N'Kirkland Signature', N'12-01-2017', N'12-03-2017', NULL, 233841823821, 0, NULL, N'Beef')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (205, N'Steak', 6.99, N'lb', N'Meat and Seafood', 10, N'Western Canadian', N'12-05-2017', N'12-07-2017', NULL, 233841823822, 0, N'Sirloin', N'Beef')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (206, N'Steak', 7.99, N'lb', N'Meat and Seafood', 17, N'Western Canadian', N'12-01-2017', N'12-03-2017', NULL, 233841823823, 0, N'Flank', N'Beef')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (207, N'Steak', 7.99, N'lb', N'Meat and Seafood', 10, N'Western Canadian', N'12-05-2017', N'12-08-2017', NULL, 233841823824, 0, N'Tenderloin', N'Beef')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (208, N'Cod Fillets', 6.99, N'lb', N'Meat and Seafood', 30, NULL, N'12-05-2017', N'12-08-2017', NULL, 233841823825, 0, N'Fillet', N'Cod')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (209, N'Sole Fillets', 6.99, N'lb', N'Meat and Seafood', 12, NULL, N'12-05-2017', N'12-08-2017', NULL, 233841823826, 0, N'Fillet', N'Sole')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (210, N'Tilapia (Fresh)', 6.99, N'lb', N'Meat and Seafood', 4, NULL, N'12-05-2017', N'12-08-2017', NULL, 233841823827, 0, NULL, N'Tilapia')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (211, N'Salmon (Fresh)', 7.99, N'lb', N'Meat and Seafood', 10, NULL, N'12-05-2017', N'12-08-2017', NULL, 233841823828, 0, N'Fillet', N'Salmon')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (212, N'Salmon (Fresh)', 8.99, N'lb', N'Meat and Seafood', 10, NULL, N'12-05-2017', N'12-08-2017', NULL, 233841823829, 1, N'Fillet', N'Salmon')
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (300, N'Bread (White)', 2.99, N'ct', N'Baked Goods', 4, N'Villagio', N'12-01-2017', N'12-06-2017', NULL, 6872100350, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (301, N'Bread (Whole Wheat)', 3.99, N'ct', N'Baked Goods', 7, N'Pepperidge Farms', N'12-01-2017', N'12-06-2017', NULL, 14100071013, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (302, N'Everything Bagel (6 count)', 4.99, N'pack', N'Baked Goods', 15, N'Sara Lee', N'12-01-2017', N'12-06-2017', NULL, 72945610033, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (303, N'Mini Cinnamon Raisin Bagel (6 count)', 4.99, N'pack', N'Baked Goods', 25, N'Pepperidge Farms', N'12-01-2017', N'12-06-2017', NULL, 14100092599, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (304, N'Bread (Rye)', 3.99, N'ct', N'Baked Goods', 9, N'Silver Hills Bakery', N'12-01-2017', N'12-06-2017', NULL, 14100071013, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (305, N'Bread (Spelt)', 4.99, N'ct', N'Baked Goods', 20, N'Silver Hills Bakery', N'12-01-2017', N'12-06-2017', NULL, 72945610033, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (306, N'Sprouted Bagel (6 count)', 4.99, N'pack', N'Baked Goods', 22, N'Silver Hills Bakery', N'12-01-2017', N'12-06-2017', NULL, 14100092599, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (307, N'Doughnut', 0.99, N'ct', N'Baked Goods', 3, N'Bake Shop', N'12-01-2017', N'12-03-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (400, N'All-Purpose Flour (Original)', 1.19, N'lb', N'Pantry Items', 32, N'Robin Hood', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (401, N'All-Purpose Flour (Whole Wheat)', 1.29, N'lb', N'Pantry Items', 30, N'Robin Hood', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (402, N'White Sugar', 0.89, N'lb', N'Pantry Items', 3, N'Rogers', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (403, N'Brown Sugar', 0.99, N'lb', N'Pantry Items', 20, N'Rogers', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (404, N'Iodized Table Salt', 0.49, N'lb', N'Pantry Items', 34, N'Windsor', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (405, N'Black Pepper', 0.59, N'lb', N'Pantry Items', 31, N'Windsor', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (406, N'Ground Cinnamon', 3.99, N'lb', N'Pantry Items', 10, N'Club House', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (407, N'Chili Flakes', 4.59, N'lb', N'Pantry Items', 20, N'Club House', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (408, N'White Rice', 1.59, N'lb', N'Pantry Items', 12, N'Rooster', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (409, N'Scoobi Do Pasta', 0.69, N'lb', N'Pantry Items', 20, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (410, N'Fusili', 0.69, N'lb', N'Pantry Items', 21, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (411, N'Penne Rigate', 0.69, N'lb', N'Pantry Items', 31, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (412, N'Elbow Pasta', 0.69, N'lb', N'Pantry Items', 4, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (413, N'Spaghetti', 0.69, N'lb', N'Pantry Items', 5, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (414, N'Linguini', 0.69, N'lb', N'Pantry Items', 6, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (415, N'Spaghettini', 0.69, N'lb', N'Pantry Items', 10, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (416, N'Farfalle', 0.69, N'lb', N'Pantry Items', 20, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (417, N'Ditali', 0.69, N'lb', N'Pantry Items', 33, N'Italpasta', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (418, N'Fusili', 0.69, N'lb', N'Pantry Items', 26, N'Barilla', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (419, N'Penne Rigate', 0.69, N'lb', N'Pantry Items', 20, N'Barilla', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (420, N'Elbow Pasta', 0.69, N'lb', N'Pantry Items', 40, N'Barilla', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (421, N'Spaghetti', 0.69, N'lb', N'Pantry Items', 10, N'Barilla', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (422, N'Linguini', 0.69, N'lb', N'Pantry Items', 32, N'Barilla', N'10-01-2017', N'12-31-2017', NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (423, N'Sriracha Chili Sauce', 2.99, N'ct', N'Pantry Items', 300, N'Huy Fong', N'11-01-2017', N'12-31-2017', NULL, 24463061095, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (424, N'Tomato Ketchup', 3.99, N'ct', N'Pantry Items', 100, N'Heinz', N'11-01-2017', N'12-31-2017', NULL, 13000001243, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [PricePerCostUnit], [CostUnit], [DepartmentName], [QuantityInStock], [Brand], [ProductionDate], [BestBeforeDate], [PLU], [UPC], [Organic], [Cut], [Animal]) VALUES (425, N'Soy Sauce', 3.99, N'ct', N'Pantry Items', 4, N'Kikkoman', N'11-01-2017', N'12-31-2017', NULL, 41390000829, 0, NULL, NULL)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (100, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (103, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (105, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (106, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (109, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (111, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (113, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (116, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (118, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (119, 1)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (4, 2)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (6, 2)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (8, 3)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (13, 3)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (20, 3)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (200, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (202, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (203, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (205, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (206, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (302, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (303, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (306, 4)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (400, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (403, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (406, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (407, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (410, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (412, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (417, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (419, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (421, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (423, 5)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (424, 6)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (425, 6)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (305, 7)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (401, 7)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (405, 7)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (408, 7)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (411, 7)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (415, 7)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (420, 7)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (300, 8)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (301, 8)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (1, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (7, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (11, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (14, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (16, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (18, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (19, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (24, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (25, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (28, 9)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (402, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (404, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (409, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (413, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (414, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (416, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (418, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (422, 10)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (3, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (12, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (17, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (21, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (22, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (23, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (26, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (27, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (29, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (30, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (31, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (32, 11)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (9, 12)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (10, 12)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (2, 13)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (5, 13)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (15, 13)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (304, 13)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (201, 14)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (204, 14)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (207, 14)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (307, 14)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (101, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (102, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (104, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (107, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (108, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (110, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (112, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (114, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (115, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (117, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (120, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (150, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (151, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (152, 15)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (208, 16)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (209, 17)
GO
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (210, 18)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (211, 19)
INSERT [dbo].[ProvidedBy] ([ProductID], [SupplierID]) VALUES (212, 20)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (1, 1)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (2, 1)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (3, 1)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (4, 2)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (5, 2)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (6, 2)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (7, 3)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (8, 3)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (9, 3)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (10, 4)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (11, 4)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (12, 4)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (13, 5)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (14, 5)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (15, 5)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (16, 6)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (17, 6)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (18, 6)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (19, 7)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (20, 7)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (21, 7)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (22, 8)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (23, 8)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (24, 8)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (25, 9)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (26, 9)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (27, 9)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (28, 10)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (29, 10)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (30, 10)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (31, 11)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (32, 11)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (33, 11)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (34, 12)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (35, 12)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (36, 12)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (37, 13)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (38, 13)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (39, 13)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (40, 14)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (41, 14)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (42, 14)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (43, 15)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (44, 15)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (45, 15)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (46, 16)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (47, 16)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (48, 16)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (49, 17)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (50, 17)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (51, 17)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (52, 18)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (53, 18)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (54, 18)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (55, 19)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (56, 19)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (57, 19)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (58, 20)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (59, 20)
INSERT [dbo].[ProvidesDelivery] ([DeliveryID], [SupplierID]) VALUES (60, 20)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (1, 1, 1, 1, N'11-01-2017', 1.59)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (1, 17, 8, 1, N'11-01-2017', 10.32)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (1, 101, 3, 1, N'11-01-2017', 6.87)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (1, 113, 4, 1, N'11-01-2017', 19.88)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (1, 119, 9, 1, N'11-01-2017', 20.61)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (1, 201, 1, 1, N'11-01-2017', 6.99)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (1, 211, 2, 1, N'11-01-2017', 15.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (2, 3, 3, 1, N'11-07-2017', 3.57)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (2, 301, 6, 1, N'11-07-2017', 23.94)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (2, 307, 8, 1, N'11-07-2017', 7.92)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (2, 421, 7, 1, N'11-07-2017', 4.83)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (2, 425, 4, 1, N'11-07-2017', 15.96)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (3, 5, 2, 2, N'12-01-2017', 2.78)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (3, 7, 9, 2, N'12-01-2017', 8.91)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (3, 13, 2, 2, N'12-01-2017', 1.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (3, 17, 8, 2, N'12-01-2017', 10.32)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (3, 103, 5, 2, N'12-01-2017', 11.45)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (3, 115, 2, 2, N'12-01-2017', 7.94)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (3, 117, 3, 2, N'12-01-2017', 9.87)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (4, 7, 9, 2, N'11-03-2017', 8.91)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (4, 203, 3, 2, N'11-03-2017', 23.97)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (4, 211, 2, 2, N'11-03-2017', 15.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (4, 303, 4, 2, N'11-03-2017', 19.96)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (4, 305, 2, 2, N'11-03-2017', 9.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (4, 410, 12, 2, N'11-03-2017', 8.28)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (4, 414, 14, 2, N'11-03-2017', 9.66)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (5, 9, 6, 3, N'12-17-2017', 7.74)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (5, 21, 3, 3, N'12-17-2017', 4.47)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (5, 203, 3, 3, N'12-17-2017', 23.97)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (6, 7, 9, 3, N'12-21-2017', 8.91)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (6, 11, 4, 3, N'12-21-2017', 15.96)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (6, 301, 6, 3, N'12-21-2017', 23.94)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (6, 303, 4, 3, N'12-21-2017', 19.96)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (6, 402, 6, 3, N'12-21-2017', 5.34)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (6, 416, 5, 3, N'12-21-2017', 3.45)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (7, 13, 2, 4, N'11-19-2017', 1.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (8, 15, 1, 4, N'11-11-2017', 1.59)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (9, 17, 8, 5, N'11-21-2017', 10.32)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (10, 19, 6, 5, N'12-25-2017', 5.94)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (11, 21, 3, 6, N'11-02-2017', 4.47)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (12, 23, 10, 6, N'12-07-2017', 9.9)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (13, 25, 1, 7, N'12-15-2017', 1.29)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (14, 27, 7, 7, N'11-09-2017', 9.03)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (15, 29, 6, 8, N'11-10-2017', 7.14)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (16, 31, 2, 8, N'12-11-2017', 7.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (17, 101, 3, 9, N'12-14-2017', 6.87)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (18, 103, 5, 9, N'11-16-2017', 11.45)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (19, 105, 6, 10, N'12-16-2017', 13.74)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (20, 107, 3, 10, N'11-08-2017', 6.87)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (21, 109, 1, 11, N'12-04-2017', 2.99)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (22, 111, 8, 11, N'11-03-2017', 18.32)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (23, 113, 4, 12, N'12-19-2017', 19.88)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (24, 115, 2, 12, N'12-18-2017', 7.94)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (25, 117, 3, 13, N'11-18-2017', 9.87)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (26, 119, 9, 13, N'12-16-2017', 20.61)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (27, 150, 1, 14, N'11-30-2017', 3.99)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (28, 152, 7, 14, N'12-31-2017', 41.93)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (29, 201, 1, 15, N'11-30-2017', 6.99)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (30, 203, 3, 15, N'12-01-2017', 23.97)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (31, 205, 13, 16, N'11-12-2017', 90.87)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (32, 207, 7, 16, N'12-15-2017', 55.93)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (33, 209, 1, 17, N'12-03-2017', 6.99)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (34, 211, 2, 17, N'11-17-2017', 15.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (35, 301, 6, 18, N'12-13-2017', 23.94)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (36, 303, 4, 18, N'12-22-2017', 19.96)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (37, 305, 2, 19, N'11-22-2017', 9.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (38, 307, 8, 19, N'11-29-2017', 7.92)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (39, 401, 4, 20, N'11-01-2017', 5.16)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (40, 403, 6, 20, N'12-27-2017', 5.94)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (41, 405, 9, 21, N'12-18-2017', 5.31)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (42, 407, 2, 21, N'11-16-2017', 9.18)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (43, 409, 1, 22, N'11-13-2017', 0.69)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (44, 411, 10, 22, N'12-02-2017', 6.9)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (45, 413, 7, 23, N'11-03-2017', 4.83)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (46, 415, 6, 23, N'12-07-2017', 4.14)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (47, 417, 1, 24, N'11-11-2017', 0.69)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (48, 419, 2, 24, N'12-16-2017', 1.38)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (49, 421, 7, 25, N'12-22-2017', 4.83)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (50, 423, 3, 25, N'12-21-2017', 8.97)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (51, 425, 4, 26, N'11-26-2017', 15.96)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (52, 400, 1, 26, N'12-18-2017', 1.19)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (53, 402, 6, 27, N'11-16-2017', 5.34)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (54, 404, 13, 27, N'12-13-2017', 6.37)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (55, 406, 2, 28, N'11-17-2017', 7.98)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (56, 408, 9, 28, N'12-01-2017', 14.31)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (57, 410, 12, 29, N'12-04-2017', 8.28)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (58, 412, 1, 29, N'11-14-2017', 0.69)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (59, 414, 14, 30, N'12-24-2017', 9.66)
INSERT [dbo].[Purchases] ([TransactionID], [ProductID], [Quantity], [CustomerID], [PurchaseDate], [Total]) VALUES (60, 416, 5, 30, N'11-24-2017', 3.45)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (1, 25)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (2, 26)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (3, 31)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (4, 34)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (5, 35)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (6, 36)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (7, 27)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (8, 32)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (9, 34)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (10, 35)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (11, 25)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (12, 33)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (13, 31)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (14, 26)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (15, 32)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (16, 27)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (17, 33)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (18, 25)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (19, 26)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (20, 31)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (21, 32)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (22, 33)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (23, 31)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (24, 27)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (25, 25)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (26, 32)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (27, 33)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (28, 26)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (29, 31)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (30, 32)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (31, 33)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (32, 31)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (100, 1)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (101, 43)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (102, 44)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (103, 2)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (104, 45)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (105, 3)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (106, 1)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (107, 43)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (108, 44)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (109, 2)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (110, 45)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (111, 3)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (112, 43)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (113, 1)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (114, 44)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (115, 45)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (116, 2)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (117, 43)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (118, 3)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (119, 1)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (120, 44)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (150, 45)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (151, 43)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (152, 44)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (200, 10)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (201, 40)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (202, 11)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (203, 12)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (204, 41)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (205, 10)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (206, 11)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (207, 42)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (208, 46)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (209, 50)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (210, 53)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (211, 56)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (212, 59)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (400, 13)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (401, 19)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (402, 28)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (403, 14)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (404, 29)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (405, 20)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (406, 15)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (407, 13)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (408, 21)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (409, 30)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (410, 14)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (411, 19)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (412, 15)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (413, 28)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (414, 29)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (415, 20)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (416, 30)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (417, 13)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (418, 28)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (419, 14)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (420, 21)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (421, 15)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (422, 29)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (423, 13)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (424, 30)
INSERT [dbo].[ReceivedFrom] ([ProductID], [DeliveryID]) VALUES (425, 19)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (1, N'Saputo Dairy Products Canada', N'6800 Lougheed Highway, Burnaby, BC V5A 1W2', N'1 800 672 8866')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (2, N'Gordon Food Services', N'1700 Cliveden Avenue, Delta, BC V3M 6T2', N'800 663 1695')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (3, N'Yen Bros. Food Service', N'1988 Vernon Drive, Vancouver, BC V6A 3Y6', N'604 255 6522')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (4, N'Arctic Meat & Sausage', N'1606 Kebet Way, Port Coquitlam, BC V3C 5W9', N'604 472 9995')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (5, N'Lekker Food Distribution Ltd.', N'2670 Wilfert Road, Victoria, BC V9B 5Z3', N'877 788 0377')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (6, N'Get Sauced & Spiced Inc.', N'58 Avenue, Surrey, BC V8H 4S9', N'780 462 2418')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (7, N'Orkin Canada', N'123 Missisauga Street, Vancouver, BC V7A 0E3', N'800 800 6754')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (8, N'Grainworks Inc.', N'921 Vulcan Avenue, Richmond, BC V8A 3H1', N'800 563 3756')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (9, N'Harvest Corporation', N'249 Missisauga Street, Vancouver, BC V9U 1H3', N'888 925 6644')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (10, N'The Leaky Cauldron', N'938 Diagon Alley, London, UK, EC', N'800 172 4532')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (11, N'Bondi Produce', N'188 New Toronto St, Etobicoke, ON M8V 2E8', N'416 252-7799')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (12, N'Augusta Fruit Market Ltd', N'65 Nassau St, Toronto, ON M5T 1M3', N'416 593-9754')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (13, N'Castle Fruit Retail & Wholesale Produce', N'80 Kensington Ave, Toronto, ON M5T 2K1', N'416 593-9262')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (14, N'Venerica Meat', N'3348 Dundas St W, Toronto, ON M6P 2A4', N'416 623-7878')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (15, N'Avalon Dairy', N'7985 N Fraser Way, Burnaby, BC V5J 4Z5', N'604 456-0550')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (16, N'Smokey Bay Seafood Company Ltd', N'896 Cambie St, Vancouver, BC V6B 2P4', N'604 568-4310')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (17, N'Oceanfood Sales', N'1909 E Hastings St, Vancouver, BC V5L 1T5', N'604 255-1414')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (18, N'Deluxe Seafood Vancouver Ltd', N'#106-366 East Kent Ave, South Vancouver, BC V5X 4N6', N'604 662-7999')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (19, N'Winning Seafood Co', N'1568 Venables St, Vancouver, BC V5L 2G9', N'604 251-3121')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone]) VALUES (20, N'Blundell Seafoods Ltd', N'11351 River Rd, Richmond, BC V6X 1Z6', N'604 270-3300')
ALTER TABLE [dbo].[AisleContains]  WITH CHECK ADD FOREIGN KEY([AisleNumber])
REFERENCES [dbo].[Aisles] ([AisleNumber])
GO
ALTER TABLE [dbo].[AisleContains]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([DepartmentName])
REFERENCES [dbo].[Departments] ([DepartmentName])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([DepartmentName])
REFERENCES [dbo].[Departments] ([DepartmentName])
GO
ALTER TABLE [dbo].[ProvidedBy]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProvidedBy]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[ProvidesDelivery]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ReceivedFrom]  WITH CHECK ADD FOREIGN KEY([DeliveryID])
REFERENCES [dbo].[ProvidesDelivery] ([DeliveryID])
GO
ALTER TABLE [dbo].[ReceivedFrom]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
USE [master]
GO
ALTER DATABASE [TheIndianMarket] SET  READ_WRITE 
GO
