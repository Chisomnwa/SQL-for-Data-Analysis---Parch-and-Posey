/* IN THIS PART, WE WILL BE WORKING WITH BASIC SQL STATEMENTS */

/* SELECT ALL COLUMNS FROM THE orders TABLE */

SELECT *
FROM orders;
-- There are 6,912 rows and 11 columns in the order table



/* SELECT ALL COLUMNS FROM THE accounts TABLE */

SELECT *
FROM accounts;
-- There are 351 rows and 7 columns in the accounts table



/* SELECT ALL COLUMNS FROM THE region TABLE */

SELECT *
FROM region;
-- There are 4 rows and 2 columns in the region table



/* SELECT ALL COLUMNS FROM THE sales_reps TABLE */

SELECT *
FROM sales_reps;
-- There are 50 rows and 3 columns in the sales_reps table



/* SELECT ALL COLUMNS FROM THE web_events TABLE */

SELECT *
FROM web_events;
-- There are 9,073 rows and 4 columns in the web_events table




/* USING TOP statement
NOTE: Not all database systems support SELECT TOP statements. MySQL and Postgre support LIMIT clause
to select a minimum number of records while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM*/

/*
Write a query that displays all the data in the occurred_at, account_id, and channel 
columns of web_events table, and limits the output to only the first 10 rows.
*/

SELECT TOP 10 occurred_at, account_id, channel
FROM web_events;




/* USING DISTINCT */

/*
Write a query to return the distinct channels in the web_events table
*/

SELECT DISTINCT channel
FROM web_events;
-- There are 6 distinct channels on the web events table




/* USING the ORDER BY clause */

/*
Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
*/

SELECT TOP 10 id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at;


/*
Write a query to return the top 5 orders in terms of the largest total_amt_usd. Include the id, account_id, and total_amt_usd.
*/

SELECT TOP 5 id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC;


/*
Write a query to return the lowest 20 orders interms of smallest total_amt_usd. Include the id, account-id, and total_amt_usd.
*/

SELECT TOP 20 id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd;


/*
Write a query that displays the order_id, account_id, and total dollar amount for all the orders, sorted
first by the account_id (in ascending order), and then by the total dolar amount (in descending order).
*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;


/*
Write a query that again displays the order_id, account_id, and total dollar amount for each order, but this time 
sorted first by the total dollar amount (in descending order), and then by the account_id (in ascending order).
*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;




/* USING the WHERE clause */

/*
Write a query that returns the first 5 rows and all columns from the orders 
table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
*/

SELECT TOP 5 *
FROM orders
WHERE gloss_amt_usd >= 1000;


/*
Write a query that returns the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
*/

SELECT TOP 10 *
FROM orders
WHERE total_amt_usd < 500;


/*
Filter the accounts table to include the company name, website, and the primary point 
of contact (primary_poc) just for the EOG Resources Company in the accounts table.
*/

SELECT name, website, primary_poc 
FROM accounts
WHERE name = 'EOG Resources';




/* USING ARITHMETIC OPERATORS */

/*
Create a column that divides the gloss_amount_usd by the gloss_quantity to find the unit price for the standard paper
paper for each order. Limit the results to the first 10 orders, and include the id and the account_id field.
*/

SELECT TOP 10 id,
           account_id,
		   (gloss_amt_usd/gloss_qty) AS unit_price
FROM orders;


/*
Wrie a query that finds the percentage of revenue that comes from poster paper for each other.You will need to use only the
columns that ends with _usd. (Try to do this without using the total column). Display the id and the account_id_fields also.
*/

SELECT TOP 10 id, 
		   account_id, 
		   (poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd)) * 100 AS poster_per_revenue
FROM orders;




/* USING the LIKE operator */

/*
Write a query that returns all the companies whose name starts with 'C'.
*/

SELECT name
FROM accounts
WHERE name LIKE 'C%';
-- 37 companies have their names starting with C


/*
Write a query that returns all companies whose names contain the string 'one' somewhere in the name.
*/

SELECT name
FROM accounts
WHERE name LIKE '%one%';
-- 6 companies have the string 'one' somewhere in their names 


/*
Write a query that returns all companies whose names end with 's'.
*/

SELECT name
FROM accounts
WHERE name LIKE '%s';
-- 81 companies have their names ending with 's'




/* USING THE IN operator */

/*
Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom')


/*
Use web-events table to find all information regarding all individuals who were contacted via channel of organic or adwords
*/

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')
-- 1,858 inviduals werecontacted via organic or adwords




/* USING NOT operator */

/*
Use web-events table to find all information regarding all individuals who were
contacted via any method except using organic or adwords methods.
*/

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords')
-- 7,215 inviduals were contacted via other methods except organic or adwords


/* Use the accounts table to find:
i. all the companies whose name do not start with 'c'. */
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';
-- 314 companies have their names not starting with C


/* ii. all the companies whose names do not contain the string 'one'. */
SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';
-- 346 companies do not have the string 'one' in their names




/* USING AND and BETWEEN operators */

/*
Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
*/

SELECT  *
FROM orders 
WHERE standard_qty > 1000
	AND poster_qty = 0
	AND gloss_qty = 0;


/*
Using the accounts table, find all the companies whose names do not start with 'c' and end with 's'.
*/

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%'
	AND name LIKE '%s';


/*
Write a query that displays the order date and gloss_qty data for all orders where gloss_qty data is between 24 and 29.
*/

SELECT occurred_at, gloss_qty
FROM orders 
WHERE gloss_qty BETWEEN 24 AND 29;


/*
Use the web_events table to find all the information regarding all individuals who were contacted via the organic
or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
*/

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')
AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;




/* USING the OR operator */

/*
Find the list of order_ids where either gloss_qty or poster_qty is greater than 4000. 
Only include the id field in the resulting table.
*/

SELECT id, gloss_qty, poster_qty
FROM orders
WHERE gloss_qty > 4000 
	OR poster_qty > 4000;


/*
Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
*/

SELECT id, standard_qty, gloss_qty, poster_qty
FROM orders
WHERE standard_qty = 0
	AND (gloss_qty > 1000
	OR poster_qty > 1000);


/*
Find all company names that start with a 'C' or 'W', and the primary contact contains 'ana, or 'Ana', but it doesn't contain 'eana'.
*/
SELECT name, primary_poc
FROM accounts 
WHERE (name LIKE 'C%' OR name LIKE 'W%')
	AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
	AND (primary_poc NOT LIKE '%eana%');



