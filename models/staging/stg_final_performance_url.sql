with source as (
    select * from {{ source('staging', 'final_url_performance') }}
),

renamed as (
    select
        
        customer_id,
        campaign_id,
        ad_group_id,
        cast(date as date) as usage_date,

       
        campaign_name,
        ad_group_name,
        effective_final_url as landing_page_url,
        
        split_part(effective_final_url, 'utm_campaign=', 2) as utm_campaign_tag,

   
        cast(clicks as integer) as clicks,
        cast(impressions as integer) as impressions,
        cast(replace(cost, '$', '') as numeric(18,2)) as spend

    from source
)

select * from renamed