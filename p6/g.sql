select
  distinct publishers.pub_name
from
  titles
  join publishers on titles.pub_id = publishers.pub_id
where
  titles.[type] = 'Business';

/*
 Algodata Infosystems
 New Moon Books
 */