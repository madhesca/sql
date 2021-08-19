SELECT standard_qty,
      SUM(standard_qty) OVER(PARTITION BY DATE_TRUNC('month', occurred_at) ORDER BY occurred_at)


      USE sql_store;

      SELECT c.points,
      	SUM(c.points) OVER(PARTITION BY o.order_date ORDER BY o.order_date) AS running_total
      FROM customers c
      JOIN orders o
      USING(customer_id)


      SELECT standard_amt_usd,
      	EXTRACT(YEAR FROM occurred_at),
      	SUM(standard_amt_usd) OVER(PARTITION BY EXTRACT(YEAR FROM occurred_at)ORDER BY occurred_at) running_total
          FROM orders


          SELECT id,
          	account_id,
              total,
              RANK() OVER(PARTITION BY account_id ORDER BY total DESC) total_rank
           FROM orders

           SELECT id,
           	account_id,
               total,
               RANK() OVER(PARTITION BY account_id ORDER BY total DESC) total_rank,
               ROW_NUMBER() OVER(PARTITION BY account_id ORDER BY account_id)
            FROM orders
            SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER main_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER main_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER main_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER main_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER main_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER main_window AS max_total_amt_usd
FROM orders

WINDOW main_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at))
