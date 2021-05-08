select
  publishers.pub_id,
  publishers.pub_name,
  titles.title,
  sum(qty) as quantity
from
  sales
  inner join titles on sales.title_id = titles.title_id
  inner join publishers on publishers.pub_id = titles.pub_id
group by
  publishers.pub_id,
  publishers.pub_name,
  titles.title_id,
  titles.title;

/*
 1389	Algodata Infosystems	The Busy Executive's Database Guide	15
 1389	Algodata Infosystems	Cooking with Computers: Surreptitious Balance Sheets	25
 0736	New Moon Books	You Can Combat Computer Stress!	35
 1389	Algodata Infosystems	Straight Talk About Computers	15
 0877	Binnet & Hardley	Silicon Valley Gastronomic Treats	10
 0877	Binnet & Hardley	The Gourmet Microwave	40
 1389	Algodata Infosystems	But Is It User Friendly?	30
 1389	Algodata Infosystems	Secrets of Silicon Valley	50
 0877	Binnet & Hardley	Computer Phobic AND Non-Phobic Individuals: Behavior Variations	20
 0736	New Moon Books	Is Anger the Enemy?	108
 0736	New Moon Books	Life Without Fear	25
 0736	New Moon Books	Prolonged Data Deprivation: Four Case Studies	15
 0736	New Moon Books	Emotional Security: A New Algorithm	25
 0877	Binnet & Hardley	Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean	40
 0877	Binnet & Hardley	Fifty Years in Buckingham Palace Kitchens	20
 0877	Binnet & Hardley	Sushi, Anyone?	20
 */