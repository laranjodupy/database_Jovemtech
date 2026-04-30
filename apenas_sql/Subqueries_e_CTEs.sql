--Subquery no where:
 -- Subquery escalar
 select customer_id, total
 from invoice
 where total > (select avg(total) from invoice);