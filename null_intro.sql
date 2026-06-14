-- Task 1: Check data types 

SELECT
    pg_typeof(42) AS integer_type,
    pg_typeof(42.0) AS decimal_type,
    pg_typeof('hi') AS text_type,
    pg_typeof(NULL) AS null_type;

-- Task 2: Compare NULL using = and IS NULL

SELECT 1 = NULL;

SELECT 1 IS NULL;

-- Task 3: Concatenate a number and unit string from the TV Show Tracker domain

SELECT 'Episodes Watched: ' || 45 || ' episodes' AS episode_label;