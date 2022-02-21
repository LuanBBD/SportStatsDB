CREATE TABLE Player(player_id INT PRIMARY KEY,team_id INT NOT NULL,player_name VARCHAR(128) NOT NULL,height INT NOT NULL,photo VARCHAR(250) NOT NULL,injury_status INT NOT NULL,position_id INT NOT NULL,player_league_stats_id INT)
GO
CREATE TABLE Player_league_stats(player_league_stats_id INT PRIMARY KEY,league_id INT,goals INT NOT NULL,yellow_cards INT NOT NULL,red_cards INT NOT NULL,appearances INT NOT NULL)
GO
ALTER TABLE Player
    ADD CONSTRAINT fk_player_stats FOREIGN KEY(player_league_stats_id)
    REFERENCES Player_league_stats(player_league_stats_id)
GO
