use tuning;

/* sample query 1 */
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


/* sample query 2 */
select a.*, b.* from driver_locations a
inner join products b
on a.product_type = b.product_type;