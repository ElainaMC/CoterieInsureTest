USE [master]
GO
/****** Object:  Database [CoterieInsurance]    Script Date: 9/11/2020 1:36:43 PM ******/
CREATE DATABASE [CoterieInsurance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoterieInsurance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoterieInsurance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoterieInsurance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoterieInsurance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoterieInsurance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoterieInsurance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoterieInsurance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoterieInsurance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoterieInsurance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoterieInsurance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoterieInsurance] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoterieInsurance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoterieInsurance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoterieInsurance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoterieInsurance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoterieInsurance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoterieInsurance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoterieInsurance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoterieInsurance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoterieInsurance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoterieInsurance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoterieInsurance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoterieInsurance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoterieInsurance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoterieInsurance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoterieInsurance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoterieInsurance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoterieInsurance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoterieInsurance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoterieInsurance] SET  MULTI_USER 
GO
ALTER DATABASE [CoterieInsurance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoterieInsurance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoterieInsurance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoterieInsurance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoterieInsurance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoterieInsurance] SET QUERY_STORE = OFF
GO
USE [CoterieInsurance]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 9/11/2020 1:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Business] [nvarchar](100) NOT NULL,
	[BusinessFactor] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_Business_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranceInputs]    Script Date: 9/11/2020 1:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceInputs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Revenue] [int] NOT NULL,
	[State] [nvarchar](10) NOT NULL,
	[Business] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CoterieInput] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 9/11/2020 1:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](10) NOT NULL,
	[StateFactor] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_StateFactor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsuranceInputs_Insert]    Script Date: 9/11/2020 1:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsuranceInputs_Insert]
		@Revenue int 
		,@State nvarchar(10)
		,@Business nvarchar(100)
		,@Id int OUTPUT


AS

/*TEST CODE

Declare @Id int = 0;

Declare @Revenue int = 20000
		,@State nvarchar(10)= 'OH'
		,@Business nvarchar(100)= 'Plumber'

Execute dbo.InsuranceInputs_Insert

		@Revenue
		,@State
		,@Business
		,@Id OUTPUT
*/



BEGIN
SELECT @Business	FROM dbo.Business
SELECT @State		FROM dbo.State


INSERT INTO [dbo].[InsuranceInputs]
           ([Revenue]
           ,[State]
           ,[Business])



     VALUES
           (@Revenue
           ,@State
           ,@Business)

	SET @Id = SCOPE_IDENTITY()


	END
GO
USE [master]
GO
ALTER DATABASE [CoterieInsurance] SET  READ_WRITE 
GO
