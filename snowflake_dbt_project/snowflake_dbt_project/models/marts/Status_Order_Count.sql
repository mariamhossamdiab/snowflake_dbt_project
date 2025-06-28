SELECT 
  a.order_status,
  COUNT(b.id ) AS order_count
FROM {{ ref('stg_orders') }} a 
LEFT JOIN {{ ref('stg_order_items') }} b
  ON a.order_id = b.order_id
GROUP BY a.order_status