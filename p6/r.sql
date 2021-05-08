declare @avg_book_count int;

set
  @avg_book_count = (
    select
      AVG(sold_book_count)
    from
      (
        select
          sum(qty) as sold_book_count
        from
          stores
          inner join sales on sales.stor_id = stores.stor_id
        group by
          stores.stor_id,
          stores.stor_name
      ) as store_sold_book_count
  )
select
  stores.stor_name,
  sum(qty) as sold_book_count
from
  stores
  inner join sales on sales.stor_id = stores.stor_id
group by
  stores.stor_id,
  stores.stor_name
having
  sum(qty) > @avg_book_count;

/*
 Barnum's	125
 News & Brews	90
 Doc-U-Mat: Quality Laundry and Books	130
 */