--show all trigger in a table
SELECT 
    tgname AS trigger_name
FROM 
    pg_trigger
WHERE
    tgrelid = 'public.mytable'::regclass
ORDER BY
    trigger_name;
    
-- show trigger    
SELECT 
    t.tgname,
    p.prosrc 
FROM 
    pg_trigger t JOIN pg_proc p ON p.oid = t.tgfoid
WHERE
    t.tgrelid = 'myschema.mytable'::regclass
    AND tgname='my_trigger_name'
ORDER BY
    t.tgname;
