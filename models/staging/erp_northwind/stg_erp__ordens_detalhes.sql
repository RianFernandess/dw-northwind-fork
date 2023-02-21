with
    source_order_details as (
        select
            cast(order_id as int) as id_pedido 					
            , cast(product_id as int) as id_produto
            , cast(discount as numeric) as desconto_produto   	   					
            , cast(unit_price as numeric) as preco_da_unidade   					
            , cast(quantity as int) as quantidade_do_produto 								
        from {{ source('erp', 'order_details') }}
    )

select *
from source_order_details    