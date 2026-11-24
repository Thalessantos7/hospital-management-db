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