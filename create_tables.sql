--TV Show Tracker Database

--Remove the table if it already exists
DROP TABLE IF EXISTS tv_shows;

--Creates a table to store info
CREATE TABLE tv_shows (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY, --unique id for each TV show

    show_name TEXT NOT NULL, --stores bame

    genre TEXT NOT NULL --stores genre & checks with approved list
        CHECK (genre IN ('Comedy', 'Drama', 'Sci-Fi', 'Mystery', 'Reality', 'Crime')),

    seasons INTEGER --number of seasons
        CHECK (seasons > 0),

    episodes_watched INTEGER DEFAULT 0 --number of episodes
        CHECK (episodes_watched >= 0),

    rating REAL --rating out of 10
        CHECK (rating >= 0 AND rating <= 10),

    date_started DATE, --date started show (nullable)

    completed BOOLEAN DEFAULT FALSE, --tracks if show has been completed

    streaming_service TEXT --streaming service (nullable)
);

--Insert 6 rows

INSERT INTO tv_shows
(show_name, genre, seasons, episodes_watched, rating, date_started, completed, streaming_service)
VALUES
('Brooklyn 99', 'Comedy', 8, 153, 8.0, '2021-01-10', TRUE, 'Netflix'),

('Modern Family', 'Comedy', 11, 250, 9.5, '2024-02-15', TRUE, 'Disney+'),

('The Flash', 'Sci-Fi', 9, 151, 8.8, '2018-03-20', FALSE, 'Netflix'),

('Gossip Girl', 'Drama', 6, 121, 7.5, '2024-06-30', TRUE, 'Netflix'),

('Only Murders In the Building', 'Mystery', 5, 50, 7.0, '2021-10-12', TRUE, 'Disney+'),

('Grey''s Anatomy', 'Drama', 22, 363, 8.8, NULL, FALSE, 'Disney+');

-- VERIFY DATA

SELECT * FROM tv_shows;

-- View the structure of the tv_shows table
-- PostgreSQL equivalent of SQLite .schema

SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'tv_shows' -- Only show information for the tv_shows table
ORDER BY ordinal_position; -- Display columns in the order they appear in the table

-- FAILED INSERT #1
-- Violates NOT NULL constraint

INSERT INTO tv_shows
show_name, genre, seasons, episodes_watched, rating, date_started, completed, streaming_service)
VALUES
NULL, 'Comedy', 2, 20, 7.5, '2024-06-01', FALSE, 'Netflix');

-- Expected Error: null value in column "show_name" violates not-null constraint

-- FAILED INSERT #2
-- Violates CHECK constraint on genre

INSERT INTO tv_shows
(show_name, genre, seasons, episodes_watched, rating, date_started, completed, streaming_service)
VALUES
('Random Show', 'Fantasy', 3, 25, 8.0, '2024-06-02', FALSE, 'Hulu');

-- Expected Error: new row violates check constraint

-- FAILED INSERT #3
-- Violates CHECK constraint on rating

INSERT INTO tv_shows
(show_name, genre, seasons, episodes_watched, rating, date_started, completed, streaming_service)
VALUES
('Bad Rating Show', 'Drama', 1, 10, 15.0, '2024-06-03', FALSE, 'Netflix');

-- Expected Error: new row violates check constraint