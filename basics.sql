SELECT *
FROM web_events
WHERE channel IN ('organic','adwords')
AND occurred_at BETWEEN '2016-01-01' AND '2016-12-31'
ORDER BY occurred_at DESC

SELECT *
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29

SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s'

SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0


SELECT *
FROM accounts
WHERE name NOT LIKE '%s'


SELECT account name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom')


SELECT id,
  account_id,
  standard_amt_usd / standard_qty AS result
FROM orders
LIMIT 10

SELECT id,
  account_id
FROM orders

LIMIT 10



SELECT id,
	account_id,
   poster_amt_usd /( standard_amt_usd + gloss_amt_usd + poster_amt_usd) *100 AS poster_percentage
FROM orders
LIMIT 10
