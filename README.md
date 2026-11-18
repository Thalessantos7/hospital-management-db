## 📃 Sobre o Projeto
Este repositório reúne a documentação da modelagem de banco de dados relacional desenvolvida para a disciplina de Banco de Dados I do curso de Análise e Desenvolvimento de Sistemas (ADS).

O esquema foi arquitetado para simular o ecossistema de um ambiente hospitalar real, aplicando na prática conceitos fundamentais da disciplina.

## 🏥 O que o sistema modela

O banco organiza dados de pacientes, médicos e usuários, incluindo perfis de acesso. Também representa departamentos e leitos, consultas e internações, além dos registros clínicos associados aos atendimentos. Para apoiar o acompanhamento dos pacientes, o modelo contempla exames, prescrições médicas, medicamentos e o controle de estoque.

## 🛠️ Tecnologias e escopo

- **Tecnologias:** modelagem relacional e SQL.
- **Escopo:** projeto acadêmico que documenta a estrutura lógica de um banco de dados hospitalar, incluindo entidades, atributos e relacionamentos. 

## 📚 Documentação

- [Esquema relacional](docs/esquema_relacional.md)
- [Descrição textual do sistema](docs/descricao_textual.md)

## 📂 Conteúdo do repositório

- **`docs/esquema_relacional.md`** — apresenta as entidades, atributos e relacionamentos do modelo lógico do banco de dados hospitalar.
- **`docs/descricao_textual.md`** — descreve o sistema e seus requisitos de dados, incluindo pacientes, equipe médica, consultas, internações, exames e prescrições.

## 📋 Regras de negócio

- Pessoas podem ser cadastradas como pacientes ou médicos. Pessoas autorizadas podem ter uma conta de usuário vinculada.
- Um usuário pode receber vários perfis de acesso, e cada perfil pode ser atribuído a vários usuários.
- Cada consulta relaciona um paciente e um médico e registra data e hora, motivo e status.
- Os prontuários registram o atendimento do paciente pelo médico, com data, diagnóstico e observações.
- Um paciente pode ter várias internações ao longo do tempo. Cada internação relaciona o paciente a um leito e registra datas de entrada e alta e observações.
- Leitos pertencem a departamentos e possuem um status, como livre ou ocupado.
- Exames são associados a pacientes e guardam tipo, data da solicitação e laudo ou resultado.
- Médicos emitem prescrições para pacientes. Cada prescrição pode conter vários medicamentos; cada item registra quantidade e posologia.
- O estoque de medicamentos é acompanhado pela quantidade disponível.