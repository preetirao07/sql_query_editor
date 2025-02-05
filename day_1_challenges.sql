-- challenge 01: create a list of all the DISTINCT DISTRICTS customers are from
select distinct district
from address

-- challenge 02: what is the latest rental date?
select rental_date
from rental
order by rental_date desc

-- challenge 03: how many films does the company have?
select film_id
from film
count (film_id)

-- challenge 04: how many distnict last names of the customers are there?
select
count (distinct last_name)
from customer