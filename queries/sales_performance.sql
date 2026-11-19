-- Monthly revenue, order count, average order value, and gross profit.
WITH order_totals AS (
  SELECT o.order_id, o.order_date,
         SUM(oi.quantity * oi.unit_price * (1 - oi.discount_rate)) AS revenue,
         SUM(oi.quantity * p.unit_cost) AS cost
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.order_id
  JOIN products p ON p.product_id = oi.product_id
  WHERE o.order_status = 'Completed'
  GROUP BY o.order_id, o.order_date
)
SELECT strftime('%Y-%m', order_date) AS month,
       COUNT(*) AS completed_orders,
       ROUND(SUM(revenue), 2) AS revenue,
       ROUND(AVG(revenue), 2) AS average_order_value,
       ROUND(SUM(revenue - cost), 2) AS gross_profit,
       ROUND(100.0 * SUM(revenue - cost) / NULLIF(SUM(revenue), 0), 1) AS gross_margin_pct
FROM order_totals
GROUP BY month
ORDER BY month;
