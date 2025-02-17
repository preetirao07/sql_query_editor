/* 
Challenge 1: How many movies are there that contain 'Saga' in the description
and where the title starts either with 'A' or ends with 'R'?
use the alias 'no_of_movies'
*/

select count (*) as no_of_movies
from film
where title like 'A%' or title like '%R'
and
description like '%Saga%'