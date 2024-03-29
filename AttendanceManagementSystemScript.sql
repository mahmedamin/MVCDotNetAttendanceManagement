USE [master]
GO
/****** Object:  Database [AttendanceManagementSystem]    Script Date: 8/9/2017 6:47:15 PM ******/
CREATE DATABASE [AttendanceManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AttendanceManagementSytem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AttendanceManagementSytem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AttendanceManagementSytem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AttendanceManagementSytem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AttendanceManagementSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AttendanceManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AttendanceManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AttendanceManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AttendanceManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AttendanceManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AttendanceManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AttendanceManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [AttendanceManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [AttendanceManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AttendanceManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AttendanceManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AttendanceManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AttendanceManagementSystem', N'ON'
GO
USE [AttendanceManagementSystem]
GO
/****** Object:  Table [dbo].[Attendances]    Script Date: 8/9/2017 6:47:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Attendances] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/9/2017 6:47:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([id], [name]) VALUES (1, N'ahmed')
INSERT [dbo].[Students] ([id], [name]) VALUES (2, N'farook')
INSERT [dbo].[Students] ([id], [name]) VALUES (3, N'suleman')
INSERT [dbo].[Students] ([id], [name]) VALUES (4, N'saleh')
INSERT [dbo].[Students] ([id], [name]) VALUES (5, N'mehboob')
SET IDENTITY_INSERT [dbo].[Students] OFF
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_Students]
GO
USE [master]
GO
ALTER DATABASE [AttendanceManagementSystem] SET  READ_WRITE 
GO
