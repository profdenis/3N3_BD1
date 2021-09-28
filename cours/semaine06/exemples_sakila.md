# Exemples BD sakila

1. Films d'au moins 2 heures
    ````sql
    select film_id, title, length
    from film
    where length >= 120
    order by length desc;
    ````

2. Id et description du film `ACADEMY DINOSAUR`
    ````sql
    select film_id, description
    from film
    where title = 'ACADEMY DINOSAUR';
    ````

3. Catégories du film `ACADEMY DINOSAUR`
    ````sql
    select c.name
    from film f
             inner join film_category fc on f.film_id = fc.film_id
             inner join category c on c.category_id = fc.category_id
    where title = 'ACADEMY DINOSAUR';
    ````

4. Films sans catégorie
    ````sql
    select f.film_id, title
    from film f
             left join film_category fc on f.film_id = fc.film_id
    where category_id is null;
    ````

5. Catégories sans film
    ````sql
    select c.category_id, c.name
    from category c
             left join film_category fc on c.category_id = fc.category_id
    where film_id is null;
    ````

6. Films dans la catégorie `Action`
    ````sql
    select f.film_id, f.title
    from category c
             inner join film_category fc on c.category_id = fc.category_id
             inner join film f
                        on f.film_id = fc.film_id
    where c.name = 'Action';
    ````

7. Nombre de films dans la catégorie `Action`
    ````sql
    select count(f.film_id)
    from category c
             inner join film_category fc on c.category_id = fc.category_id
             inner join film f on f.film_id = fc.film_id
    where c.name = 'Action';
    
    select count(fc.film_id) as nb_films
    from category c
             inner join film_category fc
                        on c.category_id = fc.category_id
    where c.name = 'Action';
    ````

8. Nombre de films dans chaque catégorie
    ````sql
    select fc.category_id, count(fc.film_id) as nb_films
    from film_category fc
    group by fc.category_id;
    
    select fc.category_id, c.name, count(fc.film_id) as nb_films
    from film_category fc
             inner join category c on c.category_id = fc.category_id
    group by fc.category_id, c.name;
    ````

9. Nombre de catégories de chaque film
    ````sql
    select fc.film_id, count(fc.category_id) as nb_categories
    from film_category fc
    group by fc.film_id;
    
    select fc.film_id, f.title, count(fc.category_id) as nb_categories
    from film_category fc
             inner join film f on fc.film_id = f.film_id
    group by fc.film_id, f.title;
    ````

10. Nombre de films
    ````sql
    select count(film_id) as nb_films
    from film;
    
    select count(*) as nb_films
    from film;
    
    select count(original_language_id) as nb_films
    from film;
    ````

11. Nombre de langues différentes dans `language`
    ````sql
    select count(language_id) as nb_langues
    from language;
    
    select count(distinct language_id) as nb_langues
    from language;
    ````

12. Nombre de langues différentes dans film
    ````sql
    select count(language_id) as nb_langues
    from film;
    
    select count(distinct language_id) as nb_langues
    from film;
    ````