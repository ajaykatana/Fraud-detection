select * from blogs;

select * from users;

select * from category;

-- joins


-- Left join

select * from users u
left join blogs b
on u.id=b.user_id;

-- Get the blog ingo along with user info
-- We need only blog id, title, username, user_id - Need all blogs irrespective of users
select b.id,b.title, u.name, u.id
from blogs b
left join
users u
on b.user_id = u.id;

-- Cross join
select * from users, blogs;

select b.id,b.title, u.name, u.id
from blogs b
cross join
users u;

select * from users, blogs, category;


select * from users, blogs, category
where category.id=4;

select * from users, blogs, category
where category.id=4 and blogs.id=6 and users.id=2;

-- This way you can join tables but it is very inefficient

-- Get the blog info, user info and category info
-- We need blog id, title, user name, category name
select b.id, b.title,b.category_id, u.name , c.category_name
from blogs b
left join users u
on b.user_id = u.id
left join
category c
on b.category_id=c.id;

-- Aggregations with joins

-- Number of blogs written by each user
Select user_id, count(*) from blogs
Group by user_id;

-- Need to have all users irrespective of whether he/she wrote blogs

-- Getting user info and blog info with all users
select * from users u 
left join
blogs b
on u.id = b.user_id;

-- Counting blogs for each user

select u.id,u.name, count(b.id)
from users u 
left join
blogs b
on u.id = b.user_id
group by u.id, u.name;

-- Get me all the users(user id, user name) with 0 blogs

select *
from users u
left join blogs b
on u.id = b.user_id;


-- Method 1: b.id is null
-- Method 2: count(b.id) = 0

-- Method 1
select u.id, u.name
from users u
left join blogs b
on u.id = b.user_id
where b.id is null;

-- Method 2
select u.id,u.name
from users u 
left join
blogs b
on u.id = b.user_id
group by u.id, u.name
having count(b.id)=0;


select * from persons;


-- Gender wise population
select gender, count(*)
from persons
group by gender;

-- Gender wise population of people of age between 25 and 29
select gender, count(*) as count, '25 - 29' as Age_range
from persons
where age between 25 and 29
group by gender;

-- Gender wise population of people of age between 20 and 24'
select gender, count(*) as count, '20 - 24' as Age_range
from persons
where age between 20 and 24
group by gender;

-- Gender wise population of people with different age ranges
select gender, count(*) as count, '20 - 24' as Age_range
from persons
where age between 20 and 24
group by gender
union
select gender, count(*) as count, '25 - 29' as Age_range
from persons
where age between 25 and 29
group by gender;

-- Get me all the countries in the data
select distinct country from persons;

-- Make separate column named continent and get continent wise population
select * from persons;

select count(*), "Asia" as continent
from persons
where country in ("India","Sri Lanka");

select count(*), "Europe" as continent
from persons
where country in ("Ireland","Spain",'Italy');

select count(*), "North America" as continent
from persons
where country in ("USA");

select count(*), "South America" as continent
from persons
where country in ("Chile","Brazil");

select count(*), "Australia" as continent
from persons
where country in ("Australia");

select count(*), "Asia" as continent
from persons
where country in ("India","Sri Lanka")
union
select count(*), "Europe" as continent
from persons
where country in ("Ireland","Spain",'Italy')
union 
select count(*), "North America" as continent
from persons
where country in ("USA")
union
select count(*), "South America" as continent
from persons
where country in ("Chile","Brazil")
union
select count(*), "Australia" as continent
from persons
where country in ("Australia");



select * from persons;

-- Get all the persons with id as even number

select * from persons
where id%2=0;

-- Get all the persons with id as multiple of 3

select * from persons
where id%3=0;

-- Get all the persons with id as multiple of 2 or 3
select * from persons
where id%2=0
union
select * from persons
where id%3=0;


-- union - removes the duplicates
-- union all - allows duplicates

-- I want that record two times if id is both multiple of 2 and 3
select * from persons
where id%2=0
union all
select * from persons
where id%3=0
order by id;