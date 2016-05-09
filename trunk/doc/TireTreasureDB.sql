USE [master]
GO
/****** Object:  Database [TireTreasureDB]    Script Date: 05/09/2016 17:07:07 ******/
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
/****** Object:  Table [dbo].[TT_User]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_User](
	[UserId] [uniqueidentifier] NOT NULL,
	[WeiXinId] [varchar](50) NULL,
	[LoginName] [nvarchar](30) NULL,
	[Password] [nvarchar](40) NULL,
	[TrueName] [nvarchar](20) NULL,
	[UserType] [tinyint] NULL,
	[Levels] [tinyint] NULL,
	[Scores] [int] NULL,
	[States] [tinyint] NULL,
	[tags] [nvarchar](20) NULL,
	[CurrentIP] [varchar](20) NULL,
	[CurrentPort] [varchar](20) NULL,
	[LastLoginAddr] [varchar](30) NULL,
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
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户微信openId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'WeiXinId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'TrueName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类型 0为普通用户 1为店铺用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'UserType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'Levels'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'Scores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1锁定 0 正常-1关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签(组)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线iP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'CurrentIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'CurrentPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'LastLoginAddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1在线 0 下线 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'IsOnline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_User app用户账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_User'
GO
INSERT [dbo].[TT_User] ([UserId], [WeiXinId], [LoginName], [Password], [TrueName], [UserType], [Levels], [Scores], [States], [tags], [CurrentIP], [CurrentPort], [LastLoginAddr], [IsOnline], [CreateTime], [UpdateTime], [isDeleted]) VALUES (N'68ba7434-9a06-4e45-a56e-3a0a30b40bf4', N'ov0HljkR7_iqO4GXLlcGdWWNATEs', N'13577777621', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A5FE01147B9F AS DateTime), CAST(0x0000A5FE01147B9F AS DateTime), 0)
INSERT [dbo].[TT_User] ([UserId], [WeiXinId], [LoginName], [Password], [TrueName], [UserType], [Levels], [Scores], [States], [tags], [CurrentIP], [CurrentPort], [LastLoginAddr], [IsOnline], [CreateTime], [UpdateTime], [isDeleted]) VALUES (N'4fac89ab-3829-47fe-8262-fe85542d0184', N'ov0HljubVsu4mOIfZsTMry_s3CNM', N'18697923505', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A5FE0119A71C AS DateTime), CAST(0x0000A5FE0119A71C AS DateTime), 0)
/****** Object:  Table [dbo].[TT_TransactSnapshot]    Script Date: 05/09/2016 17:07:08 ******/
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
	[CategoryId] [varchar](20) NULL,
	[Brand] [varchar](20) NULL,
	[Models] [nvarchar](30) NULL,
	[Details] [text] NULL,
	[Phone] [varchar](20) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'TransactionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店铺Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Models'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Versions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_TransactSnapshot物品快照' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot'
GO
/****** Object:  Table [dbo].[TT_Transaction]    Script Date: 05/09/2016 17:07:08 ******/
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
	[CategoryId] [varchar](20) NULL,
	[Brand] [varchar](20) NULL,
	[Models] [nvarchar](30) NULL,
	[Details] [text] NULL,
	[Phone] [varchar](20) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店铺Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Models'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Versions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Transaction物品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction'
