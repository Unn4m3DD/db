select distinct title, avg(price * ytd_sales) as faturacao, avg(royalty * 0.01 * price * ytd_sales) as auths_revenue, avg(price * ytd_sales) - avg(royalty * 0.01 * price * ytd_sales) as publisher_revenue from titles
join titleauthor on titles.title_id = titleauthor.title_id
where ytd_sales is not null
group by titles.title_id, title 
order by title