USE [CardProcessing]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[AccountStatement]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Agent]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Area]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[CardType]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Master]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Merchant]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[MerchantType]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Message]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[MessageType]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Privilege]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Report_Agent]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Report_Master]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[Report_Merchant]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 6/12/2017 12:49:30 AM ******/
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
/****** Object:  Table [dbo].[TransactionType]    Script Date: 6/12/2017 12:49:30 AM ******/
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

GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate]) VALUES (1, N'hieu', N'202CB962AC59075B964B07152D234B70', 1, 1)
GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate]) VALUES (2, N'hieu01', N'202CB962AC59075B964B07152D234B70', 1, 1)
GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate]) VALUES (3, N'hieu02', N'202CB962AC59075B964B07152D234B70', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

GO
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (2, N'Agent 001', 1, NULL, 1, 1, 1)
GO
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (3, N'Agent 002', 1, NULL, 1, 2, 1)
GO
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (4, N'Agent 003', 1, NULL, 1, 3, 1)
GO
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (7, N'Agent 0001', 1, 2, 1, 1, 2)
GO
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (8, N'Agent 0002', 1, 2, 1, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

GO
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (1, N'Miền Bắc')
GO
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (2, N'Miền Trung')
GO
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (3, N'Miền Nam')
GO
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (4, N'Khu Vực Khác')
GO
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

GO
INSERT [dbo].[Card] ([CardId], [MasterId], [CardNumber], [CardTypeId]) VALUES (1, 1, N'c4ca4238a0b923820dcc509a6f75849b', 1)
GO
INSERT [dbo].[Card] ([CardId], [MasterId], [CardNumber], [CardTypeId]) VALUES (9, 1, N'c81e728d9d4c2f636f067f89cc14862c', 2)
GO
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
SET IDENTITY_INSERT [dbo].[CardType] ON 

GO
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (1, N'Visa Card')
GO
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (2, N'Master Card')
GO
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (3, N'Debit Card')
GO
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (4, N'Foreign Key Card')
GO
SET IDENTITY_INSERT [dbo].[CardType] OFF
GO
SET IDENTITY_INSERT [dbo].[Master] ON 

GO
INSERT [dbo].[Master] ([MasterId], [MasterName], [AccountId]) VALUES (1, N'Master 001', 1)
GO
SET IDENTITY_INSERT [dbo].[Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Merchant] ON 

GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (1, N'Merchant 1', N'Ha Noi', 3, CAST(N'2017-02-15' AS Date), 1, 1, 2, 2)
GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (2, N'Merchant 2', N'Da Nang', 4, CAST(N'2017-02-15' AS Date), 1, 1, 3, 3)
GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (3, N'Merchant 3', N'Ha Noi', 2, CAST(N'2017-02-15' AS Date), 1, 1, 1, 2)
GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (4, N'Merchant 001', N'HCM', 8, CAST(N'2017-02-15' AS Date), 1, 1, 1, 1)
GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (5, N'Merchant 002', N'HCM', 7, CAST(N'2017-02-15' AS Date), 1, 1, 1, 1)
GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (10, N'Merchant 003', N'HCM', 2, CAST(N'2017-02-15' AS Date), 1, 1, 1, 1)
GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (11, N'3434t3', N'4t34t34', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Merchant] OFF
GO
SET IDENTITY_INSERT [dbo].[MerchantType] ON 

GO
INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (1, N'Merchant Type 1')
GO
INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (2, N'Merchant Type 2')
GO
INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (3, N'Merchant Type 3')
GO
SET IDENTITY_INSERT [dbo].[MerchantType] OFF
GO
SET IDENTITY_INSERT [dbo].[Privilege] ON 

GO
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (1, N'Master')
GO
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (2, N'Agent')
GO
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (3, N'Merchant')
GO
SET IDENTITY_INSERT [dbo].[Privilege] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportType] ON 

GO
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (1, N'Daily')
GO
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (2, N'Monthly')
GO
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (3, N'Yearly')
GO
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (4, N'Custom')
GO
SET IDENTITY_INSERT [dbo].[ReportType] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionDetails] ON 

GO
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (1, N'Product001', 3, 10.5000, 1, N'c4ca4238a0b923820dcc509a6f75849b', 1, CAST(N'2017-12-05 12:00:00.000' AS DateTime))
GO
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (2, N'Product002', 1.5, 15.0000, 1, N'c4ca4238a0b923820dcc509a6f75849b', 1, CAST(N'2017-05-15 03:00:00.000' AS DateTime))
GO
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (3, N'Product003', 2, 20.0000, 1, N'c4ca4238a0b923820dcc509a6f75849b', 1, CAST(N'2017-12-05 23:00:00.000' AS DateTime))
GO
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (4, N'Pro 1', 5, 10.5000, 1, N'c4ca4238a0b923820dcc509a6f75849b', 1, CAST(N'2017-05-15 18:00:00.000' AS DateTime))
GO
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (5, N'Pro 2', 4, 15.3000, 2, N'c4ca4238a0b923820dcc509a6f75849b', 1, CAST(N'2017-05-15 18:00:00.000' AS DateTime))
GO
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (6, N'Pro 3', 2, 20.0000, 1, N'c4ca4238a0b923820dcc509a6f75849b', 2, CAST(N'2017-05-15 18:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TransactionDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

GO
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (1, N'Sale')
GO
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (2, N'Return')
GO
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
GO
/****** Object:  Index [UQ__Card__A4E9FFE9C3775833]    Script Date: 6/12/2017 12:49:30 AM ******/
ALTER TABLE [dbo].[Card] ADD UNIQUE NONCLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Report_Agent]  WITH CHECK ADD  CONSTRAINT [FK_Report_Agent_Report_Master] FOREIGN KEY([ParentReportId])
REFERENCES [dbo].[Report_Master] ([ReportId])
ON DELETE CASCADE
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
ON DELETE CASCADE
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
/****** Object:  Trigger [dbo].[md5_CardNumber]    Script Date: 6/12/2017 12:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[md5_CardNumber]
ON [dbo].[TransactionDetails]
After INSERT
AS
Begin
declare @mahoa varchar(100)
declare @number varchar(100)
Select @number = CardNumber from inserted
set @mahoa = LOWER(CONVERT(VARCHAR(32), HASHBYTES('MD5', @number), 2))

update TransactionDetails set TransactionDetails.CardNumber = @mahoa FROM TransactionDetails
    INNER JOIN inserted i on i.Id = TransactionDetails.Id
end
GO
