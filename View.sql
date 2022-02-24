CREATE VIEW Top_goal_scorer AS
	SELECT Player.first_name, Player.last_name, Player_league_stats.goals 
	FROM (Player INNER JOIN Player_league_stats ON Player.player_league_stats_id=Player_league_stats.player_league_stats_id)
GO
