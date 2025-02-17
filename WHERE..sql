-- WHERE
-- WHERE is used to filter our data
-- always after FROM

SELECT
*
FROM payment
WHERE amount = 10.99

--

SELECT
*
FROM customer
WHERE first_name = 'ADAM'

--
SELECT
amount
FROM payment
WHERE amount = 0

-- count all the values of 0 amount
SELECT
count(*)
FROM payment
WHERE amount = 0

-- How many payment were made by the customer with customer_id = 100?
select
count(*)
from payment
where customer_id = 100


-- What is the last name of our customer with first name 'ERICA'?
select first_name, last_name
from customer
where first_name = 'ERICA'

--find amount > 10
select *
from payment
where amount > 10
order by amount desc

-- <> and != both means not equal to

-- nul and not null use case
select *
from customer
where first_name is not null

--
select *
from customer
where first_name is null

-- the sales manger asks you to how for a list of all the payment_ids with an amount less than or equal to $2. include payment_id and amount
select payment_id, amount
from payment
where amount <= 2

-- the inventory manager asks you how rentals have not been returned yet 
-- return_date is null
select count(*) from rental
where return_date is null

-- AND/OR = used to connect two or more conditions
select
*
from payment
where amount = 10.99
or amount = 9.99

--
select
*
from payment
where amount = 10.99 or 9.99

-- can be both in different rows
select
*
from payment
where customer_id = 30 or staff_id = 2

--both condition in one situtation
select
*
from payment
where customer_id = 30 AND staff_id = 2

--challenge: the support manager asks you about a list of all the payment of the customer 322, 346 and 354 where the amount is either less than $2 or greater than $30
select *
from payment
where (customer_id = 322 or customer_id = 346 or customer_id = 354)
and 
(amount < 2 or amount >10)

-- challnege: it should be ordered by the customer first (asc) and then as second condition order by amount in a desc order
select *
from payment
where (customer_id = 322 or customer_id = 346 or customer_id = 354)
and 
(amount < 2 or amount >10)
order by customer_id asc, amount desc

-- between & and
select payment_id, payment_date
from payment
where amount between 1.99 and 6.99

--
-- between & and
select payment_id, payment_date
from payment
where amount not between 1.99 and 6.99

-- TO ALTER DATABASE
alter database greencycles set timezone to 'Europe/Berlin';

--
-- between & and
select * from rental
where rental_date between '2005-05-24' and '2005-05-26'
order by rental_date desc

--challenge: there have been some faulty payments and you need to help to dound out how many payments ahve been affected.
--how many paymemts have been made on january 26th and 27th 2020 with an amount between 1.99 and 3.99?
select count (*) from payment
where payment_date between '2020-01-26' and '2020-01-27 23:59'
and
amount between 1.99 and 3.99

--IN: if we have long list of values and we want to filter them
select * from customer
where customer_id in (123, 212, 323, 243, 353, 432)

--
select * from customer
where first_name in ('LYDIA', 'MATTHEW')

--challenge: there have beem 6 complaints of customer about their payments with customer_id: 12, 25, 67, 93, 124, 234
select * from payment
where customer_id in (12, 25, 67, 93, 124, 234)

-- the concerend payments are all the payments of these customers with amounts 4.99, 7.99 and 9.99 in january 2020
and amount = 4.99 or amount = 7.99 or amount = 9.99

-- or 
select * from payment
where customer_id in (12, 25, 67, 93, 124, 234)

-- the concerend payments are all the payments of these customers with amounts 4.99, 7.99 and 9.99 in january 2020
and amount in (4.99, 7.99, 9.99)
and payment_date between '2020-01-01' and '2020-01-31'

--LIKE
-- LIKE: used to filter by matching against a pattern
-- use wildcards: _ for any single character
-- use wildcards: % for any consequences of chacaters

select * from actor
-- here like is used to match and % shows any sequence of characters afterwards
where first_name like 'A%'
-- LIKE: it is case sensitive
-- ILIKE: it is case InSensitive

select * from actor
-- _A% is for A is at 2nd position
where first_name like '_A%'

--
select * from actor
-- __A% is for A is at 3rd position
where first_name like '__A%'

--
select * from actor
-- %A% is for A can be anywhere & not like is for not anywhere
where first_name not like '%A%'

--
-- Find Drama anywhere in the description
select * from film
where description like '%Drama%'

--T in starting
select * from film
where description like '%Drama%'
and title like 'T%'

-- You need to help the inventory manager to find out: How many movies are there that contain the 'Documentary' in the description?
select count(*) from film
where description like '%Documentary%'

-- How many customers are there with a first name that is 3 letters long and either 'X' or a 'Y' as the last letter in the last name?
select count(*) from customer
where first_name like '___'
and (last_name like '%X'
or last_name like '%Y')

-- single line comment

/*    
multiple line comment 
*/ 

/*
an alias is a temporary name assigned to a table or column within a query, 
enhancing readability and simplifying complex queries. 
Aliases are particularly useful when dealing with lengthy or complex table and column names, 
or when performing operations like self-joins. 

Column Aliases:
Assigning an alias to a column can make the output more understandable. 
This is achieved using the AS keyword, though its use is optional.
*/

select title, description as description_of_movie, release_year
from film
where description like '%Documentary%'


-- alias for count: to under the count output
select 
count(*) as number_of_movie
from film
where description like '%Documentary%'
