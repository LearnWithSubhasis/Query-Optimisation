/* Create a new database schema */
create schema tuning;

/* Use the newly created database schema */
use tuning;

/* Create required tables */
create table driver_locations (
driver_id int, 
driver_latitude double, 
driver_longitude double, 
country varchar(50), 
recorded_at_time timestamp,
product_type char);

create table products (
product_type char,
product_name varchar(20));

/* Insert some sample data */
insert into driver_locations values (1, 28.35, 76.52, 'IN', cast('2022-01-01 09:00:00' as datetime), 'A');
insert into driver_locations values (1, 28.36, 77.16, 'IN', cast('2022-01-01 09:01:00' as datetime), 'A');
insert into driver_locations values (1, 28.49, 77.66, 'IN', cast('2022-01-01 09:03:00' as datetime), 'A');
insert into driver_locations values (1, 28.52, 77.77, 'IN', cast('2022-01-01 09:04:00' as datetime), 'A');
insert into driver_locations values (2, 21.37, 72.89, 'IN', cast('2022-01-01 09:00:00' as datetime), 'B');
insert into driver_locations values (2, 21.38, 72.63, 'IN', cast('2022-01-01 09:03:00' as datetime), 'B');

insert into products values ('A', 'UberX');
insert into products values ('B', 'UberGo');
insert into products values ('C', 'UberXL');