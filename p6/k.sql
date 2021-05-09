select
  authors.au_fname,
  authors.au_lname,
  count(distinct titles.[type])
from
  authors
  inner join titleauthor on authors.au_id = titleauthor.au_id
  inner join titles on titles.title_id = titleauthor.title_id
group by
  authors.au_id,
  authors.au_fname,
  authors.au_lname
having
  count(distinct titles.[type]) > 1;

/*
 Michael	O'Leary	2
 Charlene	Locksley	2
 Stearns	MacFeather	2
 Anne	Ringer	2
 */