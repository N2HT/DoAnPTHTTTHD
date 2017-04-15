CREATE DATABASE TransactionProcessing
GO
USE TransactionProcessing
GO
CREATE TABLE TransactionDetail
(
	RecordId INT PRIMARY KEY IDENTITY,
	ReportDate DATE,
	AccountNumber VARCHAR(100),
	TransactionCode VARCHAR(1),
	Amount MONEY,
	MerchantNumber VARCHAR(100)
)

SELECT * FROM TransactionDetail

DROP Table TransactionDetail