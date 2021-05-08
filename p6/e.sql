select
  au_fname as first_name,
  au_lname as last_name,
  phone as telephone
from
  dbo.authors
where
  authors.state = 'CA'
  and authors.au_fname != 'Ringer'
order by
  au_fname,
  au_lname;