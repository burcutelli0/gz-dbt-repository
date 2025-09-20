WITH cost_per_day AS (
    SELECT
    date_date,
    COUNT(DISTINCT(orders_id)) AS orders_id,
    ROUND(SUM(revenue),0) AS revenue,
    ROUND(SUM(opeoperational_margin),0) AS opeoperational_margin,
    ROUND(SUM(purchase_cost),0) AS purchase_cost,
    ROUND(SUM(shipping_fee),0) AS shipping_fee,
    ROUND(SUM(logcost),0) AS logcost,
    ROUND(SUM(ship_cost),0) AS ship_cost,
    SUM(quantity) AS quantity
    FROM {{ref("int_orders_operational")}}
    GROUP BY date_date


)

SELECT
orders_id,
revenue,
opeoperational_margin,
purchase_cost,
shipping_fee,
logcost,
ship_cost,
quantity,
ROUND(revenue/NULLIF(orders_id,0),2) AS average_basket
FROM cost_per_day
ORDER BY date_date DESC