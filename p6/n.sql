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