GO
/****** Object:  Table [dbo].[TT_ShopAppUser]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_ShopAppUser](
	[ShopUserId] [uniqueidentifier] NOT NULL,
	[ShopId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[WeiXinId] [varchar](50) NULL,
	[UserType] [tinyint] NULL,
	[Levels] [tinyint] NULL,
	[Scores] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[States] [tinyint] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_SHOPAPPUSER] PRIMARY KEY CLUSTERED 
(
	[ShopUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'ShopUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商店Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户微信openId(商家的微信)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'WeiXinId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类型 预留' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'UserType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'Levels'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'Scores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_ShopAppUser 商铺会员关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_ShopAppUser'
GO
/****** Object:  Table [dbo].[TT_Shop]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Shop](
	[ShopId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TName] [nvarchar](30) NULL,
	[ImageUrlMax] [nvarchar](200) NULL,
	[ImageUrl] [nvarchar](200) NULL,
	[Star] [tinyint] NULL,
	[Phone] [varchar](20) NULL,
	[Details] [text] NULL,
	[CategoryId] [varchar](20) NULL,
	[CreateMan] [uniqueidentifier] NULL,
	[ProvinceCode] [varchar](20) NULL,
	[CityCode] [varchar](20) NULL,
	[AreaCode] [varchar](20) NULL,
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
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'UserId'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop', @level2type=N'COLUMN',@level2name=N'CreateMan'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Shop 商铺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Shop'
GO
/****** Object:  Table [dbo].[TT_Reservation]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Reservation](
	[ReservationId] [uniqueidentifier] NOT NULL,
	[TransactionId] [uniqueidentifier] NOT NULL,
	[ShopId] [uniqueidentifier] NULL,
	[Explain] [varchar](200) NULL,
	[OrderId] [uniqueidentifier] NULL,
	[RMney] [decimal](18, 2) NULL,
	[Types] [tinyint] NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品(服务Id)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'TransactionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店面Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预约说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预约已交付金额（预留）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'RMney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（会员预约、消费预约）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'Types'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预约时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'ReserTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（已完成1，预约中0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Reservations 预约' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Reservation'
GO
/****** Object:  Table [dbo].[TT_RequestFriends]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_RequestFriends](
	[RequestFriendsId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ToUserId] [uniqueidentifier] NULL,
	[States] [tinyint] NULL,
	[CategoryId] [varchar](20) NULL,
	[Messages] [nvarchar](200) NULL,
	[AddTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_REQUESTFRIENDS] PRIMARY KEY CLUSTERED 
(
	[RequestFriendsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'RequestFriendsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请的用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'ToUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1添加成功 0 拒绝 -1关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'Messages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_RequestFriends 好友申请' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends'
GO
/****** Object:  Table [dbo].[TT_References]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_References](
	[ReferencesId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ToUserId] [uniqueidentifier] NULL,
	[InvitationCode] [varchar](50) NULL,
	[States] [tinyint] NULL,
	[CategoryId] [varchar](20) NULL,
	[Messages] [nvarchar](100) NULL,
	[AddTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_REFERENCES] PRIMARY KEY CLUSTERED 
(
	[ReferencesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'ReferencesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐的用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'ToUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'InvitationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1推荐成功 0 推荐中 -1关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'Messages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_References 我推荐的好友' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_References'
GO
/****** Object:  Table [dbo].[TT_MissionsApply]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_MissionsApply](
	[MissApplyId] [uniqueidentifier] NOT NULL,
	[MissionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Explain] [nvarchar](200) NULL,
	[Remarks] [nvarchar](200) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'MissApplyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'MissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人申请说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'ApplyStates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'ApplyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始进行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'StarTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_MissionsApply 接受任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_MissionsApply'
GO
/****** Object:  Table [dbo].[TT_Missions]    Script Date: 05/09/2016 17:07:08 ******/
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
	[CategoryId] [varchar](20) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Titles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赏金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'MoneyReward'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已完成1进行中0待接受-1关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'要求完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'SpendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'要求完成（小时）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'SpendHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Missions 任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Missions'
GO
/****** Object:  Table [dbo].[TT_Messages]    Script Date: 05/09/2016 17:07:08 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'ReceiveUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'SendUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查看时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'ViewTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'isView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Messages  系统消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Messages'
GO
/****** Object:  Table [dbo].[TT_Levels]    Script Date: 05/09/2016 17:07:08 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'Levels'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所需积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels', @level2type=N'COLUMN',@level2name=N'Scores'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Levels 会员等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Levels'
GO
/****** Object:  Table [dbo].[TT_InsuranCompany]    Script Date: 05/09/2016 17:07:08 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'ApiUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'IConUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'SCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany', @level2type=N'COLUMN',@level2name=N'Pkey'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_InsuranCompany  保险公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranCompany'
GO
/****** Object:  Table [dbo].[TT_Insuran]    Script Date: 05/09/2016 17:07:08 ******/
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
	[CategoryId] [varchar](20) NULL,
	[ProvinceCode] [varchar](20) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险公司Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'InsuranCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'MCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人办理说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'依据（单号）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被保险人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'InsuranMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厂牌型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CarModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'号牌号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'LicensePlate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发动机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'EngineNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'险别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'RisksType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车架号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CarFrameNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已办理1办理中0未付款-1关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'HandlePerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'StarTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Insuran 保险单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran'
