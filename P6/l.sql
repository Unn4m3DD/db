select
  publishers.pub_name,
  titles.[type],
  sum(qty) as quantity,
  avg(price) as average_price
from
  titles
  inner join sales on titles.title_id = sales.title_id
  inner join publishers on titles.pub_id = publishers.pub_id
group by
  titles.[type],
  publishers.pub_id,
  publishers.pub_name;

/*
 New Moon Books	business    	35	2.99
 New Moon Books	psychology  	173	11.2542
 Binnet & Hardley	mod_cook    	50	8.6566
 Binnet & Hardley	psychology  	20	21.59
 Binnet & Hardley	trad_cook   	80	15.9633
 Algodata Infosystems	business    	55	17.98
 Algodata Infosystems	popular_comp	80	21.475
 */