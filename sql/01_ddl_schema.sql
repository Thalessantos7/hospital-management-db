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
    email_corporativo VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_pessoa INTEGER NOT NULL UNIQUE,

    CONSTRAINT fk_usuario_pessoa
        FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE
);

CREATE TABLE perfil_acesso (
    id_perfil SERIAL PRIMARY KEY,
    nome_role VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL,
    sigla VARCHAR(10) NOT NULL UNIQUE,
    localizacao VARCHAR(100) NOT NULL
);

CREATE TABLE medicamento (
    id_medicamento SERIAL PRIMARY KEY,
    nome_generico VARCHAR(150) NOT NULL,
    dosagem VARCHAR(50) NOT NULL,
    quantidade_estoque INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT chk_medicamento_estoque
        CHECK (quantidade_estoque >= 0)
);