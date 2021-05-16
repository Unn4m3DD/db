declare @book_count int;

set
  @book_count = (
    select
      count(*)
    from
      titles
  )
select
  stores.stor_name
from
  stores
  inner join sales on sales.stor_id = stores.stor_id
group by
  stores.stor_id,
  stores.stor_name
having
  count(distinct title_id) = @book_count;

/*
 
 */