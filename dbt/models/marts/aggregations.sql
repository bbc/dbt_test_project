-- models/marts/brand_engagement_metrics.sql

select
    brand_id,
    brand_title,
    date_of_event,
    count(distinct audience_id) as users,
    sum(playback_time_total) as time_spent
from
    {{ ref('load_raw_data') }}
where date_of_event = ('<params.run_date')::date - 1
group by
    brand_id,
    brand_title,
    date_of_event;
