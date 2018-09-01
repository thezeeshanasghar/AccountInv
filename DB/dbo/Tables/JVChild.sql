CREATE TABLE [dbo].[JVChild]
(
	[ID]            INT           IDENTITY (1, 1) NOT NULL,
    [JVParentID]          INT NOT NULL,
    [AccountID]          INT NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Debit]         FLOAT CONSTRAINT [DF_JVChild_Debit] DEFAULT ((0)) NOT NULL,
    [Credit]        FLOAT CONSTRAINT [DF_JVChild_Credit] DEFAULT ((0)) NOT NULL,
    
    [Date] DATE NOT NULL DEFAULT (getdate()), 
    CONSTRAINT [PK_JVChild] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_JVChild_JVParent] FOREIGN KEY([JVParentID]) REFERENCES [dbo].[JVParent] ([ID]), 
    CONSTRAINT [FK_JVChild_Account] FOREIGN KEY ([AccountID]) REFERENCES [Account]([ID])
)
