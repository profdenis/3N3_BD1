-- 1. films d'au moins 2 heures
select film_id, title, length
from film
where length >= 120
order by length desc;

-- 2. id et description du film 'ACADEMY DINOSAUR'
select film_id, description
from film
where title = 'ACADEMY DINOSAUR';

-- 3. catégories du film 'ACADEMY DINOSAUR'
select c.name
from film f
         inner join film_category fc on f.film_id = fc.film_id
         inner join category c on c.category_id = fc.category_id
where title = 'ACADEMY DINOSAUR';

-- 4. films sans catégorie
select f.film_id, title
from film f
         left join film_category fc on f.film_id = fc.film_id
where category_id is null;

-- 5. catégories sans film
select c.category_id, c.name
from category c
         left join film_category fc on c.category_id = fc.category_id
where film_id is null;

-- 6. films dans la catégorie 'Action'
select f.film_id, f.title
from category c
         inner join film_category fc on c.category_id = fc.category_id
         inner join film f on f.film_id = fc.film_id
where c.name = 'Action';

-- 7. nombre de films dans la catégorie 'Action'
select count(f.film_id)
from category c
         inner join film_category fc on c.category_id = fc.category_id
         inner join film f on f.film_id = fc.film_id
where c.name = 'Action';

select count(fc.film_id) as nb_films
from category c
         inner join film_category fc on c.category_id = fc.category_id
where c.name = 'Action';

-- 8. nombre de films dans chaque catégorie
select fc.category_id, count(fc.film_id) as nb_films
from film_category fc
group by fc.category_id;

select fc.category_id, c.name, count(fc.film_id) as nb_films
from film_category fc inner join category c on c.category_id = fc.category_id
group by fc.category_id, c.name;

-- 9. nombre de catégories de chaque film
select fc.film_id, count(fc.category_id) as nb_categories
from film_category fc
group by fc.film_id;

select fc.film_id, f.title, count(fc.category_id) as nb_categories
from film_category fc inner join film f on fc.film_id = f.film_id
group by fc.film_id, f.title;

-- 10. nombre de films
select count(film_id) nb_films
from film;

select count(*) nb_films
from film;

select count(original_language_id) nb_films
from film;

-- 11. nombre de langues différentes dans language
select count(language_id) as nb_langues
from language;

select count(distinct language_id) as nb_langues
from language;

-- 12. nombre de langues différentes dans film
select count(language_id) as nb_langues
from film;

select count(distinct language_id) as nb_langues
from film;