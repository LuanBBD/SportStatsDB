CREATE PROCEDURE upcomingMatches
@team_id int 
AS 
	SELECT TOP 5
	t1.team_name AS home_team,
	t2.team_name AS away_team,
	m.date_time,
	m.stadium,
	m.home_goals,
	m.away_goals
	FROM Matches m
	INNER JOIN Team t1 ON t1.team_id=m.home_team_id
	INNER JOIN Team t2 ON t2.team_id=m.away_team_id
	WHERE( m.home_team_id = @team_id 
	OR m.away_team_id= @team_id)
	AND date_time>GETDATE()
GO

CREATE PROCEDURE prevMatches
@team_id int 
AS 
	SELECT
	t1.team_name AS home_team,
	t2.team_name AS away_team,
	m.date_time,
	m.stadium,
	m.home_goals,
	m.away_goals
	FROM Matches m
	INNER JOIN Team t1 ON t1.team_id=m.home_team_id
	INNER JOIN Team t2 ON t2.team_id=m.away_team_id
	WHERE( m.home_team_id = @team_id 
	OR m.away_team_id= @team_id)
	AND date_time<GETDATE()
	ORDER BY date_time 
	OFFSET dbo.getNumberOfGames(@team_id)-5 ROWS
	FETCH NEXT 5 ROWS ONLY;
GO