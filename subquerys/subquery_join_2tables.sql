SELECT 
-- Select the team long and short names
 team_long_name,
 team_short_name
  FROM team 
-- Exclude all values from the subquery
   WHERE team_api_id NOT IN
   (SELECT DISTINCT home_team_api_id FROM
   --As long as the values in your list match a column in your main query's table, you don't need to use a join -- even if the list is from a separate table.
   (SELECT * 
     FROM match
       WHERE season IN ("2011/2012", "2012/2013", "2013/2014", "2014/2015")))