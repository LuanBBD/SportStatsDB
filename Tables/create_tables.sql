USE master
IF EXISTS(select * from sys.databases where name='SportStatsDB')
DROP DATABASE SportStatsDB

CREATE DATABASE SportStatsDB;
GO

USE TestDB;
GO

CREATE TABLE Manager(
    manager_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    first_name VARCHAR(120) NOT NULL,
    last_name VARCHAR(120) NOT NULL,
    date_of_birth DATE NOT NULL CHECK (date_of_birth < GETDATE()),
    country_of_birth VARCHAR(64) NOT NULL,
);
GO

CREATE TABLE Country (
    country_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    country_name VARCHAR(100) NOT NULL,
    flag VARCHAR(200) NULL,
);
GO

CREATE TABLE League(
    league_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    league_name VARCHAR(50) NOT NULL,
    country_id INT FOREIGN KEY REFERENCES Country(country_id) NOT NULL,
    logo VARCHAR(200) NULL
);
GO

CREATE TABLE Stadium(
    stadium_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    stadium_name varchar (120) NOT NULL,
    stadium_capacity int NOT NULL,
);
GO

CREATE TABLE Team(
    team_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    manager_id INT FOREIGN KEY REFERENCES Manager(manager_id) NOT NULL,
    league_id INT FOREIGN KEY REFERENCES League(league_id) NOT NULL,
    stadium_id INT FOREIGN KEY REFERENCES Stadium(stadium_id) NOT NULL,
    team_name VARCHAR(64) NOT NULL,
    team_logo VARCHAR(256) NOT NULL
);
GO

CREATE TABLE Team_Stats(
    team_stat_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    team_id INT FOREIGN KEY REFERENCES Team(team_id) NOT NULL,
    league_id INT FOREIGN KEY REFERENCES League(league_id) NOT NULL,
    goals_against INT DEFAULT 0,
    goals_for INT DEFAULT 0,
    losses TINYINT DEFAULT 0,
    draws TINYINT DEFAULT 0,	
    wins TINYINT DEFAULT 0,
);
GO

CREATE TABLE Position(
    position_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    position_name VARCHAR(50) NOT NULL,
);
GO

CREATE TABLE Player_League_Stats (
	player_league_stats_id INT PRIMARY KEY NOT NULL,
	league_id INT FOREIGN KEY REFERENCES League(league_id) NOT NULL,
	goals INT NOT NULL,
	yellow_cards TINYINT NOT NULL,
	red_cards TINYINT NOT NULL,
	appearances TINYINT NOT NULL
);
GO

CREATE TABLE Player (
	player_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	team_id INT FOREIGN KEY REFERENCES Team(team_id) NOT NULL,
	player_league_stats_id INT FOREIGN KEY REFERENCES Player_League_Stats(player_league_stats_id) NOT NULL,
	position_id INT FOREIGN KEY REFERENCES Position(position_id) NOT NULL,
	first_name VARCHAR(128) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	height INT NOT NULL,
	photo VARCHAR(250) NOT NULL,
	health_status BIT DEFAULT 0, -- 0: Fit, 1: Injured	
);
GO

CREATE TABLE Matches (
	match_id int NOT NULL,
	home_team_id int FOREIGN KEY REFERENCES Team(team_id) NOT NULL,
	away_team_id int FOREIGN KEY REFERENCES Team(team_id) NOT NULL,
	league_id int NOT NULL,
	season int NOT NULL CHECK (season > 1850 AND season < 2100),
	date_time datetime NOT NULL CHECK (date_time > '1850-01-01 00:00:00' AND date_time < '2100-01-01 00:00:00'),
	stadium varchar(128),
	home_goals tinyint NOT NULL,
	away_goals tinyint NOT NULL,
	referee varchar(64),
	logo_url varchar(256),
	CONSTRAINT match_pk PRIMARY KEY (match_id, home_team_id, away_team_id),
	CONSTRAINT match_u UNIQUE (match_id),
);
GO
