USE [master]
GO
/****** Object:  Database [TireTreasureDB]    Script Date: 05/30/2016 16:17:14 ******/
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
ALTER DATABASE [TireTreasureDB] SET AUTO_CLOSE ON
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
/****** Object:  Table [dbo].[TT_UserCard]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_UserCard](
	[CardId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Levels] [tinyint] NULL,
	[CarNo] [nvarchar](20) NULL,
	[Password] [nvarchar](40) NULL,
	[Scores] [int] NULL,
	[States] [tinyint] NULL,
	[StarTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_USERCARD] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'CardId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级（联盟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'Levels'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'CarNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分（联盟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'Scores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1开通 0 未开通 11锁定 12 失效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开卡日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'StarTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到期日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_UserCard会员卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_UserCard'
GO
SET IDENTITY_INSERT [dbo].[TT_UserCard] ON
INSERT [dbo].[TT_UserCard] ([CardId], [UserId], [Levels], [CarNo], [Password], [Scores], [States], [StarTime], [EndTime], [isDeleted]) VALUES (1, N'a3e8f66f-3552-4626-9ee2-f7ddd8b106d8', 1, N'200807042', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TT_UserCard] OFF
/****** Object:  Table [dbo].[TT_User]    Script Date: 05/30/2016 16:17:15 ******/
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
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[TT_User] ON
INSERT [dbo].[TT_User] ([UserId], [WeiXinId], [LoginName], [Password], [TrueName], [UserType], [Levels], [Scores], [States], [tags], [CurrentIP], [CurrentPort], [LastLoginAddr], [IsOnline], [CreateTime], [UpdateTime], [isDeleted], [Id]) VALUES (N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'ov0HljubVsu4mOIfZsTMry_s3CNM', N'18697923505', N'PGg6LCKx3ks=', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A60C010E20D7 AS DateTime), CAST(0x0000A60C010E20D7 AS DateTime), 0, 43)
INSERT [dbo].[TT_User] ([UserId], [WeiXinId], [LoginName], [Password], [TrueName], [UserType], [Levels], [Scores], [States], [tags], [CurrentIP], [CurrentPort], [LastLoginAddr], [IsOnline], [CreateTime], [UpdateTime], [isDeleted], [Id]) VALUES (N'e085a99b-3a98-49cb-a3e2-994540cf3f9d', N'ov0HljkR7_iqO4GXLlcGdWWNATEs', N'13333333333', N'PGg6LCKx3ks=', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A60901075008 AS DateTime), CAST(0x0000A60901075008 AS DateTime), 0, 27)
INSERT [dbo].[TT_User] ([UserId], [WeiXinId], [LoginName], [Password], [TrueName], [UserType], [Levels], [Scores], [States], [tags], [CurrentIP], [CurrentPort], [LastLoginAddr], [IsOnline], [CreateTime], [UpdateTime], [isDeleted], [Id]) VALUES (N'903b68ca-41b5-44bb-bdfe-b39286eabb3b', N'ov0HljjhdxtzoJ1IJ7lp0eq8135k', N'18577808333', N'brysjhhrhl', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A605010BCDA9 AS DateTime), CAST(0x0000A605010BCDA9 AS DateTime), 0, 24)
INSERT [dbo].[TT_User] ([UserId], [WeiXinId], [LoginName], [Password], [TrueName], [UserType], [Levels], [Scores], [States], [tags], [CurrentIP], [CurrentPort], [LastLoginAddr], [IsOnline], [CreateTime], [UpdateTime], [isDeleted], [Id]) VALUES (N'a3e8f66f-3552-4626-9ee2-f7ddd8b106d8', N'ov0HljqTXj1rzH9Bz7wqH1acKJt8', N'13481111402', N'3707954', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A608008C3793 AS DateTime), CAST(0x0000A608008C3793 AS DateTime), 0, 26)
SET IDENTITY_INSERT [dbo].[TT_User] OFF
/****** Object:  Table [dbo].[TT_TransactSnapshot]    Script Date: 05/30/2016 16:17:15 ******/
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
	[Stock] [int] NULL,
	[Sold] [int] NULL,
	[MonthlySales] [int] NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已售' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'Sold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月销' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_TransactSnapshot', @level2type=N'COLUMN',@level2name=N'MonthlySales'
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
/****** Object:  Table [dbo].[TT_Transaction]    Script Date: 05/30/2016 16:17:15 ******/
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
	[Stock] [int] NULL,
	[Sold] [int] NULL,
	[MonthlySales] [int] NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已售' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'Sold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月销' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Transaction', @level2type=N'COLUMN',@level2name=N'MonthlySales'
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
INSERT [dbo].[TT_Transaction] ([TransactionId], [ShopId], [Title], [ImageUrl], [CategoryId], [Brand], [Models], [Details], [Phone], [Price], [ProvinceCode], [CityCode], [AreaCode], [CallCount], [Praises], [Stock], [Sold], [MonthlySales], [Clicks], [CreateTime], [Versions], [UpdateTime], [States], [isValid], [isDeleted]) VALUES (N'f04c876e-dbd7-42fb-b6f8-13021f8a3043', N'ec647ef0-8ba8-4f26-8de0-e55677c401fb', N'大法师', N'http://192.168.3.112:8061/\File\\20160525034605_83ca4b25-7655-459c-b8dc-3a475df803f3.jpg', N'多少速度', N'水电费', N'fsd2', N'发的发生是发送到', N'12312312312', CAST(323.00 AS Decimal(18, 2)), N'01', N'0101', N'010101', 0, 0, NULL, NULL, NULL, 0, CAST(0x0000A61000EDD848 AS DateTime), NULL, CAST(0x0000A61000EDD848 AS DateTime), 0, 1, 0)
INSERT [dbo].[TT_Transaction] ([TransactionId], [ShopId], [Title], [ImageUrl], [CategoryId], [Brand], [Models], [Details], [Phone], [Price], [ProvinceCode], [CityCode], [AreaCode], [CallCount], [Praises], [Stock], [Sold], [MonthlySales], [Clicks], [CreateTime], [Versions], [UpdateTime], [States], [isValid], [isDeleted]) VALUES (N'f8560396-1ac3-4fc5-9898-292b444657db', N'9fe877d0-3797-4e71-8bd7-f1a7ed1bb52f', N'的沙发那部分', N'http://192.168.3.112:8061/\File\\20160525034536_e81d8dc5-4b69-4213-883f-c4458b02017f.jpg', N'水电费', N'发送到是', N' 发送到是的是的范德萨个', N'的事故发生的规定发给多少个大概都是相关地方都说过的地方更多丰富的个地方vgfdcv', N'234234543424', CAST(45353453452343.00 AS Decimal(18, 2)), N'01', N'0101', N'010101', 0, 0, NULL, NULL, NULL, 0, CAST(0x0000A61000FC2C40 AS DateTime), NULL, CAST(0x0000A61000FC2C40 AS DateTime), 0, 1, 0)
INSERT [dbo].[TT_Transaction] ([TransactionId], [ShopId], [Title], [ImageUrl], [CategoryId], [Brand], [Models], [Details], [Phone], [Price], [ProvinceCode], [CityCode], [AreaCode], [CallCount], [Praises], [Stock], [Sold], [MonthlySales], [Clicks], [CreateTime], [Versions], [UpdateTime], [States], [isValid], [isDeleted]) VALUES (N'c419d105-f783-4926-87c9-9e4dd432a11c', N'c419d105-f783-4926-87c9-9e4dd432a21c', N'吃的', N'http://192.168.3.223:82/\FileTransact\20160518034928_129368a5-0655-486c-8d08-932fed8184fa.jpg', NULL, NULL, NULL, N'哈哈喽喽', N'11', CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 200, 120, 100, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TT_Transaction] ([TransactionId], [ShopId], [Title], [ImageUrl], [CategoryId], [Brand], [Models], [Details], [Phone], [Price], [ProvinceCode], [CityCode], [AreaCode], [CallCount], [Praises], [Stock], [Sold], [MonthlySales], [Clicks], [CreateTime], [Versions], [UpdateTime], [States], [isValid], [isDeleted]) VALUES (N'630a221f-30a1-465b-90cf-b1154ed2c21d', N'7d4dc03a-f490-46c2-8a34-693bd5cf7796', N'说法的算法阿斯蒂芬', N'http://192.168.3.112:8061/\File\\20160525041201_5d3647ef-092b-4d6c-a738-7be0985010f7.jpg', N'爽肤水', N'发啥呆', N'大2', N'威尔刚分手费我问他提供的  按时', N'223232322322', CAST(234223232323.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, CAST(0x0000A611010B2FDF AS DateTime), NULL, CAST(0x0000A611010B2FDF AS DateTime), 0, 1, 0)
INSERT [dbo].[TT_Transaction] ([TransactionId], [ShopId], [Title], [ImageUrl], [CategoryId], [Brand], [Models], [Details], [Phone], [Price], [ProvinceCode], [CityCode], [AreaCode], [CallCount], [Praises], [Stock], [Sold], [MonthlySales], [Clicks], [CreateTime], [Versions], [UpdateTime], [States], [isValid], [isDeleted]) VALUES (N'b5e64217-14e3-4e3d-9b51-c780746cab51', N'3f52d3eb-b953-4324-9a11-c49f5807a09a', N'标题1', N'http://192.168.3.112:8061/\File\\20160525034622_4a1bc434-4d55-414c-bc43-559c5f4b4d97.jpg', N'物品', N'xx牌', N'demo-1.0', N'水电费水电费是是的个多少是的的大哥发的噶个按公司大多数个', N'133xxxxxxxxxx', CAST(2323423.00 AS Decimal(18, 2)), N'01', N'0101', N'010102', 0, 0, 200, 120, 100, 0, CAST(0x0000A61000B8CDC4 AS DateTime), 34, CAST(0x0000A61000B8CDC4 AS DateTime), 0, 1, 0)
/****** Object:  Table [dbo].[TT_ShopAppUser]    Script Date: 05/30/2016 16:17:15 ******/
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
INSERT [dbo].[TT_ShopAppUser] ([ShopUserId], [ShopId], [UserId], [WeiXinId], [UserType], [Levels], [Scores], [CreateTime], [UpdateTime], [States], [isDeleted]) VALUES (N'24195334-cf54-4ac9-bc03-28c6027a8ee7', N'c419d105-f783-4926-87c9-9e4dd432a21c', N'a3e8f66f-3552-4626-9ee2-f7ddd8b106d8', N'ov0HljqTXj1rzH9Bz7wqH1acKJt8', 1, 0, 0, CAST(0x0000A60B00ADA196 AS DateTime), CAST(0x0000A60B00ADA252 AS DateTime), 0, 0)
INSERT [dbo].[TT_ShopAppUser] ([ShopUserId], [ShopId], [UserId], [WeiXinId], [UserType], [Levels], [Scores], [CreateTime], [UpdateTime], [States], [isDeleted]) VALUES (N'c419d105-f783-4926-87c7-9e4dd432a51c', N'c419d105-f783-4926-87c9-9e4dd432a21c', N'a3e8f66f-3552-4626-9ee2-f7ddd8b106d8', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[TT_ShopAppUser] ([ShopUserId], [ShopId], [UserId], [WeiXinId], [UserType], [Levels], [Scores], [CreateTime], [UpdateTime], [States], [isDeleted]) VALUES (N'9981a08d-99be-4a66-8a85-d31b12b4f836', N'c419d105-f783-4926-87c9-9e4dd432a21c', N'27562ccb-cfab-4e75-ab16-b62a96c14317', N'ov0HljubVsu4mOIfZsTMry_s3CNM', 1, 0, 0, CAST(0x0000A60B01115303 AS DateTime), CAST(0x0000A60B0111533A AS DateTime), 0, 0)
INSERT [dbo].[TT_ShopAppUser] ([ShopUserId], [ShopId], [UserId], [WeiXinId], [UserType], [Levels], [Scores], [CreateTime], [UpdateTime], [States], [isDeleted]) VALUES (N'65ffbfc4-d5de-49a3-8d7b-edd062e7f824', N'c419d105-f783-4926-87c9-9e4dd432a21c', N'a3e8f66f-3552-4626-9ee2-f7ddd8b106d8', N'ov0HljqTXj1rzH9Bz7wqH1acKJt8', 1, 0, 0, CAST(0x0000A60B00AE0D8F AS DateTime), CAST(0x0000A60B00AE0D8F AS DateTime), 0, 0)
/****** Object:  Table [dbo].[TT_Shop]    Script Date: 05/30/2016 16:17:15 ******/
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
INSERT [dbo].[TT_Shop] ([ShopId], [UserId], [TName], [ImageUrlMax], [ImageUrl], [Star], [Phone], [Details], [CategoryId], [CreateMan], [ProvinceCode], [CityCode], [AreaCode], [Address], [CallCount], [Praises], [Clicks], [CreateTime], [UpdateTime], [Longitude], [Latitude], [States], [isDeleted]) VALUES (N'fd67097e-2ae1-4602-a184-095042a1b835', N'e085a99b-3a98-49cb-a3e2-994540cf3f9d', N'1', N'http://www.jslover.com/demo/pano2016/', NULL, 2, N'3', N'<p>wewewe&nbsp;</p>', N'11', NULL, N'01', N'0101', N'010101', N'32', NULL, NULL, NULL, CAST(0x0000A603012A4634 AS DateTime), CAST(0x0000A603012A4634 AS DateTime), 108.321465, 22.832497, 2, 0)
INSERT [dbo].[TT_Shop] ([ShopId], [UserId], [TName], [ImageUrlMax], [ImageUrl], [Star], [Phone], [Details], [CategoryId], [CreateMan], [ProvinceCode], [CityCode], [AreaCode], [Address], [CallCount], [Praises], [Clicks], [CreateTime], [UpdateTime], [Longitude], [Latitude], [States], [isDeleted]) VALUES (N'c419d105-f783-4926-87c9-9e4dd432a21c', N'a3e8f66f-3552-4626-9ee2-f7ddd8b106d8', N'小田的店', N'http://www.jslover.com/demo/pano2016/', N'http://192.168.3.223:82/\File\20160512121050_303517be-ee95-4b80-9dae-06379dbd5704.jpg', 4, N'6', N'<p><span style="BACKGROUND-COLOR: #4bacc6">23232323&nbsp;</span></p>', N'13', NULL, N'01', N'0101', N'010101', N'广西南宁市', NULL, NULL, NULL, CAST(0x0000A60400C8E290 AS DateTime), CAST(0x0000A60400C8E290 AS DateTime), 108.321465, 22.832497, 2, 0)
/****** Object:  Table [dbo].[TT_Reservation]    Script Date: 05/30/2016 16:17:15 ******/
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
/****** Object:  Table [dbo].[TT_RequestFriends]    Script Date: 05/30/2016 16:17:15 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1添加成功 0 拒绝 11关闭 2申请中）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_RequestFriends', @level2type=N'COLUMN',@level2name=N'States'
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
/****** Object:  Table [dbo].[TT_References]    Script Date: 05/30/2016 16:17:15 ******/
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
/****** Object:  Table [dbo].[TT_MissionsApply]    Script Date: 05/30/2016 16:17:15 ******/
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
/****** Object:  Table [dbo].[TT_Missions]    Script Date: 05/30/2016 16:17:15 ******/
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
INSERT [dbo].[TT_Missions] ([MissionId], [UserId], [ProvinceCode], [CityCode], [AreaCode], [CategoryId], [Titles], [Details], [Address], [Longitude], [Latitude], [MoneyReward], [States], [SpendTime], [SpendHours], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'8c0856b1-e9fd-4ef4-89a5-0cad1d5ac620', N'd0250b2c-7a0c-4715-bbca-e0d9c9403924', N'广西', N'南宁', N'西乡塘', N'1231', N'以旧换新', N'jsdkyfhsdhfweliuhreshfkjsdhfdsjhfkjsdhlfsdjhfjksdhfjksdhfjkdshfksjadhfjdskhfsdjkfhsjdakhfjdskhfskdhfsdkjhfsadkjlfhsad', N'广西省南宁市青秀区', 108.369991, 22.834862, CAST(100.00 AS Decimal(18, 2)), 0, CAST(0x0000A602003CA9B0 AS DateTime), 1, CAST(0x0000A602003CA9B0 AS DateTime), CAST(0x0000A602003CA9B0 AS DateTime), 1, 1)
INSERT [dbo].[TT_Missions] ([MissionId], [UserId], [ProvinceCode], [CityCode], [AreaCode], [CategoryId], [Titles], [Details], [Address], [Longitude], [Latitude], [MoneyReward], [States], [SpendTime], [SpendHours], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'e57cb9e2-46a5-4a23-9ad7-66e04c4a1694', N'c609fc1c-df5b-4b3e-9eb3-89c8834c8bb8', N'广西', N'南宁', N'琅东区', N'123321', N'二恶第三方士大夫似的', N'发多少个地方地方 ', N'广西省南宁市青秀区', 108.369991, 22.834862, CAST(343.00 AS Decimal(18, 2)), 0, CAST(0x0000A602003CA9B0 AS DateTime), 1, CAST(0x0000A602003CA9B0 AS DateTime), CAST(0x0000A602003CA9B0 AS DateTime), 0, 0)
/****** Object:  Table [dbo].[TT_Messages]    Script Date: 05/30/2016 16:17:15 ******/
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
/****** Object:  Table [dbo].[TT_Levels]    Script Date: 05/30/2016 16:17:15 ******/
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
SET IDENTITY_INSERT [dbo].[TT_Levels] ON
INSERT [dbo].[TT_Levels] ([LevelsId], [TName], [Levels], [Scores], [Details], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (1, N'菜鸟会员', 1, 100, N'双方粉丝大师的', CAST(0x0000A60C00F63693 AS DateTime), CAST(0x0000A60C00F63693 AS DateTime), 1, 0)
INSERT [dbo].[TT_Levels] ([LevelsId], [TName], [Levels], [Scores], [Details], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (2, N'老鸟', 2, 300, N'都是发的所发生的', CAST(0x0000A60C00F95168 AS DateTime), CAST(0x0000A60C00F95168 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[TT_Levels] OFF
/****** Object:  Table [dbo].[TT_InsuranItermSeel]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_InsuranItermSeel](
	[ItermSeelId] [int] IDENTITY(1,1) NOT NULL,
	[TName] [nvarchar](50) NULL,
	[Orders] [int] NULL,
	[SCode] [varchar](10) NULL,
	[Rates] [float] NULL,
	[Formula] [varchar](50) NULL,
	[ClaimAmount] [nvarchar](100) NULL,
	[Describe] [nvarchar](50) NULL,
	[Details] [nvarchar](500) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_INSURANITERMSEEL] PRIMARY KEY CLUSTERED 
(
	[ItermSeelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'ItermSeelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'SCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'Formula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赔附额度(多个'' | ''分开)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'ClaimAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'Describe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_InsuranItermSeel 保险项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranItermSeel'
GO
SET IDENTITY_INSERT [dbo].[TT_InsuranItermSeel] ON
INSERT [dbo].[TT_InsuranItermSeel] ([ItermSeelId], [TName], [Orders], [SCode], [Rates], [Formula], [ClaimAmount], [Describe], [Details], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (3, N'xx高利贷', NULL, N'0000001', 8989898, N'1+1', N'1', N'高利贷', N'高利贷', CAST(0x0000A60C00971802 AS DateTime), CAST(0x0000A60C009718A4 AS DateTime), 1, 0)
INSERT [dbo].[TT_InsuranItermSeel] ([ItermSeelId], [TName], [Orders], [SCode], [Rates], [Formula], [ClaimAmount], [Describe], [Details], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (4, N'水电费', NULL, N'223', 2333, N'1-1', N'23213', N'梵蒂冈地方生产相关', N'他个人情人都是vcb', CAST(0x0000A60C009AFE90 AS DateTime), CAST(0x0000A60C009AFF04 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[TT_InsuranItermSeel] OFF
/****** Object:  Table [dbo].[TT_InsuranIterm]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_InsuranIterm](
	[InsuranItermId] [bigint] IDENTITY(1,1) NOT NULL,
	[InsuranId] [uniqueidentifier] NOT NULL,
	[ItermSeelId] [int] NULL,
	[itemCost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TT_INSURANITERM] PRIMARY KEY CLUSTERED 
(
	[InsuranItermId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranIterm', @level2type=N'COLUMN',@level2name=N'InsuranItermId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranIterm', @level2type=N'COLUMN',@level2name=N'InsuranId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险项Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranIterm', @level2type=N'COLUMN',@level2name=N'ItermSeelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranIterm', @level2type=N'COLUMN',@level2name=N'itemCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_InsuranIterm 用户选的保险信息项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_InsuranIterm'
GO
/****** Object:  Table [dbo].[TT_InsuranCompany]    Script Date: 05/30/2016 16:17:15 ******/
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
SET IDENTITY_INSERT [dbo].[TT_InsuranCompany] ON
INSERT [dbo].[TT_InsuranCompany] ([InsuranCompanyId], [TName], [ApiUrl], [IConUrl], [Orders], [SCode], [Pkey], [Details], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (4, N'23423', N'233223fsd', NULL, 342, N'1s', N'2342ssasadw24qwe', N'sdfaes3rewrfsdafds', CAST(0x0000A60400C5CE48 AS DateTime), CAST(0x0000A60400C5CEC8 AS DateTime), 1, 0)
INSERT [dbo].[TT_InsuranCompany] ([InsuranCompanyId], [TName], [ApiUrl], [IConUrl], [Orders], [SCode], [Pkey], [Details], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (5, N'fdsa', N'rewsd32wesdx3ewds', NULL, 23, N'wersdfxc', N'fdsefdasxc', N'fadserfdsvdgafesfdfsgsdf', CAST(0x0000A60400EAFD59 AS DateTime), CAST(0x0000A60400EAFD59 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[TT_InsuranCompany] OFF
/****** Object:  Table [dbo].[TT_Insuran]    Script Date: 05/30/2016 16:17:15 ******/
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
	[CarMoney] [decimal](18, 2) NULL,
	[MCost] [decimal](18, 2) NULL,
	[DiscountCode] [decimal](18, 2) NULL,
	[Explain] [varchar](200) NULL,
	[NCode] [varchar](30) NULL,
	[InsuranMan] [nvarchar](10) NULL,
	[InsuranManIdCar] [nvarchar](20) NULL,
	[Vehicle] [nvarchar](20) NULL,
	[CarModel] [nvarchar](30) NULL,
	[LicensePlate] [nvarchar](10) NULL,
	[EngineNumber] [varchar](20) NULL,
	[CarFrameNo] [nvarchar](30) NULL,
	[RisksType] [nvarchar](30) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汽车价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CarMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'MCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折后价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'DiscountCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人办理说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'依据（单号）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被保险人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'InsuranMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被保险人身份证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'InsuranManIdCar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'Vehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厂牌型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CarModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'号牌号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'LicensePlate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发动机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'EngineNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车架号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'CarFrameNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'险别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Insuran', @level2type=N'COLUMN',@level2name=N'RisksType'
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
INSERT [dbo].[TT_Insuran] ([InsuranId], [UserId], [InsuranCompanyId], [CategoryId], [ProvinceCode], [CityCode], [AreaCode], [CarMoney], [MCost], [DiscountCode], [Explain], [NCode], [InsuranMan], [InsuranManIdCar], [Vehicle], [CarModel], [LicensePlate], [EngineNumber], [CarFrameNo], [RisksType], [Remarks], [States], [HandlePerson], [StarTime], [EndTime], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'fac024d8-5c4e-463d-b871-e33c38382ebe', N'c609fc1c-df5b-4b3e-9eb3-89c8834c8bb8', 4, N'1', N'广西', N'南宁', N'西乡塘', NULL, NULL, CAST(5000.00 AS Decimal(18, 2)), N'fsdfsdfsdfasdfsfdsfdsf', N'24213ew', N'大大', N'234567434567865435', N'大多数', N'3223', N'桂A123213', N'32423432', N'21321', N'1', N'电饭锅电饭锅读书法萨芬撒打发斯蒂芬', 2, N'大大', CAST(0x0000A60800214FBC AS DateTime), CAST(0x0000A75300214FBC AS DateTime), CAST(0x0000A60800214FBC AS DateTime), CAST(0x0000A60800214FBC AS DateTime), 1, 0)
/****** Object:  Table [dbo].[TT_FundPerSon]    Script Date: 05/30/2016 16:17:15 ******/
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
INSERT [dbo].[TT_FundPerSon] ([FundPerSonId], [UserId], [FundInfoId], [HScores], [StarTime], [EndTime], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'a97d8b80-889c-40ac-b1dd-272cfa5ebcca', N'73035ad8-5fb9-4d46-82fd-0153d48fef55', N'e8bbc10d-c92b-4551-8501-e5dc69085aa8', CAST(150.00 AS Decimal(18, 2)), CAST(0x0000A6040075A8B4 AS DateTime), CAST(0x0000A6040075A8B4 AS DateTime), CAST(0x0000A6040075A8B4 AS DateTime), CAST(0x0000A6040075A8B4 AS DateTime), 1, 0)
INSERT [dbo].[TT_FundPerSon] ([FundPerSonId], [UserId], [FundInfoId], [HScores], [StarTime], [EndTime], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'87ae4012-9ac4-4109-8e5a-32bdd92c18c2', N'73035ad8-5fb9-4d46-82fd-0153d48fef55', N'fa558c99-f967-4cf6-8ad4-c2983df0d923', CAST(150.00 AS Decimal(18, 2)), CAST(0x0000A6030075A8B4 AS DateTime), CAST(0x0000A6030075A8B4 AS DateTime), CAST(0x0000A6030075A8B4 AS DateTime), CAST(0x0000A6030075A8B4 AS DateTime), 1, 0)
INSERT [dbo].[TT_FundPerSon] ([FundPerSonId], [UserId], [FundInfoId], [HScores], [StarTime], [EndTime], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'9f66d948-f0d5-4c16-81b7-3a480f11f64d', N'73035ad8-5fb9-4d46-82fd-0153d48fef55', N'9c8f4a0f-f503-45c0-82bd-285699bae1c0', CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A6030075A8B4 AS DateTime), CAST(0x0000A6030075A8B4 AS DateTime), CAST(0x0000A6030075A8B4 AS DateTime), CAST(0x0000A6030075A8B4 AS DateTime), 1, 0)
/****** Object:  Table [dbo].[TT_FundInfo]    Script Date: 05/30/2016 16:17:15 ******/
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
INSERT [dbo].[TT_FundInfo] ([FundInfoId], [TName], [SCode], [IConUrl], [Orders], [NeedScores], [Scores], [Summarys], [Details], [StarTime], [EndTime], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'ce18c221-609c-4df4-a94c-0023aff5597b', N'范德萨的', N'f321', NULL, NULL, CAST(12.00 AS Decimal(18, 2)), CAST(66.00 AS Decimal(18, 2)), N'而是打发似的收到收到', N'发生的士大夫但是过分的施工费多少的所发生的收到是多少发是否是给对方地方地方大幅度  地方大 嘎但是大概地方dsa', CAST(0x0000A60900000000 AS DateTime), CAST(0x0000A617018B80D4 AS DateTime), CAST(0x0000A60300AD6BEC AS DateTime), CAST(0x0000A60300AD6EF3 AS DateTime), 1, 0)
INSERT [dbo].[TT_FundInfo] ([FundInfoId], [TName], [SCode], [IConUrl], [Orders], [NeedScores], [Scores], [Summarys], [Details], [StarTime], [EndTime], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'4568d160-5a77-4649-9781-40e6fbfce6dc', N'而投入近', N'saf232342', NULL, NULL, CAST(3232.00 AS Decimal(18, 2)), CAST(3243221.00 AS Decimal(18, 2)), N'是打发第三方收到', N'是德国和高科技和规范的时代风格和', CAST(0x0000A60300000000 AS DateTime), CAST(0x0000A61100000000 AS DateTime), CAST(0x0000A60300E0FD0C AS DateTime), CAST(0x0000A60300E0FD0C AS DateTime), 1, 0)
INSERT [dbo].[TT_FundInfo] ([FundInfoId], [TName], [SCode], [IConUrl], [Orders], [NeedScores], [Scores], [Summarys], [Details], [StarTime], [EndTime], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (N'a464590b-5c41-4052-8d63-c5255e2dd862', N'的发送到发生的士大夫', N'v32423', NULL, NULL, CAST(23423423.00 AS Decimal(18, 2)), CAST(32544534343434.00 AS Decimal(18, 2)), N'43提供的三个都是的地方公司的大概d', N' 打算规定啊个个都是嘎但是干啥干啥都是嘎嘎是是爱的', CAST(0x0000A61000ADC334 AS DateTime), CAST(0x0000A61600ADC6B8 AS DateTime), CAST(0x0000A60300ADF1BC AS DateTime), CAST(0x0000A60300ADF1BC AS DateTime), 1, 0)
/****** Object:  Table [dbo].[TT_Friends]    Script Date: 05/30/2016 16:17:15 ******/
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
/****** Object:  Table [dbo].[TT_FilesTransact]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_FilesTransact](
	[FileId] [bigint] IDENTITY(1,1) NOT NULL,
	[ToId] [varchar](40) NULL,
	[ShowName] [nvarchar](100) NULL,
	[FileName] [varchar](150) NULL,
	[SourceTable] [varchar](50) NULL,
	[RelativePath] [varchar](200) NULL,
	[Route] [varchar](100) NULL,
	[Suffix] [varchar](10) NULL,
	[FileType] [nvarchar](20) NULL,
	[AddTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_FilesTransact_1] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesTransact', @level2type=N'COLUMN',@level2name=N'FileId'
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
SET IDENTITY_INSERT [dbo].[TT_FilesTransact] ON
INSERT [dbo].[TT_FilesTransact] ([FileId], [ToId], [ShowName], [FileName], [SourceTable], [RelativePath], [Route], [Suffix], [FileType], [AddTime], [isValid], [isDeleted]) VALUES (1, N'', N'16021844_1200x1000_0.jpg', N'20160518112536_ff7bfbc6-d334-4ddb-8914-e769b2bab4b2.jpg', N'TT_Shop', N'\FileTransact\20160518112536_ff7bfbc6-d334-4ddb-8914-e769b2bab4b2.jpg', N'http://192.168.3.223:82/', N'.jpg', N'图片', CAST(0x0000A60A00BC4F2C AS DateTime), 1, 0)
INSERT [dbo].[TT_FilesTransact] ([FileId], [ToId], [ShowName], [FileName], [SourceTable], [RelativePath], [Route], [Suffix], [FileType], [AddTime], [isValid], [isDeleted]) VALUES (2, N'', N'16021840_1200x1000_0.jpg', N'20160518112608_156875fb-f021-4798-bb22-4196fedf6e31.jpg', N'TT_Shop', N'\FileTransact\20160518112608_156875fb-f021-4798-bb22-4196fedf6e31.jpg', N'http://192.168.3.223:82/', N'.jpg', N'图片', CAST(0x0000A60A00BC7421 AS DateTime), 1, 0)
INSERT [dbo].[TT_FilesTransact] ([FileId], [ToId], [ShowName], [FileName], [SourceTable], [RelativePath], [Route], [Suffix], [FileType], [AddTime], [isValid], [isDeleted]) VALUES (3, N'', N'16021844_1200x1000_0.jpg', N'20160518034253_79653455-6c96-43fe-beee-3e1c13ef5cb9.jpg', N'TT_Shop', N'\FileTransact\20160518034253_79653455-6c96-43fe-beee-3e1c13ef5cb9.jpg', N'http://192.168.3.223:82/', N'.jpg', N'图片', CAST(0x0000A60A0102F97E AS DateTime), 1, 0)
INSERT [dbo].[TT_FilesTransact] ([FileId], [ToId], [ShowName], [FileName], [SourceTable], [RelativePath], [Route], [Suffix], [FileType], [AddTime], [isValid], [isDeleted]) VALUES (4, N'', N'16021840_1200x1000_0.jpg', N'20160518034301_78c832b5-ca1f-48ef-a756-7fa9a6e7b8da.jpg', N'TT_Shop', N'\FileTransact\20160518034301_78c832b5-ca1f-48ef-a756-7fa9a6e7b8da.jpg', N'http://192.168.3.223:82/', N'.jpg', N'图片', CAST(0x0000A60A010302D7 AS DateTime), 1, 0)
INSERT [dbo].[TT_FilesTransact] ([FileId], [ToId], [ShowName], [FileName], [SourceTable], [RelativePath], [Route], [Suffix], [FileType], [AddTime], [isValid], [isDeleted]) VALUES (5, N'c419d105-f783-4926-87c9-9e4dd432a21c', N'16021840_1200x1000_0.jpg', N'20160518034834_3db5cd1f-a0a4-4fa3-8527-ed0339e45ccb.jpg', N'TT_Shop', N'\FileTransact\20160518034834_3db5cd1f-a0a4-4fa3-8527-ed0339e45ccb.jpg', N'http://192.168.3.223:82/', N'.jpg', N'图片', CAST(0x0000A60A010488C0 AS DateTime), 1, 0)
INSERT [dbo].[TT_FilesTransact] ([FileId], [ToId], [ShowName], [FileName], [SourceTable], [RelativePath], [Route], [Suffix], [FileType], [AddTime], [isValid], [isDeleted]) VALUES (6, N'c419d105-f783-4926-87c9-9e4dd432a21c', N'16021844_1200x1000_0.jpg', N'20160518034928_129368a5-0655-486c-8d08-932fed8184fa.jpg', N'TT_Shop', N'\FileTransact\20160518034928_129368a5-0655-486c-8d08-932fed8184fa.jpg', N'http://192.168.3.223:82/', N'.jpg', N'图片', CAST(0x0000A60A0104C878 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[TT_FilesTransact] OFF
/****** Object:  Table [dbo].[TT_FilesInsuran]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_FilesInsuran](
	[FileId] [bigint] IDENTITY(1,1) NOT NULL,
	[ToId] [varchar](40) NULL,
	[ShowName] [nvarchar](100) NULL,
	[FileName] [varchar](150) NULL,
	[SourceTable] [varchar](50) NULL,
	[RelativePath] [varchar](200) NULL,
	[Route] [varchar](100) NULL,
	[Suffix] [varchar](10) NULL,
	[FileType] [nvarchar](20) NULL,
	[AddTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_FilesInsuran_1] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_FilesInsuran', @level2type=N'COLUMN',@level2name=N'FileId'
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
/****** Object:  Table [dbo].[TT_Files]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_Files](
	[FileId] [bigint] IDENTITY(1,1) NOT NULL,
	[ToId] [varchar](40) NULL,
	[ShowName] [nvarchar](100) NULL,
	[FileName] [varchar](150) NULL,
	[SourceTable] [varchar](50) NULL,
	[RelativePath] [varchar](200) NULL,
	[Route] [varchar](100) NULL,
	[Suffix] [varchar](10) NULL,
	[FileType] [nvarchar](20) NULL,
	[AddTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_Files] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'FileId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所禹对象Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'ToId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'ShowName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源表（某个数据表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'SourceTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相对路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'RelativePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'Suffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件属性类型（中文）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'FileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_Files', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
/****** Object:  Table [dbo].[TT_CostRecord]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_CostRecord](
	[CostRecordId] [uniqueidentifier] NOT NULL,
	[TransactionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[ShopId] [uniqueidentifier] NULL,
	[Explain] [nvarchar](100) NULL,
	[UserName] [nvarchar](10) NULL,
	[CodeTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TT_COSTRECORD] PRIMARY KEY CLUSTERED 
(
	[CostRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'CostRecordId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品(服务Id)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'TransactionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店面Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'ShopId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'CodeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TT_CostRecord 消费记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TT_CostRecord'
GO
/****** Object:  Table [dbo].[TT_Config]    Script Date: 05/30/2016 16:17:15 ******/
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
/****** Object:  Table [dbo].[TT_CommentT]    Script Date: 05/30/2016 16:17:15 ******/
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
/****** Object:  Table [dbo].[TT_AppUserInfo]    Script Date: 05/30/2016 16:17:15 ******/
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
INSERT [dbo].[TT_AppUserInfo] ([AppUserInfoId], [UserId], [Nickname], [ImgeUrl], [Phone], [ProvinceCode], [CityCode], [AreaCode], [Address], [CategoryId], [Details], [Longitude], [Latitude], [LocationUpdateTime], [References], [ReferencesId], [AddTime], [UpdateTime], [isDeleted]) VALUES (N'df5fd93e-8026-42bb-8548-0438bda29df8', N'e085a99b-3a98-49cb-a3e2-994540cf3f9d', N'', N'http://wx.qlogo.cn/mmopen/JVDECnNjedGRicGjQ93ibEMNT0R21c1IqW01LCmF18E2icXNWyjkQPpic4FBPjwgebicvhJksOLfN55axPa5ib2qdicfnjXEDDXZgbD/0', N'13333333333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00000000-0000-0000-0000-000000000000', CAST(0x0000A60901075008 AS DateTime), CAST(0x0000A60901075008 AS DateTime), 0)
INSERT [dbo].[TT_AppUserInfo] ([AppUserInfoId], [UserId], [Nickname], [ImgeUrl], [Phone], [ProvinceCode], [CityCode], [AreaCode], [Address], [CategoryId], [Details], [Longitude], [Latitude], [LocationUpdateTime], [References], [ReferencesId], [AddTime], [UpdateTime], [isDeleted]) VALUES (N'0ece7240-b015-42ff-b2e2-073c0283d7b2', N'a3e8f66f-3552-4626-9ee2-f7ddd8b106d8', N'秋刀鱼', N'http://wx.qlogo.cn/mmopen/JVDECnNjedER6aeZggdjvBg4f5lyVoeQ9jZLxnfHXrRzn3B6ADsVLnSbTiaQ5ZwFbBumFUz9e7R3agCcuCWj2Ds7mnzn1rxrs/0', N'13481111402', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00000000-0000-0000-0000-000000000000', CAST(0x0000A608008C3793 AS DateTime), CAST(0x0000A608008C3793 AS DateTime), 0)
INSERT [dbo].[TT_AppUserInfo] ([AppUserInfoId], [UserId], [Nickname], [ImgeUrl], [Phone], [ProvinceCode], [CityCode], [AreaCode], [Address], [CategoryId], [Details], [Longitude], [Latitude], [LocationUpdateTime], [References], [ReferencesId], [AddTime], [UpdateTime], [isDeleted]) VALUES (N'6d1d7062-1a92-4e8e-8f84-1fb90283d118', N'903b68ca-41b5-44bb-bdfe-b39286eabb3b', N'愛拚ォ哙↘赢', N'http://wx.qlogo.cn/mmopen/xGNLibSyicGrrCnsKzsPficHSdL2xkxVySNxxN8MmFNDDZMIqeuoKMsgUiaMj4Y5ibc0c3mjJUGK96cwduCM5XhhaL44wtxicRibh0G/0', N'18577808333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00000000-0000-0000-0000-000000000000', CAST(0x0000A605010BCDA9 AS DateTime), CAST(0x0000A605010BCDA9 AS DateTime), 0)
INSERT [dbo].[TT_AppUserInfo] ([AppUserInfoId], [UserId], [Nickname], [ImgeUrl], [Phone], [ProvinceCode], [CityCode], [AreaCode], [Address], [CategoryId], [Details], [Longitude], [Latitude], [LocationUpdateTime], [References], [ReferencesId], [AddTime], [UpdateTime], [isDeleted]) VALUES (N'96eefd0f-4ddf-4122-b507-3327b83bc2c8', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'啊啊啊啊', N'http://wx.qlogo.cn/mmopen/xGNLibSyicGrpBFcNXX8WvXocngBuAN88A4MQNYgOMiaaxfS39Q2Hf8PFkiaTY4oxR7PbBiaBv0EIuBclbibgJyaORiaZ5YKBbYiaM6X/0', N'18697923505', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00000000-0000-0000-0000-000000000000', CAST(0x0000A60C010E20D7 AS DateTime), CAST(0x0000A60C010E20D7 AS DateTime), 0)
/****** Object:  Table [dbo].[SysItem]    Script Date: 05/30/2016 16:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [varchar](20) NULL,
	[ItemValue] [varchar](100) NULL,
	[ItemName] [nvarchar](200) NULL,
	[Icon] [varchar](100) NULL,
	[OrderID] [int] NULL,
	[Remark] [nvarchar](100) NULL,
	[CreateTime] [varchar](20) NULL,
	[CreateMan] [varchar](30) NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_SysItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'ItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'ItemValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Icon' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreateMan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'CreateMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysItem', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
SET IDENTITY_INSERT [dbo].[SysItem] ON
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (1, N'RequestFriendsStates', N'0', N'拒绝', NULL, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (2, N'RequestFriendsStates', N'1', N'成功', NULL, 1, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (3, N'RequestFriendsStates', N'2', N'申请中', NULL, 4, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (4, N'RequestFriendsStates', N'11', N'关闭', NULL, 2, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[SysItem] OFF
/****** Object:  StoredProcedure [dbo].[sp_public_SetFiedValue]    Script Date: 05/30/2016 16:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ld
-- Create date: 20160127
-- Description:	更新某一列的值
-- =============================================
CREATE PROCEDURE [dbo].[sp_public_SetFiedValue]
	(@tableName NVARCHAR(200),      ----要显示的表或多个表的连接
	@Idfied NVARCHAR(200),      ----id或列名称
	@IdSet NVARCHAR(1000),      ----id集，","号隔开如："3","4"
	@fied NVARCHAR(200),      ----列名称
	@value NVARCHAR(1000)      ----值
	)
AS
Declare @sql NVARCHAR(1000)    ----存放动态生成的SQL语句
BEGIN
SET @sql = ' update  '+@tableName +' set '+@fied+'='''+@value+''' where '+ @Idfied+' in ('+@IdSet+')'
exec(@sql) 
select @@rowcount --执行完后保存受影响的行数至变量

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PaginationEx]    Script Date: 05/30/2016 16:17:16 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_DelForSetDelete]    Script Date: 05/30/2016 16:17:16 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_CountOne]    Script Date: 05/30/2016 16:17:16 ******/
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
/****** Object:  View [dbo].[v_TT_UserCard]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_UserCard]
AS
SELECT     dbo.TT_UserCard.CardId, dbo.TT_UserCard.UserId, dbo.TT_UserCard.Levels, dbo.TT_UserCard.CarNo, dbo.TT_UserCard.Password, dbo.TT_UserCard.Scores, 
                      dbo.TT_UserCard.States, dbo.TT_UserCard.StarTime, dbo.TT_UserCard.EndTime, dbo.TT_UserCard.isDeleted, b.UMoney, dbo.TT_AppUserInfo.Nickname, 
                      dbo.TT_Levels.Details
FROM         dbo.TT_Levels RIGHT OUTER JOIN
                      dbo.TT_UserCard ON dbo.TT_Levels.Levels = dbo.TT_UserCard.Levels LEFT OUTER JOIN
                      dbo.TT_AppUserInfo ON dbo.TT_UserCard.UserId = dbo.TT_AppUserInfo.UserId LEFT OUTER JOIN
                      TireMoneyDB.dbo.TM_Balce AS b ON dbo.TT_AppUserInfo.UserId = b.USId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[3] 2[25] 3) )"
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
         Begin Table = "TT_AppUserInfo"
            Begin Extent = 
               Top = 34
               Left = 387
               Bottom = 350
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_UserCard"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 225
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 34
               Left = 860
               Bottom = 347
               Right = 1006
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_Levels"
            Begin Extent = 
               Top = 168
               Left = 248
               Bottom = 388
               Right = 394
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_UserCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_UserCard'
GO
/****** Object:  View [dbo].[v_TT_User]    Script Date: 05/30/2016 16:17:17 ******/
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
/****** Object:  View [dbo].[v_TT_Shop]    Script Date: 05/30/2016 16:17:17 ******/
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
/****** Object:  View [dbo].[v_TT_RequestFriends]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_RequestFriends]
AS
SELECT     dbo.TT_AppUserInfo.Nickname, dbo.TT_AppUserInfo.ImgeUrl, dbo.TT_RequestFriends.ToUserId, dbo.TT_RequestFriends.States, dbo.SysItem.ItemName AS StatesName
FROM         dbo.TT_RequestFriends INNER JOIN
                      dbo.TT_AppUserInfo ON dbo.TT_RequestFriends.UserId = dbo.TT_AppUserInfo.UserId LEFT OUTER JOIN
                      dbo.SysItem ON dbo.TT_RequestFriends.States = dbo.SysItem.ItemValue
WHERE     (dbo.SysItem.ItemType = 'RequestFriendsStates')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[6] 2[17] 3) )"
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
         Begin Table = "TT_RequestFriends"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_AppUserInfo"
            Begin Extent = 
               Top = 0
               Left = 836
               Bottom = 206
               Right = 1022
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SysItem"
            Begin Extent = 
               Top = 61
               Left = 419
               Bottom = 317
               Right = 563
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_RequestFriends'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_RequestFriends'
GO
/****** Object:  View [dbo].[v_TT_Missions]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_Missions]
AS
SELECT     dbo.TT_Missions.ProvinceCode, dbo.TT_Missions.CityCode, dbo.TT_Missions.AreaCode, dbo.TT_Missions.CategoryId, dbo.TT_Missions.Titles, 
                      dbo.TT_Missions.Details, dbo.TT_Missions.Address, dbo.TT_Missions.Longitude, dbo.TT_Missions.Latitude, dbo.TT_Missions.MoneyReward, 
                      dbo.TT_Missions.SpendTime, dbo.TT_Missions.States, dbo.TT_Missions.SpendHours, dbo.TT_Missions.CreateTime, dbo.TT_Missions.UpdateTime, 
                      dbo.TT_Missions.isValid, dbo.TT_Missions.isDeleted, dbo.TT_User.LoginName, dbo.TT_User.TrueName, dbo.TT_User.UserType, dbo.TT_User.Levels, 
                      dbo.TT_User.Scores, dbo.TT_User.States AS Expr1, dbo.TT_Missions.MissionId
FROM         dbo.TT_Missions LEFT OUTER JOIN
                      dbo.TT_User ON dbo.TT_Missions.UserId = dbo.TT_User.UserId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "TT_Missions"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_User"
            Begin Extent = 
               Top = 6
               Left = 234
               Bottom = 125
               Right = 391
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_Missions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_Missions'
GO
/****** Object:  View [dbo].[v_TT_Insurance]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_Insurance]
AS
SELECT     dbo.TT_Insuran.CategoryId, dbo.TT_Insuran.ProvinceCode, dbo.TT_Insuran.CityCode, dbo.TT_Insuran.AreaCode, dbo.TT_Insuran.MCost, dbo.TT_Insuran.Explain, 
                      dbo.TT_Insuran.NCode, dbo.TT_Insuran.InsuranMan, dbo.TT_Insuran.CarModel, dbo.TT_Insuran.LicensePlate, dbo.TT_Insuran.EngineNumber, 
                      dbo.TT_Insuran.RisksType, dbo.TT_Insuran.CarFrameNo, dbo.TT_Insuran.Remarks, dbo.TT_Insuran.States, dbo.TT_Insuran.HandlePerson, dbo.TT_Insuran.StarTime, 
                      dbo.TT_Insuran.EndTime, dbo.TT_Insuran.CreateTime, dbo.TT_Insuran.UpdateTime, dbo.TT_Insuran.isValid, dbo.TT_Insuran.isDeleted, 
                      dbo.TT_InsuranCompany.TName, dbo.TT_Insuran.InsuranCompanyId, dbo.TT_InsuranCompany.SCode, dbo.TT_Insuran.InsuranId, dbo.TT_Insuran.InsuranManIdCar, 
                      dbo.TT_Insuran.Vehicle
FROM         dbo.TT_Insuran LEFT OUTER JOIN
                      dbo.TT_InsuranCompany ON dbo.TT_Insuran.InsuranCompanyId = dbo.TT_InsuranCompany.InsuranCompanyId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "TT_Insuran"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_InsuranCompany"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 125
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 6
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_Insurance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_Insurance'
GO
/****** Object:  View [dbo].[v_TT_Fund]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_Fund]
AS
SELECT     dbo.TT_FundPerSon.FundPerSonId, dbo.TT_FundPerSon.UserId, dbo.TT_FundPerSon.FundInfoId, dbo.TT_FundPerSon.HScores, dbo.TT_FundPerSon.StarTime, 
                      dbo.TT_FundPerSon.EndTime, dbo.TT_User.UserId AS Expr1, dbo.TT_User.LoginName, dbo.TT_User.TrueName, dbo.TT_FundPerSon.CreateTime, 
                      dbo.TT_FundPerSon.UpdateTime, dbo.TT_FundPerSon.isValid, dbo.TT_FundPerSon.isDeleted
FROM         dbo.TT_FundPerSon left JOIN
                      dbo.TT_User ON dbo.TT_FundPerSon.UserId = dbo.TT_User.UserId
GO
/****** Object:  View [dbo].[v_TT_FriendsList]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TT_FriendsList]
AS
SELECT     TOP (100) PERCENT dbo.TT_Friends.UserId, dbo.TT_Friends.ToUserId, dbo.TT_AppUserInfo.Nickname, dbo.TT_AppUserInfo.ImgeUrl, dbo.TT_Friends.AddTime
FROM         dbo.TT_Friends INNER JOIN
                      dbo.TT_AppUserInfo ON dbo.TT_Friends.ToUserId = dbo.TT_AppUserInfo.UserId
ORDER BY dbo.TT_Friends.AddTime DESC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[22] 2[9] 3) )"
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
         Begin Table = "TT_Friends"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 200
               Right = 184
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "TT_AppUserInfo"
            Begin Extent = 
               Top = 6
               Left = 222
               Bottom = 196
               Right = 408
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_FriendsList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TT_FriendsList'
GO
/****** Object:  StoredProcedure [dbo].[proc_GetIdByUserId]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetIdByUserId]
	(
		@UserId uniqueidentifier
	)
AS
BEGIN
	SELECT Id FROM [TireTreasureDB].[dbo].[TT_User] where UserId=@UserId
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GeRecommendIdByWeiXinId]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GeRecommendIdByWeiXinId]
	(
		@WeiXinId varchar(50)
	)
AS
BEGIN
	SELECT Id FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUserIdByWeiXinId]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetUserIdByWeiXinId]
	(
		@WeiXinId varchar(50),
		@UserId uniqueidentifier output
	)
AS
	
BEGIN
	SELECT @UserId=UserId FROM [TireTreasureDB].[dbo].[TT_User] where  WeiXinId=@WeiXinId
	select @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUserIdByRecommendId]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetUserIdByRecommendId]
	(
		@Id bigint
	)
AS
BEGIN
	SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where Id=@Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_InsuranceHandle]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--保险申请
-- =============================================
CREATE PROCEDURE [dbo].[proc_InsuranceHandle]
(
@Number VARCHAR(50),--自定义订单编号
@Types varchar(10),--订单类型
@UOId UNIQUEIDENTIFIER,--用户id
@SOId UNIQUEIDENTIFIER,--商铺（收款人）id
@Money DECIMAL(18,0),--金额
@SaleType TINYINT,--消费类型
@Remarks VARCHAR(60),--备注
@PayType INT--支付方式
)
AS
BEGIN
	BEGIN
  DECLARE @aid BIGINT;  
  EXEC proc_produceOrderNumber @Number OUTPUT,@Types,@aid OUTPUT
  END  
	INSERT INTO TireMoneyDB.dbo.TM_OrderList( OiId , UOId ,SOId , NCode ,OMuney ,Remarks ,SaleType ,States ,PayType ,CreateTime ,PayTime ,isDeleted)
	VALUES  (NEWID() ,@UOId,@SOId , @Number ,@Money ,N''+@Remarks+'', @SaleType ,0 ,@PayType ,GETDATE() ,GETDATE() ,0 )--插入到订单表
	IF	@@ROWCOUNT>0
	BEGIN    
	UPDATE TireMoneyDB.dbo.TM_OrderNo SET NCode=@Number WHERE Id=@aid 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUserLoginNameByLoginName]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetUserLoginNameByLoginName]
	-- Add the parameters for the stored procedure here4
	(
            @LoginName  nvarchar(30)          
	)
AS
		
BEGIN
	SELECT LoginName FROM [TireTreasureDB].[dbo].[TT_User] where LoginName=@LoginName

END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUserInfoByWeiXinId]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetUserInfoByWeiXinId]
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
/****** Object:  StoredProcedure [dbo].[proc_OrderGenerate]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 生产订单号
-- =============================================
CREATE PROCEDURE [dbo].[proc_OrderGenerate]
	@CustomNumber VARCHAR(60) OUT,--自定义前缀
	@SaleType varchar(10)--订单类型

AS
	declare @AutoId BIGINT  --自增长id
BEGIN
	INSERT INTO TireMoneyDB.dbo.TM_OrderNo( NCode,Types )VALUES  ( '',@SaleType )--订单编号表插入
	SET @AutoId=IDENT_CURRENT('TireMoneyDB.dbo.TM_OrderNo')--获取自增长id
	SET @CustomNumber=@CustomNumber+(CONVERT(VARCHAR(30),@AutoId));--组装订单编号
	UPDATE TireMoneyDB.dbo.TM_OrderNo SET NCode=@CustomNumber WHERE Id=@AutoId;
	select @CustomNumber
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_NumberOfRecommend]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_NumberOfRecommend]
	(
		@WeiXinId varchar(50)
	)
AS

BEGIN	
	
	SELECT COUNT(1)
  FROM [TireTreasureDB].[dbo].[TT_References] where [States]=1 and [UserId]=(SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId)

END
GO
/****** Object:  StoredProcedure [dbo].[proc_IsOpenIdExist]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_IsOpenIdExist]
	(
		@WeiXinId varchar(50)
	)
AS
BEGIN
	SELECT WeiXinId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_IsAlreadyFriend]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_IsAlreadyFriend]
	(
		@UserWeiXinId varchar(50),
		@ToUserWeiXinId varchar(50)			
	)
AS
	declare @UserId uniqueidentifier
	declare @ToUserId uniqueidentifier
BEGIN
	EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinId] @UserWeiXinId ,@UserId output
	
	EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinId] @ToUserWeiXinId ,@ToUserId output
	
	SELECT * FROM [TireTreasureDB].[dbo].[TT_Friends] where UserId=@UserId and  ToUserId=@ToUserId 
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUserInfoBy_v_RequestFriends]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetUserInfoBy_v_RequestFriends]
	(
		@WeiXinId varchar(50)
		
	)
AS
BEGIN
	select NickName,ImgeUrl,States from [TireTreasureDB].[dbo].v_TT_RequestFriends where ToUserId=(SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId) 
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUserInfoBy_v_FriendsList]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetUserInfoBy_v_FriendsList]
	(
		@WeiXinId varchar(50)
		
	)
AS
BEGIN
	select NickName,ImgeUrl,AddTime from [TireTreasureDB].[dbo].v_TT_FriendsList where UserId=(SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId) 
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetRequestUserId]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetRequestUserId]
	(
		@WeiXinId varchar(50),		
		@States tinyint
	)
AS  
	declare @UserId uniqueidentifier 
BEGIN
	 EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinId] @WeiXinId ,@UserId output
		
	SELECT * FROM [TireTreasureDB].[dbo].[TT_RequestFriends] where UserId=@UserId  and States=@States
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UpdateRequestFriendsSates]    Script Date: 05/30/2016 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_UpdateRequestFriendsSates]
	(
		@WeiXinId varchar(50),		
		@States tinyint 
	)
AS  
	declare @toUserId uniqueidentifier 
BEGIN
	 EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinId] @WeiXinId ,@toUserId output
		
	UPDATE [TireTreasureDB].[dbo].[TT_RequestFriends] SET States=@States WHERE ToUserId=@toUserId or UserId=@toUserId
	
END
GO
