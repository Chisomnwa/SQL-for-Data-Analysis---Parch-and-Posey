/* [Advanced] - SQL Advanced Joins and Performance Tuning */

/*
Write a query with FULL OUTER JOIN to see: 
- each account who has a sales rep and each sales rep that  has an account (all of the columns in these
returned rows will be full)
- but also each account that does not have a sales rep and each sales rep that does not have an account 
(some of the columns in these returned rows will be empty)
*/

SELECT a.*,
	s.id AS s_id,
    s.name AS sales_rep,
    s.region_id AS r_id
FROM accounts a
FULL OUTER JOIN sales_reps s 
ON a.sales_rep_id = s.id;


/*
Write a query that left joins the accounts table and the  sales_reps tables on each sale rep's ID
number and joins it using the < comparison operator on accounts.primary_poc and  sales_reps.name, like so:
	`accounts.primary_poc < sales_reps.name`
The query results should be a table with three columns: the account name (e.g. Johnson Controls), the primary 
contact name (e.g. Cammy Sosnowski), and the sales representative's name (e.g. Samuel Racine). 
*/

SELECT a.name,
	a.primary_poc,
    s.name AS sales_rep
FROM accounts a
LEFT JOIN sales_reps s
ON a.sales_rep_id = s.id
	AND a.primary_poc < s.name;


/*
Write a query that uses UNION ALL on two instances (and selecting all columns) of the accounts table. 
*/

SELECT *
FROM accounts

UNION ALL

SELECT *
FROM accounts;


/*
Add a WHERE clause to each of the tables that you unioned in the  query above, filtering the first
table where name equals Walmart and filtering the second table where name equals Disney.
*/

SELECT *
FROM accounts
WHERE name = 'Walmart'

UNION ALL

SELECT *
FROM accounts
WHERE name = 'Disney';


/*
Perform the union in your first query (under the Appending Data via UNION header) in a common table
expression and name it double_accounts. Then do a COUNT the number of times a name appears in the 
double_accounts table. If you do this correctly, your query results should have a count of 2 for each name.
*/

WITH double_accounts AS ( 
  	SELECT *
	FROM accounts
	
	UNION ALL

	SELECT *	
	FROM accounts
)
  
SELECT name, COUNT(*) AS count_of_names
FROM double_accounts
GROUP BY name;
