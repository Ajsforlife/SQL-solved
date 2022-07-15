--## Distinct Queries

--In this activity, you will practice using `DISTINCT ON ()` with joins and filtering with the `WHERE` clause.
select distinct customer_id, inventory_id, rental_date
FROM rental
ORDER BY rental_date DESC;

select customer_id, count(customer_id) from rental group by customer_id order by customer_id;
--### Instructions
select * from film;
select * FROM customer;
select * FROM rental;
select * from inventory;
--1. Retreive the latest rental for each customer's first and last name and emial address. 
SELECT DISTINCT ON (c.customer_id) 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    r.rental_date
FROM customer as c
INNER JOIN rental as r
ON (c.customer_id = r.customer_id)
GROUP BY c.customer_id, r.rental_date
ORDER BY c.customer_id;
--2. Retrieve the latest rental date for each title. 
SELECT DISTINCT ON (f.title)
    f.title,
    r.rental_date,
    r.inventory_id,
    f.film_id
From inventory as i
INNER JOIN rental as r
ON (i.inventory_id = r.inventory_id)
INNER JOIN film as f
ON (i.film_id = f.film_id)


--***Hint:** Join the `rental` and `inventory` tables on `inventory_id` and then join the `film` table with the `inventory` table on `film_id`. 

--## Bonus

--* The last query only returned 958 movies, which means 42 movies are not being rented. We know that there are 1,000 movies in the `film` table. Retrieve the film titles of the 42 movies that are not in the `inventory` table. 

--***Hint:** You won't need to use `DISTINCT ON ()` for this solution. Determine if the `film_id` from the `film` table is `NOT IN` the `inventory` table. 

SELECT DISTINCT f.title,
	i.film_id
FROM inventory as i
FULL OUTER JOIN film as f
ON (i.film_id = f.film_id)
WHERE i.film_id isnull;
