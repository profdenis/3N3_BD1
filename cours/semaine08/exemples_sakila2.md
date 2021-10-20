# 1. Catégories sans film

## Avec un `left join`

````sql
select c.category_id, c.name
from category c
         left join film_category fc on c.category_id = fc.category_id
where film_id is null;
````

## Avec un `group by`

````sql
select c.category_id, c.name
from category c
         left join film_category fc on c.category_id = fc.category_id
group by c.category_id, c.name
having count(fc.film_id) = 0;
````

## Avec un `not in` (sous-requête *non corrélée*)

````sql
select category_id, name
from category
where category_id not in (select category_id from film_category);
````

## Avec un `not exists` (sous-requête *corrélée*)

````sql
select category_id, name
from category c
where not exists(select fc.category_id
                 from film_category fc
                 where fc.category_id = c.category_id);
````

## Avec un `except`

````sql
select category_id, name
from category c
    except
select c.category_id, c.name
from category c
         inner join film_category fc on fc.category_id = c.category_id;
````

## Avec un `except` dans une sous-requête *non corrélée*

````sql
select c.category_id, name
from category c
         inner join (select category_id
                     from category c
                         except
                     select fc.category_id
                     from film_category fc) as T
                    on c.category_id = T.category_id;
````

## Avec un `except` dans une sous-requête *non corrélée* dans un `with`

````sql
with T as (select category_id
           from category c
               except
           select fc.category_id
           from film_category fc)
select c.category_id, name
from category c
         inner join T on c.category_id = T.category_id;
````

# 2. Catégorie qui contient le plus grand nombre de films

````sql
select fc.category_id,
       count(fc.film_id) as nb_films
from film_category fc
group by fc.category_id
order by nb_films desc
limit 1;
````

## S'il y a plus d'une catégorie avec le plus grand nombre de films ?

````sql
select fc.category_id,
       count(fc.film_id) as nb_films
from film_category fc
group by fc.category_id
order by nb_films desc;
````

## Trouver le plus grand nombre de films dans une catégorie

### Sous-requête dans le `from`

````sql
select max(nb_films) as max
from (select count(fc.film_id) as nb_films
      from film_category fc
      group by fc.category_id) as nb_films_par_categorie;
````

### Avec sous-requête dans le `with`

````sql
with nb_films_par_categorie
         as (select count(fc.film_id) as nb_films
             from film_category fc
             group by fc.category_id)
select max(nb_films) as max
from nb_films_par_categorie;
````

## Trouver les catégories qui ont le plus grand nombre de films dans une catégorie

### Une sous-requête dans le `with`, l'autre dans le `where`

````sql
with nb_films_par_categorie
         as (select fc.category_id, count(fc.film_id) as nb_films
             from film_category fc
             group by fc.category_id)
select category_id, nb_films
from nb_films_par_categorie
where nb_films = (select max(nb_films) as max
                  from nb_films_par_categorie);
````

### Les 2 sous-requêtes dans le `with`

````sql
with nb_films_par_categorie
         as (select fc.category_id, count(fc.film_id) as nb_films
             from film_category fc
             group by fc.category_id),
     max_nb_films as (select max(nb_films) as max
                      from nb_films_par_categorie)
select category_id, nb_films
from nb_films_par_categorie
where nb_films = (select * from max_nb_films);
````

## Ajouter le nom des catégories au `category_id`

````sql
with nb_films_par_categorie
         as (select fc.category_id, count(fc.film_id) as nb_films
             from film_category fc
             group by fc.category_id)
select c.category_id, c.name, nb_films
from nb_films_par_categorie n
         inner join category c on n.category_id = c.category_id
where nb_films = (select max(nb_films) as max
                  from nb_films_par_categorie);
````