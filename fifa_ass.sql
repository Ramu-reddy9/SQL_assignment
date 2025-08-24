
use ramudb;

# 1.How many players are there in the dataset?

select count(*) from fifa;


# 2.How many nationalities do these players belong to?

select count(distinct nationality) from fifa;

# 3.Which nationality has the highest number of players, what are the top 3 nationalities by # of players?

select nationality,count(*) as player_count from fifa group by nationality
order by player_count desc limit 1;

select nationality,count(*) as player_count from fifa group by nationality
order by player_count desc limit 3;

# 4.What is the total wage given to all players? What’s the average and standard deviation?

select sum(wage) as total_wage,
avg(wage) as avg_wage,
std(wage) as stddev_wage
from fifa;

# 5.Which player has the highest wage? Who has the lowest ?

select name as highest_wager from fifa order by wage desc limit 1;

select name as lowest_wager from fifa order by wage asc limit 1;

# 6.The player having the best overall rating? Worst overall rating?

select name as best_overall_rated_player,overall  from fifa order by overall desc limit 1; 

select name as worst_overall_rated_player ,overall from fifa order by overall asc limit 1; 

# 7.Club having the highest total of overall rating? Highest Average of overall rating?

select club,sum(overall) as total_overall from fifa
group by club
order by total_overall desc limit 1;

# 8.What are the top 5 clubs based on the average rating of their players?

select club ,avg(overall) as avg_overall from fifa 
group by club
order by avg_overall desc limit 5;

# 9.What is the distribution of players whose preferred foot is left vs right ?
select Preferred_Foot ,count(*) as player_count from fifa
group by Preferred_Foot
order by player_count;

# 10. Which jersey number is the luckiest?
select Jersey_number , avg(overall) as avg_overall from fifa
group by Jersey_number
order by avg_overall desc limit 1;

# 11.what is the frequency distribution of nationalities among players whose club name starts with M?

select nationality, count(* ) as players_count from fifa where club like "M%" 
group by nationality
order by players_count desc;

# 12.how many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019(both inclusive)?

select count(*) as players_joined from fifa where club between "2018-05-20" and "2019-04-10";

# 13. How many players have joined their respective clubs date wise?

select joined,count(*) as players_joined from fifa 
group by joined
order by str_to_date(joined ,"%d-%m-%y") asc;

# 14. How many players have joined their respective clubs yearly?


select year(str_to_date(joined, "%d-%m-%Y")) as join_year,
count(*) as players_joined from fifa
group by join_year order by join_year;




