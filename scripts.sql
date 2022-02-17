USE master
IF EXISTS(select * from sys.databases where name='SportStatsDB')
DROP DATABASE SportStatsDB

CREATE DATABASE SportStatsDB;
GO

USE SportStatsDB;
GO



CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[flag] [varchar](200) NULL,
	CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
	(
		[CountryID] ASC
	)
);
GO

CREATE TABLE [dbo].[League](
	[LeagueID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CountryID] [int] FOREIGN KEY REFERENCES Country(CountryID) NOT NULL,
	[Logo] [varchar](200) NULL,
	CONSTRAINT [PK_League] PRIMARY KEY CLUSTERED 
	(
		[LeagueID] ASC
	)
);
GO

CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
	(
		[PositionID] ASC
	)
);
GO

INSERT INTO [dbo].[Country]
           ([Name]
           ,[flag]         
           )
VALUES	('England','https://media.api-sports.io/flags/gb.svg'),
		('Spain', 'https://media.api-sports.io/flags/es.svg'),
		('Italy', 'https://media.api-sports.io/flags/it.svg'),
		('Germany', 'https://media.api-sports.io/flags/de.svg')
GO

INSERT INTO [dbo].[League]
           ([Name]
           ,[CountryID]
           ,[Logo]
           )
VALUES	('Premier League',1,'https://media.api-sports.io/football/leagues/39.png'),
		('La Liga',2, 'https://media.api-sports.io/football/leagues/140.png'),
		('Serie A',3, 'https://media.api-sports.io/football/leagues/135.png'),
		('Bundesliga 1',4, 'https://media.api-sports.io/football/leagues/78.png')
GO

INSERT INTO [dbo].[Position]
           ([Name]   
           )
VALUES	('Goalkeeper'),
		('Defender'),
		('Midfielder'),
		('Attacker')
GO