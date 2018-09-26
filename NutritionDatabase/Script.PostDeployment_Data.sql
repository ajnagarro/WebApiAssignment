/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
USE [NutritionDatabase]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Code], [Name], [StockSymbol]) VALUES (1, N'A', N'American Home Food Products', N'AHFP')
INSERT [dbo].[Manufacturer] ([Id], [Code], [Name], [StockSymbol]) VALUES (2, N'G', N'General Mills', N'GIS')
INSERT [dbo].[Manufacturer] ([Id], [Code], [Name], [StockSymbol]) VALUES (3, N'K', N'Kelloggs', N'K')
INSERT [dbo].[Manufacturer] ([Id], [Code], [Name], [StockSymbol]) VALUES (4, N'N', N'Nabisco', N'KHC')
INSERT [dbo].[Manufacturer] ([Id], [Code], [Name], [StockSymbol]) VALUES (5, N'P', N'Post', N'POST')
INSERT [dbo].[Manufacturer] ([Id], [Code], [Name], [StockSymbol]) VALUES (6, N'Q', N'Quaker Oats', N'PEP')
INSERT [dbo].[Manufacturer] ([Id], [Code], [Name], [StockSymbol]) VALUES (7, N'R', N'Ralston Purina', N'NSRGF')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF

GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (2, 4, N'100% Bran', N'C', 70, 4, 1, 130, 10, 5, 6, 280, 25, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(0.330000 AS Decimal(18, 6)), CAST(68.402973 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (3, 6, N'100% Natural Bran', N'C', 120, 3, 5, 15, 2, 8, 8, 135, 0, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), CAST(33.983679 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (4, 3, N'All-Bran', N'C', 70, 4, 1, 260, 9, 7, 5, 320, 25, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(0.330000 AS Decimal(18, 6)), CAST(59.425505 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (5, 3, N'All-Bran with Extra Fiber', N'C', 50, 4, 0, 140, 14, 8, 0, 330, 25, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(0.500000 AS Decimal(18, 6)), CAST(93.704912 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (6, 7, N'Almond Delight', N'C', 110, 2, 2, 200, 1, 14, 8, -1, 25, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(0.750000 AS Decimal(18, 6)), CAST(34.384843 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (7, 2, N'Apple Cinnamon Cheerios', N'C', 110, 2, 2, 180, 1, 10, 10, 70, 25, 1, CAST(1.000000 AS Decimal(18, 6)), CAST(0.750000 AS Decimal(18, 6)), CAST(29.509541 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (8, 3, N'Apple Jacks', N'C', 110, 2, 0, 125, 1, 11, 14, 30, 25, 2, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), CAST(33.174094 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (9, 2, N'Basic 4', N'C', 130, 3, 2, 210, 2, 18, 8, 100, 25, 3, CAST(1.330000 AS Decimal(18, 6)), CAST(0.750000 AS Decimal(18, 6)), CAST(37.038562 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (10, 7, N'Bran Chex', N'C', 90, 2, 1, 200, 4, 15, 6, 125, 25, 1, CAST(1.000000 AS Decimal(18, 6)), CAST(0.670000 AS Decimal(18, 6)), CAST(49.120253 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (11, 5, N'Bran Flakes', N'C', 90, 3, 0, 210, 5, 13, 5, 190, 25, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(0.670000 AS Decimal(18, 6)), CAST(53.313813 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (12, 6, N'Cap''n''Crunch', N'C', 120, 1, 2, 220, 0, 12, 12, 35, 25, 2, CAST(1.000000 AS Decimal(18, 6)), CAST(0.750000 AS Decimal(18, 6)), CAST(18.042851 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (13, 2, N'Cheerios', N'C', 110, 6, 2, 290, 2, 17, 1, 105, 25, 1, CAST(1.000000 AS Decimal(18, 6)), CAST(1.250000 AS Decimal(18, 6)), CAST(50.764999 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (14, 2, N'Cinnamon Toast Crunch', N'C', 120, 1, 3, 210, 0, 13, 9, 45, 25, 2, CAST(1.000000 AS Decimal(18, 6)), CAST(0.750000 AS Decimal(18, 6)), CAST(19.823573 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (15, 2, N'Clusters', N'C', 110, 3, 2, 140, 2, 13, 7, 105, 25, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(0.500000 AS Decimal(18, 6)), CAST(40.400208 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (16, 2, N'Cocoa Puffs', N'C', 110, 1, 1, 180, 0, 12, 13, 55, 25, 2, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), CAST(22.736446 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (17, 7, N'Corn Chex', N'C', 110, 2, 0, 280, 0, 22, 3, 25, 25, 1, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), CAST(41.445019 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (18, 3, N'Corn Flakes', N'C', 100, 2, 0, 290, 1, 21, 2, 35, 25, 1, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), CAST(45.863324 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (19, 3, N'Corn Pops', N'C', 110, 1, 0, 90, 1, 13, 12, 20, 25, 2, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), CAST(35.782791 AS Decimal(18, 6)))
INSERT [dbo].[Product] ([Id], [ManufacturerId], [Name], [Type], [Calories], [Protein], [Fat], [Sodium], [Fiber], [Carbo], [Sugar], [Potash], [Vitamins], [Shelf], [Weight], [Cups], [Rating]) VALUES (20, 2, N'Count Chocula', N'C', 110, 1, 1, 180, 0, 12, 13, 65, 25, 2, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), CAST(22.396513 AS Decimal(18, 6)))
SET IDENTITY_INSERT [dbo].[Product] OFF
