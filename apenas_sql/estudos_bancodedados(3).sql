-- Extra 1
select
  concat(c.first_name,' ', c.last_name) as nome_completo,
  sum(fat.total) as total_gasto
from
  customer c
  inner join invoice fat on c.customer_id = fat.customer_id 
group by nome_completo
order by total_gasto desc

-- Extra 2
select 
  a.title as titulo, 
  t.name as faixas_nulas
from 
  album a
left join track t on a.album_id = t.album_id
where 
  t.name is null;

-- Extra 3
select

from 
  track t
inner join playlist_track playt on t.track_id = playt.track_id

-- Lembrar de pegar o pdf e terminar o extra 3.