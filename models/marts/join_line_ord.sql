
select
    o.order_key,
    o.customer_key,
    o.status_code,
    o.total_price,
    o.order_date,
    l.part_key,
    l.line_number,
    l.quantity,
    l.extended_price,
    l.discount_percentage,
    l.tax_rate,
    {{ c_line_totals('l.extended_price', 'l.discount_percentage', 'l.tax_rate') }}
from
    {{ ref('stg_ord') }} as o
join
    {{ ref('stg_lineitems') }} as l
on
    o.order_key = l.order_key
