select titles.title, publishers.pub_name, ytd_sales from titles 
join publishers on titles.pub_id = publishers.pub_id and ytd_sales is not null
order by titles.title
