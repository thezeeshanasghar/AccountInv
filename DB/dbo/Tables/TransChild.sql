CREATE TABLE [dbo].[TransChild]
(
	[ID]            INT           IDENTITY (1, 1) NOT NULL,
    [TransParentID]          INT NOT NULL,
    [AccountID]          INT NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Debit]         FLOAT CONSTRAINT [DF_TransChild_Debit] DEFAULT ((0)) NOT NULL,
    [Credit]        FLOAT CONSTRAINT [DF_TransChild_Credit] DEFAULT ((0)) NOT NULL,
    
    [Date] DATE NOT NULL DEFAULT (getdate()), 
    CONSTRAINT [PK_TransChild] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_TransChild_TransParent] FOREIGN KEY([TransParentID]) REFERENCES [dbo].[TransParent] ([ID]), 
    CONSTRAINT [FK_TransChild_Account] FOREIGN KEY ([AccountID]) REFERENCES [Account]([ID])
)
