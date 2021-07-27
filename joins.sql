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
