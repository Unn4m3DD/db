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