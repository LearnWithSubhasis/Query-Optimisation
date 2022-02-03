use tuning;

create table driver_locations (
driver_id int, 
driver_latitude double, 
driver_longitude double, 
country varchar(50), 
recorded_at_time timestamp,
product_type char);


insert into driver_locations values (1, 28.35, 76.52, 'IN', cast('2022-01-01 09:00:00' as datetime), 'A');
insert into driver_locations values (1, 28.36, 77.16, 'IN', cast('2022-01-01 09:01:00' as datetime), 'A');
insert into driver_locations values (1, 28.49, 77.66, 'IN', cast('2022-01-01 09:03:00' as datetime), 'A');
insert into driver_locations values (1, 28.52, 77.77, 'IN', cast('2022-01-01 09:04:00' as datetime), 'A');
insert into driver_locations values (2, 21.37, 72.89, 'IN', cast('2022-01-01 09:00:00' as datetime), 'B');
insert into driver_locations values (2, 21.38, 72.63, 'IN', cast('2022-01-01 09:03:00' as datetime), 'B');

create table products (
product_type char,
product_name varchar(20));

insert into products values ('A', 'UberX');
insert into products values ('B', 'UberGo');
insert into products values ('C', 'UberXL');

/*
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

EXPLAIN ANALYZE 

select d.*, p.product_name from driver_locations d 
inner join products p
on p.product_type = d.product_type
where driver_id=2;

show processlist;

*/



