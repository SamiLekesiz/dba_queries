
SELECT
    n.nspname AS "Schema",
    c.relname AS "Name",
    pg_size_pretty(pg_table_size(c.oid)) AS "Data Size",
    pg_size_pretty(pg_total_relation_size(c.oid)) AS "Total Size",
    format(
      '%s / %s',
      pg_size_pretty(sum(pg_total_relation_size(c.oid)) over(order by pg_total_relation_size(c.oid) DESC)),
      pg_size_pretty(pg_database_size(current_database ()))
      ) AS "Grant Total / Database Size"
  FROM pg_class c
  LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE
    c.relkind IN ('r','p','') AND
    n.nspname <> 'pg_catalog' AND
    n.nspname <> 'information_schema' AND
    n.nspname !~ '^pg_toast'
  ORDER BY pg_total_relation_size(c.oid) DESC
  LIMIT 20;
