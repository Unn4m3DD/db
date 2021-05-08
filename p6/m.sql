select
  title,
  titles.[type],
  advance
from
  titles
  join (
    select
      [type],
      avg(advance) as average
    from
      titles
    group by
      [type]
    having
      avg(advance) is not null
  ) as temp on titles.type = temp.type
  and titles.advance >= temp.average * 1.5;