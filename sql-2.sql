-- 1. Одним запросом магаз в котором > 300 пользаков 
 
SELECT E.first_name, E.last_name, CI.city, COUNT(C.customer_id) AS customer_count
FROM store AS S
JOIN staff AS E ON S.store_id = E.store_id
JOIN address AS A ON S.address_id = A.address_id
JOIN customer AS C ON S.store_id = C.store_id
JOIN city AS CI ON A.city_id = CI.city_id
GROUP BY E.first_name, E.last_name, CI.city
HAVING COUNT(C.customer_id) > 300;

-- 2. Длинна фильма

SELECT COUNT(*) AS film_count
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- 3. Месяц макс платеж, кол-во аренд.

SELECT
    DATE_FORMAT(P.payment_date, '%Y-%m') AS month,
    SUM(P.amount) AS total_payment,
    COUNT(R.rental_id) AS rental_count
FROM
    payment AS P
JOIN
    rental AS R ON P.rental_id = R.rental_id
GROUP BY
    month
ORDER BY
    total_payment DESC
LIMIT 1;

