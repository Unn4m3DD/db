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

/*
 Barnum's	Binnet & Hardley
 Barnum's	Five Lakes Publishing
 Barnum's	GGG&G
 Barnum's	Lucerne Publishing
 Barnum's	Ramona Publishers
 Barnum's	Scootney Books
 Bookbeat	Five Lakes Publishing
 Bookbeat	GGG&G
 Bookbeat	Lucerne Publishing
 Bookbeat	New Moon Books
 Bookbeat	Ramona Publishers
 Bookbeat	Scootney Books
 Doc-U-Mat: Quality Laundry and Books	Algodata Infosystems
 Doc-U-Mat: Quality Laundry and Books	Five Lakes Publishing
 Doc-U-Mat: Quality Laundry and Books	GGG&G
 Doc-U-Mat: Quality Laundry and Books	Lucerne Publishing
 Doc-U-Mat: Quality Laundry and Books	Ramona Publishers
 Doc-U-Mat: Quality Laundry and Books	Scootney Books
 Eric the Read Books	Binnet & Hardley
 Eric the Read Books	Five Lakes Publishing
 Eric the Read Books	GGG&G
 Eric the Read Books	Lucerne Publishing
 Eric the Read Books	Ramona Publishers
 Eric the Read Books	Scootney Books
 Fricative Bookshop	Five Lakes Publishing
 Fricative Bookshop	GGG&G
 Fricative Bookshop	Lucerne Publishing
 Fricative Bookshop	Ramona Publishers
 Fricative Bookshop	Scootney Books
 News & Brews	Algodata Infosystems
 News & Brews	Five Lakes Publishing
 News & Brews	GGG&G
 News & Brews	Lucerne Publishing
 News & Brews	Ramona Publishers
 News & Brews	Scootney Books
 */