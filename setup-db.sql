-- store high-level pagerduty events
create table alerts
(
	id serial primary key,
	ts timestamp not null, -- hourly timestamp
	src text not null,     -- src == PagerDuty
	typ varchar not null,  -- error, success, warning
	hourly_count integer not null,
	pd_id integer not null,  -- external identifier
	name text not null, -- alert name
	service text not null -- service name
);

create index on alerts(ts);
create index on alerts(typ);
create index on alerts(pd_id);
create index on alerts(name);
create index on alerts(service);
