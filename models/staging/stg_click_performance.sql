with source as (
    select * from {{ source('staging', 'click_performance') }}
),

renamed as (
    select
        gcl_id as google_click_id,
        customer_id,
        campaign_id,
        ad_group_id,
        criteria_id,
        cast(date as date) as usage_date,

        campaign_name,
        ad_group_name,
        lower(campaign_status) as campaign_status,
        
        cast(clicks as integer) as clicks

    from source
)

select * from renamed