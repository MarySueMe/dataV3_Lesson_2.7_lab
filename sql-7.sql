-- Lab | SQL Join (Part I) 2023 August 10
-- In this lab, you will be using the Sakila database of movie rentals.
USE sakila;
commit;

-- Instructions
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.category_id, c.name, COUNT(fc.film_id) AS num_films
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id 
GROUP BY c.name;


-- Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_id, SUM(p.amount) AS total_amount
FROM sakila.payment p
JOIN sakila.staff s
ON p.staff_id = s.staff_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
GROUP BY s.staff_id;




-- Which actor has appeared in the most films?

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(fa.film_id) AS total_films
FROM sakila.actor a
JOIN sakila.film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, actor_name
ORDER BY total_films DESC
LIMIT 1;


-- Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, COUNT(r.rental_id) AS num_rentals
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY num_rentals DESC
LIMIT 1;


-- Display the first and last names, as well as the address, of each staff member.

SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS employee_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY employee_name
ORDER BY employee_name;




-- List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(fa.actor_id) as num_actors
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY f.title;



-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_amount
FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;



-- List the titles of films per category.

SELECT c.name AS category_name, GROUP_CONCAT(f.title ORDER BY f.title ASC)
FROM sakila.film f
JOIN sakila.film_category fc 
ON f.film_id = fc.film_id
JOIN sakila.category c
ON fc.category_id = c.category_id
GROUP BY category_name
ORDER BY category_name;


SELECT  f.title,c.name as category
FROM sakila.film_category fc
JOIN sakila.film f
ON fc.film_id=f.film_id
JOIN sakila.category c
ON  fc.category_id=c.category_id
ORDER BY category;

