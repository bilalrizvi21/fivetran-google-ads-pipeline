with source as (
    select * from {{ source('staging', 'criteria_performance') }}
),

renamed as (
    select
        
        id as criteria_id,
        campaign_id,
        ad_group_id,
        customer_id,
        cast(date as date) as usage_date,

        campaign_name,
        ad_group_name,
        criteria as keyword,
        lower(criteria_type) as criteria_type,
        lower(campaign_status) as campaign_status,

        
        cast(clicks as integer) as clicks,
        cast(impressions as integer) as impressions,
        
        cast(replace(cost, '$', '') as numeric(18,2)) as spend

    from source
)

select * from renamed