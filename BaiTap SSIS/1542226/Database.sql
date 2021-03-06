Create database [TransactionProcessing]
go
USE [TransactionProcessing]
GO
/****** Object:  Table [dbo].[TransactionDetail]    Script Date: 4/9/2017 4:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportDate] [date] NULL,
	[AccountNumber] [varchar](100) NULL,
	[TransactionCode] [varchar](50) NULL,
	[Amount] [money] NULL,
	[MerchantNumber] [varchar](100) NULL,
 CONSTRAINT [PK_TransactionDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
