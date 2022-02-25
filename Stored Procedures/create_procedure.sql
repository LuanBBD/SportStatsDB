CREATE PROCEDURE upcomingMatches
@team_id int 
AS 
    SELECT TOP 5
	t1.team_name AS home_team,
	t2.team_name AS away_team,
	m.match_date,
	m.match_time,
	m.stadium,
	m.match_status
	FROM Match_Details m
	INNER JOIN Team t1 ON t1.team_id=m.home_team_id
	INNER JOIN Team t2 ON t2.team_id=m.away_team_id
	WHERE( m.home_team_id = @team_id 
	OR m.away_team_id= @team_id)
	AND match_date>GETDATE() 
	ORDER BY m.match_date
GO


CREATE PROCEDURE prevMatches
@team_id int 
AS 
	SELECT
	t1.team_name AS home_team,
	t2.team_name AS away_team,
	m.match_date,
	m.match_time,
	m.stadium,
	m.home_goals,
	m.away_goals,
	m.match_status
	FROM Match_Details m
	INNER JOIN Team t1 ON t1.team_id=m.home_team_id
	INNER JOIN Team t2 ON t2.team_id=m.away_team_id
	WHERE( m.home_team_id = @team_id 
	OR m.away_team_id= @team_id)
	AND match_date<GETDATE()
	ORDER BY match_date
	OFFSET dbo.getNumberOfGames(@team_id)-5 ROWS
	FETCH NEXT 5 ROWS ONLY;
GO

CREATE PROCEDURE league_top_scorer
@league_id int 
AS 
	SELECT Player.first_name, Player.last_name, Player_League_Stats.goals 
	FROM (Player INNER JOIN Player_League_Stats ON Player.player_league_stats_id=Player_League_Stats.player_league_stats_id)
	WHERE Player_League_Stats.league_id=@league_id
	ORDER BY Player_League_Stats.goals DESC
	OFFSET 0 ROWS
	FETCH NEXT 5 ROWS ONLY;
GO

SELECT Top(10) PERCENT lg.league_name, pl.first_name, pl.last_name, pls.goals, pls.yellow_cards, pls.red_cards, pls.appearances
FROM     dbo.League lg INNER JOIN
                  dbo.Player_League_Stats pls ON lg.league_id = pls.league_id INNER JOIN
                  dbo.Player pl ON pls.player_league_stats_id = pl.player_league_stats_id INNER JOIN
                  dbo.Team ON lg.league_id = dbo.Team.league_id AND pl.team_id = dbo.Team.team_id
--Where lg.league_name = 'English Premier League'
ORDER BY pls.goals Desc
Go

 

 

CREATE PROC LeaguePlayerStandings @leaguename1 varchar(50) 
AS
BEGIN
SELECT lg.league_name, pl.first_name, pl.last_name, dbo.Team.team_name, pls.goals, pls.yellow_cards, pls.red_cards, pls.appearances
FROM     dbo.League lg INNER JOIN
                  dbo.Player_League_Stats pls ON lg.league_id = pls.league_id INNER JOIN
                  dbo.Player pl ON pls.player_league_stats_id = pl.player_league_stats_id INNER JOIN
                  dbo.Team ON lg.league_id = dbo.Team.league_id AND pl.team_id = dbo.Team.team_id
Where lg.league_name = @leaguename1
ORDER BY pls.goals Desc
END
go
EXEC LeaguePlayerStandings 'English Premier League';
go
