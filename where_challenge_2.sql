/* 
Challenge 2: Create a list of all customers where the first name contains ER
and has an 'A' as the second letter. 
Order the results by the last name descendingly.
*/

select *
from customer
where first_name like '%ER%' or first_name like '_A%'
order by last_name desc
