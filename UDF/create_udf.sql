
CREATE FUNCTION getLeagueTable (@league_id INT)
RETURNS TABLE
AS
RETURN
SELECT
t.team_name as Club,
no_games_played as MP,
wins as W,
draws as D,
losses as L,
goals_for as GF,
goals_against as GA,
goals_for - goals_against as GD,
(wins * 3 + draws) as Pts
FROM Team_Stats ts
	INNER JOIN Team t on t.team_id = ts.team_id
WHERE ts.league_id=@league_id;
GO

select * from getLeagueTable(2) order by Pts desc
