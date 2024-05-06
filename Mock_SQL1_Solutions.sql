--Mock SQL 1 Solutions


-- 1) Top Travellers - Problem No :- 15

select u.name,coalesce(sum(r.distance),0) as 'travelled_distance' from 
users u left join 
rides r on u.id = r.user_id
group by u.id,u.name
order by coalesce(sum(r.distance),0) desc, u.name;

-- 2) Apple Oranges - Problem No :- 16

SELECT sale_date, (s1.sold_num - s2.sold_num) as 'diff' FROM 	Sales s1
inner join Sales s2
on s1.sale_date=s2.sale_date
and lcase(s1.fruit)='apples'
and lcase(s2.fruit)='oranges'
order by sale_date;
