CREATE TABLE [dbo].[BRChild]
(
	[ID]            INT           IDENTITY (1, 1) NOT NULL,
    [BRParentID]          INT NOT NULL,
    [AccountID]          INT NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Debit]         FLOAT CONSTRAINT [DF_BRChild_Debit] DEFAULT ((0)) NOT NULL,
    [Credit]        FLOAT CONSTRAINT [DF_BRChild_Credit] DEFAULT ((0)) NOT NULL,
    
    [Date] DATE NOT NULL DEFAULT (getdate()), 
    CONSTRAINT [PK_BRChild] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_BRChild_BRParent] FOREIGN KEY([BRParentID]) REFERENCES [dbo].[BRParent] ([ID]), 
    CONSTRAINT [FK_BRChild_Account] FOREIGN KEY ([AccountID]) REFERENCES [Account]([ID])
)
