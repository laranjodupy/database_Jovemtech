# Bug Hunt — Aula 06
## Grupo 4

**Banco de dados:** Chinook · PostgreSQL  
**Tabelas:** `invoice_line` · `track`

---

## Regras da dinâmica

Cada query abaixo está **quebrada**. Pode faltar parte da lógica, pode ter algo errado no que está escrito, pode ter os dois ao mesmo tempo. O enunciado descreve exatamente o que o cliente precisa — a query não entrega isso.

### O que a equipe precisa entregar

Para cada query, a equipe deve registrar:

1. **A query incorreta** — exatamente como está aqui
2. **O que foi encontrado** — descrever os problemas em português, explicando por que a query não resolve o enunciado
3. **Como chegaram na solução** — o raciocínio que levou à correção
4. **A query correta** — a versão funcionando no banco que entrega o que o enunciado pede

A entrega é feita por escrito. Cada query vale **1 ponto**. A equipe que entregar mais respostas corretas e bem explicadas vence.

---

## Queries

---

### Query 1

> O time financeiro quer saber a receita total gerada por cada faixa vendida. Mostre o `track_id` e a receita total, mas apenas para faixas que geraram **mais de 3.00** de receita. Ordene da faixa que mais gerou receita para a que menos gerou.

```sql
select
  sum(unit_price * quantity) as receita_total
from
  invoice_line
group by
  track_id
having
  sum(unit_price * quantity) < 3.00
order by
  track_id;
```

---

### Query 2

> O time de operações quer saber quantos itens diferentes foram vendidos em cada fatura. Mostre o `invoice_id` e a contagem de itens, mas apenas faturas com **mais de 5 itens**. Ordene da fatura com mais itens para a com menos.

```sql
select
  count(invoice_line_id) as total_itens
from
  invoice_line
having
  count(invoice_line_id) > 5
order by
  total_itens desc;
```

---

### Query 3

> O time de produto quer saber quantas vezes cada faixa foi vendida. Mostre o `track_id` e o total de vendas, mas apenas as faixas vendidas **no máximo 2 vezes**. Ordene da faixa mais vendida para a menos vendida.

```sql
select
  track_id,
  count(*) as total_vendas
from
  invoice_line
order by
  total_vendas asc;
```

---

### Query 4

> O time financeiro quer entender a distribuição de preços praticados nas vendas. Mostre cada `unit_price` e quantas vezes esse preço foi cobrado, mas apenas preços que aparecem **mais de 100 vezes**. Ordene do preço mais frequente para o menos frequente.

```sql
select
  count(*) as total_cobrado
from
  invoice_line
having
  count(*) > 100
order by
  total_cobrado asc;
```

---

### Query 5

> O time de análise quer saber a receita média por fatura. Mostre o `invoice_id` e a média de receita por item dentro dessa fatura, arredondada para 2 casas decimais. Mostre apenas faturas com receita média **acima de 1.50**. Ordene da maior receita média para a menor.

```sql
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
```

---

### Query 6

> O time de dados quer saber quantas faixas do catálogo têm preço unitário **acima de 0.99**. Mostre o `unit_price` e a contagem. Ordene do preço mais alto para o mais baixo.

```sql
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
```

---

### Query 7

> O time de curadoria quer saber a duração total do catálogo por tipo de mídia, em horas, arredondada para 2 casas decimais. Mostre o `media_type_id` e a duração total. Ordene do tipo com mais horas para o com menos.

```sql
select
  round(sum(milliseconds) / 3600000, 2) as duracao_total_horas
from
  track
group by
  media_type_id
order by
  duracao_total_horas asc;
```

---

### Query 8

> O time financeiro quer saber a receita máxima gerada em uma única linha de venda, agrupada por fatura. Mostre o `invoice_id` e o valor máximo. Mostre apenas faturas onde o item mais caro **custou mais de 1.50**. Ordene da fatura com maior valor máximo para a com menor.

```sql
select
  max(unit_price * quantity) as valor_maximo
from
  invoice_line
group by
  invoice_id
having
  max(unit_price * quantity) > 1.50
order by
  valor_maximo desc;
```

---

### Query 9

> O time de produto quer saber a contagem de faixas e o tamanho médio em bytes por álbum. Mostre apenas álbuns com **mais de 5 faixas**. Ordene do álbum com mais faixas para o com menos.

```sql
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

---

### Query 10

> O time de análise quer saber a quantidade total de itens vendidos por fatura. Mostre o `invoice_id` e a soma das quantidades. Mostre apenas faturas com **mais de 5 itens no total**. Ordene da fatura com mais itens para a com menos.

```sql
select
  sum(quantity) as total_itens
from
  invoice_line
group by
  invoice_id
having
  sum(quantity) >= 5
order by
  total_itens desc;
```
