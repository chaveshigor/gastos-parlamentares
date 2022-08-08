## Link heroku
COLOCAR LINK AQUI


## Requisitos Obrigatórios
- [x] Possibilitar o upload do arquivo;
- [x] Organizar os dados extraidos do arquivo em tabelas no banco de dados;
- [x] Listagem dos deputados do seu estado;
- [x] Mostrar o somatório dos seus gastos;
- [x] Listar as despesas, mostrando a data(`datEmissao`), estabelecimento(`txtFornecedor`), valor(`vlrLiquido`), e link para a nota(`urlDocumento`);
- [x] Destacar a maior despesa do candidato;
- [x] Usar o framework Rails (utilize esse repositório como base);
- [x] Ter uma cobertura de código;

## Funcionalidades
- Recebe upload de arquivo CSV contendo dados de gastos de parlamentares
- Tratamento de dados para popular tabelas no banco de dados
- Captura de dados apenas de parlamentares do estado do RJ
- Listagem de todos os parlamentares com opções de:
  - Ordenação por maiores gastos
  - Ordenação por nome
  - Filtro por nome
- Exibição de detalhes de gastos de parlamentar:
  - Maior gasto
  - Dados pessoais (cpf, partido...)
  - Gráfico exibindo Gastos x Dia
  - Gráfico exibindo Gasto x Categoria
  - Download de gráficos
  - Tabela contendo todos os gastos referentes ao parlamentar
- Deleção de todos os dados armazenados atualmente

## Estratégia para prevenção a queries N + 1
- Foi utilizada a gem bullet, que tem como propósito a detecção de queries N + 1, facilitando suas identificações e correções.

## Estratégia de implementação de processamento em background
- Processamento para popular dados do CSV: Foi optado por não utilizar processamento em background em primeiro momento pelo fato da impossibilidade de se enviar um retorno ao usuário sobre o status da operação de população dos dados. Essa impossibilidade se deve ao fato de não se possuir nenhum tipo de contato(email, telefone...) para retornar um feedback ao usuário.

- Deleção de dados atuais: Foi optado por utilizar processamento em background nesse caso por este ser um evento de menor prioridade, não tendo problema o não envio de um feedback ao usuário, já que o usuário pode simplesmente recarregar a página para verificar se a operação foi efetuada.

# Instruções para executar o projeto

### Dependências:
- Ruby
- Ruby on Rails
- Yarn
- Docker
- Docker Compose

### Executar:
- Clonar o projeto
- Executar o comando `yarn install`
- Executar o comando `bundle install`
- Executar o comando `docker-compose build`
- Executar o comando `docker-compose up`
- Execução de testes `bundle exec rspec`

## Cobertura de código por testes
- Para verificação da cobertura de código foi utilizada a gem simplecov
- Print do relatório contendo cobertura de código:
COLOCAR PRINT AQUI

## Modelagem do BD
COLOCAR PRINT AQUI
