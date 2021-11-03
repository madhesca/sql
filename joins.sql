select standard_qty, gloss_qty, poster_qty,
	website, primary_poc
from orders o
join accounts a
on o.account_id = a.id
limit 100



USE sql_store;
SELECT c.state,
	c.customer_id,
    c.first_name,
    c.last_name,
	SUM(oi.quantity * oi.unit_price) spending,
    o.order_id,
    oi.product_id

FROM customers c
JOIN orders o USING(customer_id)
JOIN order_items oi USING(order_id)

WHERE c.state = 'VA'
GROUP BY c.customer_id,
    c.first_name,
    c.last_name
HAVING spending > 100
ORDER BY SUM(oi.quantity * oi.unit_price) DESC






USE sql_invoicing;
SELECT p.date ,
	pm.name payment_method,
    SUM(p.amount) total_payments

FROM payments p
LEFT JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY p.date, pm.name
ORDER BY p.date, p.payment_method



USE sql_invoicing;
SELECT 'First half of 2018' AS date_range,
	SUM(invoice_total) total_sales,
    SUM(payment_total) total_payments,
	SUM(invoice_total) - SUM(payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 'Second half of 2019' date_range,
	SUM(invoice_total) total_sales,
    SUM(payment_total) total_payments,
    SUM(invoice_total) - SUM(payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date > '2019-06-30'
UNION
SELECT 'Total',
SUM(invoice_total) total_sales,
SUM(payment_total) total_payment,
SUM(invoice_total - payment_total)
FROM invoices


USE sql_store;
SELECT first_name,
	points,
    'Bronze' type
FROM customers
WHERE points < 2000
UNION
SELECT first_name,
	points,
    'Silver' type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT first_name,
	points,
    'Gold' type
FROM customers
WHERE points > 3000


USE sql_invoicing;
SELECT p.date,
	c.name client,
    p.amount,
    pm.name
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
ORDER BY pm.name DESC




SELECT o.occurred_at as timestamp,
	a.name,
	o.total total,
	o.total_amt_usd total_usd,
	EXTRACT (YEAR FROM o.occurred_at) as YEAR
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
WHERE EXTRACT (YEAR FROM occurred_at) = 2015






SELECT DISTINCT a.name account_name,
		 we.channel channel,
         a.id
FROM accounts a
JOIN web_events we
	ON a.id = we.account_id
	AND account_id = 1001




SELECT r.name region_name,
	a.name account_name,
	total_amt_usd / (total + 0.01) unit_price,
	sr.name sales_rep_name,
	o.standard_qty
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id
	JOIN sales_reps sr
		ON sr.id = a.sales_rep_id
	JOIN region r
		ON r.id = sr.region_id
	WHERE standard_qty > 100
	AND poster_qty > 50
	ORDER BY unit_price DESC



SELECT r.name region_name,
	a.name account_name,
	total_amt_usd / (total + 0.01) unit_price,
	sr.name sales_name,
	o.poster_qty
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id
	JOIN sales_reps sr
		ON sr.id = a.sales_rep_id
	JOIn region r
		ON r.id = sr.region_id
	WHERE standard_qty > 100
	AND poster_qty > 50
	ORDER BY unit_price









SELECT r.name region_name,
	a.name account_name,
	o.total_amt_usd / ( o.total +.01 ) AS unit_price,
    sr.name sales_rep_name,
    o.standard_qty
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	JOIN sales_reps sr
		ON sr.id = a.sales_rep_id
	JOIN region r
		ON r.id = sr.region_id
	WHERE o.standard_qty > 100



SELECT r.name region_name,
			sr.name sales_rep_name,
			a.name account_name
FROM sales_reps sr
JOIN region r
	ON sr.region_id = r.id
JOIN accounts a
	ON a.sales_rep_id = sr.id
WHERE sr.name LIKE '% K%'
AND r.name = 'Midwest'
ORDER BY a.name



SELECT r.name region_name,
	sr.name sales_rep_name,
	a.name account_name
FROM sales_reps sr
JOIN region r
	ON sr.region_id = r.id
JOIN accounts a
	ON a.sales_rep_id = sr.id
WHERE sr.name LIKE 'S%'
AND r.name = 'Midwest'
ORDER BY a.name




SELECT r.name region_name,
	sr.name sales_rep_name,
	a.name account_name
FROM sales_reps sr
LEFT JOIN region r
	ON sr.region_id = r.id
JOIN accounts a
	ON a.sales_rep_id = sr.id

WHERE r.name = 'Midwest'
ORDER BY a.name



USE sql_store;
SELECT o.order_date,
	o.order_id,
	c.first_name,
    s.name shipper,
    os.name status
FROM orders o
 JOIN customers c USING (customer_id)
LEFT JOIN shippers s USING (shipper_id)
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id

ORDER BY status


USE sql_store;
SELECT p.product_id,
	p.name product_name,
	oi.quantity
FROM products p
LEFT JOIN order_items oi
	USING(product_id)
ORDER BY product_id

USE sql_invoicing;
SELECT p.payment_id,
	c.name client_name,
    pm.name method
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
	ON  p.payment_method = pm.payment_method_id


USE sql_store;
SELECT o.order_id,
	o.order_date,
    c.first_name,
	c.last_name,
    os.name status
FROM orders o
JOIN customers c USING(customer_id)

JOIN order_statuses os ON  o.status = os.order_status_id
ORDER BY  status, order_id



USE sql_hr;
SELECT  man.employee_id,
	man.first_name,
    man.last_name,
    em.first_name
FROM employees em
JOIN employees man
	ON em.employee_id = man.reports_to


USE sql_store;
SELECT  order_id,
	oi.product_id,
    p.name product_name,
	oi.quantity,
	oi.unit_price
FROM order_items oi
JOIN products p
	USING(product_id)



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
