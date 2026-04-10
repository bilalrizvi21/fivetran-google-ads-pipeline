with clicks as (
    select * from {{ ref('stg_click_performance') }}
),

final as (
    select
        google_click_id,
        usage_date,
        campaign_id,
        ad_group_id,
        criteria_id,
        lower(campaign_status) as campaign_status_at_click,
        clicks as click_count
    from clicks
)

select * from final