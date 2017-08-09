use {{ qubole_database_name }};

SELECT c.category_name AS Category, COUNT(order_item_quantity) AS QuantityOrdered
FROM order_items oi
INNER JOIN products p ON oi.order_item_product_id = p.product_id
INNER JOIN categories c ON c.category_id = p.product_category_id
GROUP BY c.category_name
ORDER BY QuantityOrdered DESC
LIMIT 10;