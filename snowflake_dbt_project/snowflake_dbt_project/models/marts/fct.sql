select
a.order_date, 
a.order_id,
sum(b.total_price) AS total_price 
from 
{{ref('stg_orders')}} a
LEFT JOIN {{ref('stg_order_items')}} b
ON a.ORDER_ID=b.ORDER_ID
GROUP BY 1,2