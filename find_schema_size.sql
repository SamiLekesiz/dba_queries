WITH 
schemas AS (
SELECT schemaname as name, sum(pg_relation_size(quote_ident(schemaname) || '.' || quote_ident(tablename)))::bigint as size FROM pg_tables
GROUP BY schemaname
),
db AS (
SELECT pg_database_size(current_database()) AS size
)

SELECT schemas.name, 
       pg_size_pretty(schemas.size) as absolute_size,
       schemas.size::float / (SELECT size FROM db)  * 100 as relative_size
FROM schemas;

[source] (https://stackoverflow.com/a/63600339/11592839).
