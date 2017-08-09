use {{ qubole_database_name }};

SELECT url AS URL, COUNT(*) AS Views
FROM web_logs
WHERE url LIKE '%\/product\/%'
GROUP BY url
ORDER BY Views DESC
LIMIT 10;
