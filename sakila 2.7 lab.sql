USE sakila;
----- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT C.category_id AS 'category id', COUNT(DISTINCT F.film_id) AS 'film count'
FROM sakila.film_category F
JOIN sakila.category C
ON F.category_id=C.category_id
GROUP BY C.category_i; 

----- Display the total amount rung up by each staff member in August of 2005.
SELECT SUM(P.amount) AS 'sum of payment', P.payment_date, S.staff_id
FROM sakila.staff S
JOIN sakila.payment P
ON S.staff_id=P.staff_id
WHERE month(P.payment_date)=08 AND year(P.payment_date)=2005
GROUP BY S.staff_id;

----- Which actor has appeared in the most films?
SELECT max(F.actor_id), A.actor_id, A.first_name         
FROM sakila.film_actor F 
JOIN sakila.actor A
ON  F.actor_id=A.actor_id
ORDER BY A.first_name desc;

----- Most active customer
SELECT max(R.customer_id), C.customer_id, C.first_name         
FROM sakila.rental R 
JOIN sakila.customer C
ON  R.customer_id=C.customer_id
ORDER BY C.first_name desc;

----- Display the first and last names, as well as the address, of each staff member.
SELECT S.first_name, S.last_name, A.address
FROM staff S
JOIN address A
ON S.address_id=A.address_id;

----- List each film and the number of actors who are listed for that film.
SELECT F.title, count(A.actor_id) AS actor_id
FROM film F
JOIN film_actor A
ON F.film_id=A.film_id
GROUP BY F.title;

----- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT C.last_name, sum(P.amount) AS 'total amount paid'
FROM payment P
JOIN customer C
ON C.customer_id=P.customer_id
GROUP BY C.last_name;

----- List number of films per category.
SELECT C.name as 'category', sum(FC.film_id) as 'number of movies'
FROM category C
JOIN film_category FC
ON C.category_id=FC.category_id
GROUP BY C.name;





SELECT * FROM film_actor;
SELECT * FROM film_category;