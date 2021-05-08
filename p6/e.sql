select
  au_fname as first_name,
  au_lname as last_name,
  phone as telephone
from
  dbo.authors
where
  authors.state = 'CA'
  and authors.au_fname != 'Ringer'
order by
  au_fname,
  au_lname;

/*
 Abraham	Bennet	415 658-9932
 Akiko	Yokomoto	415 935-4228
 Ann	Dull	415 836-7128
 Burt	Gringlesby	707 938-6445
 Charlene	Locksley	415 585-4620
 Cheryl	Carson	415 548-7723
 Dean	Straight	415 834-2919
 Dirk	Stringer	415 843-2991
 Heather	McBadden	707 448-4982
 Johnson	White	408 496-7223
 Livia	Karsen	415 534-9219
 Marjorie	Green	415 986-7020
 Michael	O'Leary	408 286-2428
 Sheryl	Hunter	415 836-7128
 Stearns	MacFeather	415 354-7128
 */