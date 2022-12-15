/* USING SQL JOINS */

/*
Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
*/

SELECT o.standard_qty, o.gloss_qty, o.poster_qty, a.website, a.primary_poc
FROM orders o
INNER JOIN
accounts a
ON o.account_id = a.id;



/*
Provide a table for all web_events associated with the account name of Walmart. There should be three columns. 
Be sure to include primary_oc, time_of_events, and the channel for each event. Additionally you might choose to add a fourth column
to assure only Walmart events were chosen.
*/

SELECT a.primary_poc, a.name, w.channel, w.occurred_at
FROM web_events w
INNER JOIN
accounts a
ON w.account_id = a.id
WHERE name = 'Walmart';



/*
Provide a table that provides the region for each sales_rep along with their associated account. Your final table should include
three column: the region-name, the sales_rep name, and account_name. Sort the accounts alphabetically.
*/

SELECT r.name AS Region, s.name AS Sales_Rep, a.name AS Account_Name
FROM region r
INNER JOIN sales_reps s
ON r.id = s.region_id
INNER JOIN accounts a
ON s.id = a.sales_rep_id 
ORDER BY a.name;



/*
Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total)
for the order. Your final table should have three columns: region name, account name, and unit price. A few accounts have 0 for
total, so we will divide by (total + 0.01) to assure not dividing by zero.
*/

SELECT r.name AS Region, a.name AS Account_Name, o.total_amt_usd/(o.total + 0.01) AS Unit_Price
FROM accounts a
INNER JOIN orders o
ON a.id = o.account_id
INNER JOIN sales_reps s
ON a.sales_rep_id = s.id
INNER JOIN region r
ON s.region_id = r.id;



/*
Provide a table that provides the region for each sales_rep along with tneir associated accounts. This time only for the
Midwest region. Your final table should include three columns: the region name, the sales_rep name, and the account name. 
Sort the accounts alphabetically (A - Z) according to account name.
*/

SELECT r.name AS Region, a.name AS Account_Name, s.name AS Sales_Rep
FROM accounts a
INNER JOIN sales_reps s
ON a.sales_rep_id = s.id
INNER JOIN region r
ON s.region_id = r.id
WHERE r.name = 'Midwest'
ORDER BY a.name;



/*
Provide a table that provides the region for each sales_rep, along with their associated accounts. This time only focus on 
for the accounts where the sales_rep has a first name starting with S and in the Midwest region. 
Your final table should include 3 columns: the region name, the sales_rep name, and the account name.
Sort the accounts alphabetically (A - Z) according to account name.
*/

SELECT r.name AS Region, a.name AS Account_Name, s.name AS Sales_Rep
FROM accounts a
INNER JOIN sales_reps s
	ON a.sales_rep_id = s.id
INNER JOIN region r
	ON s.region_id = r.id
WHERE r.name = 'Midwest'
	AND s.name LIKE 'S%' 
ORDER BY a.name;

--OR

SELECT r.name AS Region, a.name AS Account_Name, s.name AS Sales_Rep
FROM accounts a
INNER JOIN sales_reps s
	ON a.sales_rep_id = s.id
	AND s.name LIKE 'S%' 
INNER JOIN region r
	ON s.region_id = r.id
	AND r.name = 'Midwest'
ORDER BY a.name;



/*
Provide a table that provides the region for each sales_rep, along with their associated accounts. This time only focus on 
for the accounts where the sales_rep has a last name starting with K and in the Midwest region. 
Your final table should include 3 columns: the region name, the sales_rep name, and the account name. 
Sort the accounts alphabetically (A - Z) according to account name.
*/

SELECT r.name AS Region, a.name AS Account_Name, s.name AS Sales_Rep
FROM accounts a
INNER JOIN sales_reps s
	ON a.sales_rep_id = s.id
	AND s.name LIKE '% K%' 
INNER JOIN region r
	ON s.region_id = r.id
	AND r.name = 'Midwest'
ORDER BY a.name;


/*
Provide the name for each region for every order, as well as the account name and the unit price they paid
(total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100.
Your final table should have 3 columns: region name, account name, and unit price.
*/

SELECT r.name AS Region, a.name AS Account_name, o.total_amt_usd / (o.total + 0.01) AS Unit_Price
FROM orders o
INNER JOIN accounts a
	ON a.id = o.account_id
INNER JOIN sales_reps s
	ON s.id = a.sales_rep_id
INNER JOIN region r
	ON r.id = s.region_id
WHERE o.standard_qty > 100
ORDER BY standard_qty;



/* 
Provide the name for each region for every order, as well as the account name and the unit price they paid
(total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity 
exceeds 100 and the poster order quantity exceeds 50.
Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first.
*/

SELECT r.name AS Region, a.name AS Account_name, o.total_amt_usd / (o.total + 0.01) AS Unit_Price
FROM orders o
INNER JOIN accounts a
	ON a.id = o.account_id
INNER JOIN sales_reps s
	ON s.id = a.sales_rep_id
INNER JOIN region r
	ON r.id = s.region_id
WHERE(o.standard_qty > 100 AND o.poster_qty >50)
ORDER BY Unit_Price;


/*
What are the different channels used by the account id 1001? Your final table should have only 2 columns: account name and
the different channels. You can try SELECT DISTINCT to narrow down the results to only unique values.
*/

SELECT DISTINCT a.name, w.channel, a.id
FROM accounts a
INNER JOIN web_events w
	ON a.id = w.account_id
	AND a.id = 1001;


-- Find all the orders that occured in 2015. Your final table should have 4 columns: occurred_at, account_name, order total 
-- and order total_amt_usd
SELECT o.id, o.occurred_at, a.name AS Account_Name, o.total, o.total_amt_usd
FROM orders o
INNER JOIN accounts a 
	ON o.account_id = a.id
	AND occurred_at BETWEEN '2015-01-01' AND '2016-01-01'
ORDER BY o.occurred_at;

