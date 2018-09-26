CREATE TABLE [dbo].[Manufacturer]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Code] CHAR NULL, 
    [Name] VARCHAR(50) NULL, 
    [StockSymbol] VARCHAR(10) NULL
)
