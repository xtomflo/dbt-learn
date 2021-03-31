-- Refunds have a negative amount, so the total amout should always be >=0
-- Therefore return records when this isn't true to make the test final
select
    order_id,
    sum(payment_amount) as total_amount
from {{ ref('stg_payments')}} 
group by 1
having not(total_amount >=0)