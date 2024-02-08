begin;

insert into central_insights_sandbox.bs_dbt_test_project_raw (
    select
        brand_id,
        brand_title,
        date_of_event,
        audience_id,
        age_range,
        playback_time_total
    from audience.audience_activity_daily_summary_enriched
    where date_of_event = ('<params.run_date')::date - 1
        and destination = 'PS_IPLAYER'
        and age_range is not null
);

commit;