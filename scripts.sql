USE master
IF EXISTS(select * from sys.databases where name='SportStatsDB')
DROP DATABASE SportStatsDB

CREATE DATABASE SportStatsDB;
GO

USE SportStatsDB;
GO

CREATE TABLE [dbo].[Manager](
    [manager_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name][varchar](120) NOT NULL,
	[last_name] [varchar](120) NOT NULL,
    [date_of_birth] [date] NOT NULL,
    [country_0f_birth] [varchar](120) NOT NULL,
);
GO
ALTER TABLE dbo.Manager
ADD CONSTRAINT [pk_manager] PRIMARY KEY CLUSTERED ([manager_id]);
GO
