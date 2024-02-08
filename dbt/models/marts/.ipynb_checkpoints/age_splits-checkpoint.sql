-- models/marts/age_splits.sql

    with topid as (
        select 
            brand_id
        from
            {{ ref('load_raw_data') }}
        where date_of_event = ('<params.run_date')::date - 1
        group by brand_id
        order by count(distinct audience_id) desc
        limit 1
    )
    
select 
    age_range,
    count(distinct audience_id) as users
from
    {{ ref('load_raw_data') }}
where date_of_event = ('<params.run_date')::date - 1
group by age_range
