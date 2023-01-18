SELECT COUNT(*) as connections,
       backend_type
FROM pg_stat_activity
where state = 'active' OR state = 'idle' OR = 'idle_in_transactions'
GROUP BY backend_type
ORDER BY connections DESC;
