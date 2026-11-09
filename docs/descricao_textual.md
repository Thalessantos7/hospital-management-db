# Descrição Textual: Sistema de Banco de Dados Hospitalar

## Resumo do Sistema:
O Sistema de Gerenciamento Hospitalar foi projetado para apoiar e centralizar as rotinas operacionais e clínicas de um complexo de saúde. Seu objetivo principal é integrar o fluxo de atendimento, desde o cadastro inicial e agendamento de consultas até o controle de internações e a gestão do histórico médico. O sistema garante o rastreamento completo da jornada do indivíduo, permitindo que a equipe médica registre prontuários, solicite exames e emita prescrições de tratamentos. Além disso, a aplicação gerencia a infraestrutura física da instituição através do controle em tempo real da ocupação dos leitos e da organização dos departamentos. O acesso às funcionalidades do sistema é governado por um modelo de Controle de Acesso Baseado em Papéis.

Considere a modelagem deste banco de dados com os requisitos de dados resumidos a seguir:

- O cadastro base do sistema inclui todas as **pessoas** envolvidas no hospital. Cada **pessoa** tem uma identificação pessoal exclusiva (ID). Elas também são descritas por seu CPF, nome completo, data de nascimento e telefone de contato.

- Dentro do grupo de **pessoas**, existe um subgrupo classificado como **pacientes**. Os **pacientes** têm atributos específicos associados a eles, como o número do cartão do SUS e o seu tipo sanguíneo.

- Da mesma forma, existe outro subgrupo de **pessoas** formado pelos **médicos**. Os **médicos** são descritos adicionalmente por sua especialidade de atuação e identificados por seu CRM (registro no conselho médico).

- Para garantir a segurança do sistema, pessoas autorizadas possuem uma conta de **usuário** vinculada. Os **usuários** são identificados unicamente, e guardam as credenciais de acesso (email corporativo e hash de senha). O escopo do que um **usuário** pode acessar é determinado pelos **perfis de acesso** (Roles) atribuídos a ele. Um **perfil de acesso** descreve o nível de permissão (ex: ADMIN, RECEPCAO, MEDICO), e pode ser concedido a vários **usuários**, assim como um **usuário** pode acumular vários papéis.

- A infraestrutura do hospital é organizada em **departamentos**, identificados exclusivamente por um ID, além de possuírem nome do departamento, sigla e localização. 

- O hospital gerencia **leitos** para as acomodações. Os **leitos** são identificados exclusivamente pelo seu código, e também são descritos pela ala em que estão localizados e pelo seu status atual (livre, ocupado, etc.).

- As **consultas** são realizadas entre um **médico** e um **paciente** em determinada data e hora. O motivo da **consulta** e o status do atendimento são registrados. O registro clínico dessas avaliações é feito por meio de **prontuários**, identificados exclusivamente e contendo a data do atendimento, o diagnóstico (código CID) e as observações gerais.

- Durante a estadia, ocorrem as **internações** (relacionamento entre **paciente** e **leito**). Um **paciente** pode ocupar vários **leitos** ao longo do tempo, e um **leito** recebe vários **pacientes** em momentos distintos. A cada **internação**, a data de entrada, a data de alta e as observações clínicas daquela estadia são obrigatoriamente registradas.

- O hospital possui um acervo de **medicamentos**, identificados por um ID exclusivo e descritos pelo nome genérico, dosagem e quantidade em estoque.

- Os **médicos** emitem **prescrições** médicas, identificadas por um número exclusivo e pela data de emissão. Uma **prescrição** pode conter vários **medicamentos**. Para cada **medicamento** contido em uma **prescrição** (item da prescrição), a quantidade prescrita e a posologia (ex: "de 8 em 8 horas") são obrigatoriamente registradas.

- Por fim, o sistema armazena **exames** solicitados para os **pacientes**. Cada **exame** possui um identificador único, tipo de exame, data da solicitação e o respectivo laudo/resultado.