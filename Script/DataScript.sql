USE [CardProcessing]
GO
SET IDENTITY_INSERT [dbo].[Privilege] ON 

INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (1, N'Master')
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (2, N'Agent')
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName]) VALUES (3, N'Merchant')
SET IDENTITY_INSERT [dbo].[Privilege] OFF
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate]) VALUES (1, N'hieu', N'202CB962AC59075B964B07152D234B70', 1, 1)
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate]) VALUES (2, N'hieu01', N'202CB962AC59075B964B07152D234B70', 1, 1)
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [PrivilegeId], [Activate]) VALUES (3, N'hieu02', N'202CB962AC59075B964B07152D234B70', 1, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (1, N'Miền Bắc')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (2, N'Miền Trung')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (3, N'Miền Nam')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (4, N'Khu Vực Khác')
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[Master] ON 

INSERT [dbo].[Master] ([MasterId], [MasterName], [AccountId]) VALUES (1, N'Master 001', 1)
SET IDENTITY_INSERT [dbo].[Master] OFF
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (2, N'Agent 001', 1, NULL, 1, 1, 1)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (3, N'Agent 002', 1, NULL, 1, 2, 1)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (4, N'Agent 003', 1, NULL, 1, 3, 1)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (7, N'Agent 0001', 1, 2, 1, 1, 2)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [MasterId], [ParentAgentId], [Activate], [AreaId], [AccountId]) VALUES (8, N'Agent 0002', 1, 2, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Agent] OFF
SET IDENTITY_INSERT [dbo].[MerchantType] ON 

INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (1, N'Merchant Type 1')
INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (2, N'Merchant Type 2')
INSERT [dbo].[MerchantType] ([MerchantTypeId], [MerchantTypeName]) VALUES (3, N'Merchant Type 3')
SET IDENTITY_INSERT [dbo].[MerchantType] OFF
SET IDENTITY_INSERT [dbo].[Merchant] ON 

INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (1, N'Merchant 1', N'Ha Noi', 3, CAST(0x763C0B00 AS Date), 1, 1, 2, 2)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (2, N'Merchant 2', N'Da Nang', 4, CAST(0x763C0B00 AS Date), 1, 1, 3, 3)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (3, N'Merchant 3', N'Ha Noi', 2, CAST(0x763C0B00 AS Date), 1, 1, 1, 2)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (4, N'Merchant 001', N'HCM', 8, CAST(0x763C0B00 AS Date), 1, 1, 1, 1)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (5, N'Merchant 002', N'HCM', 7, CAST(0x763C0B00 AS Date), 1, 1, 1, 1)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (10, N'Merchant 003', N'HCM', 2, CAST(0x763C0B00 AS Date), 1, 1, 1, 1)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [Address], [AgentId], [BeginDay], [Activate], [MerchantTypeId], [AreaId], [AccountId]) VALUES (11, N'3434t3', N'4t34t34', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Merchant] OFF
SET IDENTITY_INSERT [dbo].[CardType] ON 

INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (1, N'Visa Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (2, N'Master Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (3, N'Debit Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (4, N'Foreign Key Card')
SET IDENTITY_INSERT [dbo].[CardType] OFF
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([CardId], [MasterId], [CardNumber], [CardTypeId]) VALUES (1, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1)
INSERT [dbo].[Card] ([CardId], [MasterId], [CardNumber], [CardTypeId]) VALUES (9, 1, N'c81e728d9d4c2f636f067f89cc14862c', 2)
SET IDENTITY_INSERT [dbo].[Card] OFF
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (1, N'Sale')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (2, N'Return')
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
SET IDENTITY_INSERT [dbo].[TransactionDetails] ON 

INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (1, N'Product001', 3, 10.5000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(0x0000A84000C5C100 AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (2, N'Product002', 1.5, 15.0000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(0x0000A77400317040 AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (3, N'Product003', 2, 20.0000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(0x0000A840017B0740 AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (4, N'Pro 1', 5, 10.5000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(0x0000A7740128A180 AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (5, N'Pro 2', 4, 15.3000, 2, N'C4CA4238A0B923820DCC509A6F75849B', 1, CAST(0x0000A7740128A180 AS DateTime))
INSERT [dbo].[TransactionDetails] ([Id], [Product], [Quantity], [UnitPrice], [MerchantId], [CardNumber], [TransactionTypeId], [TransactionTime]) VALUES (6, N'Pro 3', 2, 20.0000, 1, N'C4CA4238A0B923820DCC509A6F75849B', 2, CAST(0x0000A7740128A180 AS DateTime))
SET IDENTITY_INSERT [dbo].[TransactionDetails] OFF
SET IDENTITY_INSERT [dbo].[ReportType] ON 

INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (1, N'Daily')
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (2, N'Monthly')
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (3, N'Yearly')
INSERT [dbo].[ReportType] ([ReportTypeId], [ReportTypeName]) VALUES (4, N'Custom')
SET IDENTITY_INSERT [dbo].[ReportType] OFF
SET IDENTITY_INSERT [dbo].[Report_Master] ON 

INSERT [dbo].[Report_Master] ([ReportId], [MasterId], [Agent], [Merchant], [TransactionType], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1000000.0000, 600000.0000, 100, 10, 50.0000, 1, CAST(0xE93C0B00 AS Date), CAST(0xC93C0B00 AS Date), CAST(0xCA3C0B00 AS Date))
INSERT [dbo].[Report_Master] ([ReportId], [MasterId], [Agent], [Merchant], [TransactionType], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate]) VALUES (2, 1, 2, 2, 2, 2, 2, 2, 1500000.0000, 700000.0000, 150, 15, 60.0000, 2, CAST(0xE43C0B00 AS Date), CAST(0xC53C0B00 AS Date), CAST(0xE43C0B00 AS Date))
INSERT [dbo].[Report_Master] ([ReportId], [MasterId], [Agent], [Merchant], [TransactionType], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate]) VALUES (3, 1, 3, 3, 3, 3, 3, 3, 2000000.0000, 1000000.0000, 200, 30, 70.0000, 3, CAST(0xE43C0B00 AS Date), CAST(0x583B0B00 AS Date), CAST(0xC53C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Report_Master] OFF
SET IDENTITY_INSERT [dbo].[Report_Agent] ON 

INSERT [dbo].[Report_Agent] ([ReportId], [AgentId], [TransactionType], [Merchant], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (2, 2, 1, 1, 1, 1, 1, 1000000.0000, 500000.0000, 50.0000, 5.0000, 50.0000, 1, CAST(0x7E3D0B00 AS Date), CAST(0xD33C0B00 AS Date), CAST(0xD43C0B00 AS Date), 1)
INSERT [dbo].[Report_Agent] ([ReportId], [AgentId], [TransactionType], [Merchant], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (3, 3, 2, 2, 2, 2, 2, 1500000.0000, 700000.0000, 80.0000, 4.0000, 100.0000, 2, CAST(0x7E3D0B00 AS Date), CAST(0xC53C0B00 AS Date), CAST(0xE43C0B00 AS Date), 2)
INSERT [dbo].[Report_Agent] ([ReportId], [AgentId], [TransactionType], [Merchant], [Area], [CardType], [MerchantType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (4, 4, 3, 3, 3, 3, 3, 2000000.0000, 1500000.0000, 150.0000, 10.0000, 100.0000, 3, CAST(0x7E3D0B00 AS Date), CAST(0x583B0B00 AS Date), CAST(0xC53C0B00 AS Date), 3)
SET IDENTITY_INSERT [dbo].[Report_Agent] OFF
SET IDENTITY_INSERT [dbo].[Report_Merchant] ON 

INSERT [dbo].[Report_Merchant] ([ReportId], [MerchantId], [TransactionType], [CardType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (2, 1, 1, N'1         ', 500000.0000, 350000.0000, 40, 5, 30.0000, 1, CAST(0x7E3D0B00 AS Date), CAST(0xC53C0B00 AS Date), CAST(0xC63C0B00 AS Date), 2)
INSERT [dbo].[Report_Merchant] ([ReportId], [MerchantId], [TransactionType], [CardType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (3, 2, 2, N'2         ', 600000.0000, 400000.0000, 45, 1, 35.0000, 2, CAST(0x7D3D0B00 AS Date), CAST(0xC53C0B00 AS Date), CAST(0xE43C0B00 AS Date), 3)
INSERT [dbo].[Report_Merchant] ([ReportId], [MerchantId], [TransactionType], [CardType], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [NetAmount], [ReportTypeId], [ReportDate], [FromDate], [ToDate], [ParentReportId]) VALUES (4, 3, 3, N'3         ', 700000.0000, 500000.0000, 50, 6, 40.0000, 3, CAST(0x7E3D0B00 AS Date), CAST(0x583B0B00 AS Date), CAST(0xC53C0B00 AS Date), 4)
SET IDENTITY_INSERT [dbo].[Report_Merchant] OFF
