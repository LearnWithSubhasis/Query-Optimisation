/*
SET global general_log = 0;
SET global slow_query_log = 0; 

DROP TABLE general_log;
DROP TABLE slow_log;

*/

SHOW variables like 'general_log'; 
SHOW variables like 'log_output'; 

SHOW variables like 'slow_query_log'; 
SHOW variables like 'long_query_time'; 
SHOW variables like 'min_examined_row_limit'; 

use mysql;
 
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

    
SET global general_log = 0;  

SHOW variables like 'long_query_time';  
SET long_query_time = 0.00001;

SET global slow_query_log = 1;

SHOW variables like 'min_examined_row_limit';

  







