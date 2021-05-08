select
  p.pub_id,
  p.pub_name,
  sum(s.qty)
from
  publishers as p
  inner join titles as t on p.pub_id = t.pub_id
  inner join sales as s on s.title_id = t.title_id
group by
  p.pub_id,
  p.pub_name;