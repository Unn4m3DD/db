select
  authors.au_fname,
  count(titles.[type])
from
  authors
  join titleauthor on authors.au_id = titleauthor.au_id
  join titles on titleauthor.title_id = titles.title_id
group by
  authors.au_fname
having
  count(titles.[type]) > 1
order by
  authors.au_fname;