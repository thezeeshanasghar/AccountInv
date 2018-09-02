﻿CREATE TABLE [dbo].[JVParent]
(
	[ID]            INT           IDENTITY (1, 1) NOT NULL,
    [Date]          DATE CONSTRAINT [DF_JVParent_Date] DEFAULT (getdate()) NOT NULL,
    [AccountID]          INT NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Ref1]          NVARCHAR (50)  NULL,
    [Ref2]         NVARCHAR(50)         NULL
    CONSTRAINT [PK_JVParent] PRIMARY KEY CLUSTERED ([ID] ASC), 
    [TotalDebit] FLOAT NULL, 
    [TotalCredit] FLOAT NULL, 
    [Difference] FLOAT NULL, 
    CONSTRAINT [FK_JVParent_Account] FOREIGN KEY ([AccountID]) REFERENCES [Account]([ID])
)