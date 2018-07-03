CREATE TABLE [dbo].[Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
 [UserType] NVARCHAR(50) NULL, 
    CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([ID] ASC)
 );