USE [master]
GO
/****** Object:  Database [TireTreasureDB]    Script Date: 04/26/2016 17:33:45 ******/
CREATE DATABASE [TireTreasureDB] ON  PRIMARY 
( NAME = N'TireTreasureDB', FILENAME = N'F:\sqlDB\TireTreasureDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TireTreasureDB_log', FILENAME = N'F:\sqlDB\TireTreasureDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TireTreasureDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TireTreasureDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TireTreasureDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TireTreasureDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TireTreasureDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TireTreasureDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TireTreasureDB] SET ARITHABORT OFF
GO
ALTER DATABASE [TireTreasureDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TireTreasureDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TireTreasureDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TireTreasureDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TireTreasureDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TireTreasureDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TireTreasureDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TireTreasureDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TireTreasureDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TireTreasureDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TireTreasureDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [TireTreasureDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TireTreasureDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TireTreasureDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TireTreasureDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TireTreasureDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TireTreasureDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TireTreasureDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TireTreasureDB] SET  READ_WRITE
GO
ALTER DATABASE [TireTreasureDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TireTreasureDB] SET  MULTI_USER
GO
ALTER DATABASE [TireTreasureDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TireTreasureDB] SET DB_CHAINING OFF
GO
USE [TireTreasureDB]
GO
/****** Object:  Table [dbo].[TT_User]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_User](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginName] [nvarchar](30) NULL,
	[Password] [nvarchar](40) NULL,
	[TrueName] [nvarchar](20) NULL,
	[UserType] [tinyint] NULL,
	[Levels] [tinyint] NULL,
	[Scores] [int] NULL,
	[States] [tinyint] NULL,
	[tags] [nvarchar](20) NULL,
	[CurrentIP] [nvarchar](20) NULL,
	[CurrentPort] [nvarchar](20) NULL,
	[LastLoginAddr] [nvarchar](30) NULL,
	[IsOnline] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_USER] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'TrueName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'UserType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'IsOnline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轮胎宝宝使用用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User'
GO
/****** Object:  Table [dbo].[TT_TransactSnapshot]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_TransactSnapshot](
	[SnapshotId] [uniqueidentifier] NOT NULL,
	[TransactionId] [uniqueidentifier] NOT NULL,
	[ShopId] [uniqueidentifier] NULL,
	[Title] [nvarchar](30) NULL,
	[ImageUrl] [nvarchar](200) NULL,
	[CategoryId] [int] NULL,
	[Brand] [varchar](20) NULL,
	[Models] [nvarchar](30) NULL,
	[Details] [text] NULL,
	[Phone] [nvarchar](20) NULL,
	[Price] [decimal](18, 2) NULL,
	[ProvinceCode] [varchar](20) NULL,
	[CityCode] [varchar](20) NULL,
	[AreaCode] [varchar](20) NULL,
	[CallCount] [int] NULL,
	[Praises] [int] NULL,
	[Clicks] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Versions] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[States] [int] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_TRANSACTSNAPSHOT] PRIMARY KEY CLUSTERED 
(
	[SnapshotId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'SnapshotId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'TransactionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Models'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'呼叫量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'CallCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Praises'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Clicks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品快照' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot'
GO
/****** Object:  Table [dbo].[TT_Transaction]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Transaction](
	[TransactionId] [uniqueidentifier] NOT NULL,
	[ShopId] [uniqueidentifier] NULL,
	[Title] [nvarchar](30) NULL,
	[ImageUrl] [nvarchar](200) NULL,
	[CategoryId] [int] NULL,
	[Brand] [varchar](20) NULL,
	[Models] [nvarchar](30) NULL,
	[Details] [text] NULL,
	[Phone] [nvarchar](20) NULL,
	[Price] [decimal](18, 2) NULL,
	[ProvinceCode] [varchar](20) NULL,
	[CityCode] [varchar](20) NULL,
	[AreaCode] [varchar](20) NULL,
	[CallCount] [int] NULL,
	[Praises] [int] NULL,
	[Clicks] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Versions] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[States] [int] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_TRANSACTION] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'TransactionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Models'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'呼叫量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'CallCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Praises'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Clicks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易信息（车辆，物品等）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction'
GO
/****** Object:  Table [dbo].[TT_Shop]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_Shop](
	[ShopId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TName] [nvarchar](30) NULL,
	[ImageUrlMax] [nvarchar](200) NULL,
	[ImageUrl] [nvarchar](200) NULL,
	[Star] [tinyint] NULL,
	[Phone] [nvarchar](20) NULL,
	[Details] [text] NULL,
	[CategoryId] [int] NULL,
	[CreateMan] [uniqueidentifier] NULL,
	[ProvinceCode] [nvarchar](20) NULL,
	[CityCode] [nvarchar](20) NULL,
	[AreaCode] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[CallCount] [int] NULL,
	[Praises] [int] NULL,
	[Clicks] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[States] [tinyint] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_SHOP] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'ImageUrlMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Star'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'CreateMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'呼叫量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'CallCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Praises'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Clicks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商铺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop'
GO
/****** Object:  Table [dbo].[TT_Reservation]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Reservation](
	[ReservationId] [uniqueidentifier] NOT NULL,
	[TransactionId] [uniqueidentifier] NOT NULL,
	[Explain] [varchar](200) NULL,
	[OrderId] [uniqueidentifier] NULL,
	[RMney] [decimal](18, 2) NULL,
	[CreateTime] [datetime] NULL,
	[ReserTime] [datetime] NULL,
	[States] [int] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_RESERVATION] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'ReservationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'TransactionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'RMney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'ReserTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预约' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation'
GO
/****** Object:  Table [dbo].[TT_RequestFriends]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_RequestFriends](
	[RequestFriendsId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ToUserId] [uniqueidentifier] NULL,
	[States] [tinyint] NULL,
	[CategoryId] [int] NULL,
	[Messages] [nvarchar](200) NULL,
	[AddTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_REQUESTFRIENDS] PRIMARY KEY CLUSTERED 
(
	[RequestFriendsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'RequestFriendsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'Messages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友申请列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends'
GO
/****** Object:  Table [dbo].[TT_References]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_References](
	[ReferencesId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ToUserId] [uniqueidentifier] NULL,
	[States] [tinyint] NULL,
	[CategoryId] [int] NULL,
	[Messages] [nvarchar](200) NULL,
	[AddTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_REFERENCES] PRIMARY KEY CLUSTERED 
(
	[ReferencesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'ReferencesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'Messages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'我推荐的会员列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References'
GO
/****** Object:  Table [dbo].[TT_MissionsApply]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_MissionsApply](
	[MissApplyId] [uniqueidentifier] NOT NULL,
	[MissionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Explain] [varchar](200) NULL,
	[Remarks] [varchar](200) NULL,
	[ApplyStates] [tinyint] NULL,
	[ApplyTime] [datetime] NULL,
	[StarTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_MISSIONSAPPLY] PRIMARY KEY CLUSTERED 
(
	[MissApplyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'MissApplyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'MissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'ApplyStates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'ApplyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'StarTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接受任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply'
GO
/****** Object:  Table [dbo].[TT_Missions]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Missions](
	[MissionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ProvinceCode] [varchar](20) NULL,
	[CityCode] [varchar](20) NULL,
	[AreaCode] [varchar](20) NULL,
	[Titles] [nvarchar](30) NULL,
	[Details] [nvarchar](500) NULL,
	[Address] [nvarchar](20) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[MoneyReward] [decimal](18, 2) NULL,
	[States] [tinyint] NULL,
	[SpendTime] [datetime] NULL,
	[SpendHours] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_MISSIONS] PRIMARY KEY CLUSTERED 
(
	[MissionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'MissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions'
GO
/****** Object:  Table [dbo].[TT_Messages]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_Messages](
	[MessagesId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReceiveUserId] [uniqueidentifier] NOT NULL,
	[SendUserId] [uniqueidentifier] NULL,
	[Title] [nvarchar](30) NULL,
	[Details] [text] NULL,
	[SendTime] [datetime] NULL,
	[ViewTime] [datetime] NULL,
	[isView] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_MESSAGES] PRIMARY KEY CLUSTERED 
(
	[MessagesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'MessagesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'ReceiveUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'ViewTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'isView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统消息
   个人对个人，群消息业务还不需，暂不作设计
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages'
GO
/****** Object:  Table [dbo].[TT_Levels]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_Levels](
	[LevelsId] [int] IDENTITY(1,1) NOT NULL,
	[TName] [nvarchar](30) NULL,
	[Levels] [int] NULL,
	[Scores] [int] NULL,
	[Details] [text] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_LEVELS] PRIMARY KEY CLUSTERED 
(
	[LevelsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'LevelsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一、会员成长方式计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels'
GO
/****** Object:  Table [dbo].[TT_InsuranCompany]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_InsuranCompany](
	[InsuranCompanyId] [int] IDENTITY(1,1) NOT NULL,
	[TName] [nvarchar](30) NULL,
	[ApiUrl] [nvarchar](200) NULL,
	[IConUrl] [nvarchar](200) NULL,
	[Orders] [int] NULL,
	[SCode] [varchar](10) NULL,
	[Pkey] [varchar](30) NULL,
	[Details] [nvarchar](200) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_INSURANCOMPANY] PRIMARY KEY CLUSTERED 
(
	[InsuranCompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'InsuranCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'ApiUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'IConUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany'
GO
/****** Object:  Table [dbo].[TT_Insuran]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Insuran](
	[InsuranId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[InsuranCompanyId] [int] NOT NULL,
	[ProvinceCode] [nvarchar](20) NULL,
	[CityCode] [varchar](20) NULL,
	[AreaCode] [varchar](20) NULL,
	[MCost] [decimal](18, 2) NULL,
	[Explain] [varchar](200) NULL,
	[NCode] [varchar](30) NULL,
	[InsuranMan] [nvarchar](10) NULL,
	[CarModel] [nvarchar](30) NULL,
	[LicensePlate] [nvarchar](10) NULL,
	[EngineNumber] [varchar](20) NULL,
	[RisksType] [nvarchar](30) NULL,
	[CarFrameNo] [nvarchar](30) NULL,
	[Remarks] [nvarchar](200) NULL,
	[States] [tinyint] NULL,
	[HandlePerson] [nvarchar](10) NULL,
	[StarTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_INSURAN] PRIMARY KEY CLUSTERED 
(
	[InsuranId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'InsuranId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'InsuranCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'InsuranMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CarModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'LicensePlate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'EngineNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'RisksType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CarFrameNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理保险单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran'
GO
/****** Object:  Table [dbo].[TT_FundPerSon]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_FundPerSon](
	[FundPerSonId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[FundInfoId] [uniqueidentifier] NOT NULL,
	[HScores] [decimal](18, 2) NULL,
	[StarTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_FUNDPERSON] PRIMARY KEY CLUSTERED 
(
	[FundPerSonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'FundPerSonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'FundInfoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一、会员成长方式计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon'
GO
/****** Object:  Table [dbo].[TT_FundInfo]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_FundInfo](
	[FundInfoId] [uniqueidentifier] NOT NULL,
	[TName] [nvarchar](30) NULL,
	[SCode] [varchar](10) NULL,
	[IConUrl] [nvarchar](200) NULL,
	[Orders] [int] NULL,
	[NeedScores] [decimal](18, 2) NULL,
	[Scores] [decimal](18, 2) NULL,
	[Summarys] [nvarchar](200) NULL,
	[Details] [text] NULL,
	[StarTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_FUNDINFO] PRIMARY KEY CLUSTERED 
(
	[FundInfoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'FundInfoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'IConUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
/****** Object:  Table [dbo].[TT_Friends]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_Friends](
	[FriendsId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ToUserId] [uniqueidentifier] NULL,
	[isDeleted] [bit] NULL,
	[SetName] [nvarchar](30) NULL,
	[ByWay] [nvarchar](20) NULL,
	[StarSign] [bit] NULL,
	[BlackList] [bit] NULL,
	[CategoryId] [int] NULL,
	[Remarks] [nvarchar](200) NULL,
	[AddTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_TT_FRIENDS] PRIMARY KEY CLUSTERED 
(
	[FriendsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'FriendsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'SetName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'ByWay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'StarSign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'BlackList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends'
GO
/****** Object:  Table [dbo].[TT_FilesTransact]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_FilesTransact](
	[FilesTransactId] [bigint] IDENTITY(1,1) NOT NULL,
	[ToId] [uniqueidentifier] NULL,
	[ShowName] [nvarchar](50) NULL,
	[FileName] [nvarchar](50) NULL,
	[SourceTable] [nvarchar](20) NULL,
	[RelativePath] [nvarchar](150) NULL,
	[Route] [nvarchar](200) NULL,
	[Suffix] [varchar](10) NULL,
	[FileType] [nvarchar](20) NULL,
	[AddTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_FILESTRANSACT] PRIMARY KEY CLUSTERED 
(
	[FilesTransactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
/****** Object:  Table [dbo].[TT_FilesInsuran]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_FilesInsuran](
	[FilesInsuranId] [bigint] IDENTITY(1,1) NOT NULL,
	[ToId] [uniqueidentifier] NULL,
	[ShowName] [nvarchar](50) NULL,
	[FileName] [nvarchar](50) NULL,
	[SourceTable] [nvarchar](20) NULL,
	[RelativePath] [nvarchar](150) NULL,
	[Route] [nvarchar](200) NULL,
	[Suffix] [varchar](10) NULL,
	[FileType] [nvarchar](20) NULL,
	[AddTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_FILESINSURAN] PRIMARY KEY CLUSTERED 
(
	[FilesInsuranId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
/****** Object:  Table [dbo].[TT_CommentT]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_CommentT](
	[CommentId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[PostId] [uniqueidentifier] NULL,
	[Star] [int] NULL,
	[Praises] [int] NULL,
	[Reports] [int] NULL,
	[Category] [nvarchar](50) NULL,
	[Author] [nvarchar](20) NULL,
	[Details] [text] NULL,
	[AddTime] [datetime] NULL,
	[States] [int] NULL,
	[IsHaveImg] [bit] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_COMMENTT] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'CommentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属文章Id（回复哪编文章）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'PostId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Star'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Praises'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Reports'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（已审核、开启1，未审核0，关闭2）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（已审核、开启1，未审核0，关闭2）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'IsHaveImg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT'
GO
/****** Object:  Table [dbo].[TT_AppUserInfo]    Script Date: 04/26/2016 17:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_AppUserInfo](
	[AppUserInfoId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Nickname] [nvarchar](20) NULL,
	[ImgeUrl] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[ProvinceCode] [varchar](20) NULL,
	[CityCode] [varchar](20) NULL,
	[AreaCode] [varchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[CategoryId] [int] NULL,
	[Details] [text] NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[LocationUpdateTime] [datetime] NULL,
	[References] [nvarchar](20) NULL,
	[ReferencesId] [uniqueidentifier] NULL,
	[AddTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_APPUSERINFO] PRIMARY KEY CLUSTERED 
(
	[AppUserInfoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'AppUserInfoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'ImgeUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'LocationUpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端用户信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo'
GO
