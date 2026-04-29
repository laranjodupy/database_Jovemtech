import sqlite3 as sq

conexao = sq.connect("banco_atividades.db")
cursor = conexao.cursor()

cursor.execute('''-- Simplified SQLite3 schema converted from Chinook PostgreSQL schema
-- Foreign keys intentionally omitted for lightweight design

CREATE TABLE IF NOT EXISTS artist (
    artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE IF NOT EXISTS album (
    album_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    artist_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS employee (
    employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    title TEXT,
    reports_to INTEGER,
    birth_date TEXT,
    hire_date TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    postal_code TEXT,
    phone TEXT,
    fax TEXT,
    email TEXT
);

CREATE TABLE IF NOT EXISTS customer (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    company TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    postal_code TEXT,
    phone TEXT,
    fax TEXT,
    email TEXT NOT NULL,
    support_rep_id INTEGER
);

CREATE TABLE IF NOT EXISTS genre (
    genre_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE IF NOT EXISTS media_type (
    media_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE IF NOT EXISTS playlist (
    playlist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE IF NOT EXISTS invoice (
    invoice_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    invoice_date TEXT NOT NULL,
    billing_address TEXT,
    billing_city TEXT,
    billing_state TEXT,
    billing_country TEXT,
    billing_postal_code TEXT,
    total REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS track (
    track_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    album_id INTEGER,
    media_type_id INTEGER NOT NULL,
    genre_id INTEGER,
    composer TEXT,
    milliseconds INTEGER NOT NULL,
    bytes INTEGER,
    unit_price REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS invoice_line (
    invoice_line_id INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_id INTEGER NOT NULL,
    track_id INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    quantity INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS playlist_track (
    playlist_id INTEGER NOT NULL,
    track_id INTEGER NOT NULL,
    PRIMARY KEY (playlist_id, track_id)
);

-- Indexes

CREATE INDEX IF NOT EXISTS idx_album_artist_id
ON album (artist_id);

CREATE INDEX IF NOT EXISTS idx_customer_support_rep_id
ON customer (support_rep_id);

CREATE INDEX IF NOT EXISTS idx_employee_reports_to
ON employee (reports_to);

CREATE INDEX IF NOT EXISTS idx_invoice_customer_id
ON invoice (customer_id);

CREATE INDEX IF NOT EXISTS idx_invoice_line_invoice_id
ON invoice_line (invoice_id);

CREATE INDEX IF NOT EXISTS idx_invoice_line_track_id
ON invoice_line (track_id);

CREATE INDEX IF NOT EXISTS idx_playlist_track_playlist_id
ON playlist_track (playlist_id);

CREATE INDEX IF NOT EXISTS idx_playlist_track_track_id
ON playlist_track (track_id);

CREATE INDEX IF NOT EXISTS idx_track_album_id
ON track (album_id);

CREATE INDEX IF NOT EXISTS idx_track_genre_id
ON track (genre_id);

CREATE INDEX IF NOT EXISTS idx_track_media_type_id
ON track (media_type_id);''')

conexao.commit()
conexao.close()