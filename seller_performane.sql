use ecom_seller_data;
-- Monitor Seller Performance 
-- (Identifies underperforming sellers)

select 
seller_name, email, region,
count(order_id) as total_orders,
avg(audits.complaince_score) as average_complaince_score,
avg(customer_feedback.ratings) as average_rating
from seller
join audits
on seller.seller_id  = audits.seller_id
join customer_feedback
on audits.seller_id = customer_feedback.seller_id
group by seller.seller_id, seller.seller_name, seller.region
having   average_rating < 2
order by average_complaince_score asc ;

-- Purpose: Identifies sellers with poor ratings 
--  for follow-up

