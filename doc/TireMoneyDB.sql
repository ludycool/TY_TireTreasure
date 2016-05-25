USE [master]
GO
/****** Object:  Database [TireMoneyDB]    Script Date: 05/24/2016 17:25:25 ******/
CREATE DATABASE [TireMoneyDB] ON  PRIMARY 
( NAME = N'TireMoneyDB', FILENAME = N'F:\sqlDB\TireMoneyDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TireMoneyDB_log', FILENAME = N'F:\sqlDB\TireMoneyDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TireMoneyDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TireMoneyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TireMoneyDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TireMoneyDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TireMoneyDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TireMoneyDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TireMoneyDB] SET ARITHABORT OFF
GO
ALTER DATABASE [TireMoneyDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TireMoneyDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TireMoneyDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TireMoneyDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TireMoneyDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TireMoneyDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TireMoneyDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TireMoneyDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TireMoneyDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TireMoneyDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TireMoneyDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [TireMoneyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TireMoneyDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TireMoneyDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TireMoneyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TireMoneyDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TireMoneyDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TireMoneyDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TireMoneyDB] SET  READ_WRITE
GO
ALTER DATABASE [TireMoneyDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TireMoneyDB] SET  MULTI_USER
GO
ALTER DATABASE [TireMoneyDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TireMoneyDB] SET DB_CHAINING OFF
GO
USE [TireMoneyDB]
GO
/****** Object:  Table [dbo].[TM_WaterNo]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_WaterNo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NCode] [varchar](60) NULL,
 CONSTRAINT [PK_TM_WATERNO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterNo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterNo', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_WaterNo 流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterNo'
GO
/****** Object:  Table [dbo].[TM_WaterBill]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_WaterBill](
	[BiId] [uniqueidentifier] NOT NULL,
	[UBId] [uniqueidentifier] NOT NULL,
	[FId] [uniqueidentifier] NOT NULL,
	[NCode] [varchar](30) NULL,
	[WMney] [decimal](18, 2) NULL,
	[Details] [nvarchar](30) NULL,
	[Remarks] [nvarchar](30) NULL,
	[Platform] [nvarchar](20) NULL,
	[BType] [int] NULL,
	[Years] [smallint] NULL,
	[Months] [tinyint] NULL,
	[Days] [varchar](10) NULL,
	[Weeks] [varchar](10) NULL,
	[ICons] [varchar](200) NULL,
	[CreateTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TM_WATERBILL] PRIMARY KEY CLUSTERED 
(
	[BiId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'BiId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'UBId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单号Id(转账单、付款订单、收款单、提现单)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'FId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'WMney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台（什么银行，支付宝、等）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Platform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(转账10、付款20、收款30、提现40、退款50)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'BType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Years'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Months'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月日（xx-xx）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Days'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周几' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Weeks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'ICons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_WaterBill 流水账单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill'
GO
/****** Object:  Table [dbo].[TM_TranAcc]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_TranAcc](
	[TiId] [uniqueidentifier] NOT NULL,
	[NCode] [varchar](30) NULL,
	[UTId] [uniqueidentifier] NOT NULL,
	[STId] [uniqueidentifier] NULL,
	[TureName] [nvarchar](10) NULL,
	[ACao] [varchar](30) NULL,
	[TManey] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](30) NULL,
	[States] [tinyint] NULL,
	[PayType] [tinyint] NULL,
	[CreateTime] [datetime] NULL,
	[ComeTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TM_TRANACC] PRIMARY KEY CLUSTERED 
(
	[TiId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'TiId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'UTId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对方用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'STId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对方姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'TureName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对方账户（成功换成：后 姓名加号）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'ACao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'TManey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(-1关闭 0 处理中 10已到账 )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转账方式(平台Id)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到账时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'ComeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_TranAcc 转账单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc'
GO
/****** Object:  Table [dbo].[TM_PayPlatform]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_PayPlatform](
	[PPId] [int] IDENTITY(1,1) NOT NULL,
	[TName] [nvarchar](30) NULL,
	[ApiUrl] [nvarchar](200) NULL,
	[IConUrl] [nvarchar](200) NULL,
	[Orders] [int] NULL,
	[SCode] [varchar](10) NULL,
	[Pkey] [varchar](30) NULL,
	[Details] [nvarchar](200) NULL,
	[Types] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isValid] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TM_PAYPLATFORM] PRIMARY KEY CLUSTERED 
(
	[PPId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'PPId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'ApiUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'IConUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'SCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'Pkey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(转账、购物)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'Types'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_PayPlatform 转账平台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform'
GO
SET IDENTITY_INSERT [dbo].[TM_PayPlatform] ON
INSERT [dbo].[TM_PayPlatform] ([PPId], [TName], [ApiUrl], [IConUrl], [Orders], [SCode], [Pkey], [Details], [Types], [CreateTime], [UpdateTime], [isValid], [isDeleted]) VALUES (1, N'工商银行', N'3', N'2', 1, N'001', NULL, N'咕咕是中', 0, CAST(0x0000A6020099A14C AS DateTime), CAST(0x0000A6020099A14C AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[TM_PayPlatform] OFF
/****** Object:  Table [dbo].[TM_OrderNo]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_OrderNo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NCode] [varchar](60) NULL,
	[Types] [nvarchar](10) NULL,
 CONSTRAINT [PK_TM_ORDERNO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderNo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderNo', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderNo', @level2type=N'COLUMN',@level2name=N'Types'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_OrderNo 订单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderNo'
GO
SET IDENTITY_INSERT [dbo].[TM_OrderNo] ON
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (1, N'201605171653441', N'1')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (2, N'201605181017412', N'1')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (5, N'CZ201605240949315', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (6, N'201605240949316', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (7, N'cz201605240949317', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (8, N'cz05240949318', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (9, N'cx201605240957121219', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (10, N'cx20160524095712121910', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (11, N'cx20160524095712121911', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (12, N'cx2016052409571212191112', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (13, N'cz2016052409493113', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (14, N'cz2016052409493114', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (15, N'cz2016052409493115', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (16, N'cz2016052409493116', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (17, N'CZ146408902717', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (18, N'CZ146408911518', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (19, N'CZ146408911519', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (20, N'CZ146408911520', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (21, N'CZ146408911521', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (22, N'CZ146408911522', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (23, N'CZ146408911523', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (24, N'CZ146408958424', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (25, N'CZ146408965125', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (26, N'CZ146409017526', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (27, N'CZ146409026927', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (28, N'CZ146409028728', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (29, N'CZ146409057529', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (30, N'CZ146409068230', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (31, N'CZ146409071631', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (32, N'CZ146409905532', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (33, N'CZ146410090033', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (34, N'CZ146410108134', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (35, N'CZ146410113235', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (36, N'CZ146410124736', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (37, N'CZ146410165437', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (38, N'CZ146410166838', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (39, N'CZ146410461039', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (40, N'CZ146410471440', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (41, N'CZ146410779941', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (42, N'CZ146410989942', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (43, N'CZ146410998243', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (44, N'CZ146411016644', N'10')
SET IDENTITY_INSERT [dbo].[TM_OrderNo] OFF
/****** Object:  Table [dbo].[TM_OrderList]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_OrderList](
	[OiId] [uniqueidentifier] NOT NULL,
	[UOId] [uniqueidentifier] NOT NULL,
	[SOId] [uniqueidentifier] NULL,
	[NCode] [varchar](30) NULL,
	[OMuney] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](30) NULL,
	[SaleType] [tinyint] NULL,
	[States] [tinyint] NULL,
	[PayType] [tinyint] NULL,
	[CreateTime] [datetime] NULL,
	[PayTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TM_ORDERLIST] PRIMARY KEY CLUSTERED 
(
	[OiId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'OiId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id(付款方)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'UOId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店铺Id(或者卖方用户Id)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'SOId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'OMuney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提供消费类型（10个人 20 店铺）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'SaleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(-1关闭 0 未付款 10已付款 20待发货 30待收货 50交易成功)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式(10账户、20支付宝、30微信、40银联)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下单时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'PayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_OrderList 订单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList'
GO
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'873a9981-a215-44e8-858b-b85a043cb807', N'97798554-d359-4c2c-aafe-e9d397522203', N'0eb0f168-c6d9-485c-b41d-287ea4c19436', N'201605171653441', CAST(432.00 AS Decimal(18, 2)), N'2sd', 0, 0, 10, CAST(0x0000A6090116752F AS DateTime), CAST(0x0000A6090116752F AS DateTime), 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'ae33f466-1e38-4f6b-b01c-e0610ad23cb7', N'fb16fb43-524c-45e0-bb9f-9111de0297bd', N'1cabb60f-291d-4d74-af9f-e370093ceaaf', N'201605181017412', CAST(324.00 AS Decimal(18, 2)), N'dssdssdf', 0, 0, 20, CAST(0x0000A60A00A9AB93 AS DateTime), CAST(0x0000A60A00A9AB93 AS DateTime), 0)
/****** Object:  Table [dbo].[TM_Banard]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_Banard](
	[BardId] [uniqueidentifier] NOT NULL,
	[UEId] [uniqueidentifier] NOT NULL,
	[TName] [nvarchar](20) NULL,
	[CType] [int] NULL,
	[BType] [int] NULL,
	[SecretKey] [varchar](40) NULL,
	[PCall] [varchar](20) NULL,
	[States] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
	[LNoo] [varchar](10) NULL,
 CONSTRAINT [PK_TM_BANARD] PRIMARY KEY CLUSTERED 
(
	[BardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'BardId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'UEId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡类型类（1储蓄卡2信用卡）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'CType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行类型(各种银行)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'BType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'SecretKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'PCall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0 正常-1冻结）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'尾号（四位）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'LNoo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_Banard 银行卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard'
GO
/****** Object:  Table [dbo].[TM_Balce]    Script Date: 05/24/2016 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_Balce](
	[BaId] [uniqueidentifier] NOT NULL,
	[USId] [uniqueidentifier] NOT NULL,
	[AMneys] [decimal](18, 2) NULL,
	[SecretS] [nvarchar](40) NULL,
	[UMoney] [decimal](18, 2) NULL,
	[Stas] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TM_BALCE] PRIMARY KEY CLUSTERED 
(
	[BaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'BaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'USId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'余额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'AMneys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'SecretS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'UMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0 正常-1冻结）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'Stas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_Balce 账户余额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce'
GO
INSERT [dbo].[TM_Balce] ([BaId], [USId], [AMneys], [SecretS], [UMoney], [Stas], [CreateTime], [UpdateTime], [isDeleted]) VALUES (N'8f1ecf74-0ca7-4e6a-abc6-a5d5732937a9', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', CAST(1.00 AS Decimal(18, 2)), NULL, NULL, 0, CAST(0x0000A6100115D370 AS DateTime), CAST(0x0000A6100115D370 AS DateTime), 0)
/****** Object:  StoredProcedure [dbo].[sp_PaginationEx]    Script Date: 05/24/2016 17:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_PaginationEx]
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
/****** Object:  StoredProcedure [dbo].[proc_DelForSetDelete]    Script Date: 05/24/2016 17:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[proc_DelForSetDelete]
	(@tableName NVARCHAR(200),      ----要显示的表或多个表的连接
	@Idfied NVARCHAR(200),      ----id或列名称
	@IdSet NVARCHAR(1000)      ----id集，","号隔开如："3","4"
	)
AS
Declare @sql NVARCHAR(1000)    ----存放动态生成的SQL语句
BEGIN
SET @sql = ' update  '+@tableName +' set isDeleted=0 where '+ @Idfied+' in ('+@IdSet+')'
exec(@sql) 
select @@rowcount --执行完后保存受影响的行数至变量

end
GO
/****** Object:  StoredProcedure [dbo].[proc_CheckBalanceInfo]    Script Date: 05/24/2016 17:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_CheckBalanceInfo]
	(
		@WeiXinId  varchar(50)
	)
AS
BEGIN
	SELECT AMneys FROM [TireMoneyDB].[dbo].[TM_Balce] where USId=(SELECT [UserId] FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId)
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_AddUserBalanceInfo]    Script Date: 05/24/2016 17:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AddUserBalanceInfo] 
(
				@WeiXinId varchar(50),
			
				@CreateTime datetime,
				@UpdateTime datetime
				
)
 AS 
	declare 	@BaId uniqueidentifier
	declare		@USId uniqueidentifier
	declare		@AMneys decimal(18,2)
	declare		@SecretS nvarchar(40)
	declare		@UMoney decimal(18,2)
	declare		@Stas int
	declare		@isDeleted bit
 BEGIN 
	
	select @BaId=newid()
	select @USId=[UserId] FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId=@WeiXinId
	select @AMneys=0
	select @SecretS=null
	select @UMoney=null	
	select @Stas=0
	select @isDeleted='false'
	
 INSERT INTO [TM_Balce]
			( 
				[BaId],
				[USId],
				[AMneys],
				[SecretS],
				[UMoney],
				[Stas],
				[CreateTime],
				[UpdateTime],
				[isDeleted] 
			)
			VALUES
			(
				@BaId,
				@USId,
				@AMneys,
				@SecretS,
				@UMoney,
				@Stas,
				@CreateTime,
				@UpdateTime,
				@isDeleted 
			) 
 END
GO
/****** Object:  StoredProcedure [dbo].[proc_UpdateBalanceInfoByWeixinId]    Script Date: 05/24/2016 17:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_UpdateBalanceInfoByWeixinId]
	(
		@WeiXinId varchar(50),		
		@AMneys decimal 
	)
AS  
	declare @UserId uniqueidentifier 
BEGIN
	 EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinId] @WeiXinId ,@UserId output
		
	UPDATE [TireMoneyDB].[dbo].[TM_Balce] SET AMneys=@AMneys WHERE USId=@UserId 
	
END
GO
