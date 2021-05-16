select
  titles.title,
  titles.[type],
  avg_type_advance * 1.5 as avg_advance_times_1_dot_5,
  advance
from
  titles
  inner join (
    select
      titles.[type],
      avg(titles.advance) as avg_type_advance
    from
      titles
    group by
      titles.[type]
  ) as avgs on titles.[type] = avgs.[type]
where
  advance > avg_type_advance * 1.5;

/*
 You Can Combat Computer Stress!	business    	9421.87500	10125.00
 The Gourmet Microwave	mod_cook    	11250.00000	15000.00
 Computer Phobic AND Non-Phobic Individuals: Behavior Variations	psychology  	6382.50000	7000.00
 */