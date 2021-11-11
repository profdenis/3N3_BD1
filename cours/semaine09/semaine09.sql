-- view

select f.*
from category c
         inner join film_category fc on c.category_id = fc.category_id
         inner join film f on f.film_id = fc.film_id
where c.name = 'Action';

create view FilmsDActions as
select f.*
from category c
         inner join film_category fc on c.category_id = fc.category_id
         inner join film f on f.film_id = fc.film_id
where c.name = 'Action';

select *
from FilmsDActions;



-- transactions

pragma foreign_keys = true;
drop table if exists A;
create table A
(
    id   integer primary key autoincrement,
    nom  text
--     b_id int references B (id)
);

drop table if exists B;
create table B
(
    id   integer primary key autoincrement,
    nom  text,
    a_id int references A (id)
);
alter table A add b_id int references B (id);

begin transaction;
pragma defer_foreign_keys = true;
insert into A(nom, b_id) values ('abc', 1);
insert into B(nom, a_id) values ('qwe', 500);
commit;
commit;