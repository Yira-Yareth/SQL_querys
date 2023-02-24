SELECT 
	date,
	CASE WHEN home_team_api_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as home,
	CASE WHEN away_team_api_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as away,
	-- Identify all possible match outcomes
	CASE WHEN home_team_goal > away_team_goal AND home_team_api_id = 8634 THEN 'Barcelona win!'
        WHEN home_team_goal > away_team_goal AND home_team_api_id = 8633 THEN 'Real Madrid win!'
        WHEN home_team_goal < away_team_goal AND away_team_api_id = 8634 THEN 'Barcelona win!'
        WHEN home_team_goal < away_team_goal AND away_team_api_id = 8633 THEN 'Real Madrid win!'
        ELSE 'Tie!' END AS outcome
FROM matches_spain_11_to_15
WHERE (away_team_api_id = 8634 OR home_team_api_id = 8634)
      AND (away_team_api_id = 8633 OR home_team_api_id = 8633);