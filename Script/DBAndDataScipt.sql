USE [master]
GO
/****** Object:  Database [CardProcessing]    Script Date: 12/6/2017 3:18:05 AM ******/
CREATE DATABASE [CardProcessing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CardProcessing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CardProcessing.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CardProcessing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CardProcessing_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CardProcessing] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CardProcessing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CardProcessing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CardProcessing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CardProcessing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CardProcessing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CardProcessing] SET ARITHABORT OFF 
GO
ALTER DATABASE [CardProcessing] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CardProcessing] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CardProcessing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CardProcessing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CardProcessing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CardProcessing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CardProcessing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CardProcessing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CardProcessing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CardProcessing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CardProcessing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CardProcessing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CardProcessing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CardProcessing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CardProcessing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CardProcessing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CardProcessing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CardProcessing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CardProcessing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CardProcessing] SET  MULTI_USER 
GO
ALTER DATABASE [CardProcessing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CardProcessing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CardProcessing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CardProcessing] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CardProcessing]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[PrivilegeId] [int] NOT NULL,
	[Activate] [bit] NOT NULL,
	[MasterId] [int] NULL,
	[AgentId] [int] NULL,
	[MerchantId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountStatement]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [int] NULL,
	[MasterId] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[TotalPrice] [money] NULL,
 CONSTRAINT [PK_SaoKeTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Agent]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](100) NULL,
	[MasterId] [int] NULL,
	[ParentAgentId] [int] NULL,
	[Activate] [bit] NULL,
	[AreaId] [int] NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Area]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Card]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Card](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NULL,
	[CardNumber] [varchar](100) NOT NULL,
	[CardTypeId] [int] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[CardTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CardTypeName] [nvarchar](30) NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CardTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Master]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master](
	[MasterId] [int] IDENTITY(1,1) NOT NULL,
	[MasterName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Master] PRIMARY KEY CLUSTERED 
(
	[MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantName] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[AgentId] [int] NULL,
	[BeginDay] [date] NULL,
	[Activate] [bit] NULL,
	[MerchantTypeId] [int] NULL,
	[AreaId] [int] NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantType](
	[MerchantTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_MerchantType] PRIMARY KEY CLUSTERED 
(
	[MerchantTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Message]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[UserIdSend] [int] NULL,
	[UserIdRecevie] [int] NULL,
	[MessageTypeId] [int] NULL,
	[MessageContent] [text] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MessageType]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageType](
	[MessageTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MessageTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_MessageType] PRIMARY KEY CLUSTERED 
(
	[MessageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Privilege]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privilege](
	[PrivilegeId] [int] IDENTITY(1,1) NOT NULL,
	[PrivilegeName] [nvarchar](30) NULL,
 CONSTRAINT [PK_Privilege] PRIMARY KEY CLUSTERED 
(
	[PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Agent]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Agent](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NULL,
	[TransactionType] [int] NULL,
	[Merchant] [int] NULL,
	[Area] [int] NULL,
	[CardType] [int] NULL,
	[MerchantType] [int] NULL,
	[SaleAmount] [money] NULL,
	[ReturnAmount] [money] NULL,
	[SaleCount] [money] NULL,
	[ReturnCount] [money] NULL,
	[NetAmount] [money] NULL,
	[ReportTypeId] [int] NULL,
	[ReportDate] [date] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[ParentReportId] [int] NULL,
 CONSTRAINT [PK_Report_Agent] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Master]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Master](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NULL,
	[Agent] [int] NULL,
	[Merchant] [int] NULL,
	[TransactionType] [int] NULL,
	[Area] [int] NULL,
	[CardType] [int] NULL,
	[MerchantType] [int] NULL,
	[SaleAmount] [money] NULL,
	[ReturnAmount] [money] NULL,
	[SaleCount] [int] NULL,
	[ReturnCount] [int] NULL,
	[NetAmount] [money] NULL,
	[ReportTypeId] [int] NULL,
	[ReportDate] [date] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
 CONSTRAINT [PK_Report_Master] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Merchant]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Merchant](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NULL,
	[TransactionType] [int] NULL,
	[CardType] [nchar](10) NULL,
	[SaleAmount] [money] NULL,
	[ReturnAmount] [money] NULL,
	[SaleCount] [int] NULL,
	[ReturnCount] [int] NULL,
	[NetAmount] [money] NULL,
	[ReportTypeId] [int] NULL,
	[ReportDate] [date] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[ParentReportId] [int] NULL,
 CONSTRAINT [PK_Report_Merchant] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[ReportTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ReportTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportType] PRIMARY KEY CLUSTERED 
(
	[ReportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product] [varchar](150) NULL,
	[Quantity] [float] NULL,
	[UnitPrice] [money] NULL,
	[MerchantId] [int] NULL,
	[CardNumber] [varchar](100) NULL,
	[TransactionTypeId] [int] NULL,
	[TransactionTime] [datetime] NULL,
 CONSTRAINT [PK_TransactionDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 12/6/2017 3:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionTypeName] [nvarchar](30) NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate], [MasterId], [AgentId], [MerchantId]) VALUES (1, N'master', N'202cb962ac59075b964b07152d234b70', 1, 1, 1, NULL, NULL)
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate], [MasterId], [AgentId], [MerchantId]) VALUES (2, N'agent', N'202cb962ac59075b964b07152d234b70', 2, 1, NULL, 2, NULL)
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate], [MasterId], [AgentId], [MerchantId]) VALUES (3, N'merchant', N'202cb962ac59075b964b07152d234b70', 3, 1, NULL, NULL, 1)
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate], [MasterId], [AgentId], [MerchantId]) VALUES (7, N'merchant', N'202cb962ac59075b964b07152d234b70', 3, 1, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId]) VALUES (2, N'Agent 001', NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Agent] OFF
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (1, N'Miền Bắc')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (2, N'Miền Trung')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (3, N'Miền Nam')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (4, N'Khu Vực Khác')
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([CardId], [MasterId], [CardNumber], [CardTypeId]) VALUES (1, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1)
INSERT [dbo].[Card] ([CardId], [MasterId], [CardNumber], [CardTypeId]) VALUES (9, 1, N'c81e728d9d4c2f636f067f89cc14862c', 2)
SET IDENTITY_INSERT [dbo].[Card] OFF
SET IDENTITY_INSERT [dbo].[CardType] ON 

INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (1, N'Visa Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (2, N'Master Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (3, N'Debit Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (4, N'Foreign Key Card')
SET IDENTITY_INSERT [dbo].[CardType] OFF
SET IDENTITY_INSERT [dbo].[Master] ON 

INSERT [dbo].[Master] ([MasterId], [MasterName]) VALUES (1, N'Master 001')
SET IDENTITY_INSERT [dbo].[Master] OFF
SET IDENTITY_INSERT [dbo].[Merchant] ON 

INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId]) VALUES (1, N'Merchant 1', N'Ha Noi', NULL, CAST(N'2017-02-15' AS Date), 1, 1, 2)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId]) VALUES (2, N'Merchant 2', N'Da Nang', NULL, CAST(N'2017-02-15' AS Date), 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Merchant] OFF
SET IDENTITY_INSERT [dbo].[MerchantType] ON 

INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (1, N'read')
INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (2, N'unread')
INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (3, N'seen')
SET IDENTITY_INSERT [dbo].[MerchantType] OFF
SET IDENTITY_INSERT [dbo].[Privilege] ON 

INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (1, N'Master')
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (2, N'Agent')
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (3, N'Merchant')
SET IDENTITY_INSERT [dbo].[Privilege] OFF
SET IDENTITY_INSERT [dbo].[Report_Agent] ON 

