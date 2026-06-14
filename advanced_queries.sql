--Advanced SQL Practice: Subqueries, CASE, VIEW, and INDEX

--TASK 1:
--Uses a subquery to return shows with more episodes watched (& avg. # of episodes watched)

SELECT show_name, genre, episodes_watched
FROM tv_shows
WHERE episodes_watched > (
    SELECT AVG(episodes_watched)
    FROM tv_shows
);

--TASK 2:
--Uses CASE to create a new classification column based on rating

SELECT
    show_name,
    rating,
    CASE
        WHEN rating >= 9.0 THEN 'Excellent'
        WHEN rating >= 8.0 THEN 'Good'
        WHEN rating >= 7.0 THEN 'Okay'
        ELSE 'Low Rated'
    END AS rating_category
FROM tv_shows;


--TASK 3:
--Creates a view that summarizes shows by genre (DROP VIEW allows the file to be rerun without errors)

DROP VIEW IF EXISTS genre_summary;

CREATE VIEW genre_summary AS
SELECT
    genre,
    COUNT(*) AS number_of_shows,
    AVG(rating) AS average_rating,
    SUM(episodes_watched) AS total_episodes_watched
FROM tv_shows
GROUP BY genre;

--Selects all data from the saved view
SELECT * FROM genre_summary;


--TASK 4:
--Creates an index on genre because genre is often used in WHERE and GROUP BY filters
--An index helps speed up searches in large tables, not super helpful in smaller table

CREATE INDEX IF NOT EXISTS idx_tv_shows_genre
ON tv_shows(genre);
