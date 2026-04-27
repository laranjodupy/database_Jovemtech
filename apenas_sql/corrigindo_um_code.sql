--Aqui eu vou copiar uma tabela errada nas definições ou na lógica de criação dos dados

CREATE TABLE consultas (
    id INTEGER,
    paciente VARCHAR(100),
    medico VARCHAR(100),
    data_consulta TIMESTAMP,
    valor REAL,
    status VARCHAR(50)
);

DROP TABLE consultas;

-- Corrigindo do jeito que eu acho que e certo
CREATE TABLE IF NOT EXISTS pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT null,
    comorbidades VARCHAR(20) DEFAULT 'não possui'
);

CREATE TABLE IF NOT EXISTS medicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT null,
    cargo VARCHAR(50) NOT null
);

CREATE TABLE IF NOT EXISTS consultas (
    id SERIAL PRIMARY KEY,
    paciente_id INTEGER REFERENCES pacientes(id) ON DELETE RESTRICT,
    medico_id INTEGER REFERENCES medicos(id) ON DELETE RESTRICT,
    data_consulta TIMESTAMPTZ,
    valor DECIMAL,
    status VARCHAR(20) DEFAULT 'ativo'
);