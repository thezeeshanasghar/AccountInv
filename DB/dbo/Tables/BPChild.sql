CREATE TABLE [dbo].[BPChild]
(
	[ID]            INT           IDENTITY (1, 1) NOT NULL,
    [BPParentID]          INT NOT NULL,
    [AccountID]          INT NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Debit]         FLOAT CONSTRAINT [DF_BPChild_Debit] DEFAULT ((0)) NOT NULL,
    [Credit]        FLOAT CONSTRAINT [DF_BPChild_Credit] DEFAULT ((0)) NOT NULL,
    
    [Date] DATE NOT NULL DEFAULT (getdate()), s
    CONSTRAINT [PK_BPChild] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_BPChild_BPParent] FOREIGN KEY([BPParentID]) REFERENCES [dbo].[BPParent] ([ID]), 
    CONSTRAINT [FK_BPChild_Account] FOREIGN KEY ([AccountID]) REFERENCES [Account]([ID])
)
