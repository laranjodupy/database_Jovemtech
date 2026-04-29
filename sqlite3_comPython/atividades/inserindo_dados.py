import sqlite3 as sq

conexao = sq.connect("banco_atividades.db")
cursor = conexao.cursor()

cursor.execute('''-- =========================
-- SAMPLE DATA (SQLite3)
-- =========================

INSERT INTO artist (name) VALUES
('Pink Floyd'),
('Daft Punk'),
('Radiohead'),
('Miles Davis');

INSERT INTO album (title, artist_id) VALUES
('The Dark Side of the Moon', 1),
('Wish You Were Here', 1),
('Random Access Memories', 2),
('OK Computer', 3),
('Kind of Blue', 4);

INSERT INTO employee (
first_name,last_name,title,reports_to,birth_date,hire_date,
address,city,state,country,postal_code,phone,email
) VALUES
(
'Jane','Smith','General Manager',NULL,
'1980-05-12','2015-01-10',
'123 Main St','São Paulo','SP','Brazil','01000-000',
'11999999999','jane@company.com'
),
(
'Carlos','Oliveira','Support Rep',1,
'1990-09-20','2020-03-15',
'456 Centro','Aracaju','SE','Brazil','49000-000',
'79988887777','carlos@company.com'
);

INSERT INTO customer (
first_name,last_name,company,address,city,state,country,
postal_code,phone,email,support_rep_id
) VALUES
(
'Daniel','Lima','Dev Solutions',
'Rua A','Aracaju','SE','Brazil',
'49000-100','79991112222',
'daniel@email.com',2
),
(
'Ana','Souza','Data Corp',
'Rua B','Salvador','BA','Brazil',
'40000-000','71995556666',
'ana@email.com',2
),
(
'Lucas','Ferreira',NULL,
'Rua C','Recife','PE','Brazil',
'50000-000','81994443333',
'lucas@email.com',2
);

INSERT INTO genre (name) VALUES
('Rock'),
('Electronic'),
('Jazz');

INSERT INTO media_type (name) VALUES
('MP3'),
('AAC'),
('FLAC');

INSERT INTO playlist (name) VALUES
('Favorites'),
('Study Music'),
('Jazz Collection');

INSERT INTO track (
name,
album_id,
media_type_id,
genre_id,
composer,
milliseconds,
bytes,
unit_price
) VALUES
(
'Money',
1,
1,
1,
'Pink Floyd',
382000,
9000000,
1.99
),
(
'Time',
1,
1,
1,
'Pink Floyd',
413000,
9500000,
1.99
),
(
'Get Lucky',
3,
2,
2,
'Daft Punk',
369000,
8800000,
2.49
),
(
'Paranoid Android',
4,
1,
1,
'Radiohead',
387000,
9200000,
2.29
),
(
'So What',
5,
3,
3,
'Miles Davis',
545000,
12000000,
1.79
);

INSERT INTO playlist_track (playlist_id,track_id) VALUES
(1,1),
(1,3),
(1,4),
(2,2),
(2,4),
(3,5);

INSERT INTO invoice (
customer_id,
invoice_date,
billing_address,
billing_city,
billing_state,
billing_country,
billing_postal_code,
total
) VALUES
(
1,
'2026-04-29 10:00:00',
'Rua A',
'Aracaju',
'SE',
'Brazil',
'49000-100',
4.48
),
(
2,
'2026-04-29 11:30:00',
'Rua B',
'Salvador',
'BA',
'Brazil',
'40000-000',
3.78
);

INSERT INTO invoice_line (
invoice_id,
track_id,
unit_price,
quantity
) VALUES
(1,1,1.99,1),
(1,3,2.49,1),
(2,4,2.29,1),
(2,5,1.49,1);

-- =========================
-- TEST QUERIES
-- =========================

-- all tracks with album and artist
-- SELECT t.name, a.title, ar.name
-- FROM track t
-- JOIN album a ON t.album_id = a.album_id
-- JOIN artist ar ON a.artist_id = ar.artist_id;

-- invoices with customer names
-- SELECT i.invoice_id, c.first_name, c.last_name, i.total
-- FROM invoice i
-- JOIN customer c ON i.customer_id = c.customer_id;

-- tracks in playlists
-- SELECT p.name, t.name
-- FROM playlist_track pt
-- JOIN playlist p ON pt.playlist_id = p.playlist_id
-- JOIN track t ON pt.track_id = t.track_id;''')

conexao.commit()
conexao.close()