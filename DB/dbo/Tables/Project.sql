CREATE TABLE [dbo].[Project]
(
	[ID] INT IDENTITY (1, 1) NOT NULL, 
    [Code] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(100) NULL, 
    [Location] NVARCHAR(100) NOT NULL, 
    [Responsible] NVARCHAR(50) NOT NULL,
	[Block] bit NOT NULL, 
    CONSTRAINT [PK_Project] PRIMARY KEY ([ID])
)
