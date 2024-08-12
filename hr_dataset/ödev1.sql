-- Sorular
--1# country tablosunda country_name içinde 'land' ifadesi geçen kayıtlar.

select  country_name from hr_countries hc
where country_name like '%land%'

--2# employees tablosunda, 5k 'den küçük maaş alan çalışanların
--bağlı olduğu job'id'lerin sayısı kaçtır?

select count(job_id) from hr_employees he 
where salary < 5000

-- distinct job id lerin sayısı
select count(distinct job_id) from hr_employees he 
where salary < 5000


--3# hr_employees tablosunda, 10k İle 20k arasında maaş alan çalışanların;
--employee_id, full_name (ad soyadın birleşimi) ve job_İd ' lerİnİ ekrana yazdırın.

select employee_id,first_name||' '||last_name as full_name, job_id from hr_employees he 
where salary between 10000 and 20000

--4# hr countries tablosu, country name alanındaki en kısa uzunluktaki
--ve en uzun uzunluktaki ülkeleri ayrı ayrı gösteriniz?
-- (Eğer aynı uzunluğa sahipse alfabetik sıraya göre sonucu getiriniz.)

	-- En kısa uzunluktaki ülkeleri getirme
select min(length(country_name)) from hr_countries hc 
--en kısa uzunluk 5

select country_name,length(country_name) from hr_countries hc 
where length(country_name) =5
order by country_name


	-- En uzun uzunluktaki ülkeleri getirme
select max(length(country_name)) from hr_countries hc 
--en uzun uzunluk 24

select country_name,length(country_name) from hr_countries hc 
where length(country_name) =24
order by country_name

-- birleşik hali 

select country_name,length(country_name) from hr_countries hc 
where length(country_name) =(select min(length(country_name)) from hr_countries hc) 
order by country_name

select country_name,length(country_name) from hr_countries hc 
where length(country_name) =(select max(length(country_name)) from hr_countries hc) 
order by country_name





