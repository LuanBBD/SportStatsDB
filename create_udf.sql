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
