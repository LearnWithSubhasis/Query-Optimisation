/* detect all queries run in past */

SELECT *, convert(argument using utf8) as query FROM mysql.general_log;	
SELECT convert(argument using utf8) as query FROM mysql.general_log;

select distinct * from (
    SELECT convert(argument using utf8) as query FROM mysql.general_log
) as q1
where q1.query like '%presto%';

/* detect slow running queries */	
select distinct * from (    
    SELECT convert(sql_text using utf8) as query FROM mysql.slow_log 
) as q2 
WHERE q2.query like '%driver%';