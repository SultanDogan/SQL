-- From film table selecting title and description columns.
SELECT title,description FROM film;

-- From film table take the films that lenght between 60 and 75.
SELECT * FROM film
WHERE length > 60 AND length <75;

-- From film table take the films that rental rate is 0.99 and replacement cost 12.99 or 28.99.
SELECT * FROM film
WHERE rental_rate = 0.99 AND replacement_cost = 12.99 OR replacement_cost = 28.99;

-- What is the last name of the customer that first name is Mary.
SELECT first_name,last_name FROM customer
WHERE first_name = 'Mary';

-- Take the films that the length is not greater then 50 and rental rate is not 2.99 or 4.99.
SELECT * FROM film
WHERE NOT length > 50 AND NOT (rental_rate = 2.99 OR rental_rate = 4.99);


-- Take the films that replacement cost is between 12.99 and 16.99.
SELECT * FROM film
WHERE replacement_cost BETWEEN 12.99 AND 16.99;

--From actor table take the first and last name of actors that first names are Penelope, Nick or Ed.
SELECT first_name, last_name FROM actor
WHERE first_name IN ('Penelope','Nick','Ed');

--From film table take the films which have 0.99 , 2.99 or 4.99 as a rental rate and 12.99 , 15.99 or 28.99 as a replacement cost.
SELECT * FROM film
WHERE rental_rate IN (0.99,2.99,4.99) AND replacement_cost IN (12.99,15.99,28.99);


-- Take the counrties that start and end with 'a' letter from counrty table.
SELECT country FROM country
WHERE country LIKE 'A%a';

-- Take the countries that ends with letter 'n' and include at least 6 letter.
SELECT country FROM country
WHERE country LIKE '_____%n';

-- From film table take the film titles which include at least 4 't' (upper or lowercase).
SELECT title FROM film
WHERE title ILIKE '%T%T%T%T%';

-- Take the films that start with 'C' and length is greater than 90 and rental rate is eaual to 2.99.
SELECT * FROM film
WHERE title LIKE 'C%' AND length >90 AND rental_rate = 2.99;


-- Find the distinct replacement cost values in the film table.
SELECT DISTINCT replacement_cost FROM film;

-- Find the number of distinct replacement cost values in the film table.
SELECT COUNT(DISTINCT replacement_cost) FROM film;

--How many film title start with 'T' and has 'G' as a rating.
SELECT COUNT(title) FROM film
WHERE title LIKE 'T%' AND rating = 'G';

--How many country has name lenght as 5 letter.
SELECT COUNT(country) FROM country
WHERE country LIKE '_____';

-- Find the number of cities that finish with letter 'b'.
SELECT COUNT(city) FROM city
WHERE city ILIKE '%R';


-- Find the 5 longest films that last letters are 'n'.
SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length DESC
LIMIT 5;

-- Find the second 5 shortest films that last letters are 'n'.
SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length
OFFSET 5
LIMIT 5;

-- From customer table take the first 4 data that ordered by last name(descending) and store id =1.
SELECT * FROM customer
WHERE store_id =1
ORDER BY last_name DESC
LIMIT 4;







