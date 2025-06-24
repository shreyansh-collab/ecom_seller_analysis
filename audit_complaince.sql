-- Audit Compliance Trends
use ecom_seller_data;
select s.seller_name,  s.seller_id,
avg(a.complaince_score) as average_complaince_score,
count(a.audit_id) as audit_count
from seller s
join audits a
on s.seller_id = a.seller_id
group by s.seller_name, s.seller_id
having average_complaince_score < 80
order by average_complaince_score asc; 

-- Purpose: Highlights sellers failing audits, 
-- requiring training or SOP enforcement.

