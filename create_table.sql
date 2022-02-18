CREATE TABLE [dbo].[Matches] (
	[match_id] [int] NOT NULL,
	[home_team_id] [int] FOREIGN KEY REFERENCES Test_Team(team_id) NOT NULL,
	[away_team_id] [int] FOREIGN KEY REFERENCES Test_Team(team_id) NOT NULL,
	[league_id] [int] NOT NULL,
	[season] [int] NOT NULL CHECK (season > 1850 AND season < 2100),
	[date_time] [datetime] NOT NULL CHECK (date_time > '1850-01-01 00:00:00' AND date_time < '2100-01-01 00:00:00'),
	[stadium] [varchar](128),
	[home_goals] [tinyint] NOT NULL,
	[away_goals] [tinyint] NOT NULL,
	[referee] [varchar](64),
	[logo_url] [varchar](256),
	CONSTRAINT [match_pk] PRIMARY KEY (match_id, home_team_id, away_team_id),
	CONSTRAINT [match_u] UNIQUE (match_id),
);
GO
