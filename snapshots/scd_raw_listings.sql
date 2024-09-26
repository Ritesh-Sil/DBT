{% snapshot scd_raw_listings %}

{{
 config(
 target_schema='DBT_ANALYTICS',
 unique_key='listing_id',
 strategy='timestamp',
 updated_at='updated_at',
 invalidate_hard_deletes=True
 )
}}

select * FROM {{ ref("src_listings") }}

{% endsnapshot %}
