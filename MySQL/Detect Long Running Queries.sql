 DROP TABLE general_log;
 DROP TABLE slow_log;
 
 CREATE TABLE `general_log` (
   `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
                          ON UPDATE CURRENT_TIMESTAMP,
   `user_host` mediumtext NOT NULL,
   `thread_id` bigint(21) unsigned NOT NULL,
   `server_id` int(10) unsigned NOT NULL,
   `command_type` varchar(64) NOT NULL,
   `argument` mediumtext NOT NULL
  ) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
  
  
  CREATE TABLE `slow_log` (
   `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
                          ON UPDATE CURRENT_TIMESTAMP,
   `user_host` mediumtext NOT NULL,
   `query_time` time NOT NULL,
   `lock_time` time NOT NULL,
   `rows_sent` int(11) NOT NULL,
   `rows_examined` int(11) NOT NULL,
   `db` varchar(512) NOT NULL,
   `last_insert_id` int(11) NOT NULL,
   `insert_id` int(11) NOT NULL,
   `server_id` int(10) unsigned NOT NULL,
   `sql_text` mediumtext NOT NULL,
   `thread_id` bigint(21) unsigned NOT NULL
  ) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
  
  
SET global general_log = 1;
SET global log_output = 'table';

  
SELECT *, convert(argument using utf8) as query FROM mysql.general_log;	
SELECT convert(argument using utf8) as query FROM mysql.general_log;

select distinct * from 
(SELECT convert(argument using utf8) as query FROM mysql.general_log) as q1
where q1.query like '%presto%';
	
select distinct * from (    
SELECT
    convert(sql_text using utf8) as query
FROM
    mysql.slow_log ) as q2
WHERE
	q2.query like '%driver%';
    
    
    
SET global general_log = 0;  

SHOW variables like 'long_query_time';  
SET long_query_time = 0.00001;

SET global slow_query_log = 1;

SHOW variables like 'min_examined_row_limit';

  




select a3.product_name, sum(a3.dist) as total_distance_travelled from
(
select * from
(
select a2.driver_id, a2.product_name, 
sqrt(
    ((a2.driver_latitude - a2.next_driver_latitude)*(a2.driver_latitude - a2.next_driver_latitude)) + 
    ((a2.driver_longitude - a2.next_driver_longitude)*(a2.driver_longitude - a2.next_driver_longitude))) dist 
from
(
select * from 
(
with aggr1 as (
    select d.*, row_number() over (partition by d.driver_id order by recorded_at_time) as rank1 
    from driver_locations d
) 
select p.product_name, a.*
, lead(a.driver_id) over (order by a.driver_id, a.recorded_at_time) as next_driver_id
, lead(a.driver_latitude) over (order by a.driver_id, a.recorded_at_time) as next_driver_latitude
, lead(a.driver_longitude) over (order by a.driver_id, a.recorded_at_time) as next_driver_longitude
from aggr1 a
inner join products p
on a.product_type=p.product_type
) as a2
) a2
where a2.driver_id = a2.next_driver_id
) as a3
) a3
group by 1 
order by 2 desc;

truncate mysql.slow_log;
SET global slow_query_log = 0; 
