select
  titles.title
from
  stores
  inner join sales on sales.stor_id = stores.stor_id
  inner join titles on titles.title_id = sales.title_id
where
  stores.stor_name = 'Bookbeat';

/*
 The Gourmet Microwave
 The Busy Executive's Database Guide
 Cooking with Computers: Surreptitious Balance Sheets
 But Is It User Friendly?
 */