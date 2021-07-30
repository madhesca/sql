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
