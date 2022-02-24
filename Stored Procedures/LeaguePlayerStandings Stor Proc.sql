--SELECT lg.league_name, pl.first_name, pl.last_name, pls.goals, pls.yellow_cards, pls.red_cards, pls.appearances
--FROM     dbo.League lg INNER JOIN
--                  dbo.Player_League_Stats pls ON lg.league_id = pls.league_id INNER JOIN
--                  dbo.Player pl ON pls.player_league_stats_id = pl.player_league_stats_id INNER JOIN
--                  dbo.Team ON lg.league_id = dbo.Team.league_id AND pl.team_id = dbo.Team.team_id
--Where lg.league_name = 'English Premier League'
--ORDER BY pls.goals Desc














CREATE PROC LeaguePlayerStandings @leaguename1 varchar 
AS
BEGIN
SELECT lg.league_name, pl.first_name, pl.last_name, pls.goals, pls.yellow_cards, pls.red_cards, pls.appearances
FROM     dbo.League lg INNER JOIN
                  dbo.Player_League_Stats pls ON lg.league_id = pls.league_id INNER JOIN
                  dbo.Player pl ON pls.player_league_stats_id = pl.player_league_stats_id INNER JOIN
                  dbo.Team ON lg.league_id = dbo.Team.league_id AND pl.team_id = dbo.Team.team_id
Where lg.league_name = @leaguename1
ORDER BY pls.goals Desc
END
