--Mock SQL Solutions  2

-- 1) Customers Who Bought All Products

with cte as (
    select count(distinct product_key)  as max_key from product p 
)


select distinct customer_id from customer
group by customer_id
having count(distinct product_key) = (select max_key from cte);


-- 2) Product Sales Analysis III

with cte as (
    select product_id,min(year) as 'min_year' from Sales
    group by product_id
)

select s.product_id, s.year as 'first_year', quantity, price
from sales s inner join
cte on s.product_id = cte.product_id
and s.year = cte.min_year;

