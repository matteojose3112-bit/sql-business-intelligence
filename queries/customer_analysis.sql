-- Customer value and repeat-purchase segmentation.
WITH customer_sales AS (
  SELECT c.customer_id, c.customer_name, c.segment, c.region,
         COUNT(DISTINCT o.order_id) AS completed_orders,
         SUM(oi.quantity * oi.unit_price * (1 - oi.discount_rate)) AS lifetime_revenue
  FROM customers c
  JOIN orders o ON o.customer_id = c.customer_id AND o.order_status = 'Completed'
  JOIN order_items oi ON oi.order_id = o.order_id
  GROUP BY c.customer_id, c.customer_name, c.segment, c.region
)
SELECT customer_id, customer_name, segment, region, completed_orders,
       ROUND(lifetime_revenue, 2) AS lifetime_revenue,
       CASE WHEN completed_orders >= 3 THEN 'Loyal'
            WHEN completed_orders = 2 THEN 'Repeat'
            ELSE 'One-time' END AS customer_type
FROM customer_sales
ORDER BY lifetime_revenue DESC;
