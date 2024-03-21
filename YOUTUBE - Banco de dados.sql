USE [master]
GO

/****** Object:  Database [YOUTUBE]    Script Date: 20/03/2024 23:15:13 ******/
CREATE DATABASE [YOUTUBE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YOUTUBE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\YOUTUBE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YOUTUBE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\YOUTUBE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YOUTUBE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [YOUTUBE] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [YOUTUBE] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [YOUTUBE] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [YOUTUBE] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [YOUTUBE] SET ARITHABORT OFF 
GO

ALTER DATABASE [YOUTUBE] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [YOUTUBE] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [YOUTUBE] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [YOUTUBE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [YOUTUBE] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [YOUTUBE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [YOUTUBE] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [YOUTUBE] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [YOUTUBE] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [YOUTUBE] SET  DISABLE_BROKER 
GO

ALTER DATABASE [YOUTUBE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [YOUTUBE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [YOUTUBE] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [YOUTUBE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [YOUTUBE] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [YOUTUBE] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [YOUTUBE] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [YOUTUBE] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [YOUTUBE] SET  MULTI_USER 
GO

ALTER DATABASE [YOUTUBE] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [YOUTUBE] SET DB_CHAINING OFF 
GO

ALTER DATABASE [YOUTUBE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [YOUTUBE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [YOUTUBE] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [YOUTUBE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [YOUTUBE] SET QUERY_STORE = OFF
GO

ALTER DATABASE [YOUTUBE] SET  READ_WRITE 
GO

