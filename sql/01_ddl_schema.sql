CREATE TABLE pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE paciente (
    id_paciente INTEGER PRIMARY KEY,
    num_cartao_sus VARCHAR(20) UNIQUE,
    tipo_sanguineo VARCHAR(3),

    CONSTRAINT fk_paciente_pessoa
        FOREIGN KEY (id_paciente) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE,
    CONSTRAINT chk_paciente_tipo_sanguineo
        CHECK (tipo_sanguineo IS NULL OR tipo_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'))
);

CREATE TABLE medico (
    id_medico INTEGER PRIMARY KEY,
    crm VARCHAR(20) NOT NULL UNIQUE,
    especialidade VARCHAR(100) NOT NULL,

    CONSTRAINT fk_medico_pessoa
        FOREIGN KEY (id_medico) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE
);

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    id_pessoa INTEGER NOT NULL UNIQUE,
    email_corporativo VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_usuario_pessoa
        FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE
);

CREATE TABLE perfil_acesso (
    id_perfil SERIAL PRIMARY KEY,
    nome_role VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE usuario_perfil (
    id_usuario INTEGER NOT NULL,
    id_perfil INTEGER NOT NULL,

    PRIMARY KEY (id_usuario, id_perfil),
    CONSTRAINT fk_usuario_perfil_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
        ON DELETE CASCADE,
    CONSTRAINT fk_usuario_perfil_perfil
        FOREIGN KEY (id_perfil) REFERENCES perfil_acesso(id_perfil)
        ON DELETE CASCADE
);

CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL,
    sigla VARCHAR(10) NOT NULL UNIQUE,
    localizacao VARCHAR(100) NOT NULL
);

CREATE TABLE leito (
    id_leito SERIAL PRIMARY KEY,
    id_departamento INTEGER NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    ala VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'LIVRE',

    CONSTRAINT fk_leito_departamento
        FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
        ON DELETE RESTRICT,
    CONSTRAINT chk_leito_status
        CHECK (status IN ('LIVRE', 'OCUPADO', 'MANUTENCAO', 'HIGIENIZACAO'))
);

CREATE TABLE internacao (
    id_paciente INTEGER NOT NULL,
    id_leito INTEGER NOT NULL,
    data_entrada TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_alta TIMESTAMP,
    observacao TEXT,

    PRIMARY KEY (id_paciente, id_leito, data_entrada),
    CONSTRAINT fk_internacao_paciente
        FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
        ON DELETE RESTRICT,
    CONSTRAINT fk_internacao_leito
        FOREIGN KEY (id_leito) REFERENCES leito(id_leito)
        ON DELETE RESTRICT,
    CONSTRAINT chk_internacao_datas
        CHECK (data_alta IS NULL OR data_alta >= data_entrada)
);

CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL,
    id_medico INTEGER NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'AGENDADA',

    CONSTRAINT fk_consulta_paciente
        FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
        ON DELETE RESTRICT,
    CONSTRAINT fk_consulta_medico
        FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
        ON DELETE RESTRICT,
    CONSTRAINT chk_consulta_status
        CHECK (status IN ('AGENDADA', 'EM_ANDAMENTO', 'REALIZADA', 'CANCELADA'))
);

CREATE TABLE prontuario (
    id_prontuario SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL,
    id_medico INTEGER NOT NULL,
    data_atendimento DATE NOT NULL DEFAULT CURRENT_DATE,
    diagnostico_cid VARCHAR(10) NOT NULL,
    observacoes TEXT,

    CONSTRAINT fk_prontuario_paciente
        FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
        ON DELETE RESTRICT,
    CONSTRAINT fk_prontuario_medico
        FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
        ON DELETE RESTRICT
);

CREATE TABLE exame (
    id_exame SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL,
    tipo_exame VARCHAR(100) NOT NULL,
    data_solicitacao DATE NOT NULL DEFAULT CURRENT_DATE,
    laudo_resultado TEXT,

    CONSTRAINT fk_exame_paciente
        FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
        ON DELETE RESTRICT
);

CREATE TABLE medicamento (
    id_medicamento SERIAL PRIMARY KEY,
    nome_generico VARCHAR(150) NOT NULL,
    dosagem VARCHAR(50) NOT NULL,
    quantidade_estoque INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT chk_medicamento_estoque
        CHECK (quantidade_estoque >= 0)
);

CREATE TABLE prescricao (
    id_prescricao SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL,
    id_medico INTEGER NOT NULL,
    data_emissao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_prescricao_paciente
        FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
        ON DELETE RESTRICT,
    CONSTRAINT fk_prescricao_medico
        FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
        ON DELETE RESTRICT
);

CREATE TABLE item_prescricao (
    id_prescricao INTEGER NOT NULL,
    id_medicamento INTEGER NOT NULL,
    quantidade_prescrita INTEGER NOT NULL,
    posologia VARCHAR(255) NOT NULL,

    PRIMARY KEY (id_prescricao, id_medicamento),
    CONSTRAINT fk_item_prescricao_prescricao
        FOREIGN KEY (id_prescricao) REFERENCES prescricao(id_prescricao)
        ON DELETE CASCADE,
    CONSTRAINT fk_item_prescricao_medicamento
        FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
        ON DELETE RESTRICT,
    CONSTRAINT chk_item_prescricao_quantidade
        CHECK (quantidade_prescrita > 0)
);