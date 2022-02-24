
CREATE FUNCTION getNumberOfGames (
@team_id int
)

RETURNS int
AS
BEGIN
  DECLARE @no_of_games int;

  SELECT @no_of_games = t.draws+t.wins+t.losses FROM Team_Stats t
  WHERE t.team_id = @team_id;

  RETURN @no_of_games;
END

GO

CREATE FUNCTION getPoints
(
@team_id int
)
RETURNS int
AS
BEGIN
  DECLARE @points int

  SELECT @points = (wins *3 + draws) FROM Team_Stats
  WHERE team_id = @team_id

  RETURN @points
END
GO

CREATE FUNCTION goalDifference
(
@team_id int
)
RETURNS int
AS
BEGIN
  DECLARE @goal_difference int

  SELECT @goal_difference = (goals_for - goals_against) FROM Team_Stats
  WHERE team_id = @team_id

  RETURN @goal_difference
END
GO

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
