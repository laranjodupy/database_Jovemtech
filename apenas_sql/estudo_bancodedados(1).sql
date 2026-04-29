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

-- Alterando uma tabela, adicionando e excluindo uma coluna com o ADD e o DROP
ALTER TABLE livros ADD COLUMN paginas INTEGER;
ALTER TABLE livros DROP COLUMN paginas;

-- Alterando o tipo de coluna com o ALTER COLUMN [chave] TYPE [tipo desejado]
ALTER TABLE livros ALTER COLUMN titulo TYPE VARCHAR(200);

--Adicionando uma regra com CONSTRAINT [chave] CHECK (condição)
ALTER TABLE livros ADD CONSTRAINT chk_preco CHECK (preco > 0);