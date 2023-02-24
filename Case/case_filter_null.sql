-- Select the season, date, home_goal, and away_goal columns
SELECT 
	season,
    date,
	home_team_goal,
	away_team_goal
FROM matches_italy_11_to_15
WHERE 
-- Exclude games not won by Bologna
	CASE WHEN home_team_api_id = 9857 AND home_team_goal > away_team_goal THEN 'Bologna Win'
		WHEN away_team_api_id = 9857 AND away_team_goal > home_team_goal THEN 'Bologna Win'  
		END IS NOT NULL;