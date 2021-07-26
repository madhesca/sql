
SELECT r.name AS region_name,
	a.name AS account_name,
    o.total_amt_usd/(o.total + 0.01) AS unit_price
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
JOIN sales_reps sr
	ON sr.id = a.sales_rep_id
JOIN region r
	ON r.id = region_id

LIMIT 10



SELECT r.name AS region ,
	sr.name AS  sales_reps,
    a.name AS account_name
FROM region r
JOIN sales_reps sr
	ON r.id = sr.region_id
JOIN accounts a
	ON a.sales_rep_id = sr.id
ORDER BY account_name
LIMIT 100


SELECT a.primary_poc,
	we.occurred_at,
    we.channel,
    a.name
FROM web_events we
JOIN accounts a
	ON a.id = we.account_id
WHERE a.name = 'Walmart'
LIMIT 10


SELECT o.standard_qty, o.gloss_qty, o.poster_qty,
      a.website, a.primary_poc
FROM orders o
JOIN accounts a
  ON o.account_id = a.id



SELECT *
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
    ORDER BY account_id DESC
LIMIT 10
