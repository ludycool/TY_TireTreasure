USE [master]
GO
/****** Object:  Database [TireMoneyDB]    Script Date: 05/30/2016 16:16:03 ******/
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
/****** Object:  Table [dbo].[TM_WaterNo]    Script Date: 05/30/2016 16:16:04 ******/
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
/****** Object:  Table [dbo].[TM_WaterBill]    Script Date: 05/30/2016 16:16:04 ******/
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
INSERT [dbo].[TM_WaterBill] ([BiId], [UBId], [FId], [NCode], [WMney], [Details], [Remarks], [Platform], [BType], [Years], [Months], [Days], [Weeks], [ICons], [CreateTime], [isDeleted]) VALUES (N'4c26d88a-0188-40eb-9dd9-6facf23d9b06', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'CZ146419324870', CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 2016, 5, NULL, N'Wednesday', NULL, CAST(0x0000A611010D8856 AS DateTime), 0)
/****** Object:  Table [dbo].[TM_TranAcc]    Script Date: 05/30/2016 16:16:04 ******/
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
/****** Object:  Table [dbo].[TM_PayPlatform]    Script Date: 05/30/2016 16:16:04 ******/
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
/****** Object:  Table [dbo].[TM_OrderNo]    Script Date: 05/30/2016 16:16:04 ******/
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
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (45, N'CZ146416598045', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (46, N'CZ146416630246', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (47, N'CZ146416639747', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (48, N'CZ146416649748', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (49, N'CZ146416673349', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (50, N'CZ146418653250', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (51, N'CZ146418665551', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (52, N'CZ146418674852', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (53, N'CZ146418876053', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (54, N'CZ146418892354', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (55, N'CZ146418895255', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (56, N'CZ146418914356', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (57, N'CZ146418936257', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (58, N'CZ146418971058', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (59, N'CZ146418986059', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (60, N'CZ146419000560', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (61, N'CZ146419056161', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (62, N'CZ146419066162', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (63, N'CZ146419127763', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (64, N'CZ146419143164', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (65, N'CZ146419158265', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (66, N'CZ146419173566', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (67, N'CZ146419186367', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (68, N'CZ146419198368', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (69, N'CZ146419240069', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (70, N'CZ146419324870', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (71, N'CZ146427198971', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (72, N'CZ146427204372', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (73, N'CZ146434784473', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (74, N'CZ146434799874', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (75, N'CZ146434801275', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (76, N'CZ146435888776', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (77, N'CZ146436129977', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (78, N'CZ146436139778', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (79, N'CZ146436159279', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (80, N'CZ146436187280', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (81, N'CZ146436226381', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (82, N'CZ146436237682', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (83, N'CZ146436239283', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (84, N'CZ146436263984', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (85, N'CZ146436287085', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (86, N'CZ146436289286', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (87, N'CZ146436306887', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (88, N'CZ146436356288', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (89, N'CZ146436690889', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (90, N'CZ146436757290', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (91, N'CZ146436913491', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (92, N'CZ146437011392', N'10')
INSERT [dbo].[TM_OrderNo] ([Id], [NCode], [Types]) VALUES (93, N'CZ146437126893', N'10')
SET IDENTITY_INSERT [dbo].[TM_OrderNo] OFF
/****** Object:  Table [dbo].[TM_OrderList]    Script Date: 05/30/2016 16:16:04 ******/
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
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'e06cddc3-2a3f-4e97-b6a1-0b748095ca6a', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'00000000-0000-0000-0000-000000000000', N'CZ146419324870', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 50, 40, CAST(0x0000A611010D62EA AS DateTime), CAST(0x0000A611010D8800 AS DateTime), 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'b9af0a02-f7cb-4a6a-9d72-56cd34ece570', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'00000000-0000-0000-0000-000000000000', N'CZ146419240069', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 50, 40, CAST(0x0000A6110109811C AS DateTime), CAST(0x0000A61101099A88 AS DateTime), 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'4a4742b3-460d-4243-bf58-89adfb911a0f', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'00000000-0000-0000-0000-000000000000', N'CZ146419158265', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 50, 40, CAST(0x0000A6110105C322 AS DateTime), CAST(0x0000A6110105E8D4 AS DateTime), 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'805bc39e-f293-403a-b737-8a761610e493', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'00000000-0000-0000-0000-000000000000', N'CZ146419173566', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 50, 40, CAST(0x0000A611010675CD AS DateTime), CAST(0x0000A6110106E270 AS DateTime), 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'e7585c77-9da8-4429-80e1-a485c6af0ff5', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'00000000-0000-0000-0000-000000000000', N'CZ146427204372', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 0, 40, CAST(0x0000A61200EA92B4 AS DateTime), NULL, 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'3c212297-6ff2-4c8d-9ed5-b45b45887973', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'c419d105-f783-4926-87c9-9e4dd432a21c', N'CZ146419198368', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 50, 40, CAST(0x0000A61101079909 AS DateTime), CAST(0x0000A6110107D9B4 AS DateTime), 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'88c674e9-a582-4b30-8ede-d14f0de1925b', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'00000000-0000-0000-0000-000000000000', N'CZ146427198971', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 0, 40, CAST(0x0000A61200EA54E1 AS DateTime), NULL, 0)
INSERT [dbo].[TM_OrderList] ([OiId], [UOId], [SOId], [NCode], [OMuney], [Remarks], [SaleType], [States], [PayType], [CreateTime], [PayTime], [isDeleted]) VALUES (N'b6084ff6-636b-4e0d-9aaf-d580d14ff193', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', N'00000000-0000-0000-0000-000000000000', N'CZ146419186367', CAST(1.00 AS Decimal(18, 2)), NULL, 10, 0, 40, CAST(0x0000A61101070BCE AS DateTime), NULL, 0)
/****** Object:  Table [dbo].[TM_OrderItem]    Script Date: 05/30/2016 16:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_OrderItem](
	[ItemId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ToId] [uniqueidentifier] NOT NULL,
	[IMuney] [decimal](18, 2) NULL,
	[ICount] [tinyint] NULL,
	[States] [tinyint] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_TM_ORDERITEM] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem', @level2type=N'COLUMN',@level2name=N'ToId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem', @level2type=N'COLUMN',@level2name=N'IMuney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem', @level2type=N'COLUMN',@level2name=N'ICount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(11关闭 12已退款 0 未付款 10已付款 20待发货 30待收货 50交易成功)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TM_OrderItem 订单商品项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderItem'
GO
INSERT [dbo].[TM_OrderItem] ([ItemId], [OrderId], [ToId], [IMuney], [ICount], [States], [isDeleted]) VALUES (N'3c212297-6ff2-4c8d-9ed5-b45b45887971', N'3c212297-6ff2-4c8d-9ed5-b45b45887973', N'630a221f-30a1-465b-90cf-b1154ed2c21d', CAST(10.00 AS Decimal(18, 2)), 2, 50, 0)
/****** Object:  Table [dbo].[TM_Banard]    Script Date: 05/30/2016 16:16:04 ******/
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
/****** Object:  Table [dbo].[TM_Balce]    Script Date: 05/30/2016 16:16:04 ******/
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
INSERT [dbo].[TM_Balce] ([BaId], [USId], [AMneys], [SecretS], [UMoney], [Stas], [CreateTime], [UpdateTime], [isDeleted]) VALUES (N'a6c12aa0-504a-413f-a2b8-bcdb2431fbd5', N'6fbe4b40-6a1b-4c3f-b91c-05230ee11259', CAST(18.00 AS Decimal(18, 2)), NULL, NULL, 0, CAST(0x0000A6110092E1F4 AS DateTime), CAST(0x0000A6110092E1F4 AS DateTime), 0)
/****** Object:  Table [dbo].[SysItem]    Script Date: 05/30/2016 16:16:04 ******/
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
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (1, N'OrderStates', N'11', N'关闭', NULL, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (2, N'OrderStates', N'12', N'已退款', NULL, 1, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (3, N'OrderStates', N'0', N'未付款', NULL, 4, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (4, N'OrderStates', N'10', N'已付款', NULL, 2, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (5, N'OrderStates', N'20', N'待发货', NULL, 2, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (6, N'OrderStates', N'30', N'待收货', NULL, 2, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[SysItem] ([ItemID], [ItemType], [ItemValue], [ItemName], [Icon], [OrderID], [Remark], [CreateTime], [CreateMan], [isValid], [isDeleted]) VALUES (7, N'OrderStates', N'50', N'交易成功', NULL, 2, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[SysItem] OFF
/****** Object:  StoredProcedure [dbo].[sp_PaginationEx]    Script Date: 05/30/2016 16:16:07 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_DelForSetDelete]    Script Date: 05/30/2016 16:16:07 ******/
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
/****** Object:  View [dbo].[v_TM_OrderItem]    Script Date: 05/30/2016 16:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TM_OrderItem]
AS
SELECT     dbo.TM_OrderItem.ItemId, dbo.TM_OrderItem.OrderId, dbo.TM_OrderItem.ToId, dbo.TM_OrderItem.IMuney, dbo.TM_OrderItem.States, dbo.TM_OrderItem.isDeleted, 
                      dbo.TM_OrderList.NCode, dbo.TM_OrderList.States AS OrderListState, dbo.TM_OrderList.OMuney, TireTreasureDB.dbo.TT_Transaction.Title, 
                      TireTreasureDB.dbo.TT_Transaction.ImageUrl, TireTreasureDB.dbo.TT_Transaction.ShopId, dbo.TM_OrderItem.ICount, TireTreasureDB.dbo.TT_Shop.UserId, 
                      dbo.TM_OrderList.CreateTime, dbo.SysItem.ItemName AS StatesName
FROM         dbo.TM_OrderList LEFT OUTER JOIN
                      TireTreasureDB.dbo.TT_Shop ON dbo.TM_OrderList.SOId = TireTreasureDB.dbo.TT_Shop.ShopId RIGHT OUTER JOIN
                      dbo.SysItem RIGHT OUTER JOIN
                      dbo.TM_OrderItem ON dbo.SysItem.ItemValue = dbo.TM_OrderItem.States LEFT OUTER JOIN
                      TireTreasureDB.dbo.TT_Transaction ON dbo.TM_OrderItem.ToId = TireTreasureDB.dbo.TT_Transaction.TransactionId ON 
                      dbo.TM_OrderList.OiId = dbo.TM_OrderItem.OrderId
WHERE     (dbo.SysItem.ItemType = 'OrderStates')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[3] 2[43] 3) )"
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
         Begin Table = "SysItem"
            Begin Extent = 
               Top = 215
               Left = 292
               Bottom = 472
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TM_OrderItem"
            Begin Extent = 
               Top = 43
               Left = 46
               Bottom = 262
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_Shop (TireTreasureDB.dbo)"
            Begin Extent = 
               Top = 25
               Left = 1053
               Bottom = 301
               Right = 1208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT_Transaction (TireTreasureDB.dbo)"
            Begin Extent = 
               Top = 260
               Left = 621
               Bottom = 619
               Right = 878
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TM_OrderList"
            Begin Extent = 
               Top = 0
               Left = 572
               Bottom = 268
               Right = 927
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
         Filter = 13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TM_OrderItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'50
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TM_OrderItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TM_OrderItem'
GO
/****** Object:  StoredProcedure [dbo].[proc_GetOrderIdByWeixinId]    Script Date: 05/30/2016 16:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetOrderIdByWeixinId]
	(
		@WeiXinId varchar(50)			
	)
AS  
	declare @UserId uniqueidentifier 
BEGIN
	 EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinId] @WeiXinId ,@UserId output
		
	select OiId from [TireMoneyDB].[dbo].[TM_OrderList]  WHERE UOId=@UserId 
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CheckBalanceInfo]    Script Date: 05/30/2016 16:16:08 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_AddUserBalanceInfo]    Script Date: 05/30/2016 16:16:08 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_UpdateOrderInfoByOrderId]    Script Date: 05/30/2016 16:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_UpdateOrderInfoByOrderId]
	(
		@NCode varchar(30),	
		@States tinyint,
		@PayTime datetime
	)
AS  
	declare @UserId uniqueidentifier 		
BEGIN
			
	UPDATE [TireMoneyDB].[dbo].[TM_OrderList] SET States=@States ,PayTime=@PayTime WHERE NCode=@NCode
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UpdateBalanceInfoByWeixinId]    Script Date: 05/30/2016 16:16:08 ******/
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
