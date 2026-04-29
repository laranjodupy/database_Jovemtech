CREATE TABLE IF NOT EXISTS artistas_caju (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    pais_origem VARCHAR(50) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE IF NOT EXISTS albuns_caju (
    id SERIAL PRIMARY KEY,
    artista_id INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    ano INT NOT NULL,

    CONSTRAINT chk_ano CHECK (ano > 1850),

    FOREIGN KEY (artista_id)
        REFERENCES artistas_caju(id)
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS faixas_caju (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT NOT NULL,

    CONSTRAINT chk_duracao CHECK (duracao_segundos > 0),

    FOREIGN KEY (album_id)
        REFERENCES albuns_caju(id)
        ON DELETE RESTRICT
);

-- ARTISTAS
INSERT INTO artistas_caju
(id, nome, genero, pais_origem, data_nascimento)
VALUES
(1,'ViadinhoGameplay','Funk','Brasil','1990-03-10'),
(2,'RenatinhoBala','Rap','Brasil','1988-06-21'),
(3,'Danielzinho Prime','Rock','Brasil','1995-01-15'),
(4,'Chun-li','Pop','China','1992-09-09'),
(5,'Davi Blowjobs','Metal','Brasil','1991-12-02');

-- ALBUNS
INSERT INTO albuns_caju
(id,titulo,artista_id,ano)
VALUES
(1,'Bloquinho da Viadagem I',1,1851),
(2,'Bloquinho da Viadagem II',1,1852),
(3,'A 4+5',2,1954),
(4,'Peidos Gritantes',2,1854),
(5,'Shrekudo: A dragão e o jegue',3,1855),
(6,'Melô do striti faiter',4,1856),
(7,'Blowjob part 1',5,1857);

-- FAIXAS
INSERT INTO faixas_caju
(id,nome,duracao_segundos,album_id)
VALUES
(1,'Deiontem',90000,1),
(2,'Comihoje',91000,1),
(3,'Broxeiamanha',60000,1),
(4,'Molested',120000,2),
(5,'Bilau',150000,2),
(6,'Dolfo',180000,2),
(7,'Peido fino',210000,3),
(8,'Shrekudo',240000,3),
(9,'Ryuzin',270000,3);

-- UPDATE 1
UPDATE artistas_caju
SET nome = 'ViadinhoGameplayUpdated'
WHERE id = 1;

-- UPDATE 2
UPDATE faixas_caju
SET duracao_segundos = duracao_segundos + 30000
WHERE id = 3;

-- DELETE EXEMPLO
DELETE FROM faixas_caju
WHERE id = 9;