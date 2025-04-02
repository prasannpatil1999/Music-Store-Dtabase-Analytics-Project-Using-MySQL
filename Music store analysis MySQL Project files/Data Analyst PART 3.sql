-- TASK 1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent?

-- Steps to Solve: First, find which artist has earned the most according to the InvoiceLines.
-- Now use this artist to find which customer spent the most on this artist. 
-- For this query, you will need to use the Invoice, InvoiceLine, Track, Customer, Album, and Artist tables.
-- Note, this one is tricky because the Total spent in the Invoice table might not be on a single product, 
-- so you need to use the InvoiceLine table to find out how many of each product was purchased,
-- and then multiply this by the price for each artist.


-- Initial Query
select *
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join album2 al on  t.album_id = al.album_id
join artist a on  al.artist_id = a.artist_id

-- Total amount_spent is 122.7599, we will write another wuery to get records of how we got this total
select  a.artist_id, a.name, SUM(il.unit_price*il.quantity) AS amount_spent
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join album2 al on  t.album_id = al.album_id
join artist a on  al.artist_id = a.artist_id
group by  a.artist_id,a.name
order by amount_spent desc
limit 1

-- create a CTE
WITH  best_selling_artist AS (
select  a.artist_id, a.name, SUM(il.unit_price*il.quantity) AS amount_spent
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join album2 al on  t.album_id = al.album_id
join artist a on  al.artist_id = a.artist_id
group by  a.artist_id,a.name
order by amount_spent desc
limit 1
)
SELECT c.customer_id, c.first_name, c.last_name, bsa.name, SUM(il.unit_price*il.quantity) AS amount_spent
FROM invoice i
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album2 alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, bsa.name
ORDER BY amount_spent DESC;


-- Question: Find how much amount spent by each customer on artists?

SELECT c.customer_id, c.first_name, c.last_name, a.name, SUM(il.unit_price*il.quantity) AS amount_spent
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join album2 al on  t.album_id = al.album_id
join artist a on  al.artist_id = a.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.name
ORDER BY amount_spent DESC;

-- TASK 2: We want to find out the most popular music Genre for each country. 
-- We determine the most popular genre as the genre with the highest amount of purchases.
--  Write a query that returns each country along with the top Genre.
--  For countries where the maximum number of purchases is shared return all Genres?

-- Steps to Solve:  There are two parts in question- first most popular music genre and second need data at country level. 
-- Initial Query
select *
from invoice i join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join genre g on  t.genre_id = g.genre_id

-- Initial Query
WITH popular_genre AS 
(
select billing_country, g.name, g.genre_id, count(quantity) no_of_purchases,
ROW_NUMBER() OVER(PARTITION BY i.billing_country ORDER BY COUNT(il.quantity) DESC) AS RowNo 
from invoice i join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join genre g on  t.genre_id = g.genre_id
group by billing_country, g.name, g.genre_id
order by i.billing_country asc, no_of_purchases desc
)
SELECT * FROM popular_genre WHERE RowNo <= 1


-- TASK 3: Write a query that determines the customer that has spent the most on music for each country.
--  Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount

-- Steps to Solve:  Similar to the above question. There are two parts in question-
--  first find the most spent on music for each country and second filter the data for respective customers

-- 1st way
WITH customer_spending AS (
    SELECT c.country,c.customer_id,c.first_name,c.last_name,SUM(il.unit_price * il.quantity) AS total_spent
    FROM customer c JOIN invoice i ON c.customer_id = i.customer_id
	JOIN invoice_line il ON i.invoice_id = il.invoice_id
    GROUP BY c.country, c.customer_id,c.first_name,c.last_name
),
ranked_customers AS (
	SELECT country,customer_id,first_name,last_name,total_spent,
	RANK() OVER (PARTITION BY country ORDER BY total_spent DESC) AS spending_rank
    FROM customer_spending
)
SELECT country,CONCAT(first_name, ' ', last_name) AS top_customer,total_spent
FROM ranked_customers
WHERE spending_rank = 1
ORDER BY country;

-- 2nd way
WITH customer_spending AS (
    SELECT c.country,c.customer_id,c.first_name,c.last_name,SUM(il.unit_price * il.quantity) AS total_spent,
    RANK() OVER (PARTITION BY country ORDER BY SUM(il.unit_price * il.quantity) DESC) AS spending_rank
    FROM customer c JOIN invoice i ON c.customer_id = i.customer_id
	JOIN invoice_line il ON i.invoice_id = il.invoice_id
    GROUP BY c.country, c.customer_id,c.first_name,c.last_name
)
SELECT *
FROM customer_spending
WHERE spending_rank = 1
ORDER BY country;


