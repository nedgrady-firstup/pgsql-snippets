SELECT conrelid::regclass AS table_name, 
       conname AS constraint_name, 
       pg_get_constraintdef(oid),
		*
FROM   pg_constraint 
WHERE  contype = 'f'  -- 'c' CHECK, 'p' PK, 'f' FK 
AND conrelid = 'sendgrid_events'::regclass
ORDER  BY 
	table_name,
	contype