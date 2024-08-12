--#1: hr_locations tablosu ile hr_countries ve hr_regions tablolarını joinleyerek
--ekrana location_id, City, state_province, country_name, region name kolonları gelecek.
--country_name göre sıralanacak

select hl.location_id,hl.city ,hl.state_province,hc.country_name,hr.region_name from hr_locations hl 
inner join hr_countries hc on hl.country_id = hc.country_id 
inner join hr_regions hr on hc.region_id = hr.region_id 
order by 4 

--#2: hr locations tablosundaki state_province alanındaki null olan dataların
--employee_id, full_name, street_address ve City bilgilerini ekrana getiriniz.
-- (Departman idi si NULLldan farklı olan datalar için geçerlidir.)

select he.employee_id, 
       he.first_name||' '||he.last_name as full_name, 
       hl.street_address, 
       hl.city 
from hr_locations hl
join hr_departments hd on hl.location_id = hd.location_id
join hr_employees he on hd.department_id = he.department_id 
where hl.state_province is null 
  and he.department_id is not null;
  
--#3: hr.hr_departments tablosunda,
--Finance ve Marketing alanında çalışan çalışanların ayrı ayrı ortalama ücreti ne kadardır?
-- (Virgülden sonra yalnızca 3 basamak alınız.)

select hd.department_name,
       to_char(round(avg(he.salary), 3), '9999999.000') as average_salary
from hr_departments hd
join hr_employees he on hd.department_id = he.department_id
where hd.department_name in ('Finance', 'Marketing')
group by hd.department_name;
 

 