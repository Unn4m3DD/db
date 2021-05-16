declare @per_publisher_revenue table(title_id varchar(10), publisher_revenue real);

insert into
  @per_publisher_revenue
select
  titles.title_id,
  avg(ytd_sales * price) - avg(ytd_sales * royalty * price *.01) as publisher_revenue
from
  authors
  inner join titleauthor on authors.au_id = titleauthor.au_id
  inner join titles on titles.title_id = titleauthor.title_id
group by
  titles.title_id,
  titles.title;

select
  titles.title,
  authors.au_fname + ' ' + authors.au_lname as author_name,
  avg(ytd_sales),
  avg(ytd_sales * price) as total_revenue,
  avg(ytd_sales * royalty * royaltyper * price *.01) as authors_revenue,
  publisher_revenue
from
  authors
  inner join titleauthor on authors.au_id = titleauthor.au_id
  inner join titles on titles.title_id = titleauthor.title_id
  inner join @per_publisher_revenue as ppr on ppr.title_id = titles.title_id
group by
  titles.title_id,
  titles.title,
  authors.au_id,
  authors.au_fname,
  authors.au_lname,
  ppr.publisher_revenue
order by
  titles.title;

/*
 But Is It User Friendly?	Cheryl Carson	8780	201501.00	3224016.000000	169260.8
 Computer Phobic AND Non-Phobic Individuals: Behavior Variations	Stearns MacFeather	375	8096.25	20240.625000	7286.625
 Computer Phobic AND Non-Phobic Individuals: Behavior Variations	Livia Karsen	375	8096.25	60721.875000	7286.625
 Cooking with Computers: Surreptitious Balance Sheets	Michael O'Leary	3876	46318.20	185272.800000	41686.38
 Cooking with Computers: Surreptitious Balance Sheets	Stearns MacFeather	3876	46318.20	277909.200000	41686.38
 Emotional Security: A New Algorithm	Charlene Locksley	3336	26654.64	266546.400000	23989.18
 Fifty Years in Buckingham Palace Kitchens	Reginald Blotchet-Halls	15096	180397.20	2525560.800000	155141.6
 Is Anger the Enemy?	Anne Ringer	2045	22392.75	134356.500000	19705.62
 Is Anger the Enemy?	Albert Ringer	2045	22392.75	134356.500000	19705.62
 Life Without Fear	Albert Ringer	111	777.00	7770.000000	699.3
 Net Etiquette	Charlene Locksley	NULL	NULL	NULL	NULL
 Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean	Sylvia Panteley	375	7856.25	78562.500000	7070.625
 Prolonged Data Deprivation: Four Case Studies	Johnson White	4072	81399.28	813992.800000	73259.35
 Secrets of Silicon Valley	Ann Dull	4095	81900.00	409500.000000	73710
 Secrets of Silicon Valley	Sheryl Hunter	4095	81900.00	409500.000000	73710
 Silicon Valley Gastronomic Treats	Innes del Castillo	2032	40619.68	487436.160000	35745.32
 Straight Talk About Computers	Dean Straight	4095	81859.05	818590.500000	73673.15
 Sushi, Anyone?	Michael O'Leary	4095	61384.05	184152.150000	55245.64
 Sushi, Anyone?	Burt Gringlesby	4095	61384.05	184152.150000	55245.64
 Sushi, Anyone?	Akiko Yokomoto	4095	61384.05	245536.200000	55245.64
 The Busy Executive's Database Guide	Marjorie Green	4095	81859.05	327436.200000	73673.15
 The Busy Executive's Database Guide	Abraham Bennet	4095	81859.05	491154.300000	73673.15
 The Gourmet Microwave	Michel DeFrance	22246	66515.54	1197279.720000	50551.81
 The Gourmet Microwave	Anne Ringer	22246	66515.54	399093.240000	50551.81
 You Can Combat Computer Stress!	Marjorie Green	18722	55978.78	1343490.720000	42543.87
 */