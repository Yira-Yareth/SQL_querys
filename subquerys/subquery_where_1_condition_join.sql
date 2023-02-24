SELECT
 -- Select the team long and short names
   team_long_name,
  team_short_name
   FROM team
-- Filter for teams with 8 or more home goals
    WHERE team_api_id IN
     (SELECT home_team_api_id 
         FROM match
          WHERE home_team_goal >= 8);