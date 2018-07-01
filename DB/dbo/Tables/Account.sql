CREATE TABLE [dbo].[Account] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [Code]          NVARCHAR (50) NOT NULL,
    [Name]          NVARCHAR (50) NOT NULL,
    [ProjectCode] NVARCHAR (50) NULL,
    [Type]          NVARCHAR (3)  NOT NULL,
    [Debit]         BIGINT        CONSTRAINT [DF_Account_Debit] DEFAULT ((0)) NOT NULL,
    [Credit]        BIGINT        CONSTRAINT [DF_Account_Credit] DEFAULT ((0)) NOT NULL,
    [Address]       NVARCHAR (50) NULL,
    [Phone]         NVARCHAR (50) NULL,
    [Email]         NVARCHAR (50) NULL,
    [Active]        BIT           CONSTRAINT [DF_Account_Active] DEFAULT ((1)) NOT NULL,
    [YearStart]     DATE          CONSTRAINT [DF_Account_YearStart] DEFAULT (getdate()) NOT NULL,
    [Created]       DATE          CONSTRAINT [DF_Account_Created] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([ID] ASC)
);

