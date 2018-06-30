﻿CREATE TABLE [dbo].[Config]
(
	[ID] INT IDENTITY(1,1) NOT NULL, 
    [StartDate] DATE NOT NULL, 
    [EndDate] DATE NOT NULL,
	CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED([ID] ASC)
);
