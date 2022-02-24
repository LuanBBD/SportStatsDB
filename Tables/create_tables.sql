USE master;

IF EXISTS(select * from sys.databases where name='FinalTestDB')
DROP DATABASE FinalTestDB

CREATE DATABASE FinalTestDB;
GO

USE FinalTestDB;
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
	player_league_stats_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
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
	date_of_birth DATE NOT NULL CHECK (date_of_birth < GETDATE()),
	height INT NOT NULL,
	photo VARCHAR(250) NOT NULL,
	health_status BIT DEFAULT 0, -- 0: Fit, 1: Injured	
);
GO

CREATE TABLE Match_Details (
	match_id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	home_team_id INT FOREIGN KEY REFERENCES Team(team_id) NOT NULL,
	away_team_id INT FOREIGN KEY REFERENCES Team(team_id) NOT NULL,
	league_id INT FOREIGN KEY REFERENCES League(league_id) NOT NULL,
	season INT NOT NULL CHECK (season > 1850 AND season < 2100),
	match_date DATE NOT NULL CHECK (match_date > '1850-01-01' AND match_date < '2100-01-01'),
	match_time TIME,
	stadium VARCHAR(128),
	home_goals TINYINT DEFAULT 0,
	away_goals TINYINT DEFAULT 0,
	referee VARCHAR(64),
	match_status VARCHAR(32) NOT NULL,
	CONSTRAINT distinct_teams CHECK (home_team_id <> away_team_id)
);
GO

