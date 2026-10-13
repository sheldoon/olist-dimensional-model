# Olist: Modelagem Dimensional

Projeto de portfólio de engenharia de dados: transformar o modelo transacional de um e-commerce brasileiro em um modelo dimensional (esquema estrela), documentando cada decisão de modelagem.

> **Status:** em andamento. O roadmap abaixo mostra o que já foi feito.

## Objetivo

O dataset original foi desenhado para operar pedidos, não para analisá-los: cada pergunta analítica exige vários joins entre tabelas. Este projeto reorganiza esses dados em **tabelas fato** (o que aconteceu) e **dimensões** (o contexto do que aconteceu), de modo que as consultas fiquem simples e rápidas.

O foco é o raciocínio: por que cada tabela existe, qual é a sua granularidade, quais são as chaves primárias e estrangeiras e quais trade-offs foram aceitos.

## Perguntas de negócio

O modelo é desenhado para responder:

1. Como evolui a receita por mês e por categoria de produto?
2. Quais estados do cliente concentram mais vendas?
3. Quanto os pedidos atrasam em relação à data estimada de entrega?
4. O atraso na entrega derruba a nota da avaliação?
5. Quais vendedores concentram a receita e como é o desempenho deles na entrega?
6. Qual o peso do frete no valor vendido, por região?

## Dataset

[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), publicado no Kaggle. Reúne cerca de 100 mil pedidos feitos entre 2016 e 2018 em marketplaces brasileiros, distribuídos em 9 arquivos CSV.

## Como baixar os dados

Os CSVs não ficam no repositório (são pesados e pertencem ao Kaggle). Para baixá-los:

1. Instale e configure o [Kaggle CLI](https://github.com/Kaggle/kaggle-api) com a sua credencial.
2. Na raiz do projeto, rode:

```bash
kaggle datasets download -d olistbr/brazilian-ecommerce -p data/raw --unzip
```

Alternativa: baixe o arquivo pela página do dataset e extraia os CSVs em `data/raw/`.

## Estrutura do repositório

```text
olist-dimensional-model/
├── data/raw/          # CSVs do Kaggle (fora do Git)
├── docs/
│   └── diagrams/      # arquivos .dbml e imagens exportadas
├── .gitignore
└── README.md
```

## Roadmap

- [ ] 1. Repositório e estrutura
- [ ] 2. Baixar e explorar o dataset
- [ ] 3. Modelo de origem (como está), em DBML
- [ ] 4. Perguntas de negócio e granularidade
- [ ] 5. Dimensões
- [ ] 6. Fatos e relacionamentos
- [ ] 7. Implementação em SQL/dbt e testes de qualidade
- [ ] 8. Documentação final

## Ferramentas

- **DBML e [dbdiagram.io](https://dbdiagram.io):** definição e visualização do modelo.
- **SQL e dbt (previstos):** implementação do modelo e testes.

## Autor

João Pedro
