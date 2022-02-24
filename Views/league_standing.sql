-- creating a view that will give us the top EPL players 
CREATE VIEW TopEPLPlayer
AS 
SELECT dbo.League.league_id, dbo.League.league_name, dbo.Player.first_name, dbo.Player.last_name, dbo.Team.team_name, dbo.Player_league_stats.goals, dbo.Player_league_stats.yellow_cards, dbo.Player_league_stats.red_cards, 
                  dbo.Player_league_stats.appearances
FROM     dbo.Team INNER JOIN
                  dbo.League ON dbo.Team.league_id = dbo.League.league_id CROSS JOIN
                  dbo.Player_league_stats INNER JOIN
                  dbo.Player ON dbo.Player_league_stats.player_league_stats_id = dbo.Player.player_league_stats_id

Where dbo.League.league_name ='English Premier League'
