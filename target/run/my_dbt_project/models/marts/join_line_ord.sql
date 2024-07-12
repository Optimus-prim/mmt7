
  
    

        create or replace transient table CONNECTION_TESTDB.MY_SCHEMA.join_line_ord
         as
        (select
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
    
    (
        l.extended_price * (1 - l.discount_percentage / 100) -- discounted price
    ) as discounted_price,
    (
        l.extended_price * (1 - l.discount_percentage / 100) * (l.tax_rate / 100) -- tax amount
    ) as tax_amount

from
    CONNECTION_TESTDB.MY_SCHEMA.stg_ord as o
join
    CONNECTION_TESTDB.MY_SCHEMA.stg_lineitems as l
on
    o.order_key = l.order_key
        );
      
  