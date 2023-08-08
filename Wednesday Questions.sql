--List all customers who live in Texas (use JOINs) 

select* from customer 

-- Get all payments above $6.99 with the Customer's Full Name 
SELECT customer.first_name,customer.last_name, payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

--Show all customers names who have made payments over $175(use subqueries) 

select customer.first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment
	where amount >175
	);
	
 --List all customers that live in Nepal (use the city table) 
SELECT customer_brandon. first_name, last_name
FROM customer_brandon
JOIN city ON customer_brandon.city = city.city
WHERE city.city= 'Nepal';

-- Which staff member had the most transactions? 

SELECT staff.staff_id, staff.first_name, COUNT(transactions_s.tx_id) AS transactions
FROM staff
LEFT JOIN transactions_s ON staff.staff_id = transactions_s.staff_id
GROUP BY staff.staff_id, staff.first_name
ORDER BY transactions DESC
LIMIT 1;

-- How many movies of each rating are there? 

SELECT rating, COUNT(rating) FROM film GROUP BY rating;

--Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer.customer_id, customer.first_name
FROM customer
WHERE 1 = (
    SELECT COUNT(*)
    FROM payment
    WHERE payment.customer_id = customer.customer_id
    AND payment.amount > 6.99
);

-- How many free rentals did our stores give away?

select film.title, rental_rate
from film 
where rental_rate = 0


