USE master
IF EXISTS(select * from sys.databases where name='SportStatsDB')
DROP DATABASE SportStatsDB

CREATE DATABASE SportStatsDB;
GO

USE SportStatsDB;
GO



CREATE TABLE [dbo].[Country](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[flag] [varchar](200) NULL,
	CONSTRAINT [pk_country] PRIMARY KEY CLUSTERED 
	(
		[country_id] ASC
	)
);
GO

CREATE TABLE [dbo].[League](
	[league_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[country_id] [int] FOREIGN KEY REFERENCES Country(country_id) NOT NULL,
	[logo] [varchar](200) NULL,
	CONSTRAINT [pk_league] PRIMARY KEY CLUSTERED 
	(
		[league_id] ASC
	)
);
GO

CREATE TABLE [dbo].[Position](
	[position_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	CONSTRAINT [pk_position] PRIMARY KEY CLUSTERED 
	(
		[position_id] ASC
	)
);
GO

INSERT INTO [dbo].[Country]
           ([name]
           ,[flag]         
           )
VALUES	('England','https://media.api-sports.io/flags/gb.svg'),
		('Spain', 'https://media.api-sports.io/flags/es.svg'),
		('Italy', 'https://media.api-sports.io/flags/it.svg'),
		('Germany', 'https://media.api-sports.io/flags/de.svg')
GO

INSERT INTO [dbo].[League]
           ([name]
           ,[country_id]
           ,[logo]
           )
VALUES	('Premier League',1,'https://media.api-sports.io/football/leagues/39.png'),
		('La Liga',2, 'https://media.api-sports.io/football/leagues/140.png'),
		('Serie A',3, 'https://media.api-sports.io/football/leagues/135.png'),
		('Bundesliga 1',4, 'https://media.api-sports.io/football/leagues/78.png')
GO

INSERT INTO [dbo].[Position]
           ([name]   
           )
VALUES	('Goalkeeper'),
		('Defender'),
		('Midfielder'),
		('Attacker')
GO