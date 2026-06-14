--UPDATE AND DELETE PRACTICE

--TASK 1:
--Select rows first, update them, then verify the update
--Condition chosen: shows on Netflix

--Displays Netflix shows before the update
SELECT show_name, streaming_service, completed
FROM tv_shows
WHERE streaming_service = 'Netflix';

--Updates all Netflix shows to completed = TRUE
UPDATE tv_shows
SET completed = TRUE
WHERE streaming_service = 'Netflix';

--Verifies that the update was successful
SELECT show_name, streaming_service, completed
FROM tv_shows
WHERE streaming_service = 'Netflix';


--TASK 2:
--Use BEGIN and ROLLBACK to demonstrate a transaction

--Starts a transaction
BEGIN;

--Deletes all Comedy shows
DELETE FROM tv_shows
WHERE genre = 'Comedy';

--Confirms that Comedy shows are gone inside the transaction
SELECT *
FROM tv_shows
WHERE genre = 'Comedy';

--Cancels the delete operation and restores the data
ROLLBACK;

--Confirms that the Comedy shows have been restored
SELECT *
FROM tv_shows
WHERE genre = 'Comedy';


--TASK 3:
-- Explain DELETE without a WHERE clause.

-- DELETE FROM tv_shows;
-- This command would delete every row in the tv_shows table
-- because no WHERE clause is provided.
-- To avoid accidentally deleting all records, I will always
-- run a SELECT query first to confirm which rows match my
-- WHERE condition before running an UPDATE or DELETE