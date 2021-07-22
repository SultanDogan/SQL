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


