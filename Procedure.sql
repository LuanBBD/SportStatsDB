CREATE PROCEDURE top_scorer1
@league_id int 
AS 
	SELECT TOP 5 Player.first_name, Player.last_name, Player_league_stats.goals 
	FROM (Player INNER JOIN Player_league_stats ON Player.player_league_stats_id=Player_league_stats.player_league_stats_id)
	WHERE Player_league_stats.league_id=@league_id
GO

