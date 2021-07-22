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


