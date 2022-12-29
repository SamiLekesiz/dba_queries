SELECT
    s.nspname AS schema_name,
    t.relname AS table_name,
    i.relname AS index_name,
    ix.indisvalid
FROM
    pg_class t
    INNER JOIN pg_index ix ON ix.indrelid = t.oid
    INNER JOIN pg_class i ON ix.indexrelid = i.oid
    INNER JOIN pg_namespace s ON s.oid = t.relnamespace
WHERE
    ix.indisvalid = false
    AND s.nspname not in ('pg_catalog','pg_toast')
ORDER BY
    ix.indisvalid,
    t.relname,
    i.relname;
