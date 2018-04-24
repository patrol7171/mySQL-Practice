SELECT first_name, last_name FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS ActorName
FROM   actor;

SELECT actor_id, first_name, last_name FROM actor WHERE first_name LIKE 'Joe%';

SELECT * FROM actor WHERE last_name LIKE '%GEN%';

SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name ASC, first_name ASC;

SELECT country_id FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor ADD COLUMN middle_name VARCHAR(20) NULL AFTER first_name;

ALTER TABLE actor MODIFY middle_name BLOB;
DESCRIBE actor middle_name;

ALTER TABLE actor  DROP middle_name;
SELECT * FROM actor;

SELECT last_name, count(*) as LN_Count 
	FROM actor GROUP BY last_name;

SELECT last_name, COUNT(*) as LN_Count
	FROM actor GROUP BY last_name
	HAVING COUNT(last_name) >= 2;
    
UPDATE actor SET first_name = 'Harpo'
WHERE last_name = 'Williams' AND first_name = 'Groucho';
SELECT * FROM actor WHERE last_name = 'Williams';   

UPDATE actor
   SET first_name = CASE
     WHEN first_name = 'Harpo' THEN 'Groucho'
     ELSE 'Mucho Groucho'
	END
WHERE last_name = 'Williams';
SELECT * FROM actor WHERE last_name = 'Williams'; 

SHOW CREATE TABLE address;

SELECT s.first_name, s.last_name, a.address
FROM staff s INNER JOIN address a ON a.address_id=s.address_id;

SELECT s.first_name, s.last_name, count(p.staff_id) as Pymt_Count
FROM staff s INNER JOIN payment p ON p.staff_id=s.staff_id GROUP BY p.staff_id;

SELECT f.title, COUNT(a.film_id) as Actor_Count
FROM film f INNER JOIN film_actor a ON f.film_id=a.film_id GROUP BY a.film_id;

SELECT f.title, COUNT(i.film_id) as Film_Count
FROM film f INNER JOIN inventory i ON f.film_id=i.film_id 
WHERE f.title = 'Hunchback Impossible';

SELECT c.first_name, c.last_name, SUM(p.amount) as Total_Pymt
FROM customer c INNER JOIN payment p ON p.customer_id=c.customer_id GROUP BY p.customer_id
ORDER BY c.last_name ASC;

SELECT title FROM film WHERE language_id = 1 and title IN (SELECT title FROM film WHERE title LIKE 'Q%' OR title LIKE 'K%');

SELECT first_name,last_name FROM actor WHERE actor_id IN (
	SELECT actor_id FROM film_actor WHERE film_id = 17);

SELECT first_name, last_name, email FROM customer WHERE address_id IN (
	SELECT a.address FROM city c INNER JOIN address a ON a.city_id=c.city_id
    WHERE c.country_id = 20);

SELECT title FROM film WHERE film_id IN (
	SELECT film_id FROM film_category WHERE category_id IN (
		SELECT category_id from category WHERE name = 'Family'));

SELECT title FROM film WHERE film_id IN (
	SELECT i.film_id FROM inventory i INNER JOIN rental r ON i.inventory_id=r.inventory_id
    GROUP BY rental_id HAVING COUNT(rental_id) >= 1);




