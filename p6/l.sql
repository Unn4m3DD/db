select
  tt.[type],
  pl.pub_id,
  avg(tt.price) as avg_price,
  sum(qty) as qtt
from
  stores as st
  inner join sales as sl on st.stor_id = sl.stor_id
  inner join titles as tt on tt.title_id = sl.title_id
  inner join publishers as pl on pl.pub_id = tt.pub_id
group by
  tt.[type],
  pl.pub_id;