GO
/****** Object:  Table [dbo].[TT_FundPerSon]    Script Date: 05/09/2016 17:07:08 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基金Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'FundInfoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已存（金额）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'HScores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'StarTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_FundPerSon 个人互助基金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundPerSon'
GO
/****** Object:  Table [dbo].[TT_FundInfo]    Script Date: 05/09/2016 17:07:08 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'SCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'IConUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资格（金额）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'NeedScores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'启动（金额）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'Scores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'Summarys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'StarTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_FundInfo 互助基金信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FundInfo'
GO
/****** Object:  Table [dbo].[TT_Friends]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[CategoryId] [varchar](20) NULL,
	[Remarks] [nvarchar](200) NULL,
	[AddTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_TT_FRIENDS] PRIMARY KEY CLUSTERED 
(
	[FriendsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'FriendsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'ToUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'SetName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加方式(扫一扫，搜索，通讯录)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'ByWay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星标志(ture是 false否)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'StarSign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入黑名单(ture是 false否)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'BlackList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Friends 好友' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Friends'
GO
/****** Object:  Table [dbo].[TT_FilesTransact]    Script Date: 05/09/2016 17:07:08 ******/
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
	[SourceTable] [varchar](20) NULL,
	[RelativePath] [varchar](150) NULL,
	[Route] [varchar](200) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'FilesTransactId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所禹对象Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'ToId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'ShowName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源表（某个数据表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'SourceTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相对路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'RelativePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'Suffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件属性类型（中文）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'FileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_FilesTransact 商品 文件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact'
GO
/****** Object:  Table [dbo].[TT_FilesInsuran]    Script Date: 05/09/2016 17:07:08 ******/
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
	[SourceTable] [varchar](20) NULL,
	[RelativePath] [varchar](150) NULL,
	[Route] [varchar](200) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'FilesInsuranId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所禹对象Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'ToId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'ShowName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源表（某个数据表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'SourceTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相对路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'RelativePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'Suffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件属性类型（中文）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'FileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_FilesInsuran 保险单 文件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran'
GO
/****** Object:  Table [dbo].[TT_Config]    Script Date: 05/09/2016 17:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Config](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[CType] [varchar](20) NULL,
	[CName] [nvarchar](200) NULL,
	[CValue] [nvarchar](100) NULL,
	[OrderID] [int] NULL,
	[Remark] [nvarchar](100) NULL,
	[UpdateTime] [datetime] NULL,
	[CreateMan] [varchar](30) NULL,
	[isValid] [bit] NULL,
 CONSTRAINT [PK_TT_CONFIG] PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'CId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'CType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'CName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'CValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'CreateMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_Config  系统配置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Config'
GO
/****** Object:  Table [dbo].[TT_CommentT]    Script Date: 05/09/2016 17:07:08 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属Id（物品）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'PostId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打星级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Star'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Praises'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Reports'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别（）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（已审核、开启1，未审核0，关闭2）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有图（0没有，1有）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'IsHaveImg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_CommentT  购物评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CommentT'
GO
/****** Object:  Table [dbo].[TT_AppUserInfo]    Script Date: 05/09/2016 17:07:08 ******/
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
	[CategoryId] [varchar](20) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'Nickname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'ImgeUrl'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐我的人名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'References'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐我的人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'ReferencesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_AppUserInfo app用户信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_AppUserInfo'
