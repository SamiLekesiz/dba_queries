SELECT
    l.relation::regclass,
    l.transactionid,
    l.mode,
    l.GRANTED,
    s.query,
    s.query_start,
    age(now(), s.query_start) AS "age",
    s.pid
FROM
    pg_stat_activity s
    JOIN pg_locks l ON l.pid = s.pid
WHERE
    mode = 'ShareUpdateExclusiveLock'
ORDER BY
    s.query_start;

