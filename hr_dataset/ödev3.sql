--1) City içerisinde South kelimesi geçen dataların region name' ini benzersiz bir şekilde gösterin.

SELECT DISTINCT hr.region_name
FROM hr_locations hl
JOIN hr_countries hc ON hl.country_id = hc.country_id
JOIN hr_regions hr ON hc.region_id = hr.region_id
WHERE hl.city LIKE '%South%';


--2) manager_İd'sİ 100 olan yöneticinin altında çalışan elemanlardan, en yüksek maaş alan kimdir?
--Eğer birden fazla en yüksek maaş alan varsa alfabetik olarak sıralayıp ilk geleni alınız.

SELECT he.employee_id, he.first_name||' '||he.last_name as full_name, he.salary
FROM hr_employees he
WHERE he.manager_id = 100
ORDER BY he.salary DESC, full_name ASC
LIMIT 1;

--3) hr.hr_employees tablosunda,hire_date'i 1985 ve 1990
--arasındaki kayıtların bağlı oldukları departman isimleri nelerdir?

SELECT he.employee_id, 
       he.first_name||' '||he.last_name as full_name, 
       hd.department_name, 
       he.hire_date
FROM hr_employees he
JOIN hr_departments hd ON he.department_id = hd.department_id
WHERE he.hire_date BETWEEN '1985-01-01' AND '1990-12-31';


--4) Country_id'si DE,IL ve IN olan çalışanları bulunuz.

SELECT e.employee_id,
       e.first_name||' '||e.last_name as full_name,
       e.salary,
       d.department_name,
       l.street_address,
       l.city,
       c.country_name
FROM hr_employees e
JOIN hr_departments d ON e.department_id = d.department_id
JOIN hr_locations l ON d.location_id = l.location_id
JOIN hr_countries c ON l.country_id = c.country_id
WHERE c.country_id IN ('DE', 'IL', 'IN');


--5) Department_id'si 50 olup en son işe alınan çalışan kimdir?

SELECT e.employee_id,
       e.first_name||' '||e.last_name as full_name,
       e.hire_date,
       e.department_id
FROM hr_employees e
WHERE e.department_id = 50
ORDER BY e.hire_date DESC
LIMIT 1;

--6) Job_id'si IT_PROG ve ST_CLERK olan çalışanların aldıkları salary'i
-- içerisindeki en büyük salary'den daha büyük sonuçları yazdırınız.

SELECT e.employee_id,
       e.first_name||' '||e.last_name as full_name,
       e.salary,
       e.job_id
FROM hr_employees e
WHERE e.salary > ALL (
        SELECT MAX(salary)
        FROM hr_employees
        WHERE job_id IN ('IT_PROG', 'ST_CLERK') -- 9000 max maaş
    );












