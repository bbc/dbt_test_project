-- models/marts/brand_engagement_metrics.sql

{{ config(
    materialized='table',
    schema='central_analytics_sandbox'
    model_name='bs_dbt_test_projecte_aggregated'
) }}

select
    brand_id,
    brand_title,
    date_of_event,
    count(distinct audience_id) as users,
    sum(playback_time_total) as time_spent
from
    {{ ref('staging_raw_data_table') }}
group by
    brand_id,
    brand_title,
    date_of_event;
