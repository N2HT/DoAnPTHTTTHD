USE [CardProcessing]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/9/2017 10:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[PrivilegeId] [int] NULL,
	[Activate] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountStatement]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[Agent]    Script Date: 6/9/2017 10:30:41 PM ******/
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
	[AccountId] [int] NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Area]    Script Date: 6/9/2017 10:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nchar](10) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Card]    Script Date: 6/9/2017 10:30:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[Master]    Script Date: 6/9/2017 10:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master](
	[MasterId] [int] IDENTITY(1,1) NOT NULL,
	[MasterName] [nvarchar](100) NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_Master] PRIMARY KEY CLUSTERED 
(
	[MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 6/9/2017 10:30:41 PM ******/
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
	[AccountId] [int] NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[Message]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[MessageType]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[Privilege]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[Report_Agent]    Script Date: 6/9/2017 10:30:41 PM ******/
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
 CONSTRAINT [PK_Report_Agent] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Master]    Script Date: 6/9/2017 10:30:41 PM ******/
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
	[ReturmAmount] [money] NULL,
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
/****** Object:  Table [dbo].[Report_Merchant]    Script Date: 6/9/2017 10:30:41 PM ******/
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
 CONSTRAINT [PK_Report_Merchant] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 6/9/2017 10:30:41 PM ******/
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
/****** Object:  Table [dbo].[TransactionType]    Script Date: 6/9/2017 10:30:41 PM ******/
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
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_User] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_User]
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
ALTER TABLE [dbo].[Master]  WITH CHECK ADD  CONSTRAINT [FK_Master_User] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Master] CHECK CONSTRAINT [FK_Master_User]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Account]
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
