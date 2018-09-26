CREATE TABLE [dbo].[Product]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ManufacturerId] INT NULL, 
    [Name] VARCHAR(MAX) NULL, 
    [Type] CHAR NULL, 
    [Calories] INT NULL, 
    [Protein] INT NULL, 
    [Fat] INT NULL, 
    [Sodium] INT NULL, 
    [Fiber] INT NULL, 
    [Carbo] INT NULL, 
    [Sugar] INT NULL, 
    [Potash] INT NULL, 
    [Vitamins] INT NULL, 
    [Shelf] INT NULL, 
    [Weight] DECIMAL(18, 6) NULL, 
    [Cups] DECIMAL(18, 6) NULL, 
    [Rating] DECIMAL(18, 6) NULL, 
    CONSTRAINT [FK_Product_ToManufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [Manufacturer]([Id])
)
