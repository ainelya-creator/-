# 1a. Выбрать все столбцы из таблицы actor (ограничить по 100 строкам).
SELECT * from actor
LIMIT 100;

# 1b. Выбрать только last_name из таблицы actor.
SELECT last_name
FROM actor;

# 1c. Выбрать только следующие столбцы из таблицы film:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)
SELECT title, description, rental_duration, rental_rate, (rental_duration*rental_rate) as total_rental_cost 
FROM film;


# ---------------------------------------------------------#

# 2a. Выбрать различные/уникальные фамилии из таблицы actor.
SELECT DISTINCT last_name
FROM actor;


# 2b. Выбрать различные/уникальные почтовые коды из таблицы address.
SELECT DISTINCT postal_code
FROM address;


# 2c. Выбрать различные/уникальные рейтинги из таблицы film.
SELECT DISTINCT rating
FROM film;

# ---------------------------------------------------------#

# 3a. Выбрать столбцы title, description, rating, length из таблицы film, которые длятся более 3 часа или более.
SELECT title, description, rating, length
FROM film
WHERE length > '180';


# 3b. Выбрать столбцы payment_id, amount, payment_date из таблицы payment, где платежи были сделаны 05/27/2005 или позднее.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date = 05-27-2005
OR payment_date > 05-27-2005;
# 3c. Выбрать все столбцы из таблицы customer, где фамилии начинаются на S и имена заканчиваются на N.
select * from customer
where last_name like 's%'
and first_name like '%n';
# 3d. Выбрать все столбцы из таблицы customer, где клиент является неактивным или его фамилия начинается на M.
select * from customer
where active is null
or last_name like 'M%';

# 3e. Выбрать все столбцы из таблицы category, где первичный ключ больше 4 и столбец name начинается на C, S или T.
select * from category
where category_id > 4
and name like 'C%, S%, %T';
# 3f. Выбрать все столбцы за исключением столбца password из таблицы staff, где имеется значение password.
# select staff_id, first_name, last_name, address_id, picture, email, store_id, username, last_update
# from staff
# where staff_id, first_name, last_name, address_id, picture, email, store_id, username, last_update = 'password';
# ---------------------------------------------------------#

# 4a. Выбрать столбцы phone, district из таблицы address, которые находятся в California, England, Taipei, или West Java.
select phone, district 
from address
where city_id = 'California'
and city_id ='England'
and  city_id ='Taipei'
or city_id = 'West Java';

# 4b. Выбрать столбцы payment_id, amount, и payment_date из таблицы payment, где платежи были выполнены 05/25/2005, 05/27/2005, 05/29/2005.
select payment_id, amount, payment_date
from payment
where payment_date = 05/25/2005
and payment_date = 05/27/2005 
and payment_date = 05/29/2005;
# 4c. Выбрать все столбцы из таблицы film, где рейтинг фильма является G, PG-13 или NC-17.
select * from film
where rating like 'G'
and rating like 'PG-13'
and rating like 'NC-17';
# ---------------------------------------------------------#

# 5a. Выбрать все столбцы из таблицы payment, где платежи были выполнены между 05/25/2005 и 05/26/2005.
select * from payment
where payment_date between '05/25/2005' and '05/26/2005';
# 5b. Выбрать только следующие столбцы из таблицы film, для фильмов у которых длина description между 100 и 120:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)

# ---------------------------------------------------------#
SELECT title, description,release_year, (rental_duration*rental_rate) as total_rental_cost 
FROM film
where length(description) between '100' and '120';

# 6a. Выбрать только следующие столбцы из таблицы film, где description начинается на "A Thoughtful":
# Title, Description, Release Year
SELECT title, description, release_year
from film
where description like 'A Thoughtful%';

# 6b. Выбрать только следующие столбцы из таблицы film, где description заканчивается на слово "Boat".
# Title, Description, Rental Duration
SELECT title, description, rental_duration
from film
where description like 'Boat%';

# 6c. Выбрать только следующие столбцы из таблицы film, где description содержит слово "Database" и длина фильма больше 3-х часов.
# Title, Length, Description, Rental Rate
SELECT title, description, rental_duration
from film
where description like 'Database' and Length > '180';
# ---------------------------------------------------------#

# 7a. Выбрать все столбцы из таблицы film и упорядочить строки относительно столбца length по возрастанию.
select * from film
order by Length;

# 7b. Выбрать различные (уникальные) рейтинги из таблицы film, отсортированный по столбцу rating по убыванию.
select distinct* from film
order by rating
desc;
# 7c. Выбрать столбцы payment_date, amount из таблицы payment (первые 20 строк) отсортированные по столбцу amount по убыванию.
#select payment_date, amount
#from payment
#limit 20
#order by amount desc;


# ---------------------------------------------------------#

# 8a. Выбрать столбцы customer first_name/last_name и actor first_name/last_name используя /left join/ 
# между таблицами customer и actor (ON имена и фамилии соответсвенных таблиц) 
# Переименуйте столбцы customer first_name/last_name как customer_first_name/customer_last_name
# Переименуйте столбцы actor first_name/last_name в том же стиле как сверху
# Должно быть 599 строк
SELECT
  COALESCE(c.first_name, a.first_name) AS first_name,
  COALESCE(c.last_name, a.last_name) AS last_name
FROM customer c
left JOIN actor a
  ON (c.first_name, c.last_name)
  =  (a.first_name, a.last_name);
   ALTER TABLE customer CHANGE first_name customer_first_name varchar(50);
   ALTER TABLE customer CHANGE last_name customer_last_name varchar(50);
   ALTER TABLE actor CHANGE first_name actor_first_name varchar(50);
   ALTER TABLE actor CHANGE last_name actor_last_name varchar(50);
# 8b. Выполните тоже самое что и в 8а, только используйте /right join/ и посмотрите на разницу
# Должно быть 200 строк
SELECT
  COALESCE(c.first_name, a.first_name) AS first_name,
  COALESCE(c.last_name, a.last_name) AS last_name
FROM customer c
right JOIN actor a
  ON (c.first_name, c.last_name)
  =  (a.first_name, a.last_name);
# 8c. Выбрать те же столбцы что и в 8а, только используйте /inner join/ через фамилию (без имени)
# Должно быть 43 строки
SELECT
  COALESCE(c.first_name, a.first_name) AS first_name,
  COALESCE(c.last_name, a.last_name) AS last_name
FROM customer c
inner JOIN actor a
  ON (c.first_name, c.last_name)
  =  (a.first_name, a.last_name);
# 8d. Выбрать столбцы city, country из таблицы city, используя left join с таблицей country.
# Должно быть 600 строк
select city, country_id
from city
left join country
on city.country_id = country.country_id;

# 8e. Выбрать столбцы title, description, release_year, и language_name из таблицы film, используя left join с таблицей language.
# Должно быть 1000 строк
select title, description, release_year,language_name
from film
left join language
on film.language_id = language.language_id;

# 8f. Выбрать столбцы first_name, last_name, address, address2, city name, district, и postal code из таблицы staff, используя 2 left join с таблицей address, а потом также с таблицей city.
# Должно быть 2 строки
select s.first_name, s.last_name, a.address, a.address2, c.city_name, a.district, a.postal_code
from staff s 
left join adress a
on s.adress_id= a.adress_id
left join city c 
on a.city_id=c.city_id;