-- TASK 1: Who is the senior most employee based on job title?
select *
from employee
order by levels desc
limit 1;

-- TASK 2: Which countries have the most invoices?
select billing_country,count(invoice_id) as no_of_invoices
from invoice
group by billing_country
order by no_of_invoices desc;

-- TASK 3: What are Top 3 values of total invoices?
select *
from invoice
order by total desc
limit 3;

-- TASK 4: Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals?

-- "Prague" city has highest no of customers so it's the best city to organize future festival
select billing_city,count(*) as no_of_invoices
from invoice
group by billing_city
order by no_of_invoices desc

-- "Prague" city is were organizers have made most money, so it's the best city to organize future festival
select billing_city,sum(total) as total
from invoice
group by billing_city
order by total desc

-- TASK 5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.?
select c.customer_id,sum(total) as sum_of_money
from customer c 
join invoice i
on c.customer_id = i.customer_id
group by c.customer_id
order by sum_of_money desc
limit 1;

