CREATE FUNCTION getLeagueTable (@league_id INT)
RETURNS TABLE
AS
RETURN
SELECT
t.team_name as Club,
dbo.getNumberOfGames(ts.team_id) as MP,
wins as W,
draws as D,
losses as L,
goals_for as GF,
goals_against as GA,
dbo.goalDifference(ts.team_id) as GD,
dbo.getPoints(ts.team_id) as Pts
FROM Team_Stats ts
	INNER JOIN Team t on t.team_id = ts.team_id
WHERE ts.league_id=@league_id;
GO
