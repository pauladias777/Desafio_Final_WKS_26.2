# Clínica Care — Análise de Dados e BI

## Sobre o projeto

O Clínica Care é um projeto desenvolvido para o Desafio Final da Fábrica de Software 2026.2, com foco em Análise de Dados e Business Intelligence (BI).

O projeto utiliza uma base de dados fictícia de uma clínica médica, contendo informações sobre pacientes, médicos, especialidades, consultas, prontuários, prescrições e pagamentos.

O objetivo é aplicar conhecimentos de modelagem de dados, SQL, Python, Machine Learning e Power BI para organizar, analisar e visualizar os dados da clínica.

---

## Objetivo

O projeto tem como objetivo transformar os dados da clínica em informações que possam auxiliar na compreensão dos atendimentos, do faturamento, do perfil dos pacientes e da ocorrência de faltas às consultas.

---

## Tecnologias utilizadas

- **MySQL** — criação e gerenciamento do banco de dados;
- **SQL** — criação das tabelas, inserção, atualização e consultas dos dados;
- **Python** — exploração, tratamento e análise dos dados;
- **Pandas** — manipulação dos dados;
- **Matplotlib** — criação de visualizações;
- **Scikit-learn** — treinamento e avaliação do modelo de Machine Learning;
- **Power BI** — criação do dashboard e visualização dos indicadores;
- **GitHub** — armazenamento e organização do projeto.

---

## Desenvolvimento do projeto

### 1. Modelagem do banco de dados

Foi realizada a modelagem do banco de dados da Clínica Care, estabelecendo as entidades, atributos e relacionamentos necessários para representar as informações da clínica.

Entre as principais entidades estão:

- Pacientes;
- Médicos;
- Especialidades;
- Consultas;
- Prontuários;
- Prescrições;
- Pagamentos.

Também foi utilizada uma tabela associativa para relacionar médicos e especialidades.

### 2. Banco de dados e SQL

O banco de dados foi desenvolvido utilizando MySQL.

Foram utilizados comandos e recursos de:

- DDL;
- DML;
- DQL;
- Chaves primárias e estrangeiras;
- Relacionamentos entre tabelas;
- Funções de agregação;
- `GROUP BY`;
- `HAVING`;
- `JOIN`;
- `UPDATE`.

Foram realizadas consultas para analisar informações como valores de consultas, pagamentos, quantidade de pacientes, médias e relacionamentos entre as tabelas.

### 3. Análise de dados e Machine Learning

Foi utilizado Python para realizar a exploração, tratamento e análise dos dados.

Foram realizadas transformações nos dados, criação de tabelas e visualizações para auxiliar na identificação de padrões.

Também foi realizado o treinamento e a avaliação de um modelo de Machine Learning, incluindo a análise dos resultados obtidos pelo modelo.

### 4. Power BI

Foi desenvolvido um dashboard no Power BI para apresentar os principais indicadores da Clínica Care.

O dashboard apresenta informações relacionadas a:

- Consultas por especialidade;
- Taxa de ocupação;
- Faturamento total;
- Valor das consultas por mês;
- Distribuição dos pacientes por plano;
- Total de pacientes;
- Taxa de no-show por mês.

---

## Principais insights

A análise do dashboard permitiu observar diferenças na quantidade de consultas entre as especialidades, com maior concentração em Gastroenterologia e Ginecologia e menor volume em Neurologia.

Também foi identificado um faturamento total de aproximadamente **R$ 397 mil** no período analisado.

A distribuição dos pacientes apresenta diferentes planos de saúde, com maior participação da Unimed.

A taxa de no-show apresenta oscilações ao longo dos meses, indicando períodos com maior ocorrência de faltas às consultas.

Essas informações podem auxiliar no acompanhamento da demanda, do faturamento, da capacidade de atendimento e da frequência dos pacientes.

---

## Estrutura do projeto

Os arquivos do projeto estão organizados da seguinte forma:

- **Modelagem E-R** — representação visual do banco de dados;
- **`clinica.sql`** — script SQL contendo criação das tabelas, inserção, atualização e consultas;
- **Documento de análise SQL** — análise das consultas realizadas no banco;
- **Notebook Python (`.ipynb`)** — exploração, tratamento, visualizações e Machine Learning;
- **Dataset limpo (`.csv`)** — conjunto de dados utilizado após o tratamento;
- **Dashboard Power BI (`.pbix`)** — dashboard desenvolvido para análise dos indicadores;
- **Documento de insights** — análise dos principais resultados apresentados no dashboard.

---

## Conclusão

O projeto permitiu aplicar conhecimentos de banco de dados, SQL, análise de dados, Machine Learning e Business Intelligence de forma integrada.

A utilização dessas tecnologias possibilitou organizar os dados da Clínica Care, realizar análises e apresentar os principais indicadores por meio de um dashboard no Power BI.
