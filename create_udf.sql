CREATE FUNCTION getNumberOfGames (
@team_id int
)

RETURNS int
AS
BEGIN
  DECLARE @no_of_games int

  SELECT @no_of_games = t.no_games_played FROM Team_Stats t
  WHERE t.team_id = @team_id

  RETURN @no_of_games
END

GO