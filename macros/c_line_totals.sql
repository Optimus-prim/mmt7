{% macro c_line_totals(extended_price, discount_percentage, tax_rate) %}
    (
        {{ extended_price }} * (1 - {{ discount_percentage }} / 100) -- discounted price
    ) as discounted_price,
    (
        {{ extended_price }} * (1 - {{ discount_percentage }} / 100) * ({{ tax_rate }} / 100) -- tax amount
    ) as tax_amount
{% endmacro %}
