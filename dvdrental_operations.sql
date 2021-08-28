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

--How many film title start with 'T' and has 'G' as a rating?
SELECT COUNT(title) FROM film
WHERE title LIKE 'T%' AND rating = 'G';

--How many country has name lenght as 5 letter?
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


-- Find average of the rental rate values in the film table.
SELECT AVG(rental_rate) FROM film;

-- Find the number of films that stars with letter 'C'.
SELECT COUNT(*) FROM film
WHERE title LIKE 'C%';

-- Find the length of longest film that has 0.99 as a rental rate value.
SELECT MAX(length) FROM film
WHERE rental_rate = 0.99;

-- How many different replacement_cost values are there for the movies longer than 150 minutes in the movie table?
SELECT COUNT(DISTINCT replacement_cost) FROM film
WHERE length > 150;


-- Group the movies in the movie table according to their rating values.
SELECT rating,COUNT(*) FROM film
GROUP BY rating;

-- When we group the films in the film table according to the replacement_cost column,
-- list the replacement_cost value with more than 50 films and the corresponding number of films.
SELECT replacement_cost,COUNT(*) FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50;

-- What are the customer numbers corresponding to the store_id values in the customer table?
SELECT store_id,COUNT(*) FROM customer
GROUP BY store_id;

-- After grouping the city data in the city table according to the country_id column, 
-- share the country_id information and the number of cities that contain the highest number of cities.
SELECT country_id,COUNT(*) FROM city
GROUP BY country_id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Find the number of film that leghts are greater than average film length.
SELECT COUNT(length) FROM film
WHERE length >
(
	SELECT AVG(length) FROM film
);

-- Find the number of films that has highest rental_rate value.
SELECT COUNT(*) FROM film
WHERE rental_rate =
(
	SELECT MAX(rental_rate) FROM film
);

-- Find the films that has lowest rental_rate and replacement_cost value.
SELECT (SELECT MIN(rental_rate)FROM film),(SELECT MIN(replacement_cost)FROM film) FROM film;

-- Find the customers that made maximum amount of shopping.
SELECT (SELECT MAX(amount) FROM payment) FROM payment;



