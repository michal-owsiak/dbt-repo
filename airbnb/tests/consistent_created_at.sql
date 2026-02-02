-- This test checks for any reviews that have a review date earlier than the listing's created_at

with listings_reviews as (
    select 
        l.created_at as listing_created_at,
        r.review_date
    from {{ ref('dim_listings_cleansed') }} as l
    join {{ ref('fct_reviews') }} as r
        on l.listing_id = r.listing_id  
)
select *
from listings_reviews
where review_date < listing_created_at
limit 10
