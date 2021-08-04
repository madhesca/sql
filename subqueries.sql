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
