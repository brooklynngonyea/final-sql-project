--Aggregate and group by practice

--Chosen categorical column: genre
--Chosen numeric column to aggregate: episodes_watched

--TASK 1:
--Computes the total number of shows in the table and the average number of episodes watched

SELECT
    COUNT(*) AS total_shows,
    AVG(episodes_watched) AS average_episodes_watched
FROM tv_shows;


--TASK 2:
--Groups the shows by genre.
--For each genre, it shows how many shows are in that genre and the average number of episodes watched (highest to lowest)

SELECT
    genre,
    COUNT(*) AS number_of_shows,
    AVG(episodes_watched) AS average_episodes_watched
FROM tv_shows
GROUP BY genre
ORDER BY average_episodes_watched DESC;

--TASK 3:
--Uses HAVING to only show genres with at least 2 shows

SELECT
    genre,
    COUNT(*) AS number_of_shows,
    AVG(episodes_watched) AS average_episodes_watched
FROM tv_shows
GROUP BY genre
HAVING COUNT(*) >= 2
ORDER BY number_of_shows DESC;


-- TASK 4:
-- This condition would fail in WHERE because WHERE filters individual rows before grouping happens (COUNT(*) is calculated after GROUP BY).