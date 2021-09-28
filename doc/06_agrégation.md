# SQL : Agrégation

Télécharger cette bd :
[agregation.sqlite](bds/agregation.sqlite.zip)

Vous y trouverez la table `agg` contenant les valeurs suivantes :

    Id          Nom         Age         Ville          Salaire
    ----------  ----------  ----------  -------------  ----------
    1           Paul        22          Drummondville  20000.0
    2           Pierre      25          Montréal       15000.0
    3           Ted         23          Québec         20000.0
    4           Marc        25          Lévis          65000.0
    5           David       22          Montréal       85000.0
    6           Kim         22          Sherbrooke     45000.0
    7           Jean        23          Magog          10000.0
    8           George      23          NULL           NULL
    9           Antoine     23          NULL           NULL

À partir de ces données, nous allons explorer les opérateurs d'agrégations. Ils
s'appellent ainsi parce qu'ils font l'agrégation
(regroupement) des plusieurs lignes de données pour produire une valeur.

Nous verrons les suivants : count, max, min, avg, sum.

Vous pouvez les voir tous
sur [http://www.sqlite.org/lang_aggfunc.html](http://www.sqlite.org/lang_aggfunc.html)

### Count

Compte le nombre de lignes retournées par la requête.

#### 1.

 ````sql
 SELECT count(*)
 
 FROM agg;
 ````

#### 2.

 ```sql
 SELECT count(*)
 FROM agg
 where Salaire > 20000;
 ```

#### 3.

 ````sql
 SELECT count(Ville)
 FROM agg;
 ````

Notez que les 2 lignes avec une ville _nulle_ ne sont pas comptées

#### 4.

 ````sql
 SELECT count(distinct Ville)
 FROM agg;
 ````

Montreal est compté une seule fois, alors que dans `3.` elle était comptée deux
fois. Pourquoi ?

**Question** : qu'arrive-t-il si je mets une autre colonne dans le `select`?

<details>
    <summary>Réponse</summary>  

La valeur de la dernière ligne **sélectionnée** (pas nécessairement la dernière
ligne de la table) est retournée pour les autres colonnes. Ce qui ne correspond
à rien de vraiment intéressant :)

</details>

### Max/Min

Retourne la valeur maximum ou minimum d'une colonne

#### 1.

````sql
SELECT max(Salaire)
FROM agg;

````

#### 2.

````sql
SELECT min(Salaire)
FROM agg
WHERE Ville = 'Montréal';
````

### Avg

Retourne la moyenne (_average_) des valeurs d'une colonne

#### 1.

````sql
SELECT avg(Salaire)
FROM agg;

````

Notez que les valeurs null ne sont pas comptées pour la division, c.à.d. la
somme 260000, est divisé par 7 (et non par 9) = 37142

#### 2.

````sql
SELECT avg(Salaire)
FROM agg
WHERE Ville = 'Montréal';
````

### Sum

Retourne la somme des valeurs d'une colonne

#### 1.

````sql
SELECT sum(Salaire)
FROM agg;
````

#### 2.

````sql
SELECT sum(Salaire)
FROM agg
WHERE Ville = 'Montréal';
````

### Autres fonctions utiles

Il existe d'autres fonctions pouvant être utilisées dans un `select` :
`random, abs, upper, lower, length`.

