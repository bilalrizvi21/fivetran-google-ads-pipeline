with ads as (
    select * from {{ ref('stg_criteria_performance') }}
),

final as (
    select
        ad_group_id,
        any_value(campaign_id) as campaign_id,
        any_value(campaign_name) as campaign_name,
        any_value(ad_group_name) as ad_group_name,
        any_value(campaign_status) as campaign_status
    from ads
    group by 1 
)

select * from final