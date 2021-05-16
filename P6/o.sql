select
  title,
  avg(price * ytd_sales) as faturacao,
  avg(royalty * 0.01 * price * ytd_sales) as auths_revenue,
  avg(price * ytd_sales) - avg(royalty * 0.01 * price * ytd_sales) as publisher_revenue
from
  titles
  join titleauthor on titles.title_id = titleauthor.title_id
group by
  titles.title_id,
  title
order by
  title;

/*
 But Is It User Friendly?	201501.00	32240.160000	169260.840000
 Computer Phobic AND Non-Phobic Individuals: Behavior Variations	8096.25	809.625000	7286.625000
 Cooking with Computers: Surreptitious Balance Sheets	46318.20	4631.820000	41686.380000
 Emotional Security: A New Algorithm	26654.64	2665.464000	23989.176000
 Fifty Years in Buckingham Palace Kitchens	180397.20	25255.608000	155141.592000
 Is Anger the Enemy?	22392.75	2687.130000	19705.620000
 Life Without Fear	777.00	77.700000	699.300000
 Net Etiquette	NULL	NULL	NULL
 Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean	7856.25	785.625000	7070.625000
 Prolonged Data Deprivation: Four Case Studies	81399.28	8139.928000	73259.352000
 Secrets of Silicon Valley	81900.00	8190.000000	73710.000000
 Silicon Valley Gastronomic Treats	40619.68	4874.361600	35745.318400
 Straight Talk About Computers	81859.05	8185.905000	73673.145000
 Sushi, Anyone?	61384.05	6138.405000	55245.645000
 The Busy Executive's Database Guide	81859.05	8185.905000	73673.145000
 The Gourmet Microwave	66515.54	15963.729600	50551.810400
 You Can Combat Computer Stress!	55978.78	13434.907200	42543.872800
 */