USE [master]
GO
/****** Object:  Database [Online_Market]    Script Date: 12/15/2022 12:24:46 AM ******/
CREATE DATABASE [Online_Market]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_Market', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_Market.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_Market_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_Market_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Online_Market] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_Market].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_Market] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_Market] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_Market] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_Market] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_Market] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_Market] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online_Market] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_Market] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_Market] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_Market] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_Market] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_Market] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_Market] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_Market] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_Market] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Online_Market] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_Market] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_Market] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_Market] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_Market] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_Market] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_Market] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_Market] SET RECOVERY FULL 
GO
ALTER DATABASE [Online_Market] SET  MULTI_USER 
GO
ALTER DATABASE [Online_Market] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_Market] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_Market] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_Market] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_Market] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_Market] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Online_Market', N'ON'
GO
ALTER DATABASE [Online_Market] SET QUERY_STORE = OFF
GO
USE [Online_Market]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/15/2022 12:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 12/15/2022 12:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [varchar](25) NOT NULL,
	[l_name] [varchar](25) NOT NULL,
	[phone] [varchar](25) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 12/15/2022 12:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_id] [int] NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[product_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12/15/2022 12:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[customer_id] [int] NULL,
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NULL,
	[delivery_address] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 12/15/2022 12:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[sub_category_id] [int] NOT NULL,
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_categories]    Script Date: 12/15/2022 12:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_categories](
	[category_id] [int] NOT NULL,
	[sub_category_id] [int] IDENTITY(1,1) NOT NULL,
	[sub_category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (1, N'FOOD CUPBOARD')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (2, N'BEVERAGES')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (3, N'LAUNDRY')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (4, N'HOUSEHOLD CLEANING')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (1, N'aaseema', N'Hashci', N'230063', N'3rd Industrial Zone, Unit 3C', N'Hashmi@gmaicl.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (2, N'Suhail', N'Mahfouz', N'27608667', N'10 El-Genena St, Sour El-Azbakeya Ataba', N'Mahfouz@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (3, N'Antonio', N'Rahim', N'25693341', N'Evergreen Tower 10 Talaat Harb St, 1st Floor', N'Rahim@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (4, N'Thomas', N'Youssef', N'28640030', N'El-Abour Bldgs 35 Salah Salem Rd, Flat 8', N'Youssef@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (5, N'Anwar', N'Shaban', N'22562558', N'10 Tantawy Gohary St, Sayda Zeinab', N'Shaban@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (6, N'Hanna', N'Abdelnour', N'27497012', N'Khalil Ibrahim St, KEBAA CITY', N'Abdelnour@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (7, N'Shaban', N'Mohammadi', N'25850358', N'El-Ghoury and Kisra St, PORT SAID', N'Mohammadi@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (8, N'Munir', N'Kareem', N'23912042', N'682 El-Horreya Rd, Loran', N'Kareem@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (9, N'Khuld', N'Ansari', N'26172554', N'32 Ahmed Hamdy St, Madkour', N'Ansari@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (10, N'Raja', N'Sayed', N'23927769', N'Obour Bldgs 17A Salah Salem, NASR CITY', N'Sayed@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (11, N'Mouhamed', N'Ahmed', N'28593694', N'32 Abdel Khalek Tharwat St', N'hamada@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (12, N'Farouk', N'Maher', N'28493560', N'Orman Tower 48 Giza St., GIZA', N'gglol@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (13, N'Adham', N'zenhom', N'29837562', N'63 street 15 maadi,cairo', N'yoloeqeqeq@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (14, N'Hamada', N'Mustafa', N'25647380', N'119 Misr Helwan Agricultural', N'hamada123@gmail.com')
INSERT [dbo].[customers] ([customer_id], [f_name], [l_name], [phone], [address], [email]) VALUES (15, N'Eslam', N'Mohab', N'29376584', N'185 El Sherouk City ', N'hhhh135@gmail.com')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (1, 1, 2, CAST(25.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (1, 5, 5, CAST(5.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (2, 5, 1, CAST(15.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (2, 10, 3, CAST(20.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (2, 3, 10, CAST(25.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (3, 2, 4, CAST(80.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (4, 7, 7, CAST(70.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (5, 8, 2, CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (6, 2, 3, CAST(80.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (7, 10, 8, CAST(20.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (8, 6, 9, CAST(35.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (9, 9, 6, CAST(22.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (10, 4, 5, CAST(150.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (11, 11, 1, CAST(45.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (12, 12, 4, CAST(69.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (13, 7, 3, CAST(70.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (14, 14, 4, CAST(200.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (15, 14, 3, CAST(200.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (16, 13, 6, CAST(66.00 AS Decimal(10, 2)), CAST(33.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (17, 15, 5, CAST(90.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (18, 13, 8, CAST(66.00 AS Decimal(10, 2)), CAST(33.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (19, 5, 3, CAST(15.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (20, 9, 9, CAST(22.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (21, 14, 1, CAST(200.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (22, 10, 4, CAST(20.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (23, 10, 1, CAST(300.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (24, 10, 4, CAST(70.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (24, 10, 8, CAST(64.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity], [product_price], [discount]) VALUES (25, 10, 1, CAST(50.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (5, 1, CAST(N'2021-11-01' AS Date), CAST(N'2021-11-03' AS Date), N'3rd Industrial Zone 10 of ramadan')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (2, 2, CAST(N'2021-11-04' AS Date), CAST(N'2021-11-09' AS Date), N'10 El-Genena St El-Ataba')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (2, 3, CAST(N'2021-11-05' AS Date), CAST(N'2021-11-10' AS Date), N'10 El-Genena St El-Ataba')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (3, 4, CAST(N'2021-11-06' AS Date), CAST(N'2021-11-11' AS Date), N'10th Talaat Harb St')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (5, 5, CAST(N'2021-11-08' AS Date), CAST(N'2021-11-13' AS Date), N'Ismaileya Sq Heliopolis')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (6, 6, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-15' AS Date), N'10 Tantawy Gohary St Sayda Zeinab')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (6, 7, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-15' AS Date), N'10 Tantawy Gohary St Sayda Zeinab')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (6, 8, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-15' AS Date), N'10 Tantawy Gohary St Sayda Zeinab')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (8, 9, CAST(N'2021-11-13' AS Date), CAST(N'2021-11-23' AS Date), N'Industrial Zone, Damietta')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (8, 10, CAST(N'2021-11-13' AS Date), CAST(N'2021-11-16' AS Date), N'682 El-Horreya Rd, alexandria')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (9, 11, CAST(N'2021-11-15' AS Date), CAST(N'2021-11-20' AS Date), N'32 Ahmed Hamdy St, Madkour')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (10, 12, CAST(N'2021-11-18' AS Date), CAST(N'2021-11-21' AS Date), N'Obour bulidings 17A Salah Salem')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (10, 13, CAST(N'2021-11-19' AS Date), CAST(N'2021-11-22' AS Date), N'Obour bulidings 17A Salah Salem')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (11, 14, CAST(N'2021-11-20' AS Date), CAST(N'2021-11-25' AS Date), N'9 El-Tayaran St., Nasr City')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (13, 15, CAST(N'2021-11-21' AS Date), CAST(N'2021-11-26' AS Date), N'63 street 15 maadi,cairo')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (13, 16, CAST(N'2021-11-21' AS Date), CAST(N'2021-11-26' AS Date), N'63 street 15 maadi,cairo')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (13, 17, CAST(N'2021-11-21' AS Date), CAST(N'2021-11-26' AS Date), N'63 street 15 maadi,cairo')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (13, 18, CAST(N'2021-11-21' AS Date), CAST(N'2021-11-26' AS Date), N'63 street 15 maadi,cairo')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (13, 19, CAST(N'2021-11-21' AS Date), CAST(N'2021-11-26' AS Date), N'63 street 15 maadi,cairo')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (14, 20, CAST(N'2021-11-23' AS Date), CAST(N'2021-11-28' AS Date), N'119 Misr Helwan ,42 maadi')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (14, 21, CAST(N'2021-11-23' AS Date), CAST(N'2021-11-28' AS Date), N'78 Arimed Forces Bldgs Sidi Bishr')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (14, 22, CAST(N'2021-11-23' AS Date), CAST(N'2021-11-28' AS Date), N'78 Arimed Forces BldgsSidi Bishr')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (15, 23, CAST(N'2021-11-25' AS Date), CAST(N'2021-11-30' AS Date), N'185 El Sherouk City NASR CITY')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (15, 24, CAST(N'2021-11-27' AS Date), CAST(N'2021-11-30' AS Date), N'185 El Sherouk City NASR CITY')
INSERT [dbo].[orders] ([customer_id], [order_id], [order_date], [delivery_date], [delivery_address]) VALUES (15, 25, CAST(N'2021-11-27' AS Date), CAST(N'2021-11-30' AS Date), N'185 El Sherouk City NASR CITY')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (1, 1, N'Abu Auf Flax Seeds - 450Gm', CAST(26.90 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (1, 2, N'Aldoha Oriental Rice – 540gm', CAST(37.25 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (1, 3, N'Zamzam White Beans - 500 gm', CAST(23.95 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (2, 4, N'Gawaher Big Rings Pasta - 350g', CAST(4.90 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (2, 5, N'El Maleka Penne Pasta - 400g', CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (2, 6, N'Italiano Spaghetti Pasta - 400g', CAST(11.80 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (3, 7, N'AL Asil Corn Oil - 750 Ml', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (3, 8, N'Crystal Corn Oil - 0.75 Liter', CAST(52.90 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (3, 9, N'Haloub Al Missalia Pure Ghee - 800g', CAST(151.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (4, 10, N'Al Tawoos Natural Vinegar - 900 Ml', CAST(9.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (4, 11, N'Rehana Natural Vinegar - 1 Liter', CAST(7.95 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (4, 12, N'Ahla Seha Apple Natural Vinegar - 270Ml', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (5, 13, N'Mero Box Of 250 Sachet Ketchup - 7 Gm', CAST(65.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (5, 14, N'Mero Ketchup Premium - 340 Gm + Mayonnaise Premium 320ml', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (5, 15, N'Mero Mayonnaise - 5Kg', CAST(160.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (6, 16, N'Clover Honey 500 Grams - Vitablend', CAST(85.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (6, 17, N'shana Nawara Squeeze Honey - 950 G', CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (6, 18, N'Ahla Seha Nawara Clover Honey - 865 Gm', CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (7, 19, N'Dobella Biscuit Flour 1kg', CAST(29.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (7, 20, N'Five Stars Dumpling Flour - 1 kg', CAST(22.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (7, 21, N'Five Stars Pancake Flour - 1 kg', CAST(24.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (8, 22, N'shana Cumin Powder - 90 GM', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (8, 23, N'YARU Natural Dried Crushed Garlic - 50gm', CAST(37.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (8, 24, N'Aldoha Cumin Powder - 100g', CAST(19.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (9, 25, N'Dobella Pickled Mexican Pepper – 370 ml', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (9, 26, N'Dobella Pickled lemon – 370 gm', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (9, 27, N'Besto Food Natural Pickled Black Olives – 370gm', CAST(23.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (10, 28, N'Zamzam Yellow Lentils - 500 gm', CAST(23.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (10, 29, N'Morspice Falafel 250 Gm', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (10, 30, N'Food Boiled Chickpeas 3 Kg', CAST(65.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (11, 31, N'YARU Natural Dried Green Spinach Bag- 50gm', CAST(37.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (11, 32, N'Food Easy Open Mushroom Pieces & Silces - 400 G', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (12, 33, N'Arlequin Pickled Mussels With Red Sauce - 69g', CAST(24.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (12, 34, N'Founty Hot Moroccan Sardine Fish', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (13, 35, N'Lino Rice Crisp - 250 gm', CAST(32.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (13, 36, N'Nesquik Cereal Cocoa Crush - 360gm', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (13, 37, N'Lino Choco Scopes - 250 gm', CAST(38.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (14, 38, N'Bisco Misr Plain Kahk - 1 kg', CAST(126.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (15, 39, N'Maxtella White Chocolate Spread - 950 Gm', CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (15, 40, N'shana Cocoa Butter Raw - 150 GM', CAST(71.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (15, 41, N'ADD-ME Fig Jam - 360g', CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (16, 42, N'Cadbury Dairy Milk Mini Hazelnut Chocolate - 168 gm', CAST(64.95 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (16, 43, N'Mythic Hazelnut Chocolate 80 G 2pcs', CAST(48.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (16, 44, N'Kit Kat Chunky Lotus Chocolate Bars - 24 Pcs', CAST(356.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (17, 45, N'Break Hot Chili Snacks 21-24 gm - Pack of 12 Pcs', CAST(23.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (17, 46, N'Lion Salt Potato Chips - 42-32 gm - Pack of 12 Pcs', CAST(35.75 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (17, 47, N'Lion Vinegar & Salt Potato Chips - 68-58 gm - Pack of 10 Pcs', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (18, 48, N'Al Muqila Aswani Peanuts - 250gm', CAST(44.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (18, 49, N'Nabtah Quinoa Seeds - 500gm', CAST(105.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (18, 50, N'Abu Auf Salted Pistachio - 100 gm', CAST(56.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (19, 51, N'Love-it Cocktail Juice - 250ml', CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (19, 52, N'Love-it Mango Juice - 250ml', CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (19, 53, N'Love-it Apple Juice - 250ml', CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (19, 54, N'Frooti Nectar Mango Juice - 1 Liter', CAST(19.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (20, 55, N'7 Up Plastic Bottle – 0.97 Liter - 6 PCs', CAST(64.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (20, 56, N'Schweppes Peach Cans – 330 Ml – 24', CAST(114.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (21, 57, N'Garnet Turkish Coffee Medium Flavoured With Cardamom 250G', CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (21, 58, N'Blue Tea Pot Fine Black Tea - 40 gm', CAST(4.50 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (21, 59, N'shana Celery & Parsley Tea - 75 GM.', CAST(33.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (22, 60, N'Flo Water - 1.25L - Set Of 9', CAST(81.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (22, 61, N'Flo Water - 600ml - Set Of 12', CAST(78.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (22, 62, N'Pearl Natural Water - 250 ml', CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (23, 63, N'Tang Instant Mango Flavoured Drink - 450 gm', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (23, 64, N'Tang Juice with Orange Flavor- 25 gm - 12 pcs', CAST(58.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (23, 65, N'Tang Tropical Juice Powder – 25gm – 12 PCs', CAST(47.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (24, 66, N'Comfort Flora Soft - 2L', CAST(58.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (24, 67, N'Ariel Liquid clean and fresh detergent 3.3 Kilogram', CAST(122.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (24, 68, N'IGel-Power Gel Liquid Laundry Detergent-Front & Top Load 2 Litrer', CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (25, 69, N'Ariel Powder Touch of Downy Detergent 7 Kilogram', CAST(254.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (25, 70, N'ABC Egypt Automatic Powder Detergent - 4 Kg', CAST(89.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (26, 71, N'Comfort Pink Liquid Softener - 1L', CAST(38.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (26, 72, N'Comfort Fabric Softner Flora Soft Pink 3L', CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (27, 73, N'Vanish Vanish Laundry Stain Remover Liquid for White Colored Clothes', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (27, 74, N'Velveta Stain Remover – 700ml', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (28, 75, N'Clorel 4x1 Lemon Scented Cleaning Bleach - 1kg', CAST(13.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (28, 76, N'Clorel 2x1 Lavender Scented Bleach - 2kg', CAST(23.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (29, 77, N'Finish Dishwasher Detergent Tablets, Quantum 21 tablets ', CAST(157.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (29, 78, N'Sheen Dish Washing Liquid -Green Lemon - 750ml', CAST(16.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (30, 79, N'Home Freshener, Multi Purpose, Blue, 250ml, CN50, Peach', CAST(14.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (30, 80, N'Turbo Mood Air Freshener-pomegranate-500 Ml', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (31, 81, N'Dettol Healthy Bathroom Power Cleaner Spray, 500ml ', CAST(84.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (31, 82, N'ABC Egypt THE TOUGHEST GREASE REMOVER Multicolour 550ml', CAST(22.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (32, 83, N'Harpic Original Toilet Cleaner – 700ml', CAST(51.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (32, 84, N'Harpic Harpic Active Fresh Lavender Toilet Cleaner Rim Block, Value Pack', CAST(37.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (33, 85, N'Veroza Guard Disinfection Floors 500 ML', CAST(33.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (33, 86, N'Brix Lemon Floor Cleaner - 3 L', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (34, 87, N'Cleaner Brush Strong Magnetic Glass Brush', CAST(1536.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (34, 88, N'Glass Wiper 2×1 Spray', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (35, 89, N'Dettol Antiseptic Liquid Cleaner - 235', CAST(33.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (35, 90, N'ISafe Disinfectant & General Cleaner - 2x500ml ', CAST(52.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (36, 91, N'Super Absorbent Kitchen Towel - 12 Pcs', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (36, 92, N'Silicone Dish Washing Sponge Scrubber', CAST(45.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (37, 93, N'Foam Large Plates - 100 Pcs', CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([sub_category_id], [product_id], [product_name], [product_price]) VALUES (37, 94, N'Sanita White Facial Tissue - 200 Tissues', CAST(8.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[sub_categories] ON 

INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 1, N'Grains and Rice')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 2, N'Pasta and Noodles')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 3, N'Cooking Oil')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 4, N'Vinegar')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 5, N'Sauce')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 6, N'Sugars and Sweeteners')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 7, N'Flour')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 8, N'Herbs and Spices')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 9, N'Antipasto')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 10, N'Beans and Peas')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 11, N'Vegetables')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 12, N'Meat')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 13, N'Cereal')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 14, N'Breakfast Biscuits and Cookies')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 15, N'Jams and Sweet Spreads')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 16, N'Candy and Chocolate')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 17, N'Crisps and Chips')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (1, 18, N'Nuts and Seeds')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (2, 19, N'Juices')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (2, 20, N'Soft Drinks')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (2, 21, N'hot Drinks')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (2, 22, N'Water')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (2, 23, N'Powdered Drink Mixes and Flavorings')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (3, 24, N'Liquid Detergent')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (3, 25, N'Powder Detergent')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (3, 26, N'Fabric Softener')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (3, 27, N'Stain Removal')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (3, 28, N'Bleach')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 29, N'Dishwashing')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 30, N'Air Fresheners')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 31, N'Kitchen Cleaners')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 32, N'Bathroom Cleaners')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 33, N'Floor Cleaners')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 34, N'Glass Cleaners')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 35, N'Disinfectants')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 36, N'Cleaning Tools')
INSERT [dbo].[sub_categories] ([category_id], [sub_category_id], [sub_category_name]) VALUES (4, 37, N'Paper and Plastic')
SET IDENTITY_INSERT [dbo].[sub_categories] OFF
GO
ALTER TABLE [dbo].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([sub_category_id])
REFERENCES [dbo].[sub_categories] ([sub_category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sub_categories]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Online_Market] SET  READ_WRITE 
GO
