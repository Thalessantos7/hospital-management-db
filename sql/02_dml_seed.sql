INSERT INTO pessoa (nome, cpf, data_nascimento, telefone) VALUES
    ('Pedro', '044.334.714-02', '2005-06-11', '(83) 93584-4374'),
    ('Astolfo', '764.404.867-72', '2001-05-20', '(85) 92124-2482'),
    ('Maria', '580.361.871-32', '2006-04-10', '(61) 92864-7497'),
    ('Jade', '673.047.315-08', '2000-03-02', '(48) 92446-9536'),
    ('Afonso', '934.851.678-78', '1988-10-01', '(98) 93130-7922'),
    ('Matheus', '798.142.412-70', '1990-05-10', '(48) 92278-7117');

INSERT INTO paciente (id_paciente, num_cartao_sus, tipo_sanguineo) VALUES
    (1, '700001234567890', 'O+'),
    (2, '700009876543210', 'A-'),
    (3, '700005554443332', 'B+');

INSERT INTO medico (id_medico, crm, especialidade) VALUES
    (4, 'CRM-PB 10452', 'Cardiologia'),
    (5, 'CRM-PB 11890', 'Clínica Médica'),
    (6, 'CRM-PB 09341', 'Traumatologia');
    
INSERT INTO departamento (nome_departamento, sigla, localizacao) VALUES
    ('Hospital São Francisco', 'HSF', 'Rua Peregrino Filho, 199 – Brasília / Centro, Patos - PB'),
    ('Hospital Infantil Noaldo Leite', 'HINL', 'Rua Hildo Menezes – Juá Doce, Patos - PB'),
    ('Complexo Hospitalar Regional Deputado Janduhy Carneiro', 'CHRDJC', 'Rua Horácio Nóbrega, s/n – Belo Horizonte, Patos - PB'),
    ('Hospital Day – UNIFIP', 'HD', 'Rua Cândido das Laranjeiras, 68 – Belo Horizonte, Patos - PB');

INSERT INTO perfil_acesso (nome_role, descricao) VALUES
    ('ADMIN', 'Administrador do sistema com acesso total'),
    ('MEDICO', 'Profissional médico com acesso a prontuários, exames e prescrições'),
    ('RECEPCAO', 'Equipe de atendimento para cadastro de pacientes e agendamento');

INSERT INTO usuario (email_corporativo, senha_hash, ativo, id_pessoa) VALUES
    ('jade.medica@hospital.com.br', '$2a$10$7EqJtq98hPqEX7fNZaFWoO5m3d8w9xY2z1A4b5C6d7E8f9G0h1I2', TRUE, 4),
    ('afonso.medico@hospital.com.br', '$2a$10$9XyZ1234567890AbCdEfGhIjKlMnOpQrStUvWxYz0123456789AB', TRUE, 5),
    ('matheus.medico@hospital.com.br', '$2a$10$4QwErTyUiOpAsDfGhJkLzXcVbNm1234567890QwErTyUiOpAsDfG', TRUE, 6);

INSERT INTO usuario_perfil (id_usuario, id_perfil) VALUES
    (1, 2),
    (1, 1),
    (2, 2),
    (3, 2);

INSERT INTO leito (codigo, ala, status, id_departamento) VALUES
    ('HSF-UTI-01', 'Ala Norte', 'OCUPADO', 1),
    ('HINL-PED-01', 'Ala Infantil', 'LIVRE', 2),
    ('CHRDJC-ENF-101', 'Ala Sul', 'LIVRE', 3),
    ('HD-AMB-01', 'Ala Cirúrgica', 'HIGIENIZACAO', 4);

INSERT INTO internacao (id_paciente, id_leito, data_entrada, data_alta, observacao) VALUES
    (1, 1, '2026-11-20 14:30:00', NULL, 'Paciente em monitoramento cardíaco contínuo na UTI.'),
    (2, 3, '2026-11-10 09:00:00', '2026-11-14 16:00:00', 'Internação para hidratação venosa e observação. Alta sem intercorrências.');

INSERT INTO consulta (data_hora, motivo, status, id_paciente, id_medico) VALUES
    ('2026-11-18 10:00:00', 'Dor torácica e falta de ar aos esforços', 'REALIZADA', 1, 4),
    ('2026-11-19 15:30:00', 'Febre persistente e dor de garganta', 'REALIZADA', 2, 5),
    ('2026-11-26 08:30:00', 'Dor no joelho direito após prática esportiva', 'AGENDADA', 3, 6);

INSERT INTO prontuario (data_atendimento, diagnostico_cid, observacoes, id_paciente, id_medico) VALUES
    ('2026-11-18', 'I20.9', 'Quadro sugestivo de angina instável. Solicitado ECG e encaminhado para internação.', 1, 4),
    ('2026-11-19', 'J06.9', 'Infecção aguda das vias aéreas superiores. Prescrito tratamento sintomático e antibiótico.', 2, 5);

INSERT INTO exame (tipo_exame, data_solicitacao, laudo_resultado, id_paciente) VALUES
    ('Eletrocardiograma (ECG)', '2026-11-18', 'Alteração no segmento ST compatível com isquemia miocárdica.', 1),
    ('Hemograma Completo', '2026-11-19', 'Leucocitose discreta sem desvio à esquerda.', 2),
    ('Ressonância Magnética do Joelho Direito', '2026-11-24', NULL, 3);

INSERT INTO medicamento (nome_generico, dosagem, quantidade_estoque) VALUES
    ('Ácido Acetilsalicílico', '100mg', 500),
    ('Atorvastatina', '20mg', 320),
    ('Dipirona Monoidratada', '500mg', 800),
    ('Amoxicilina', '500mg', 250);

INSERT INTO prescricao (data_emissao, id_paciente, id_medico) VALUES
    ('2026-11-18 11:15:00', 1, 4),
    ('2026-11-19 16:00:00', 2, 5);

INSERT INTO item_prescricao (id_prescricao, id_medicamento, quantidade_prescrita, posologia) VALUES
    (1, 1, 30, 'Tomar 1 comprimido por via oral após o almoço, 1 vez ao dia.'),
    (1, 2, 30, 'Tomar 1 comprimido por via oral à noite, antes de dormir.'),
    (2, 3, 12, 'Tomar 1 comprimido de 6 em 6 horas em caso de dor ou febre.'),
    (2, 4, 21, 'Tomar 1 cápsula de 8 em 8 horas durante 7 dias.');