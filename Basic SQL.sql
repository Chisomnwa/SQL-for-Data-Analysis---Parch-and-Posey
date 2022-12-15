/*IN THIS PART, WE WILL BE WORKING WITH BASIC SQL STATEMENTS*/

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



/* USING TOP statement
NOTE: Not all database systems support SELECT TOP statements. MySQL and Postgre support LIMIT clause
to select a minimum number of records while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM*/

/*Write a query that displays all the data in the occurred_at, account_id, and channel 
columns of web_events table, and limits the output to only the first 10 rows*/

SELECT TOP 10 occurred_at, account_id, channel
FROM web_events;



/*USING DISTINCT*/

/*Write a query to return the distinct channels in the web_events table*/

SELECT DISTINCT channel
FROM web_events;
-- There are 6 distinct channels on the web events table



/*USING the ORDER BY clause*/

/*Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.*/

SELECT TOP 10 id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at;


/*Write a query to return the top 5 orders in terms of the largest total_amt_usd. Include the id, account_id, and total_amt_usd.*/

SELECT TOP 5 id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC;


/*Write a query to return the lowest 20 orders interms of smallest total_amt_usd. Include the id, account-id, and total_amt_usd.*/

SELECT TOP 20 id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd;


/*Write a query that displays the order_id, account_id, and total dollar amount for all the orders, sorted
first by the account_id (in ascending order), and then by the total dolar amount (in descending order).*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;


/*Write a query that again displays the order_id, account_id, and total dollar amount for each order, but this time 
sorted first by the total dollar amount (in descending order), and then by the account_id (in ascending order).*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;



/*USING the WHERE clause*/

/*Write a query that returns the first 5 rows and all columns from the orders 
table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.*/

SELECT TOP 5 *
FROM orders
WHERE gloss_amt_usd >= 1000;


/*Write a query that returns the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.*/

SELECT TOP 10 *
FROM orders
WHERE total_amt_usd < 500;


/*Filter the accounts table to include the company name, website, and the primary point 
of contact (primary_poc) just for the EOG Resources Company in the accounts table.*/

SELECT name, website, primary_poc 
FROM accounts
WHERE name = 'EOG Resources';



/*USING ARITHMETIC OPEARTIONS*/

/* Create a column that divides the gloss_amount_usd by the gloss_quantity to find the unit price for the standard paper
paper for each order. Limit the results to the first 10 orders, and include the id and the account_id field.*/

SELECT TOP 10 id,
           account_id,
		   (gloss_amt_usd/gloss_qty) AS unit_price
FROM orders;


/* Wrie a query that finds the percentage of revenue that comes from poster paper for each other.You will need to use only the
columns that ends with _usd. (Try to do this without using the total column). Display the id and the account_id_fields also.*/

SELECT TOP 10 id, 
		   account_id, 
		   (poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd)) * 100 AS poster_per_revenue
FROM orders;



/*USING THE LIKE operator*/

-- Write a query that returns all the companies whose name starts with 'C'
SELECT name
FROM accounts
WHERE name LIKE 'C%';
-- 37 companies have their names starting with C


-- Write a query that returns all companies whose names contain the string 'one' somewhere in the name
SELECT name
FROM accounts
WHERE name LIKE '%one%';
-- 6 companies have the string 'one' somewhere in their names 


-- Write a query that returns all companies whose names end with 's'
SELECT name
FROM accounts
WHERE name LIKE '%s';
-- 81 companies have their names ending with 's'






