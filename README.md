# Music Store Dtabase Analytics Project


## Tables of Contents: 
- [Project Overview](#project-overview)  
- [Tools Used](#tools-used)  
- [Data Sources](#data-sources)  
- [Data Cleaning/Preparation](#data-cleaningpreparation)  
- [Key Business Questions Answered](#key-business-questions-answered)  
- [Project Files](#project-files)  
- [How to Use](#how-to-use)  
- [Insights & Findings](#insights--findings)  
- [Recommendations](#recommendations)  
- [Conclusion](#conclusion)
  
### Project Overview
The Music Store Database Analytics Project aims to analyze sales, customer preferences, and product performance to gain insights into trends in the music industry. By examining factors such as top-selling genres, customer demographics, and revenue distribution across different formats, the project helps optimize inventory management and marketing strategies for better business decisions.

### Tools Used
- MySQL

### Data Sources
The Music_Store_database.sql file contains structured data related to a music store, including tables for customers, sales transactions, music genres, albums, artists, and payment details. This dataset helps analyze sales trends, customer purchasing behavior, and revenue distribution across different music categories and formats.

### Data Cleaning/Preparation
- In the initial data preparation phase, we performed the following tasks:

1. Imported data into the MySQL database and conducted an inspection.
2. No duplicates, null and blank values are found
3. Checked for spelling errors, typos, and inconsistencies. None were found.

### Key Business Questions Answered
- TASK 1: Who is the senior most employee based on job title?
- TASK 2: Which countries have the most invoices?
- TASK 3: What are Top 3 values of total invoices?
- TASK 4: Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money?
- TASK 5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 

- TASK 6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
- TASK 7:: Let's invite the artists who have written the most rock music in our dataset. 
- TASK 8:Return all the track names that have a song length longer than the average song length. 

- TASK 9: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent?
- TASK 10: We want to find out the most popular music Genre for each country. 
- TASK 11: Write a query that determines the customer that has spent the most on music for each country.



### Project Files
- 📊 "Music_Store_database.sql" (Database File) - Contains all data.
- 📝 Problem Statement (Word File) - Outlines the business questions and objectives.

 ### How to Use
1. Review the Problem Statement Word file  to understand the key objectives.
2. Use the Readme file to get answers

### Insights & Findings

-- TASK 1: Who is the senior most employee based on job title?
````sql
select *
from employee
order by levels desc
limit 1;
````
**Results:**

senior most employee|
---------------------|
 Adams Andrew     |

  
-- TASK 2: Which countries have the most invoices?

````sql
select billing_country,count(invoice_id) as no_of_invoices
from invoice
group by billing_country
order by no_of_invoices desc;
````
**Results:**
| Billing Country      | Number of Invoices |
|----------------------|-------------------|
| USA                 | 131               |
| Canada              | 76                |
| Brazil              | 61                |
| France              | 50                |
| Germany             | 41                |
| Czech Republic      | 30                |
| Portugal            | 29                |
| United Kingdom      | 28                |
| India               | 21                |
| Ireland             | 13                |
| Chile               | 13                |
| Finland             | 11                |
| Spain               | 11                |
| Poland              | 10                |
| Denmark             | 10                |
| Australia           | 10                |
| Hungary             | 10                |
| Sweden              | 10                |
| Netherlands         | 10                |
| Norway              | 9                 |
| Italy               | 9                 |
| Austria             | 9                 |
| Belgium             | 7                 |
| Argentina           | 5                 |

  
-- TASK 3: What are Top 3 values of total invoices?
````sql
select *
from invoice
order by total desc
limit 3;
````
**Results:**
| Invoice ID | Total Invoice |
|------------|--------------|
| 183        | 23.76        |
| 92         | 19.80        |
| 526        | 19.80        |
 
-- TASK 4: Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money?
````sql
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

````
**Results:**
| Best city | No of Invoices |
|------------|--------------|
|Prague       | 30       |

| Billing City            | Total Made  |
|-------------------------|------------|
| Prague                 | 273.24     |
| Mountain View         | 169.29     |
| London                | 166.32     |
| Berlin                | 158.40     |
| Paris                 | 151.47     |
| São Paulo            | 129.69     |
| Dublin                | 114.84     |
| Delhi                 | 111.87     |
| São José dos Campos  | 108.90     |
| Brasília              | 106.92     |
| Lisbon                | 102.96     |
| Bordeaux              | 99.99      |
| Montréal              | 99.99      |
| Madrid                | 98.01      |
| Redmond               | 98.01      |
| Santiago              | 97.02      |
| Frankfurt             | 94.05      |
| Orlando               | 92.07      |
| Reno                  | 91.08      |
| Ottawa                | 91.08      |
| Fort Worth            | 86.13      |
| Tucson                | 84.15      |
| Porto                 | 82.17      |
| Stuttgart             | 82.17      |
| Rio de Janeiro        | 82.17      |
| Sydney                | 81.18      |
| New York              | 79.20      |
| Helsinki              | 79.20      |
| Edinburgh             | 79.20      |
| Budapest              | 78.21      |
| Madison               | 76.23      |
| Warsaw                | 76.23      |
| Yellowknife           | 75.24      |
| Stockholm             | 75.24      |
| Dijon                 | 73.26      |
| Oslo                  | 72.27      |
| Salt Lake City        | 72.27      |
| Chicago               | 71.28      |
| Bangalore             | 71.28      |
| Winnipeg              | 70.29      |
| Vienne                | 69.30      |
| Vancouver             | 66.33      |
| Boston                | 66.33      |
| Amsterdam             | 65.34      |
| Lyon                  | 64.35      |
| Halifax               | 62.37      |
| Brussels              | 60.39      |
| Cupertino             | 54.45      |
| Rome                  | 50.49      |
| Toronto               | 40.59      |
| Buenos Aires          | 39.60      |
| Copenhagen            | 37.62      |
| Edmonton              | 29.70      |
 
-- TASK 5: Who is the best customer? The customer who has spent the most money will be declared the best customer? 
````sql
-- Write a query that returns the person who has spent the most money.?
select c.customer_id,sum(total) as sum_of_money
from customer c 
join invoice i
on c.customer_id = i.customer_id
group by c.customer_id
order by sum_of_money desc
limit 1;
````
**Results:**
| Customer ID | Money Spent |
|------------|------------|
| 5          | 144.54     |
  
-- TASK 6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners?
````sql
select DISTINCT first_name, last_name, email,g.name
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join genre g on  t.genre_id = g.genre_id
where g.name LIKE "Rock%"
order by email 
````
**Results:**
| First Name | Last Name  | Email                          | Genre |
|------------|-----------|--------------------------------|-------|
| Aaron      | Mitchell  | aaronmitchell@yahoo.ca        | Rock  |
| Alexandre  | Rocha     | alero@uol.com.br              | Rock  |
| Astrid     | Gruber    | astrid.gruber@apple.at        | Rock  |
| Bjørn      | Hansen    | bjorn.hansen@yahoo.no         | Rock  |
| Camille    | Bernard   | camille.bernard@yahoo.fr      | Rock  |
| Daan       | Peeters   | daan_peeters@apple.be        | Rock  |
| Diego      | Gutiérrez | diego.gutierrez@yahoo.ar      | Rock  |
| Dan        | Miller    | dmiller@comcast.com           | Rock  |
| Dominique  | Lefebvre  | dominiquelefebvre@gmail.com   | Rock  |
| Edward     | Francis   | edfrancis@yachoo.ca          | Rock  |
| Eduardo    | Martins   | eduardo@woodstock.com.br      | Rock  |
| Ellie      | Sullivan  | ellie.sullivan@shaw.ca        | Rock  |
| Emma       | Jones     | emma_jones@hotmail.com        | Rock  |
| Enrique    | Muñoz     | enrique_munoz@yahoo.es        | Rock  |
| Fernanda   | Ramos     | fernadaramos4@uol.com.br      | Rock  |
| Frank      | Harris    | fharris@google.com           | Rock  |
| Frank      | Ralston   | fralston@gmail.com           | Rock  |
| František  | Wichterlová | frantisekw@jetbrains.com    | Rock  |
| François   | Tremblay  | ftremblay@gmail.com          | Rock  |
| Fynn       | Zimmermann| fzimmermann@yahoo.de         | Rock  |
| Hannah     | Schneider | hannah.schneider@yahoo.de    | Rock  |
| Helena     | Holý      | hholy@gmail.com              | Rock  |
| Heather    | Leacock   | hleacock@gmail.com           | Rock  |
| Hugh       | O'Reilly  | hughoreilly@apple.ie         | Rock  |
| Isabelle   | Mercier   | isabelle_mercier@apple.fr    | Rock  |
| Jack       | Smith     | jacksmith@microsoft.com      | Rock  |
| Jennifer   | Peterson  | jenniferp@rogers.ca          | Rock  |
| João       | Fernandes | jfernandes@yahoo.pt         | Rock  |
| Joakim     | Johansson | joakim.johansson@yahoo.se    | Rock  |
| Johannes   | Van der Berg | johavanderberg@yahoo.nl  | Rock  |
| John       | Gordon    | johngordon22@yahoo.com       | Rock  |
| Julia      | Barnett   | jubarnett@gmail.com         | Rock  |
| Kathy      | Chase     | kachase@hotmail.com         | Rock  |
| Kara       | Nielsen   | kara.nielsen@jubii.dk       | Rock  |
| Ladislav   | Kovács    | ladislav_kovacs@apple.hu    | Rock  |
| Leonie     | Köhler    | leonekohler@surfeu.de       | Rock  |
| Lucas      | Mancini   | lucas.mancini@yahoo.it      | Rock  |
| Luís       | Gonçalves | luisg@embraer.com.br        | Rock  |
| Luis       | Rojas     | luisrojas@yahoo.cl          | Rock  |
| Manoj      | Pareek    | manoj.pareek@rediff.com     | Rock  |
| Marc       | Dubois    | marc.dubois@hotmail.com     | Rock  |
| Mark       | Taylor    | mark.taylor@yahoo.au       | Rock  |
| Martha     | Silk      | marthasilk@gmail.com       | Rock  |
| Madalena   | Sampaio   | masampaio@sapo.pt         | Rock  |
| Mark       | Philips   | mphilips12@shaw.ca        | Rock  |
| Niklas     | Schröder  | nschroder@surfeu.de       | Rock  |
| Patrick    | Gray      | patrick.gray@aol.com      | Rock  |
| Phil       | Hughes    | phil.hughes@gmail.com     | Rock  |
| Richard    | Cunningham| ricunningham@hotmail.com  | Rock  |
| Rishabh    | Mishra    | rishabh_mishra@yahoo.in   | Rock  |
| Robert     | Brown     | robbrown@shaw.ca         | Rock  |
| Roberto    | Almeida   | roberto.almeida@riotur.gov.br | Rock  |
| Stanisław  | Wójcik    | stanisław.wójcik@wp.pl   | Rock  |
| Steve      | Murray    | steve.murray@yahoo.uk    | Rock  |
| Terhi      | Hämäläinen | terhi.hamalainen@apple.fi | Rock  |
| Tim        | Goyer     | tgoyer@apple.com        | Rock  |
| Victor     | Stevens   | vstevens@yahoo.com      | Rock  |
| Wyatt      | Girard    | wyatt.girard@yahoo.fr   | Rock  |
  
-- TASK 7: Let's invite the artists who have written the most rock music in our dataset?
````sql
-- Top 10 Rock Band
select a.name,count(a.artist_id) as no_of_rocks_written
from artist a join album2 alb on  a.artist_id = alb.artist_id
join track t on  alb.album_id = t.album_id
join genre g on  t.genre_id = g.genre_id
where g.name LIKE "Rock%"
group by a.name
order by no_of_rocks_written desc
limit 10
````
**Results:**
| Artist Name                        | Number of Rock Songs |
|-------------------------------------|----------------------|
| AC/DC                               | 18                   |
| Aerosmith                           | 15                   |
| Audioslave                          | 14                   |
| Led Zeppelin                        | 14                   |
| Alanis Morissette                   | 13                   |
| Alice In Chains                     | 12                   |
| BackBeat                             | 12                   |
| Frank Zappa & Captain Beefheart     | 9                    |
| Accept                              | 4                    |

-- TASK 8:Return all the track names that have a song length longer than the average song length?
````sql
--  Return the Name and Milliseconds for each track?
-- Order by the song length with the longest songs listed first?

select name,milliseconds
from track
where milliseconds > (select avg(milliseconds) as average_song_length from track)
order by milliseconds desc
````
**Results:**
- We got 143 track names that have a song length longer than the average song length
- Here glimpse of top 10

 | Song Name                                       | Duration (Milliseconds) |
|------------------------------------------------|------------------------|
| How Many More Times                            | 711836                 |
| Advance Romance                                | 677694                 |
| Sleeping Village                               | 644571                 |
| You Shook Me(2)                                | 619467                 |
| Talkin' 'Bout Women Obviously                  | 589531                 |
| Stratus                                        | 582086                 |
| No More Tears                                  | 555075                 |
| The Alchemist                                  | 509413                 |
| Wheels Of Confusion / The Straightener        | 494524                 |
| Book Of Thel                                   | 494393                 |

-- TASK 9: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent?
````sql
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
select  a.artist_id, a.name, SUM(il.unit_price*il.quantity) AS amount_spent
from customer c join invoice i on  c.customer_id = i.customer_id
join invoice_line il on  i.invoice_id = il.invoice_id
join track t on  il.track_id = t.track_id
join album2 al on  t.album_id = al.album_id
join artist a on  al.artist_id = a.artist_id
group by  a.artist_id,a.name
order by amount_spent desc
limit 1
````
**Results:**
- gets us 41 records
- Top 10 of those records

  Customer ID | First Name  | Last Name  | Artist Name | Amount Spent |
|-------------|------------|------------|-------------|--------------|
| 54          | Steve      | Murray     | AC/DC       | 17.82        |
| 53          | Phil       | Hughes     | AC/DC       | 10.89        |
| 21          | Kathy      | Chase      | AC/DC       | 10.89        |
| 49          | Stanisław  | Wójcik     | AC/DC       | 9.90         |
| 1           | Luís       | Gonçalves  | AC/DC       | 7.92         |
| 24          | Frank      | Ralston    | AC/DC       | 7.92         |
| 31          | Martha     | Silk       | AC/DC       | 3.96         |
| 16          | Frank      | Harris     | AC/DC       | 2.97         |
| 42          | Wyatt      | Girard     | AC/DC       | 2.97         |
| 6           | Helena     | Holý       | AC/DC       | 2.97         |
  
-- TASK 10: We want to find out the most popular music Genre for each country?
````sql
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

````
**Results:**
| Billing Country     | Genre  | Genre ID | No. of Purchases | Row Rank |
|---------------------|--------|----------|------------------|----------|
| Argentina          | Rock   | 1        | 1                | 1        |
| Australia         | Rock   | 1        | 18               | 1        |
| Austria           | Rock   | 1        | 6                | 1        |
| Belgium           | Rock   | 1        | 5                | 1        |
| Brazil           | Rock   | 1        | 26               | 1        |
| Canada           | Rock   | 1        | 57               | 1        |
| Chile            | Rock   | 1        | 7                | 1        |
| Czech Republic   | Rock   | 1        | 14               | 1        |
| Denmark         | Rock   | 1        | 6                | 1        |
| Finland         | Rock   | 1        | 6                | 1        |
| France          | Rock   | 1        | 26               | 1        |
| Germany         | Rock   | 1        | 28               | 1        |
| Hungary         | Rock   | 1        | 4                | 1        |
| India           | Rock   | 1        | 13               | 1        |
| Ireland         | Rock   | 1        | 2                | 1        |
| Italy          | Rock   | 1        | 3                | 1        |
| Netherlands     | Rock   | 1        | 6                | 1        |
| Norway         | Metal  | 3        | 2                | 1        |
| Poland         | Rock   | 1        | 14               | 1        |
| Portugal       | Rock   | 1        | 23               | 1        |
| Spain         | Metal  | 3        | 4                | 1        |
| Sweden        | Rock   | 1        | 5                | 1        |
| United Kingdom | Rock   | 1        | 47               | 1        |
| USA           | Rock   | 1        | 70               | 1        |

-- TASK 11: Write a query that determines the customer that has spent the most on music for each country?
````sql
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
````
**Results:**
| Country          | Customer ID | First Name  | Last Name       | Total Spent            | Spending Rank |
|-----------------|-------------|------------|----------------|------------------------|---------------|
| Argentina       | 56          | Diego      | Gutiérrez      | 39.60                  | 1             |
| Australia      | 55          | Mark       | Taylor         | 81.18                  | 1             |
| Austria        | 7           | Astrid     | Gruber         | 69.30                  | 1             |
| Belgium        | 8           | Daan       | Peeters        | 60.39                  | 1             |
| Brazil        | 1           | Luís       | Gonçalves      | 108.90                 | 1             |
| Canada        | 3           | François   | Tremblay       | 99.99                  | 1             |
| Chile         | 57          | Luis       | Rojas          | 97.02                  | 1             |
| Czech Republic | 5           | František  | Wichterlová    | 144.54                 | 1             |
| Denmark       | 9           | Kara       | Nielsen        | 37.62                  | 1             |
| Finland       | 44          | Terhi      | Hämäläinen     | 79.20                  | 1             |
| France        | 42          | Wyatt      | Girard         | 99.99                  | 1             |
| Germany       | 37          | Fynn       | Zimmermann     | 94.05                  | 1             |
| Hungary       | 45          | Ladislav   | Kovács         | 78.21                  | 1             |
| India         | 58          | Manoj      | Pareek         | 111.87                 | 1             |
| Ireland       | 46          | Hugh       | O'Reilly       | 114.84                 | 1             |
| Italy         | 47          | Lucas      | Mancini        | 50.49                  | 1             |
| Netherlands   | 48          | Johannes   | Van der Berg   | 65.34                  | 1             |
| Norway        | 4           | Bjørn      | Hansen         | 72.27                  | 1             |
| Poland        | 49          | Stanisław  | Wójcik         | 76.23                  | 1             |
| Portugal      | 34          | João       | Fernandes      | 102.96                 | 1             |
| Spain         | 50          | Enrique    | Muñoz         | 98.01                  | 1             |
| Sweden        | 51          | Joakim     | Johansson      | 75.24                  | 1             |
| United Kingdom | 53          | Phil       | Hughes        | 98.01                  | 1             |
| USA           | 17          | Jack       | Smith         | 98.01                  | 1             |
  


### Recommendations
- Senior Leadership: Retain and leverage Adams Andrew’s experience as the most senior employee.

- Invoice Strategy: Focus on USA, Canada, and Brazil, as they generate the most invoices.

-  High-Value Invoices: Target customers with a history of high invoice totals to increase revenue.

- Best Customer Location: Organize promotions and events in Prague, the highest revenue-generating city.

- Top-Spending Customer: Engage Customer ID 5 with loyalty programs to encourage repeat business.

- Rock Music Listeners: Target personalized promotions for identified Rock music listeners.

- Artist Invitations: Prioritize AC/DC, Aerosmith, and Audioslave for rock music events.

- Long Songs Promotion: Highlight longer-than-average songs in curated playlists or premium features.

- Customer Spending on Artists: Focus on AC/DC, as they generate the highest revenue.

- Popular Genre per Country: Tailor music recommendations by country, especially Rock in key regions.

### Conclusion
The analysis highlights key areas for business growth, including customer engagement, strategic marketing, and revenue optimization. Targeting high-value customers, leveraging location-based insights, and personalizing music recommendations can enhance sales. Additionally, promoting popular artists and genres per region will drive better customer satisfaction and retention. Implementing these strategies will help maximize revenue and strengthen market position.

### Author
- Prasannagoud Patil

### Email
- Prasannpatil31@gmail.com
