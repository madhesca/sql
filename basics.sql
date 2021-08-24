


CREATE TABLE table_name AS (
	SELECT *
	FROM orders

)
USE sql_invoicing;

UPDATE invoices
SET payment_total = invoice_total * 5 , payment_date = due_date
WHERE invoice_id = 3

USE sql_invoicing;

UPDATE invoices
SET payment_total = invoice_total * 5 , payment_date = due_date


USE sql_store;

UPDATE customers
SET points = points + 500000000
WHERE birth_date < '1990-01-01'


INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date < '2019-01-01'

USE sql_invoicing;

CREATE TABLE invoice_archived AS (
SELECT i.client_id,
	c.name AS client_name
FROM invoices i
JOIN clients c
USING(client_id)
WHERE payment_date IS NOT NULL )




USE sql_store;
INSERT INTO orders (customer_id, order_date, status)
VALUE(12, '1988-03-24', 1);

INSERT INTO order_items
VALUES(LAST_INSERT_ID(), 17, 5, 2.5),
	(LAST_INSERT_ID(), 16, 5, 3.5)


USE sql_store;
INSERT INTO products(name, quantity_in_stock, unit_price)
VALUES(
	'laptop',
    100,
    12.50
),
(
'car',
200,
15.20
),
(
'house',
100,
45.2
)





USE sql_store;
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3

USE sql_store;
SELECT *, quantity * unit_price AS total
FROM order_items
WHERE order_id = 2
ORDER BY total DESC

USE sql_store;
SELECT *
FROM orders
WHERE shipped_date IS NULL

USE sql_store;
SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur'

USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$'

USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP '^my|^se'

USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]'


SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc LIKE '%ana%' OR  primary_poc LIKE '%Ana%' )
  AND  primary_poc NOT LIKE '%eana%'

SELECT *
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000)

SELECT *
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000


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
