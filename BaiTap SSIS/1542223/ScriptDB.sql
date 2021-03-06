USE [TransactionProcessing]
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

