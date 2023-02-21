with
    funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , self_joined as (
        select
            funcionarios.id_funcionario
            , funcionarios.id_gerente
            , funcionarios.nome_funcionario
            , funcionarios.sobrenome_funcionario
            , funcionarios.nome_completo_funcionario
            , funcionarios.titulo_de_cortesia_funcionario
            , funcionarios.data_de_nascimento_funcionario
            , funcionarios.cargo_funcionario
            , funcionarios.data_da_contratacao_funcionario
            , gerentes.nome_completo_funcionario as gerente
            , funcionarios.endereco_funcionario
            , funcionarios.cep_funcionario
            , funcionarios.cidade_funcionario
            , funcionarios.regiao_funcionario
            , funcionarios.pais_funcionario
            , funcionarios.telefone_funcionario
            , funcionarios.observacoes_funcionario
        from funcionarios
        left join funcionarios as gerentes on
            funcionarios.id_gerente = gerentes.id_funcionario
    )

    , transformed as (
        select
            row_number() over (order by id_funcionario) as sk_funcionario
            , *
        from self_joined
    )

select *
from transformed