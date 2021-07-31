4.
SELECT a.name,
	SUM(total_amt_usd) total_spending
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.name
HAVING SUM(total_amt_usd) > 30000
ORDER BY total_spending

3.
SELECT a.name,
	MAX(o.account_id) as orders_count
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.name
ORDER BY orders_count DESC
LIMIT 1



2.
SELECT a.name,
	COUNT(o.account_id) as orders_count
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.name
HAVING COUNT(o.account_id) > 20
ORDER BY orders_count

1.
SELECT sr.name,
	COUNT(*) as accounts_count
FROM sales_reps sr
JOIN accounts a
	ON sr.id = a.sales_rep_id
GROUP BY sr.name
HAVING COUNT(*)  > 5
ORDER BY accounts_count
----------------------------------------------------
SELECT sr.id,
	sr.name,
    COUNT(*) as num_accounts
FROM sales_reps sr
JOIN accounts a
	ON	sr.id = a.sales_rep_id
GROUP BY sr.id, sr.name
ORDER BY sr.name


SELECT DISTINCT sr.name sales_rep
FROM sales_reps sr
JOIN accounts a
	ON sr.id = a.sales_rep_id
ORDER BY sales_rep


SELECT DISTINCT a.name account_name,
	r.name region_name
FROM accounts a
JOIN sales_reps sr
	ON a.sales_rep_id = sr.id
JOIN region r
	ON r.id = sr.region_id









4.
SELECT r.name region,
	we.channel channel_name,
    COUNT(we.channel) channel_count
FROM web_events we
JOIN accounts a
	ON we.account_id = a.id
JOIN sales_reps sr
	ON sr.id = a.sales_rep_id
JOIN region r
	ON r.id = sr.region_id
GROUP BY r.name, we.channel
ORDER BY channel_count DESC



3.
SELECT sr.name sales_rep_name,
	we.channel channel_name,
    COUNT(we.channel) channel_count
FROM web_events we
JOIN accounts a
	ON we.account_id = a.id
JOIN sales_reps sr
	ON sr.id = a.sales_rep_id
JOIN region r
	ON r.id = sr.region_id
GROUP BY sr.name , we.channel
ORDER BY channel_count DESC




2.
SELECT a.name account_name,
COUNT(o.account_id) count_account,
	SUM(o.standard_amt_usd) sum_standard
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
GROUP BY a.name
LIMIT 50


1.
SELECT a.name account_name,
	AVG(standard_amt_usd) avg_standard,
    AVG(gloss_amt_usd) avg_gloss,
    AVG(poster_amt_usd) avg_poster
FROM accounts a
JOIN orders o
	on a.id = o.account_id
GROUP BY a.name











7. SELECT
    r.name region,
    COUNT(sr.name) count_of_salesReps
FROM sales_reps sr
JOIN region r
	ON sr.region_id = r.id
GROUP BY r.name
Midwest	9

----------------------------------------------

6.
SELECT  a.name,
	MIN(o.total_amt_usd) smallest
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.name
LIMIT 10


Marsh & McLennan	1432.93
---------------------------
5.
SELECT  we.account_id,
	MIN(we.occurred_at) early,
a.name,
	a.primary_poc
FROM web_events we
JOIN accounts a
	ON we.account_id = a.id
    GROUP BY we.account_id,
	a.name,
	a.primary_poc
ORDER BY early
LIMIT 1
Leana Hawker
-------------------------------

4.
SELECT channel,
	COUNT(channel) as times_used
FROM web_events we
GROUP BY channel

3.
SELECT MAX(we.occurred_at) ,
	we.channel,
    a.name
FROM web_events we
JOIN accounts a
	ON we.account_id = a.id
GROUP BY we.channel,
    a.name

ORDER BY max DESC
LIMIT 10


--------------------------------------
2.
SELECT a.name,
	SUM(o.total_amt_usd)
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
  GROUP BY a.name
ORDER BY a.name DESC

---------------------------------
1 .
SELECT a.name,
	 MIN(o.occurred_at) early
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
   GROUP BY a.name
  -- ORDER BY o.occurred_at
 ORDER BY early
LIMIT 10




------------------------------




SELECT AVG(standard_qty) standard,
	AVG(gloss_qty)gloss,
    AVG(poster_qty) poster,
    AVG(standard_amt_usd) stan_amt,
    AVG(gloss_amt_usd)gloss_amt,
    AVG(poster_amt_usd) poster_amt
FROM orders
GROUP BY id


SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
limit 1
2017-01-01T23:51:09.000Z

SELECT MAX(occurred_at)
FROM web_events
2017-01-01T23:51:09.000Z

SELECT occurred_at
FROM orders
ORDER BY occurred_at
limit 1
2013-12-04T04:22:44.000Z

SELECT MIN(occurred_at ) as early
FROM orders
2013-12-04T04:22:44.000Z


SELECT SUM(standard_qty)
FROM orders
723,646
1,938,346
23,141,511.83
standard_amt_usd 9,672,346.54
gloss_amt_usd    7,593,159.77

SELECT id,
SUM(standard_amt_usd / (standard_qty+0.01)) AS  per_unit
FROM orders
GROUP BY id
ORDER BY id DESC

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;
