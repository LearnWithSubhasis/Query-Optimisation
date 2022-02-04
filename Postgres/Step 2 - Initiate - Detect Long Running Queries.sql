########## SQLs ###############

ALTER DATABASE tuning SET log_min_duration_statement = 0;

SELECT pg_reload_conf();

SHOW log_min_duration_statement;

SHOW config_file;

SELECT * FROM pg_settings 
WHERE category IN( 'Reporting and Logging / Where to Log' , 'File Locations')
ORDER BY category,name;
	
select * from pg_stat_activity;

ALTER DATABASE tuning
SET log_statement = 'all';

/*
ALTER DATABASE tuning
SET logging_collector = on;
*/


  
########## Bash Commands ##########

> vi /Users/subhasiskhatua/Library/Application Support/Postgres/var-14/postgresql.conf
log_destination = 'csvlog'
log_directory = 'pg_log'
log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'
logging_collector = on
> ps -ef|grep postgres|grep 5432
  502 21923     1   0 10:32AM ??         0:00.05 /Applications/Postgres.app/Contents/Versions/14/bin/postgres -D /Users/subhasiskhatua/Library/Application Support/Postgres/var-14 -p 5432
> /Applications/Postgres.app/Contents/Versions/latest/bin/pg_ctl -D "/Users/subhasiskhatua/Library/Application Support/Postgres/var-14" restart	

