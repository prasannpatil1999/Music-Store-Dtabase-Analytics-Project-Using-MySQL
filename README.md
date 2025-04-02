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
select category,count(*)
from menu_items
group by category
````
**Results:**
 Cuisine   | Items Sold | 
-----------|------------|
 American  | 6          | 
 Asian     | 8          | 
 Mexican   | 9          | 
 Italian   | 9          | 
  
-- TASK 7: Let's invite the artists who have written the most rock music in our dataset?
````sql
sselect category,count(*),avg(price)
from menu_items
group by category
````
**Results:**
  
 Cuisine   | Items Sold | Average Price (USD) |
-----------|------------|---------------------|
 American  | 6          | 10.07               |
 Asian     | 8          | 13.48               |
 Mexican   | 9          | 11.80               |
 Italian   | 9          | 16.75               |

-- TASK 8:Return all the track names that have a song length longer than the average song length?
````sql
select *
from order_details
````
**Results:**
- Selects entire order_details table in result
 
-- TASK 9: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent?
````sql
-- max date
select  max(order_date)
from order_details
-- OR this way
select  *
from order_details
order by order_date desc

-- min date
select  min(order_date)
from order_details
-- OR this way
select  *
from order_details
order by order_date
````
**Results:**
Max order date|
---------------------|
 2023-03-31      |
 
Min order date|
---------------------|
2023-01-01      |
  
-- TASK 10: We want to find out the most popular music Genre for each country?
````sql
select  count(distinct(order_id))
from order_details
````
**Results:**
orders were made within date range|
---------------------|
5370    |

-- TASK 11: Write a query that determines the customer that has spent the most on music for each country?
````sql
select  count(item_id)
from order_details
````
**Results:**
items  ordered within date range|
---------------------|
12097  |
  
-- TASK 12: Which order had the most no of items?
````sql
select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
order by no_of_items desc
````
**Results:**
Order ID   | No of items |
-----------|------------|
 4305  | 14          | 
  
-- TASK 13: How many Orders have more than 12 items?
````sql
select count(*)
from  (select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
having no_of_items > 12
order by no_of_items desc) as no_of_items_ordered_above_12
````
**Results:**
Count|
---------------------|
20  |
  
-- TASK 14: What is the average dish price  within each category?
````sql
select category,count(*),avg(price)
from menu_items
group by category
````
**Results:**
 Cuisine   | Items Sold | Average Price (USD) |
-----------|------------|---------------------|
 American  | 6          | 10.07               |
 Asian     | 8          | 13.48               |
 Mexican   | 9          | 11.80               |
 Italian   | 9          | 16.75               |


-- TASK15: Combine menu_items and oredr_details tables into one single table?
````sql
select *
 from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
````
**Results:**

- We got single table which is result of mix of menu_items and oredr_details tables 
  
-- TASK16: What were the least and most ordered items. What categories were  they in?
````sql
select item_name,category ,count(item_id) as count_of_items
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count_of_items desc
````
**Results:**

Item name   | Category | count of items |
-----------|------------|---------------------|
 Hamburger  | American          | 622               |
 Chicken Tacos   | Mexican       | 123            |
 
-- TASK17: What were the top 5 orders that spent most money?
````sql
select order_id,sum(price) as total_price
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_price desc
limit 5
````
**Results:**
 order_id | total_price (USD) |
----------|------------------|
 440      | 192.15           |
 2075     | 191.05           |
 1957     | 190.10           |
 330      | 189.70           |
 2675     | 185.10           |
  
-- TASK18: View the details of the highest spend order. What insights you can gather from?
````sql
-- Checking for insights
select category,count(order_id)
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category
````
**Results:**

- He has spent most of his money on Italian dishes
  
-- TASK19: View the details of the Top 5 hignest spend order. What insights you can gather from?
````sql
-- Checking for insights
select category,count(order_id)
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by category
````
**Results:**

- Top 5 hignest spendrs have spent most of their money on Italian dishes


### Recommendations
- Expand the Italian Menu: Since the highest-spending orders are dominated by Italian dishes, consider adding new Italian dishes or premium options.
- Promote High-Selling Items: The Hamburger (American) and Chicken Tacos (Mexican) are the most ordered items—promoting them with combo deals or upsell strategies can increase revenue.
- Analyze Low-Selling Items: Identify and improve or remove menu items with low sales to optimize the menu.
- Optimize Pricing Strategy: With Italian dishes having the highest average price, introducing mid-range Italian options may attract more customers.
- Enhance Order Size Growth: Since some orders contain over 12 items, encourage group or family meal deals to increase the average order size.
- Target High-Spending Customers: Create loyalty programs or discounts for repeat high-value customers, especially those ordering Italian cuisine frequently.

### Conclusion
The Restaurant Order Data Analysis provides valuable insights into customer preferences, sales trends, and menu performance. Italian dishes emerge as the most popular and highest-grossing category, indicating a strong demand. Optimizing the menu by expanding high-selling items, adjusting pricing strategies, and promoting group deals can enhance revenue. Implementing targeted marketing and loyalty programs for frequent high-spending customers can further boost profitability.

### Author
- Prasannagoud Patil

### Email
- Prasannpatil31@gmail.com
