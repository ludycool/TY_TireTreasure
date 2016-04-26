USE [master]
GO
/****** Object:  Database [TireMoneyDB]    Script Date: 04/26/2016 17:32:29 ******/
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
/****** Object:  Table [dbo].[TM_WaterBill]    Script Date: 04/26/2016 17:32:30 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'UBId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'FId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'WMney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Days'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'Weeks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'ICons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水账单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_WaterBill'
GO
/****** Object:  Table [dbo].[TM_TranAcc]    Script Date: 04/26/2016 17:32:30 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'UTId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'STId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'TureName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'ACao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'TManey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'ComeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转账单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_TranAcc'
GO
/****** Object:  Table [dbo].[TM_PayPlatform]    Script Date: 04/26/2016 17:32:30 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'TName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'ApiUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'IConUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转账平台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_PayPlatform'
GO
/****** Object:  Table [dbo].[TM_OrderList]    Script Date: 04/26/2016 17:32:30 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'UOId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'SOId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'NCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'OMuney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'PayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水账单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_OrderList'
GO
/****** Object:  Table [dbo].[TM_Banard]    Script Date: 04/26/2016 17:32:30 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'UEId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'SecretKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'PCall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'States'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定银行卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Banard'
GO
/****** Object:  Table [dbo].[TM_Balce]    Script Date: 04/26/2016 17:32:30 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'USId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'AMneys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'SecretS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'UMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（2已审核、开启1，未审核0，关闭-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'Stas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce', @level2type=N'COLUMN',@level2name=N'isDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'我的钱包' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TM_Balce'
GO
