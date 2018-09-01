CREATE TABLE [dbo].[CRChild]
(
	[ID]            INT           IDENTITY (1, 1) NOT NULL,
    [CRParentID]          INT NOT NULL,
    [AccountID]          INT NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Debit]         FLOAT CONSTRAINT [DF_CRChild_Debit] DEFAULT ((0)) NOT NULL,
    [Credit]        FLOAT CONSTRAINT [DF_CRChild_Credit] DEFAULT ((0)) NOT NULL,
    
    [Date] DATE NOT NULL DEFAULT (getdate()), 
    CONSTRAINT [PK_CRChild] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_CRChild_CRParent] FOREIGN KEY([CRParentID]) REFERENCES [dbo].[CRParent] ([ID]), 
    CONSTRAINT [FK_CRChild_Account] FOREIGN KEY ([AccountID]) REFERENCES [Account]([ID])
)
