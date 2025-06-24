-- Feedback Rating Distribution Analysis

use ecom_seller_data;

select s.seller_name, s.region,
count(f.feedback_id) as total_feedbacks,
Round(sum(case when f.ratings = 1 then 1 else 0 end) / count(feedback_id) *100, 2) as percent_1_star,
Round(sum(case when f.ratings = 5 then 1 else 0 end) / count(feedback_id) *100 ,2) as percent_5_star,
avg(f.ratings) as average_ratings
from seller s
join customer_feedback f
on s.seller_id = f.seller_id
group by s.seller_id, s.seller_name, s.region
having total_feedbacks > 5
order by average_ratings desc;

-- Purpose: Analyze the distribution of customer feedback 
-- ratings per seller to identify patterns in customer 
-- satisfaction, guiding quality improvement efforts.


