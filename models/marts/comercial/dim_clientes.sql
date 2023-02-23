with
    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )

    , transformed as (
        select
            row_number() over (order by id_cliente) as sk_cliente
            , id_cliente
            , nome_do_cliente
            , titulo_de_cortesia_do_cliente
            , nome_da_empresa
            , endereco_cliente
            , cep_cliente
            , cidade_cliente
            , regiao_cliente
            , pais_cliente
            , fax_cliente
            , telefone_cliente 
        from clientes
    )

select *
from transformed