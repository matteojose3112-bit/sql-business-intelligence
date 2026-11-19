-- Product performance by net sales and gross profit.
SELECT p.product_id, p.product_name, p.category,
       SUM(oi.quantity) AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_rate)), 2) AS net_revenue,
       ROUND(SUM(oi.quantity * (oi.unit_price * (1 - oi.discount_rate) - p.unit_cost)), 2) AS gross_profit
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY net_revenue DESC;
