CREATE TABLE [dbo].[CPChild]
(
	[ID]            INT           IDENTITY (1, 1) NOT NULL,
    [CPParentID]          INT NOT NULL,
    [AccountID]          INT NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Debit]         FLOAT CONSTRAINT [DF_CPChild_Debit] DEFAULT ((0)) NOT NULL,
    [Credit]        FLOAT CONSTRAINT [DF_CPChild_Credit] DEFAULT ((0)) NOT NULL,
    
    [Date] DATE NOT NULL DEFAULT (getdate()), 
    CONSTRAINT [PK_CPChild] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_CPChild_CPParent] FOREIGN KEY([CPParentID]) REFERENCES [dbo].[CPParent] ([ID]), 
    CONSTRAINT [FK_CPChild_Account] FOREIGN KEY ([AccountID]) REFERENCES [Account]([ID])
)
