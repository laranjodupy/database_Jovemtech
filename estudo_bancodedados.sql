CREATE TABLE IF NOT EXISTS clientes(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  status VARCHAR(20) DEFAULT 'ativo',
  limite NUMERIC(10,2) CHECK (LIMITE >=0),
  criado_em TIMESTAMPTZ DEFAULT NOW()
);

-- Tabela pai
CREATE TABLE IF NOT EXISTS autores (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT null
);

-- Depois a tabela filha (que faz a referência)
CREATE TABLE IF NOT EXISTS livros(
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  preco NUMERIC(10,2) NOT NULL,
  autor_id INTEGER REFERENCES autores(id) ON DELETE RESTRICT
);

ALTER TABLE livros ADD COLUMN paginas INTEGER;
