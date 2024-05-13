-- SQL Mock 3 solutions

-- 1) Tournament winners

with cte as (
select  p.group_id, p.player_id,
rank() over (partition by p.group_id order by
sum(case when p.player_id = m.first_player then m.first_score
else m.second_score END) desc, player_id) as 'rnk'
from player p join 
matches m on p.player_id in (m.first_player, m.second_player)
group by p.group_id, p.player_id
)


select group_id,player_id from cte 
where rnk=1;



-- 2) Market Analysis II

 with cte as (
 select seller_id,item_id, rank() over (partition by seller_id order by order_date ) as 'rnk'
 from orders
 )
 , cte1 as(
 select c1.seller_id, i.item_brand
 from cte c1 join 
 items i on c1.item_id = i.item_id
 where c1.rnk =2 )
 
 
 select u.user_id as seller_id,
 case when u.favorite_brand = c2.item_brand then 'yes'
 else 'mo' end as '2nd_item_fav_brand'
 from users u left join 
 cte1 c2
 on u.user_id = c2.seller_id;