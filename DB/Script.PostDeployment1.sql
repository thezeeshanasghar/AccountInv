/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
insert into [login] VALUES ('admin@gmail.com','admin','Admin');
insert into [login] VALUES ('manager@gmail.com','manager','Manager');
INSERT INTO [Config] VALUES (CAST(N'2018-12-21' AS Date), CAST(N'2019-12-12' AS Date), N'AFX')