CREATE TABLE [dbo].[Registration]
(
	[Id] VARCHAR(1000) NOT NULL PRIMARY KEY, 
    [First_Name] VARCHAR(50) NULL, 
    [Last_Name] VARCHAR(50) NULL, 
    [Email] VARCHAR(50) NULL, 
    [Password] VARCHAR(50) NULL, 
    [isAdmin] VARCHAR(50) NULL
)
