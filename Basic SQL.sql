/*SELECT ALL COLUMNS FROM THE orders TABLE*/
SELECT *
FROM orders;
-- There are 6,912 rows and 11 columns in the order table



/*SELECT ALL COLUMNS FROM THE accounts TABLE*/
SELECT *
FROM accounts;
-- There are 351 rows and 7 columns in the accounts table



/*SELECT ALL COLUMNS FROM THE region TABLE*/
SELECT *
FROM region;
-- There are 4 rows and 2 columns in the region table



/*SELECT ALL COLUMNS FROM THE sales_reps TABLE*/
SELECT *
FROM sales_reps;
-- There are 50 rows and 3 columns in the sales_reps table



/*SELECT ALL COLUMNS FROM THE web_events TABLE*/
SELECT *
FROM web_events;
-- There are 9,073 rows and 4 columns in the web_events table



/* USING SELECT TOP statement
NOTE: Not all database sysytems support SELECT TOP statements
MySQL and Postgre support LIMIT clause to select a minimum number of records while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM*/

/*Write a query that displays all the data in the occurred_at, account_id, and channel columns of web_events table, and limits the output to only the first 10 rows*/
SELECT TOP 10 occurred_at, account_id, channel
FROM web_events;