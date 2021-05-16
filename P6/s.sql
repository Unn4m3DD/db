select
  tt.title
from
  titles as tt
except
select
  tt.title
from
  stores as st
  inner join sales as sl on st.stor_id = sl.stor_id
  inner join titles as tt on tt.title_id = sl.title_id
where
  st.stor_name = 'Bookbeat';

/*
 Computer Phobic AND Non-Phobic Individuals: Behavior Variations
 Emotional Security: A New Algorithm
 Fifty Years in Buckingham Palace Kitchens
 Is Anger the Enemy?
 Life Without Fear
 Net Etiquette
 Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean
 Prolonged Data Deprivation: Four Case Studies
 Secrets of Silicon Valley
 Silicon Valley Gastronomic Treats
 Straight Talk About Computers
 Sushi, Anyone?
 The Psychology of Computer Cooking
 You Can Combat Computer Stress!
 */