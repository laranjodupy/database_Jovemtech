Respostas das querys (especifiquem qual a sua query e organize de acordo cm o que o professor pediu o para fazer): 

/* =========================
   QUERY 5 - Kauan
   ========================= */

/* Query incorreta
select
  avg(unit_price * quantity) as receita_media
from
  invoice_line
group by
  invoice_id
having
  avg(unit_price * quantity) < 1.50
order by
  receita_media desc;
*/

/*
Problemas encontrados:
1. Não mostra invoice_id
2. HAVING está errado (< 1.50)
3. Falta arredondar para 2 casas decimais
4. Precisa mostrar somente médias acima de 1.50
*/

/* Query correta */
SELECT
  invoice_id,
  ROUND(AVG(unit_price * quantity), 2) AS receita_media
FROM
  invoice_line
GROUP BY
  invoice_id
HAVING
  AVG(unit_price * quantity) > 1.50
ORDER BY
  receita_media DESC;


/* =========================
   QUERY 6 - Kauan
   ========================= */

/* Query incorreta
select
  count(track_id) as total_faixas
from
  track
group by
  unit_price
having
  unit_price > 0.99
order by
  unit_price asc;
*/

/*
Problemas encontrados:
1. Não mostra unit_price
2. Ordenação errada (ASC)
3. Melhor usar WHERE ao invés de HAVING
4. Deve mostrar preços acima de 0.99
*/

/* Query correta */
SELECT
  unit_price,
  COUNT(track_id) AS total_faixas
FROM
  track
WHERE
  unit_price > 0.99
GROUP BY
  unit_price
ORDER BY
  unit_price DESC;

--------------------------- QUERY 9 --------------------------
--Daniel

select
  count(track_id) as total_faixas,
  round(avg(bytes), 0) as media_bytes,
  album_id 
from
  track
group by 
  album_id
having
  count(track_id) > 5
order by
  total_faixas desc;


-- ERROS: 
 --1 : Não houve erros de comando diretamente, mas sim a falta de mais especificações!
 --2: Eu percebi que não havia um agrupamento feito de forma correta e muito menos uma chamada para saber o album em especifico a ser usado como base de trabalho no group by.
 --3: eu adicionei o album_id, adicinei o group by e coloquei o album_id como especificação de agrupamento.
 --4: A query correta está logo acima desse comentário sobre os erros.

-- Query incorreta abaixo
/*```sql
select
  count(track_id) as total_faixas,
  round(avg(bytes), 0) as media_bytes
from
  track
having
  count(track_id) > 5
order by
  total_faixas desc;
```
*/

--------------------------- QUERY 10 --------------------------
-- Daniel 

select
  invoice_id,
  sum(quantity) as total_itens
from
  invoice_line
group by
  invoice_id
having
  sum(quantity) >= 5
order by
  total_itens desc;

-- ERROS: 
 --1 : Não houve erros de comando diretamente, mas sim a falta de mais especificações (DENOVO)!
 --2: Houve a falta de um select no invoice_id, daí o grup by se tornava inútil pois não tinha referência de como agrupar.
 --3: Bastou adicionar um invoice_id na parte do select e tudo ta de boa, graças a Deus.
 --4: A query correta está logo acima desse comentário sobre os erros.

 -- Query incorreta abaixo:
 /*```sql
select
  count(track_id) as total_faixas,
  round(avg(bytes), 0) as media_bytes
from
  track
having
  count(track_id) > 5
order by
  total_faixas desc;
```
*/