-- TASK 1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A?

-- Initial tables joined for refrence
select *
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join genre g on  t.genre_id = g.genre_id

select DISTINCT first_name, last_name, email,g.name
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join genre g on  t.genre_id = g.genre_id
where g.name LIKE "Rock%"
order by email 

-- TASK 2:: Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands?

-- Initial query
select *
from artist a join album2 alb on  a.artist_id = alb.artist_id
join track t on  alb.album_id = t.album_id
join genre g on  t.genre_id = g.genre_id
where g.name LIKE "Rock%"

-- Final query
select a.name,count(a.artist_id) as no_of_rocks_written
from artist a join album2 alb on  a.artist_id = alb.artist_id
join track t on  alb.album_id = t.album_id
join genre g on  t.genre_id = g.genre_id
where g.name LIKE "Rock%"
group by a.name
order by no_of_rocks_written desc

-- Top 10 Rock Band
select a.name,count(a.artist_id) as no_of_rocks_written
from artist a join album2 alb on  a.artist_id = alb.artist_id
join track t on  alb.album_id = t.album_id
join genre g on  t.genre_id = g.genre_id
where g.name LIKE "Rock%"
group by a.name
order by no_of_rocks_written desc
limit 10


-- TASK 3:Return all the track names that have a song length longer than the average song length. 
--  Return the Name and Milliseconds for each track?
-- Order by the song length with the longest songs listed first?

select name,milliseconds
from track
where milliseconds > (select avg(milliseconds) as average_song_length from track)
order by milliseconds desc
