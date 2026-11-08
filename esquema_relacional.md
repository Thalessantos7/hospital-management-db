# Esquema Relacional (Modelo Lógico Textual)

**PESSOA** (**id_pessoa**, nome, cpf, data_nascimento, telefone)

**PACIENTE** (**id_paciente**, num_cartao_sus, tipo_sanguineo)

**MEDICO** (**id_medico**, crm, especialidade)

**USUARIO** (**id_usuario**, id_pessoa, email_corporativo, senha_hash, ativo)

**PERFIL_ACESSO** (**id_perfil**, nome_role, descricao)

**USUARIO_PERFIL** (**id_usuario, id_perfil**)

**DEPARTAMENTO** (**id_departamento**, nome, sigla, localizacao)

**LEITO** (**id_leito**, id_departamento, codigo, ala, status)

**INTERNACAO** (**id_paciente, id_leito, data_entrada**, data_alta, observacao)

**CONSULTA** (**id_consulta**, id_paciente, id_medico, data_hora, motivo, status)

**PRONTUARIO** (**id_prontuario**, id_paciente, id_medico, data_atendimento, diagnostico, observacoes)

**EXAME** (**id_exame**, id_paciente, tipo_exame, data_solicitacao, laudo_resultado)

**MEDICAMENTO** (**id_medicamento**, nome, dosagem, quantidade_estoque)

**PRESCRICAO** (**id_prescricao**, id_paciente, id_medico, data_emissao)

**ITEM_PRESCRICAO** (**id_prescricao, id_medicamento**, quantidade_prescrita, posologia)