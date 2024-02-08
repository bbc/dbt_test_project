-- models/marts/brand_engagement_metrics.sql

{{ config(
    materialized='table',
    schema='central_analytics_sandbox'
    model_name='bs_dbt_test_project_age_split'
) }}

    with topid as (
        select 
            brand_id
        from
            {{ ref('bs_dbt_test_project_raw') }}
        where date_of_event = ('<params.run_date')::date - 1
        group by brand_id
        order by count(distinct audience_id) desc
        limit 1
    )
    
select 
    age_range,
    count(distinct audience_id) as users
from
    {{ ref('bs_dbt_test_project_raw') }}
where date_of_event = ('<params.run_date')::date - 1
group by age_range