Je vous laisse les explorer sur
[http://www.tutorialspoint.com/sqlite/sqlite_useful_functions.htm](http://www.tutorialspoint.com/sqlite/sqlite_useful_functions.htm)

Il en existe d'autres encore :
[http://www.sqlite.org/lang_corefunc.html](http://www.sqlite.org/lang_corefunc.html)

Il est aussi possible de concaténer deux colonnes avec l'opérateur `||`

````sql
SELECT Nom || Ville AS 'Nom-Ville'
from agg;
````

Les entiers et la division
--------------------------

Si vous divisez deux entiers, le résultat sera la valeur entière de la division.

`SELECT 13/3;` → `4`, et non pas `4.3333`

Pour obtenir une réponse en virgule flottante, il suffit de multiplier un des
deux entiers par `1.0`

`SELECT 1.0*13/3;` → `4.333`

Ou de faire une conversion de type (casting)

`SELECT cast(13 as float)/3;` → `4.333`

La clause `GROUP BY` permet le regroupement des informations de même valeur.
Elle est utilisée avec les fonctions d'agrégations afin de retourner des
agrégations groupées.

#### 1.

````sql
SELECT Age, SUM(Salaire)
FROM agg
GROUP BY Age;
````

#### 2.

````sql
SELECT Ville, SUM(Salaire)
FROM agg
GROUP BY Ville;
````

#### 3.

````sql
SELECT *, SUM(Salaire), COUNT(*)
FROM agg
GROUP BY Ville, Age;
````

#### 4.

```sql
SELECT *, SUM(Salaire), COUNT(*)
FROM agg
GROUP BY Ville
```

Notez que Montreal retourne 2 pour le count.

#### 5.

````sql
SELECT Age, count(*)
FROM agg
GROUP BY Age;
````

#### 5.

````sql
SELECT Age, count(Salaire)
FROM agg
GROUP BY Age;
````

Quelle est la différence entre 5 et 5a, et pourquoi ?

<details>
    <summary>Réponse</summary>  

La valeur pour le groupe 23 est différente.

La raison : `count(*)` compte les lignes, alors que `count(salaire)` compte les
valeurs non-nulles.

</details>

Les nulls sont des bébittes assez particulières dans les bd. Voyons comment les
traiter.

### On ne peut faire de comparaison avec `NULL`, ni le remplacer par `' '`

#### 1.

````sql
SELECT *
FROM agg
WHERE VILLE IS NULL;
````

#### 2.

```sql
SELECT *
FROM agg
WHERE VILLE = '';
```

### On ne peut faire de calcul avec `NULL`

#### 1.

````sql
SELECT Nom, Salaire
FROM agg;
````

#### 2.

````sql
SELECT Nom, Salaire + 1
FROM agg;
````

### Si on concatène `NULL` avec une chaîne de caractère... on obtient `NULL`

#### 1.

````sql
SELECT Nom || Ville
FROM agg;
````

### `NULL` n'est pas pris en compte par les fonctions d'agrégations (nous l'avons déjà vu)

#### 1.

````sql
SELECT avg(Salaire)
FROM agg;

````

### Les fonctions pour traiter les `NULL`s

Pour remplacer un null par une valeur : `COALESCE`

#### 1.

````sql
SELECT Nom, COALESCE(Salaire + 1, 1)
FROM agg;
````

#### 2.

````sql
SELECT Nom || COALESCE(Ville, 'vide')
FROM agg;
````

Pour tester si la valeur est `NULL` : `IS NULL`
Pour tester si la valeur n'est pas `NULL` : `IS NOT NULL`

#### 1.

````sql
SELECT Nom
FROM agg
WHERE Ville IS NULL;
````

#### 2.

````sql
SELECT Nom
FROM agg
WHERE Ville IS NOT NULL;
````

#### 3.

````sql
SELECT COUNT(*)
FROM agg
WHERE Ville IS NULL;
````

### Problème de logique posé par les valeurs `NULL`

Nous sommes habitués à la logique booléenne où une condition est vraie ou
fausse. Mais dans les BD, il y a un troisième état : `null`.

**Exemple** : si je recherche tous les enregistrements ou le salaire est plus
grand que 22000, et qu'ensuite je recherche ceux qui sont plus petits ou égaux à
22000, je m'attends à avoir le compte total des enregistrements... essayons-le.

`SELECT COUNT(*) FROM agg WHERE Salaire>22000;` → `3`

`SELECT COUNT(*) FROM agg WHERE Salaire<=22000;` → `4`

Pour trouver le complément, il faut compter les valeurs nulles :

`SELECT COUNT(*) FROM agg WHERE Salaire IS NULL;` → `2`

## LIMIT

La clause `LIMIT` du select permet de limiter le nombre de lignes qui seront
affichées.

Notez que cette clause est spécifique à SQLite. Vous verrez en BD2 que d'autres
BD utilisent d'autres clauses pour limiter le nombre de lignes (ex : `TOP`)

#### 1. afficher les 3 salaires les plus élevés

````sql
select *
from agg
order by salaire desc
limit 3;
````

## HAVING

La clause `HAVING` permet de filtrer les données après que le `SELECT` et
le `WHERE`
aient retourné des résultats. Elle est indispensable dès qu'un filtre porte sur
une colonne calculée, comme c'est le cas avec les fonctions d'agrégations.

Supposons que je veuille trouver les villes où la somme des salaires est plus
grande que 90000.

Je ne peux faire la requête suivante :

```
SELECT Ville, SUM(Salaire)
FROM agg
WHERE SUM(Salaire) > 90000
GROUP BY Ville;
```

Car la fonction d'agrégations ne peut être utilisée dans un `WHERE`.

Il faut donc utiliser un `HAVING`

```sql
SELECT Ville, SUM(Salaire)
FROM agg
GROUP BY Ville
HAVING SUM(Salaire) > 90000;
```

