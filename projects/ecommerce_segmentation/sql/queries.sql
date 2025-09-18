-- Example SQL for building RFM features (SQLite syntax). Adjust table/column names to your data.
-- Assume a table 'transactions' with columns:
-- customer_id, invoice_no, invoice_date (YYYY-MM-DD), quantity, unit_price

-- 1) Monetary value per order and per customer
WITH order_value AS (
  SELECT
    customer_id,
    invoice_no,
    DATE(invoice_date) AS order_date,
    SUM(quantity * unit_price) AS order_amount
  FROM transactions
  GROUP BY customer_id, invoice_no, DATE(invoice_date)
),
customer_value AS (
  SELECT
    customer_id,
    COUNT(DISTINCT invoice_no) AS frequency,
    SUM(order_amount) AS monetary,
    MAX(order_date) AS last_order_date
  FROM order_value
  GROUP BY customer_id
)
SELECT
  cv.customer_id,
  cv.frequency,
  ROUND(cv.monetary, 2) AS monetary,
  -- recency in days relative to a reference date (e.g., the max date in the table)
  CAST((JULIANDAY(ref.max_date) - JULIANDAY(cv.last_order_date)) AS INTEGER) AS recency_days
FROM customer_value cv
CROSS JOIN (SELECT MAX(DATE(invoice_date)) AS max_date FROM transactions) AS ref
ORDER BY monetary DESC;