
CREATE TABLE Team(
    team_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	manager_id int FOREIGN KEY REFERENCES Manager(manager_id) NOT NULL,
	league_id int FOREIGN KEY REFERENCES League(league_id) NOT NULL,
	stadium_id int FOREIGN KEY REFERENCES Stadium(stadium_id) NOT NULL,
	team_name VARCHAR(64) NOT NULL,
	no_of_players int NOT NULL,
	team_logo varchar(256) NOT NULL
);
GO

CREATE TABLE Test_Team_Stats(
    team_league_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	team_id int FOREIGN KEY REFERENCES Team(team_id) NOT NULL,
	league_pos int NOT NULL,
	goals_against int NOT NULL,
	goals_for int NOT NULL,
	goal_diff int NOT NULL,
	points int NOT NULL,
	losses int NOT NULL,
	wins int NOT NULL,
	no_games_played int NOT NULL
);
GO