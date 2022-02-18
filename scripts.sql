USE master
IF EXISTS(select * from sys.databases where name='SportStatsDB')
DROP DATABASE SportStatsDB

CREATE DATABASE SportStatsDB;
GO

USE SportStatsDB;
GO

CREATE TABLE [dbo].[Manager](
    [ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName][varchar](120) NOT NULL,
	[LastName] [varchar](120) NOT NULL,
    [DateOfBirth] [date] NOT NULL,
    [CountryOfBirth] [varchar](120) NOT NULL,
);
GO
ALTER TABLE dbo.Manager
ADD CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED ([ManagerID] ASC);
GO
