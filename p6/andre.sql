;

--f)
select
  pub_id,
  pub_name
from
  publishers
where
  pub_name like '%Bo%';

--h)
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

-- j)
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

-- l)
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

-- n)
select
  auth.au_lname + ' ' + auth.au_fname as author_name,
  title,
  avg(ta.royaltyper) as avg_revenue,
  sum(qty) as sold_book_count,
  sum(ta.royaltyper * qty) as author_revenue
from
  authors as auth
  inner join titleauthor as ta on auth.au_id = ta.au_id
  inner join titles as tt on tt.title_id = ta.title_id
  inner join sales as sl on sl.title_id = tt.title_id
group by
  auth.au_id,
  auth.au_lname,
  auth.au_fname,
  tt.title_id,
  title;

--r)
declare @avg_books_per_store as int;

set
  @avg_books_per_store = (
    select
      avg(book_count)
    from
      (
        select
          st.stor_name,
          sum(sl.qty) as book_count
        from
          stores as st
          inner join sales as sl on st.stor_id = sl.stor_id
        group by
          st.stor_id,
          st.stor_name
      ) as books_per_store
  );

select
  st.stor_name,
  sum(sl.qty) as book_count
from
  stores as st
  inner join sales as sl on st.stor_id = sl.stor_id
group by
  st.stor_id,
  st.stor_name
having
  sum(sl.qty) > @avg_books_per_store;

-- s)
select
  tt.title
from
  titles as tt
except
select
  tt.title
from
  stores as st
  inner join sales as sl on st.stor_id = sl.stor_id
  inner join titles as tt on tt.title_id = sl.title_id
where
  st.stor_name = 'Bookbeat';

-- t)
select
  st.stor_name,
  pl.pub_name
from
  stores as st,
  publishers as pl
except
select
  st.stor_name,
  pl.pub_name
from
  stores as st
  inner join sales as sl on st.stor_id = sl.stor_id
  inner join titles as tt on tt.title_id = sl.title_id
  inner join publishers as pl on pl.pub_id = tt.pub_id;