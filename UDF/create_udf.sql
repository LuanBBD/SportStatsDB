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
