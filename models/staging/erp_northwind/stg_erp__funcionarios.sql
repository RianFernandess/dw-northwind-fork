with
    source_employees as (
        select
            cast(employee_id as int) as id_funcionario
            , cast(reports_to as int) as id_gerente
            , cast(first_name as string) as nome_funcionario   				
            , cast(last_name as string) as sobrenome_funcionario 
            , cast((first_name || ' ' || last_name) as string) as nome_completo_funcionario 
            , cast(title_of_courtesy as string) as titulo_de_cortesia_funcionario
            , cast(birth_date as date) as data_de_nascimento_funcionario 								
            , cast(title as string) as cargo_funcionario 								 				
            , cast(hire_date as date) as data_da_contratacao_funcionario				
            , cast('address' as string) as endereco_funcionario
            , cast(postal_code as string) as cep_funcionario  				
            , cast(city	as string) as cidade_funcionario 				
            , cast(region as string) as regiao_funcionario 								
            , cast(country as string) as pais_funcionario 				
            , cast(home_phone as string) as telefone_funcionario 										
            , cast(notes as string) observacoes_funcionario 				
            --extension as int	 				
            --photo_path as string
            --photo as string  								
        from {{ source('erp', 'employees') }}
    )

select *
from source_employees    