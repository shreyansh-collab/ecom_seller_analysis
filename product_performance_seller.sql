-- Product Performance by Seller

use ecom_seller_data;
select s.seller_id, s.seller_name,
i.product_id,
count(o.order_id) as total_orders,
avg(cf.ratings) as product_ratings
from seller s 
join inventory i 
on s.seller_id = i.seller_id
join order_details o 
on i.seller_id = o.seller_id
join customer_feedback cf 
on o.seller_id = cf.seller_id
where o.order_date >= date_sub(current_date(), interval 365 day)
group by i.product_id, s.seller_id, s.seller_name
having avg(ratings) < 3
order by product_ratings;

-- Purpose: Identifies low-rated products 
-- for removal or quality checks.

