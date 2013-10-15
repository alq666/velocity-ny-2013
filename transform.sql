-- focus on errors only
create table alert_by_time as (
select id, ts, name,
       date_part('hour', ts) as tod,
       date_part('dow', ts) as dow
 from alerts
where typ = 'error');
