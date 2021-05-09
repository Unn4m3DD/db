select
  authors.au_fname + ' ' + authors.au_lname as author_name,
  titles.title,
  sum(qty * royaltyper) as author_revenue
from
  authors
  inner join titleauthor on authors.au_id = titleauthor.au_id
  inner join titles on titles.title_id = titleauthor.title_id
  inner join sales on sales.title_id = titles.title_id
group by
  authors.au_id,
  authors.au_fname,
  authors.au_lname,
  titles.title_id,
  titles.title;

/*
 Johnson White	Prolonged Data Deprivation: Four Case Studies	1500
 Marjorie Green	The Busy Executive's Database Guide	600
 Marjorie Green	You Can Combat Computer Stress!	3500
 Cheryl Carson	But Is It User Friendly?	3000
 Michael O'Leary	Cooking with Computers: Surreptitious Balance Sheets	1000
 Michael O'Leary	Sushi, Anyone?	600
 Dean Straight	Straight Talk About Computers	1500
 Abraham Bennet	The Busy Executive's Database Guide	900
 Ann Dull	Secrets of Silicon Valley	2500
 Burt Gringlesby	Sushi, Anyone?	600
 Charlene Locksley	Emotional Security: A New Algorithm	2500
 Reginald Blotchet-Halls	Fifty Years in Buckingham Palace Kitchens	2000
 Akiko Yokomoto	Sushi, Anyone?	800
 Innes del Castillo	Silicon Valley Gastronomic Treats	1000
 Michel DeFrance	The Gourmet Microwave	3000
 Stearns MacFeather	Cooking with Computers: Surreptitious Balance Sheets	1500
 Stearns MacFeather	Computer Phobic AND Non-Phobic Individuals: Behavior Variations	500
 Livia Karsen	Computer Phobic AND Non-Phobic Individuals: Behavior Variations	1500
 Sylvia Panteley	Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean	4000
 Sheryl Hunter	Secrets of Silicon Valley	2500
 Anne Ringer	The Gourmet Microwave	1000
 Anne Ringer	Is Anger the Enemy?	5400
 Albert Ringer	Is Anger the Enemy?	5400
 Albert Ringer	Life Without Fear	2500
 */