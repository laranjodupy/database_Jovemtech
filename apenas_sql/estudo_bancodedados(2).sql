-- inner join: retorna todas as colunas que possuem conexao, tipo artista-album
select
  *
from
  album
  inner join artist on album.artist_id = artist.artist_id
  -- left join: retorna todas as colunas que possuem conexao e as que nao possuem conexao, retornando nulo para as colunas que nao possuem conexao nenhuma.


select
  *
from
  album
  left join artist on album.artist_id = artist.artist_id
  -- aliases: é necessario o "as" para especificar os nomes somente no SELECT, em outros casos como o FROM e o JOIN é de boa colocar apenas o apelido após uma separação por espaço


select
  *
from
  album pinto
  left join artist banana on pinto.artist_id = banana.artist_id
  -- usando os colunas comuns entre tabelas como caminhos por meio do join.

-- ligando varias tabelas (track ao album ao artista) para ligar a track ao artista
select
  t.name as nome_do_artista,
  al.title as titulo_album,
  t.unit_price as preco_unitario,
  ar.name as nome_do_artista
from
  track t
  inner join album al on t.album_id = al.album_id
  inner join artist ar on al.artist_id = ar.artist_id