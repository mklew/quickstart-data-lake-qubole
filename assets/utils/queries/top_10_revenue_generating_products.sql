use {{ qubole_database_name }};

SELECT p.product_name AS Product, r.revenue AS TotalRevenue
FROM products p
INNER JOIN (
  SELECT oi.order_item_product_id, CAST(round(SUM(oi.order_item_subtotal)) AS Int) AS revenue
  FROM order_items oi INNER JOIN orders o
  ON oi.order_item_order_id = o.order_id
  WHERE o.order_status <> 'CANCELED'
  AND o.order_status <> 'SUSPECTED_FRAUD'
  GROUP BY order_item_product_id
) r
ON p.product_id = r.order_item_product_id
ORDER BY TotalRevenue DESC
LIMIT 10;