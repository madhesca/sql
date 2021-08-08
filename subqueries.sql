5.
SELECT account_name,
	total_sales,
    (
    SELECT avg_sales
FROM (
SELECT 'avg' as avg_all,
	AVG(total_sales) avg_sales
FROM (
SELECT a.name account_name,
	SUM(total_amt_usd) total_sales
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
) sub1
GROUP BY 1
) sub2
    )

FROM (
SELECT a.name account_name,
	o.total_amt_usd total_sales

FROM accounts a
JOIN orders o
	ON a.id = o.account_id
ORDER BY o.total_amt_usd DESC
LIMIT 10
) sub1
GROUP BY 1, 2



4.
SELECT channel,
	COUNT(*) channel_count
FROM web_events
WHERE account_id = (
SELECT sub1.id
FROM (
SELECT a.id ,
	a.name account_name,
	SUM(total_amt_usd) total_sales
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY 1, 2
ORDER BY total_sales DESC
LIMIT 1

) sub1
)
GROUP BY 1

3.

SELECT a.name account_name,
	SUM(total) total_count
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY 1
HAVING SUM(total) > (
	SELECT std_total
FROM (

SELECT DISTINCT a.id, a.name,
    SUM(o.standard_qty) standard_count,
  	SUM(o.total) std_total
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1
)sub2
)


2.
SELECT r.name region_name,
	COUNT(o.total_amt_usd) total_sales
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps sr
ON sr.id = a.sales_rep_id
JOIN region r
ON r.id = sr.region_id
WHERE r.name = (
	SELECT region_name AS region_name
					FROM (
					SELECT r.name region_name,
						SUM(total_amt_usd)
					FROM orders o
					JOIN accounts a
						ON o.account_id = a.id
					JOIN sales_reps sr
						ON sr.id = a.sales_rep_id
					JOIN region r
						ON r.id = sr.region_id

					GROUP BY 1
					ORDER BY 2 DESC
					LIMIT 1
					) sub1
)
GROUP BY 1



1.
	SELECT sub3.sales_rep,
		sub2.region_name,
		sub2.total_sales

	FROM (
					SELECT sub1.region_name region_name,
								MAX(sub1.total_amt_usd) total_sales
					FROM (
							SELECT sr.name sales_rep,
								r.name region_name,
							    o.total_amt_usd
							FROM accounts a
							JOIN orders o
								ON a.id = o.account_id
							JOIN sales_reps sr
								ON sr.id = a.sales_rep_id
							JOIN region r
								ON r.id = sr.region_id
					    ) sub1

					GROUP BY 1
				) sub2

JOIN (
			SELECT sub1.sales_rep sales_rep,
				sub1.region_name region_name,
				MAX(sub1.total_amt_usd) total_sales
	FROM (
			SELECT sr.name sales_rep,
				r.name region_name,
					o.total_amt_usd
			FROM accounts a
			JOIN orders o
				ON a.id = o.account_id
			JOIN sales_reps sr
				ON sr.id = a.sales_rep_id
			JOIN region r
				ON r.id = sr.region_id
			) sub1

	GROUP BY 1, 2
) sub3

ON sub2.total_sales = sub3.total_sales AND
	sub2.region_name = sub3.region_name
----------------------------------------------------
USE sql_invoicing;

SELECT c.client_id,
		c.name,
        (
        SELECT SUM(invoice_total)
        FROM invoices
        WHERE client_id = c.client_id
        ) total_sales,
        (
        SELECT AVG(invoice_total) average
        FROM invoices
        ) average,
        (SELECT total_sales - average) difference

FROM clients c


SELECT channel,
	AVG(event_count) events_avg
FROM (SELECT DATE_TRUNC('day', occurred_at)event_date,
	channel,
    COUNT(*) event_count
FROM web_events
GROUP BY 1, 2) event_table
GROUP BY 1
ORDER BY 1, 2 DESC




USE sql_hr;

SELECT *
FROM employees e
WHERE salary > (
SELECT AVG(salary)
FROM employees
WHERE office_id = e.office_id
)
SELECT *
FROM accounts a
WHERE EXISTS (
	SELECT account_id
  	FROM orders
  WHERE account_id = a.id
)

USE sql_invoicing;

SELECT invoice_total,
	(	SELECT AVG(invoice_total)
		FROM invoices
    ) invoice_average,

    (SELECT invoice_total - invoice_average as difference) difference
FROM invoices

USE sql_invoicing;

SELECT *
FROM invoices i
WHERE invoice_total > (
SELECT AVG(invoice_total)
FROM invoices
WHERE client_id = i.client_id
)

DISTINCT

SELECT *
FROM orders o
WHERE standard_qty > (
	SELECT AVG(standard_qty)
  FROM orders
  WHERE account_id = o.account_id
)

USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id IN (
	SELECT client_id
    FROM invoices

)


USE sql_invoicing;

SELECT *
FROM invoices
WHERE invoice_total >
 (

SELECT
	MAX(invoice_total) max
FROM invoices
WHERE client_id = 3
)








USE sql_store;

SELECT c.customer_id,
CONCAT(c.last_name, ', ', c.first_name) fullName,
	o.order_id,
    oi.product_id,
    p.name
FROM customers c
JOIN orders o USING(customer_id)
JOIN order_items oi USING(order_id)
JOIN products p USING(product_id)
WHERE p.product_id = 3



USE sql_store;

SELECT name,
	quantity_in_stock * unit_price results
FROM products
WHERE quantity_in_stock * unit_price >  (

SELECT  quantity_in_stock * unit_price results
FROM products
WHERE product_id = 3 )

USE sql_hr;

SELECT *,
 (
SELECT AVG(salary)
FROM employees
) average
FROM employees
WHERE salary >  (
SELECT AVG(salary)
FROM employees
)



USE sql_store;

SELECT *
FROM products
WHERE product_id NOT IN (
	SELECT DISTINCT product_id
    FROM order_items
)


USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id NOT IN (
SELECT client_id
FROM invoices
)
