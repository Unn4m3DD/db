select
  au_fname,
  au_lname,
  phone
from
  dbo.authors
order by
  au_fname,
  au_lname;