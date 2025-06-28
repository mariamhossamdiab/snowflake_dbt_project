SELECT
id ,
order_id,
product_id,
quantity,
unit_price, 
(quantity * unit_price) AS total_price 
FROM {{ source('raw', 'order_items') }}