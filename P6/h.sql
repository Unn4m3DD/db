select
  publishers.pub_id,
  publishers.pub_name,
  sum(qty) as quantity
from
  sales
  inner join titles on sales.title_id = titles.title_id
  inner join publishers on publishers.pub_id = titles.pub_id
group by
  publishers.pub_id,
  publishers.pub_name;

/*
 0736	New Moon Books	208
 0877	Binnet & Hardley	150
 1389	Algodata Infosystems	135
 */