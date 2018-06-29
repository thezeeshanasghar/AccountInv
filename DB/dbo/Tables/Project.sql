CREATE TABLE [dbo].[Project]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Code] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(100) NULL, 
    [Location] NVARCHAR(100) NOT NULL, 
    [Responsible] NVARCHAR(50) NOT NULL
)