INSERT [dbo].[Report_Agent] ([ReportId], [AgentId], [TransactionType], [Merchant], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (2, 2, 1, 1, 1, 1, 1, 1000000.0000, 500000.0000, 50.0000, 5.0000, 50.0000, 1, CAST(N'2017-11-06' AS Date), CAST(N'2017-05-19' AS Date), CAST(N'2017-05-20' AS Date), 1)
INSERT [dbo].[Report_Agent] ([ReportId], [AgentId], [TransactionType], [Merchant], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (3, 3, 2, 2, 2, 2, 2, 1500000.0000, 700000.0000, 80.0000, 4.0000, 100.0000, 2, CAST(N'2017-11-06' AS Date), CAST(N'2017-05-05' AS Date), CAST(N'2017-06-05' AS Date), 2)
INSERT [dbo].[Report_Agent] ([ReportId], [AgentId], [TransactionType], [Merchant], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (4, 4, 3, 3, 3, 3, 3, 2000000.0000, 1500000.0000, 150.0000, 10.0000, 100.0000, 3, CAST(N'2017-11-06' AS Date), CAST(N'2016-05-05' AS Date), CAST(N'2017-05-05' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Report_Agent] OFF
SET IDENTITY_INSERT [dbo].[Report_Master] ON 

INSERT [dbo].[Report_Master] ([ReportId], [MasterId], [Agent], [Merchant], [TransactionType], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1000000.0000, 600000.0000, 100, 10, 50.0000, 1, CAST(N'2017-06-10' AS Date), CAST(N'2017-05-09' AS Date), CAST(N'2017-05-10' AS Date))
INSERT [dbo].[Report_Master] ([ReportId], [MasterId], [Agent], [Merchant], [TransactionType], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate]) VALUES (2, 1, 2, 2, 2, 2, 2, 2, 1500000.0000, 700000.0000, 150, 15, 60.0000, 2, CAST(N'2017-06-05' AS Date), CAST(N'2017-05-05' AS Date), CAST(N'2017-06-05' AS Date))
INSERT [dbo].[Report_Master] ([ReportId], [MasterId], [Agent], [Merchant], [TransactionType], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate]) VALUES (3, 1, 3, 3, 3, 3, 3, 3, 2000000.0000, 1000000.0000, 200, 30, 70.0000, 3, CAST(N'2017-06-05' AS Date), CAST(N'2016-05-05' AS Date), CAST(N'2017-05-05' AS Date))
SET IDENTITY_INSERT [dbo].[Report_Master] OFF
SET IDENTITY_INSERT [dbo].[Report_Merchant] ON 

INSERT [dbo].[Report_Merchant] ([ReportId], [MerchantId], [TransactionType], [CardType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (2, 1, 1, N'1         ', 500000.0000, 350000.0000, 40, 5, 30.0000, 1, CAST(N'2017-11-06' AS Date), CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Report_Merchant] OFF
SET IDENTITY_INSERT [dbo].[ReportType] ON 

INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (1, N'Daily')
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (2, N'Monthly')
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (3, N'Yearly')
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (4, N'Custom')
SET IDENTITY_INSERT [dbo].[ReportType] OFF
SET IDENTITY_INSERT [dbo].[TransactionDetails] ON 

INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (1, N'Product001', 3, 10.5000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(N'2017-12-05 12:00:00.000' AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (2, N'Product002', 1.5, 15.0000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(N'2017-05-15 03:00:00.000' AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (3, N'Product003', 2, 20.0000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(N'2017-12-05 23:00:00.000' AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (4, N'Pro 1', 5, 10.5000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(N'2017-05-15 18:00:00.000' AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (5, N'Pro 2', 4, 15.3000, 2, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(N'2017-05-15 18:00:00.000' AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (6, N'Pro 3', 2, 20.0000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 2, CAST(N'2017-05-15 18:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TransactionDetails] OFF
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (1, N'Sale')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (2, N'Return')
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
/****** Object:  Index [UQ__Card__A4E9FFE984FA3F5F]    Script Date: 12/6/2017 3:18:05 AM ******/
ALTER TABLE [dbo].[Card] ADD UNIQUE NONCLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Agent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Agent]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Master] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Master] ([MasterId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Master]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Merchant] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchant] ([MerchantId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Merchant]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_User_Privilege] FOREIGN KEY([PrivilegeId])
REFERENCES [dbo].[Privilege] ([PrivilegeId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_User_Privilege]
GO
ALTER TABLE [dbo].[AccountStatement]  WITH CHECK ADD  CONSTRAINT [FK_AccountStatement_Master] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Master] ([MasterId])
GO
ALTER TABLE [dbo].[AccountStatement] CHECK CONSTRAINT [FK_AccountStatement_Master]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Agent] FOREIGN KEY([ParentAgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Agent]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Area] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Area] ([AreaId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Area]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Master] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Master] ([MasterId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Master]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_CardType] FOREIGN KEY([CardTypeId])
REFERENCES [dbo].[CardType] ([CardTypeId])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_CardType]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Master] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Master] ([MasterId])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Master]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Agent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Agent]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Area1] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Area] ([AreaId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Area1]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_MerchantType] FOREIGN KEY([MerchantTypeId])
REFERENCES [dbo].[MerchantType] ([MerchantTypeId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_MerchantType]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_MessageType] FOREIGN KEY([MessageTypeId])
REFERENCES [dbo].[MessageType] ([MessageTypeId])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_MessageType]
GO
ALTER TABLE [dbo].[Report_Agent]  WITH CHECK ADD  CONSTRAINT [FK_Report_Agent_Report_Master] FOREIGN KEY([ParentReportId])
REFERENCES [dbo].[Report_Master] ([ReportId])
GO
ALTER TABLE [dbo].[Report_Agent] CHECK CONSTRAINT [FK_Report_Agent_Report_Master]
GO
ALTER TABLE [dbo].[Report_Agent]  WITH CHECK ADD  CONSTRAINT [FK_Report_Agent_ReportType] FOREIGN KEY([ReportTypeId])
REFERENCES [dbo].[ReportType] ([ReportTypeId])
GO
ALTER TABLE [dbo].[Report_Agent] CHECK CONSTRAINT [FK_Report_Agent_ReportType]
GO
ALTER TABLE [dbo].[Report_Master]  WITH CHECK ADD  CONSTRAINT [FK_Report_Master_ReportType] FOREIGN KEY([ReportTypeId])
REFERENCES [dbo].[ReportType] ([ReportTypeId])
GO
ALTER TABLE [dbo].[Report_Master] CHECK CONSTRAINT [FK_Report_Master_ReportType]
GO
ALTER TABLE [dbo].[Report_Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Report_Merchant_Report_Agent] FOREIGN KEY([ParentReportId])
REFERENCES [dbo].[Report_Agent] ([ReportId])
GO
ALTER TABLE [dbo].[Report_Merchant] CHECK CONSTRAINT [FK_Report_Merchant_Report_Agent]
GO
ALTER TABLE [dbo].[Report_Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Report_Merchant_ReportType] FOREIGN KEY([ReportTypeId])
REFERENCES [dbo].[ReportType] ([ReportTypeId])
GO
ALTER TABLE [dbo].[Report_Merchant] CHECK CONSTRAINT [FK_Report_Merchant_ReportType]
GO
ALTER TABLE [dbo].[TransactionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetails_Merchant] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchant] ([MerchantId])
GO
ALTER TABLE [dbo].[TransactionDetails] CHECK CONSTRAINT [FK_TransactionDetails_Merchant]
GO
ALTER TABLE [dbo].[TransactionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetails_TransactionType] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[TransactionDetails] CHECK CONSTRAINT [FK_TransactionDetails_TransactionType]
GO
USE [master]
GO
ALTER DATABASE [CardProcessing] SET  READ_WRITE 
GO
