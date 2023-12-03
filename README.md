# projeto_individual_M3

Este repositório é a entrega de meu projeto do módulo 3 do curso de Análise de Dados feito no Senac em parceria com a Resilia Educação LTDA.

## Métodos e ferramentas

Foi usado o MySQL Workbench para elaborar e testar os códigos. O Xampp foi usado para servir localmente o banco e as pesquisas. A sintaxe usada foi a do MySQL.

## Proposta

Desenvolver um banco de dados que será usado pelo sistema Resiliadata.


O banco deve armazenar:
* empresas parceiras
* colaboradores
* tecnologias usadas e quais empresas as usam

Parte da proposta consiste em:
* definir as entidades necessárias
* definir qualidade e tipagem dos principais campos
* definir os relacionamentos entre as entidades
* simular dois registros para cada entidade

1. Quais são as entidades necessárias?

Para este modelo serão definidas as entidades: colaborador, empresa_parceira, tecnologia e area.  
Será definida uma entidade promovida: empresaparceira_tecnologia.

3. Quais são os principais campos e seus respectivos tipos?
   Para evitar repetições, segue-se uma relação entre as tabelas e seus campos e tipos correspondentes:
   FK - chave estrangeira
   PK - chave primária  
   `area`: id_area int PK, nome varchar  
   `tecnologia`: id_tecnologia int PK, nome varchar, id_area int FK  
   `empresapareceira`: id_empresaparceira int PK, nome varchar, cnpj   
   `colaborador`: id_colaborador nome cpf id_empresaparceira  
   `empresaparceira_tecnologia`: id_empresaparceira id_tecnologia   

5. Como essas entidades estão relacionadas?  
   `tecnologia` depende de `area` para existir.  
   `colaborador` depende de `empresaparceira` para existir.  
   `empresaparceira` e `area` existem independentemente de outras entidades.  
   1 `empresaparceira` para muitos `colaborador`  
   1 `area` para muitos `tecnologia`  
   muitos `empresaparceira` para muitos `tecnologia`

6. Simule 2 registros para cada entidade.  
   Foram feitos registros em cada tabela no arquivo [model](./model.sql). Ao executar o arquivo, será criado o banco de dados resiliadata, feitos os inserts, definida a função de formatação de cpf, e por fim exibidas as consultas.

## Agradecimentos

Ao Programa SENAC de Gratuidade, PSG, à Resilia Educação e ao SENAC pela oportunidade de estudar gratuitamente análise de dados. Louvar ao trabalho das empresas que oferecem software gratuito de qualidade, documentações, guia de uso e suporte de tecnologias tão úteis e que facilitam a vida de muita gente, como as que foram usadas neste projeto, o próprio GitHub, e outras como o SQL e tecnolgias associadas, Unix, Python e sua comunidade ativa, Xampp e muitas outras. Agradecimentos a Douglas Klem, sempre muito competente e solícito, um ótimo professor.
