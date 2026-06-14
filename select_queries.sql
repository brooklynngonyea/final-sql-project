--Query 1:
--Returns selected columns only, filters by a numeric condition, sorts ratings from highest to lowest, and limits results to the top 5
SELECT show_name, genre, rating, episodes_watched
FROM tv_shows
WHERE rating >= 8.0
ORDER BY rating DESC
LIMIT 5;

--Query 2:
--Uses LIKE to find shows with "The" in the title
SELECT show_name, genre, streaming_service
FROM tv_shows
WHERE show_name LIKE '%The%';

--Query 3:
--Uses BETWEEN to find shows with ratings between 7.5 and 9.5
SELECT show_name, rating
FROM tv_shows
WHERE rating BETWEEN 7.5 AND 9.5;

--Query 4:
--Uses DISTINCT to list each unique genre in the table
SELECT DISTINCT genre
FROM tv_shows;

--Query 5:
--Selects only the columns needed for this report
SELECT show_name, genre, rating, streaming_service

--Chooses the table the data is coming from
FROM tv_shows

--Filters for shows that are either highly rated OR already completed
WHERE (rating >= 8.0 OR completed = TRUE)

--Uses IN to only include shows from selected streaming services.
AND streaming_service IN ('Netflix')

--Sorts the results from highest rating to lowest rating
ORDER BY rating DESC

--Limits the output to only the top 5 results
LIMIT 5;