GO
INSERT [dbo].[TT_AppUserInfo] ([AppUserInfoId], [UserId], [Nickname], [ImgeUrl], [Phone], [ProvinceCode], [CityCode], [AreaCode], [Address], [CategoryId], [Details], [Longitude], [Latitude], [LocationUpdateTime], [References], [ReferencesId], [AddTime], [UpdateTime], [isDeleted]) VALUES (N'8b4c542c-4b33-4d59-87b5-c41d051d57fc', N'68ba7434-9a06-4e45-a56e-3a0a30b40bf4', N'', N'http://wx.qlogo.cn/mmopen/Ao0AwNarQEppd269yPllajxYrJia8D5C7r0pKNFhULKR4cuRITHExpYkAgya1L8b20smldx9UhdSIBdAjpMSglJCGxbA2gP0N/0', N'13577777621', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A5FE01147B9F AS DateTime), CAST(0x0000A5FE01147B9F AS DateTime), 0)
INSERT [dbo].[TT_AppUserInfo] ([AppUserInfoId], [UserId], [Nickname], [ImgeUrl], [Phone], [ProvinceCode], [CityCode], [AreaCode], [Address], [CategoryId], [Details], [Longitude], [Latitude], [LocationUpdateTime], [References], [ReferencesId], [AddTime], [UpdateTime], [isDeleted]) VALUES (N'c4a16d2d-b436-43d0-8aa2-e3b793c51fb4', N'4fac89ab-3829-47fe-8262-fe85542d0184', N'啊啊啊啊', N'http://wx.qlogo.cn/mmopen/xGNLibSyicGrpBFcNXX8WvXocngBuAN88A4MQNYgOMiaaxfS39Q2Hf8PFkiaTY4oxR7PbBiaBv0EIuBclbibgJyaORiaZ5YKBbYiaM6X/0', N'18697923505', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A5FE0119A71C AS DateTime), CAST(0x0000A5FE0119A71C AS DateTime), 0)
/****** Object:  StoredProcedure [dbo].[sp_PaginationEx]    Script Date: 05/09/2016 17:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_PaginationEx]
	@tableName varchar(8000), -- 表名
	@strGetFields varchar(1000) = '*', -- 需要返回的列
	@strOrder varchar(400)='', -- 排序的字符串
	@PageSize int = 10, -- 页尺寸
	@PageIndex int = 1, -- 页码
	@TotalCount int = 0 output, -- 返回记录总数
	@strWhere varchar(1500) = '' -- 查询条件 (注意: 不要加 where)    
AS

	declare @strSQL nvarchar(4000) -- 主语句

 if @strWhere !=''
 begin
    if charindex('group by',@strWhere)>0
       set @strSQL = 'select @TotalCount=count(0) from (select ' + @strGetFields + ' from ' + @tableName + ' where '+@strWhere + ') as t'
    else
       set @strSQL = 'select @TotalCount=count(0) from ' + @tableName + ' where '+@strWhere
 end
 else
   set @strSQL = 'select @TotalCount=count(0) from ' + @tableName + ''
        
----取得查询结果总数量-----  
 exec sp_executesql @strSQL,N'@TotalCount int out ',@TotalCount out  

begin
    if @PageIndex = 1
    begin
        if @strWhere != ''
            set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ ' from ' + @tableName + ' where ' + @strWhere + ' order by ' + @strOrder
        else
            set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ ' from '+ @tableName + ' order by '+ @strOrder
    --如果是第一页就执行以上代码，这样会加快执行速度
    end
    else
    begin
    --以下代码赋予了@strSQL以真正执行的SQL代码
        if @strWhere != ''
         begin
           set @strSQL = 'select '+@strGetFields+ ' from ( select Row_Number() over (order by ' + @strOrder + ') as row,'+@strGetFields+ ' from ' + 
           @tableName + ' where '+@strWhere +') tmpTable where row between' + str((@PageIndex-1)*@PageSize + 1)+ ' and '
            + str((@PageIndex)*@PageSize) 
           end
         else
          begin
              set @strSQL = 'select '+@strGetFields+ ' from ( select Row_Number() over (order by ' + @strOrder + ') as row,'+@strGetFields+ ' from ' +
            @tableName + ') tmpTable where row between' + str((@PageIndex-1)*@PageSize + 1)+ ' and ' + str((@PageIndex)*@PageSize) 
              end 
	end
END

SET NOCOUNT off  
 exec sp_executesql @strSQL

print @strSQL
GO
/****** Object:  StoredProcedure [dbo].[proc_DelForSetDelete]    Script Date: 05/09/2016 17:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
create  PROCEDURE [dbo].[proc_DelForSetDelete]
	(@tableName NVARCHAR(200),      ----要显示的表或多个表的连接
	@Idfied NVARCHAR(200),      ----id或列名称
	@IdSet NVARCHAR(1000)      ----id集，","号隔开如："3","4"
	)
AS
Declare @sql NVARCHAR(1000)    ----存放动态生成的SQL语句
BEGIN
SET @sql = ' update  '+@tableName +' set isDeleted=1 where '+ @Idfied+' in ('+@IdSet+')'
exec(@sql) 
select @@rowcount --执行完后保存受影响的行数至变量

end
GO
/****** Object:  StoredProcedure [dbo].[proc_CountOne]    Script Date: 05/09/2016 17:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
create PROCEDURE [dbo].[proc_CountOne]
	(@tableName NVARCHAR(100),      ----表名
	@Countfied NVARCHAR(100),      ----要统计的列名称
	@Idfied  NVARCHAR(100) ,     ----id列名
	@Id NVARCHAR(100)      ----id
	)
AS
Declare @sql NVARCHAR(1000)    ----存放动态生成的SQL语句
BEGIN
SET @sql = ' update  '+@tableName +' set '+@Countfied+'='+@Countfied+'+1 where '+ @Idfied+'='''+@Id+''''
exec(@sql) 
select @@rowcount --执行完后保存受影响的行数至变量

end
GO
/****** Object:  View [dbo].[v_TT_User]    Script Date: 05/09/2016 17:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_User]
AS
SELECT     dbo.TT_User.LoginName, dbo.TT_User.TrueName, dbo.TT_User.UserType, dbo.TT_User.Levels, dbo.TT_User.Scores, dbo.TT_User.States, dbo.TT_User.tags, 
                      dbo.TT_User.CurrentIP, dbo.TT_User.LastLoginAddr, dbo.TT_User.CurrentPort, dbo.TT_User.IsOnline, dbo.TT_User.isDeleted, dbo.TT_User.UserId, 
                      dbo.TT_AppUserInfo.AppUserInfoId, dbo.TT_AppUserInfo.Nickname, dbo.TT_AppUserInfo.ImgeUrl, dbo.TT_AppUserInfo.Phone, dbo.TT_AppUserInfo.ProvinceCode, 
                      dbo.TT_AppUserInfo.CityCode, dbo.TT_AppUserInfo.AreaCode, dbo.TT_AppUserInfo.Address, dbo.TT_AppUserInfo.CategoryId, dbo.TT_AppUserInfo.Details, 
                      dbo.TT_AppUserInfo.Longitude, dbo.TT_AppUserInfo.Latitude, dbo.TT_AppUserInfo.LocationUpdateTime, dbo.TT_AppUserInfo.[References], 
                      dbo.TT_AppUserInfo.ReferencesId, dbo.TT_User.CreateTime
FROM         dbo.TT_User INNER JOIN
                      dbo.TT_AppUserInfo ON dbo.TT_User.UserId = dbo.TT_AppUserInfo.UserId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[12] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TT_User"
            Begin Extent = 
               Top = 31
               Left = 158
               Bottom = 356
               Right = 315
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_AppUserInfo"
            Begin Extent = 
               Top = 0
               Left = 781
               Bottom = 371
               Right = 967
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_User'
GO
/****** Object:  View [dbo].[v_TT_Shop]    Script Date: 05/09/2016 17:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_Shop]
AS
SELECT     dbo.TT_Shop.*, dbo.TT_User.LoginName, dbo.TT_User.TrueName, dbo.TT_User.Levels, dbo.TT_User.tags, dbo.TT_User.Scores, dbo.TT_User.IsOnline
FROM         dbo.TT_User INNER JOIN
                      dbo.TT_Shop ON dbo.TT_User.UserId = dbo.TT_Shop.UserId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[69] 4[3] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TT_User"
            Begin Extent = 
               Top = 108
               Left = 734
               Bottom = 476
               Right = 891
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_Shop"
            Begin Extent = 
               Top = 81
               Left = 227
               Bottom = 501
               Right = 382
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_Shop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_Shop'
GO
/****** Object:  StoredProcedure [dbo].[proc_SearchUserInfo]    Script Date: 05/09/2016 17:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_SearchUserInfo]
	(
		@WeiXinId varchar(50)
	)
AS

BEGIN	
	
	SELECT [Nickname]
      ,[ImgeUrl]
      ,[Phone]
      ,[ProvinceCode]
      ,[CityCode]
      ,[AreaCode]
      ,[Address]
      ,[CategoryId]
      ,[Details]
      ,[Longitude]
      ,[Latitude]
      ,[LocationUpdateTime]
      ,[References]
      ,[ReferencesId]
      ,[AddTime]
      ,[UpdateTime]
      ,[isDeleted] FROM [TireTreasureDB].[dbo].TT_AppUserInfo where UserId=(SELECT [UserId] FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_IsUserRegistered]    Script Date: 05/09/2016 17:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_IsUserRegistered]
	(
		@WeiXinId varchar(50)
	)
AS
BEGIN
	SELECT [WeiXinId] FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUserId]    Script Date: 05/09/2016 17:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetUserId]
	-- Add the parameters for the stored procedure here4
	(
            @WeiXinId  varchar(50)          
	)
AS
		
BEGIN
	SELECT [UserId] FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId

END
GO
