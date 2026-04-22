CREATE TABLE artistas_caju (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    pais_origem VARCHAR(50) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE albuns_caju (
    id SERIAL PRIMARY KEY,
    artista_id INT NOT NULL,
    titulo varchar(150) NOT NULL,
    ano INT NOT NULL,

    CONSTRAINT chk_ano CHECK (ano > 1850),
    artista_id REFERENCES artista(id) ON DELETE RESTRICT
)

CREATE TABLE faixas_caju (
    id SERIAL PRIMARY KEY,
    nome varchar(100) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT NOT NULL,
    
    CONSTRAINT chk_duracao CHECK (duracao > 0 ),
    album_id REFERENCES albuns_caju(id) ON DELETE RESTRICT

)

INSERT INTO artista_caju (nome, id)
VALUES ('ViadinhoGameplay', 1), ('RenatinhoBala', 2), ('Danielzinho Prime', 3), ('Chun-li', 4), ('Davi Blowjobs', 5)

INSERT INTO album_caju (titulo, artista_id, ano, id)
VALUES ('Bloquinho da Viadagem I', 1, 1851, 1), ('Bloquinho da Viadagem II', 1, 1852, 2), ('A 4+5', 2, 1954, 3), ('Peidos Gritantes', 2, 1854, 4), ('Shrekudo: A dragão e o jegue', 3, 1855, 5), ('Melô do striti faiter', 4, 1856, 6), ('Blowjob part 1', 5, 1857, 7)

INSERT INTO faixas_caju (id, nome, duracao_segundos, album_id)
VALUES (1,'Deiontem', 90000, 1), (2, 'Comihoje', 91000, 1), (3, 'Broxeiamanha', 60000, 1), (4, 'Molested', 120000, 2), (5, 'bilau', 150000, 2), (6, 'dolfo', 180000, 2), (7, 'Peido fino', 210000, 3), (8, 'Shrekudo', 240000, 3), (9, 'Ryuzin', 270000, 3) 

