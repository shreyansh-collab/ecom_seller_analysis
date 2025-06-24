use ecom_seller_data;
select i.product_id, i.stock_level,
count(o.order_id) as orders_placed,
s.seller_id,
s.seller_name
from inventory i
join order_details o
on i.seller_id = o.seller_id
join seller s
on o.seller_id = s.seller_id
and order_date >= date_sub(current_date(), interval 365 day)
group by i.product_id,s.seller_name,i.seller_id,i.stock_level
having stock_level < 50
order by orders_placed desc;

-- Purpose: Flags low-stock products with high 
-- demand,indicating potential sales losses.

