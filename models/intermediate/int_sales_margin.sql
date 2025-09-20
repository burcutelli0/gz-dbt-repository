SELECT 
s.date_date,
s.pdt_id,
s.orders_id,
s.revenue,
s.quantity,
ROUND((s.quantity*p.purchase_price),2) AS purchase_cost,
ROUND((s.revenue-(s.quantity*p.purchase_price)),2) AS margin
FROM {{ ref("stg_raw__sales") }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
ON s.pdt_id=p.products_id
