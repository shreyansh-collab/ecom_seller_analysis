-- Seller Performance Ranking by Region
-- Step 1: Aggregate seller performance
with seller_stats as (
  select
    s.seller_id,
    s.seller_name,
    s.region,
    count(o.order_id) as total_orders,
    avg(cf.ratings) as avg_ratings
  from seller s
  join order_details o on s.seller_id = o.seller_id
  join customer_feedback cf on o.order_id = cf.order_id
  where o.order_date >= date_sub(curdate(), interval 365 day)
  group by s.seller_id, s.seller_name, s.region
)

-- Step 2: Rank sellers within each region
select
  seller_id,
  seller_name,
  region,
  total_orders,
  avg_ratings,
  rank() over (partition by region order by avg_ratings desc, total_orders desc) as performance_rank
from seller_stats;


-- Purpose: Rank sellers within each region based on
--  their average customer rating and total order 
-- volume over the last 365 days, identifying top and
--  bottom performers for targeted support.



