/* CLEANING DATA IN SQL*/

/*LEFT AND RIGHT FUNCTIONS*/

/*
In the accounts table, there is a column holding the website of each company. The last three digits specify what type 
of web address they are using. Pull these extenstions and provide how many of each website type exist in the accounts table.
*/

SELECT RIGHT(website, 3) AS extension, COUNT(*) AS num_occurences
FROM accounts
GROUP BY RIGHT(website, 3)
ORDER BY num_occurences DESC;




/*
Use the accounts table to pull the first letter of each company name to see the distribution of company names that 
begin with each letter or (number).
*/

SELECT LEFT(name, 1) AS extension, COUNT(*) AS num_occurences
FROM accounts
GROUP BY LEFT(name, 1)
ORDER BY num_occurences DESC;




/*
Use the accounts table and a CASE statement to create two groups: one group of company names that start with a number 
and a second group of those company that start with a letter. What proprtion of company names start with a letter?
*/

SELECT SUM(num) AS num, SUM(letter) AS letter
FROM
	(SELECT CASE WHEN LEFT(name, 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
				   THEN 1
				   ELSE 0
				   END AS num,
		   CASE WHEN LEFT(name, 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
				   THEN 0
				   ELSE 1
				   END AS letter
FROM accounts) letter_num;

-- OR

SELECT SUM (CASE WHEN LEFT(name, 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
				   THEN 1
				   ELSE 0
				   END) AS num,
	   SUM (CASE WHEN LEFT(name, 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
				   THEN 0
				   ELSE 1
				   END) AS letter
FROM accounts;
-- you then do the math to ascertain the proportion of companies that start with a letter i.e 350/351 = percent/100





/*CHARINDEX FUNCTION*/

/*
Use the accounts table to create the first and last name columns that hold the first and last names for the primary_poc.
*/

SELECT LEFT(primary_poc, CHARINDEX(' ', primary_poc) -1) AS first_name,
	   RIGHT(primary_poc, LEN(primary_poc) - CHARINDEX(' ', primary_poc)) AS last_name
FROM accounts;




/*
Now see if you can do the exact thing for every rep name in the sales_rep table. Again provide first and last name columns.
*/

SELECT LEFT(name, CHARINDEX(' ', name) -1) AS first_name,
	   RIGHT(name, LEN(name) - CHARINDEX(' ', name)) AS last_name
FROM sales_reps;




/*CONCAT FUNCTION*/

/*
Each company in the accounts table want to create an email address for each primary_poc. 
The email address should be the first name of the primary_poc.the last name primary poc @ company name.com
*/

WITH email_table AS (
	SELECT name,
		   LEFT(primary_poc, CHARINDEX(' ', primary_poc) -1) AS first_name,
		   RIGHT(primary_poc, LEN(primary_poc) - CHARINDEX(' ', primary_poc)) AS last_name
	FROM accounts)

SELECT CONCAT(first_name, '.', last_name, '.', '@', name, '.com')
FROM email_table;




/*
You may have noticed that in the previous solution some of the company names include spaces, which will certainly not work 
in an email address. See if you can create an email address that will work by removing all of the spaces in the account name.
*/

WITH email_table AS (
	SELECT name,
		   LEFT(primary_poc, CHARINDEX(' ', primary_poc) -1) AS first_name,
		   RIGHT(primary_poc, LEN(primary_poc) - CHARINDEX(' ', primary_poc)) AS last_name
	FROM accounts)

SELECT CONCAT(first_name, '.', last_name, '.', '@', REPLACE(name, ' ', ''), '.com') AS email
FROM email_table;




/*
We would also like to create an initial password, which they will change after their first log in. The first password
will be the first letter of the primary_poc's first name (lowercase), then the last letter of their first name(lowercase),
the first letter of their last name(lowercase), then the last letter of the last name(lowercase), the number of letters in
their first name, the number of letters in their last name, and then the name of the company they are working with, all
capitalized with no spaces.
*/

WITH email_table AS (
	SELECT name,
		   LEFT(primary_poc, CHARINDEX(' ', primary_poc) -1) AS first_name,
		   RIGHT(primary_poc, LEN(primary_poc) - CHARINDEX(' ', primary_poc)) AS last_name
	FROM accounts)

SELECT CONCAT(LEFT(LOWER(first_name),1), RIGHT(LOWER(first_name), 1),
	         LEFT(LOWER(last_name),1), RIGHT(LOWER(last_name), 1),
		     LEN(first_name), LEN(last_name),
		     REPLACE(UPPER(name), ' ', '')) AS password
FROM email_table;
