-- b)
select au_fname, au_lname, phone from dbo.authors
-- c)
select au_fname, au_lname, phone from dbo.authors order by au_fname, au_lname
-- d)
select au_fname as first_name, au_lname as last_name, phone as telephone from dbo.authors order by au_fname, au_lname
-- e)
select au_fname as first_name, au_lname as last_name, phone as telephone from dbo.authors
where authors.state = 'CA' and authors.au_fname != 'Ringer' 
order by au_fname, au_lname
-- g)
select distinct pub_name from publishers
join titles on titles.type = 'Business' 
order by publishers.pub_name
-- i)
select titles.title, publishers.pub_name, ytd_sales from titles 
join publishers on titles.pub_id = publishers.pub_id and ytd_sales is not null
order by titles.title

-- k)
select authors.au_fname, count(titles.[type]) from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id 
group by authors.au_fname
having count(titles.[type]) > 1
order by authors.au_fname

-- m)
select title, titles.[type], advance from titles
join
(select [type], avg(advance) as average from titles
group by [type]
having avg(advance) is not null
) as temp on titles.type = temp.type and titles.advance >= temp.average * 1.5 

-- o) 
select distinct title, avg(price * ytd_sales) as faturacao, avg(royalty * 0.01 * price * ytd_sales) as auths_revenue, avg(price * ytd_sales) - avg(royalty * 0.01 * price * ytd_sales) as publisher_revenue from titles
join titleauthor on titles.title_id = titleauthor.title_id
where ytd_sales is not null
group by titles.title_id, title 
order by title

-- q) 
declare @title_count as int;
set @title_count = (select count(*) from titles)
select stores.stor_id, stor_name, count(*)  from stores
join sales on stores.stor_id = sales.stor_id 
group by stores.stor_id, stor_name
having count(*) = @title_count
--

