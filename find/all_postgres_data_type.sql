select typname, typlen, nspname
from pg_type t
join pg_namespace n
on t.typnamespace = n.oid
where nspname = 'pg_catalog'
and typname !~ '(^_|^pg_|^reg|_handlers$)'
order by nspname, typname;
