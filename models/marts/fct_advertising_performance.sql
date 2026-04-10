with criteria as (
    select * from {{ ref('stg_criteria_performance') }}
),

final as (
    select
        usage_date,
        campaign_id,
        ad_group_id,
        keyword,
        
        sum(clicks) as total_clicks,
        sum(impressions) as total_impressions,
        sum(spend) as total_spend,
        
        case 
            when sum(clicks) > 0 then sum(spend) / sum(clicks)
            else 0 
        end as avg_cpc
        
    from criteria
    group by 1, 2, 3, 4
)

select * from final