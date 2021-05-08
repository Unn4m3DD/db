select
  tt.title
from
  stores as st
  inner join sales as sl on st.stor_id = sl.stor_id
  inner join titles tt on tt.title_id = sl.title_id
where
  st.stor_id = (
    select
      stor_id
    from
      stores
    where
      stor_name = 'Bookbeat'
  );