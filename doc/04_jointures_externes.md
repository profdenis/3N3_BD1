# Jointures

## Jointures externes ( `outer join` )

### Le problème :

Je veux lister tous les étudiants ainsi que leurs notes, pour tous les cours,
mais certains étudiants ne sont dans aucun groupe et je veux qu'ils soient
listés quand même.

Regardons la liste des étudiants:

````sql
SELECT *
FROM Etudiants;
````

```
CodePermanent  Nom            DateDiplome
-------------  -------------  -----------
ALLM111111     Michel Allard  2013-07-31
PAUP222222     Paul Paul      2013-07-31
CHOG333333     Gino Chouinar  2013-07-31
TANP444444     Pierre Tangua
DESS555555     Sylvie Deshai
FORP666666     Patricia Fort
TREM777777     Michel Trembl
TURM888888     Michel Turcot
```

Ainsi que la liste des notes :

````sql
    SELECT *
    FROM Notes;
````

```
Sigle       Groupe      CodePermanent  NoteFinale
----------  ----------  -------------  ----------
420BD1      001         ALLM111111     89.0
420BD1      001         PAUP222222     56.0
420BD1      001         CHOG333333     79.0
420BD1      001         TANP444444     99.0
420CN1      001         ALLM111111     87.0
420CN1      001         PAUP222222     78.0
420CN1      001         CHOG333333     75.0
420CN1      001         TANP444444     67.0
420PRA      001         FORP666666     89.0
420PRA      001         TREM777777     67.0
420PRA      001         TURM888888     85.0
420BD1      002         TREM777777
420BD1      002         TURM888888
```

Vous pouvez voir que la clé `DESS555555` n'apparait pas dans la table
`Notes`.

Alors, si je fais la requête suivante :

```sql
SELECT e.Nom, n.Sigle, n.Groupe, n.NoteFinale
FROM Etudiants e
         JOIN Notes n
              ON e.CodePermanent = n.CodePermanent;
```

Les étudiants n'ayant aucunes notes seront exclus (ex : `Sylvie Deshaies`).

```
Nom            Sigle       Groupe      NoteFinale
-------------  ----------  ----------  ----------
Michel Allard  420BD1      001         89.0
Paul Paul      420BD1      001         56.0
Gino Chouinar  420BD1      001         79.0
Pierre Tangua  420BD1      001         99.0
Michel Allard  420CN1      001         87.0
Paul Paul      420CN1      001         78.0
Gino Chouinar  420CN1      001         75.0
Pierre Tangua  420CN1      001         67.0
Patricia Fort  420PRA      001         89.0
Michel Trembl  420PRA      001         67.0
Michel Turcot  420PRA      001         85.0
Michel Trembl  420BD1      002
Michel Turcot  420BD1      002
```

### La solution : un outer join

La différence avec un `INNER JOIN`: les enregistrements de la table de gauche
seront retournés même s'il n'y pas d'enregistrement correspondant dans la table
de droite.

```sql
SELECT e.Nom, n.Sigle, n.Groupe, n.NoteFinale
FROM Etudiants e
         LEFT OUTER JOIN Notes n
                         ON e.CodePermanent = n.CodePermanent;
```

```
Nom            Sigle       Groupe      NoteFinale
-------------  ----------  ----------  ----------
Michel Allard  420BD1      001         89.0
Michel Allard  420CN1      001         87.0
Paul Paul      420BD1      001         56.0
Paul Paul      420CN1      001         78.0
Gino Chouinar  420BD1      001         79.0
Gino Chouinar  420CN1      001         75.0
Pierre Tangua  420BD1      001         99.0
Pierre Tangua  420CN1      001         67.0
Sylvie Deshai
Patricia Fort  420PRA      001         89.0
Michel Trembl  420BD1      002
Michel Trembl  420PRA      001         67.0
Michel Turcot  420BD1      002
Michel Turcot  420PRA      001         85.0
```

La « table de gauche » est la table avant le `LEFT OUTER JOIN`, et la « table de
droite » est la table après.

Les colonnes de la table de droite seront remplacées par la valeur `NULL`.

Il y a 3 types de Outer join : `LEFT`, `RIGHT`, et `FULL` . SQL ne supporte que
le `LEFT`.

SQL ne supporte pas le `RIGHT OUTER JOIN`. Mais il suffit d'inverser les tables
pour le simuler. Il est d'ailleurs recommandé de ne pas utiliser
de `right outer join` même lorsqu'il est supporté, car ça devient mélangeant. Il
est plutôt recommandé de simplement inverser l'ordre des tables et de prendre le
left.

SQL ne supporte pas le `FULL OUTER JOIN`. Mais il est possible de le simuler
avec une syntaxe plus complexe que nous ne verrons pas dans le cadre du cours.
De plus, la compréhension de la sémantique d'un `FULL OUTER JOIN` est assez
complexe.

Notez qu'il existe une syntaxe pour le `outer join` utilisant un « (+) ». Elle
n'est plus supportée.

Il est aussi important de comprendre que les enregistrements retournés doivent
aussi répondre aux conditions de la clause WHERE.

Exercices
---------

1. Dans l'exemple ci-haut, tous les étudiants sauf Sylvie Deshaies avaient au
   moins une note d'associée. Ajouté un critère pour indiquer que vous désirez
   uniquement les notes pour le cours 420BD1.

   Quelle étudiante est maintenant exclue ?
    <details>
      <summary>Réponse</summary>   

   Patricia Fortin est maintenant exclue de la table de droite, mais reste
   sélectionnée dans la table de gauche.

    ```sql
    SELECT e.Nom, n.Sigle, n.Groupe, n.NoteFinale
    FROM Etudiants e
    LEFT OUTER JOIN Notes n
        ON e.CodePermanent = n.CodePermanent
        AND n.Sigle = '420BD1';
    ```

    ```
    Nom            Sigle       Groupe      NoteFinale
    -------------  ----------  ----------  ----------
    Michel Allard  420BD1      001         89.0
    Paul Paul      420BD1      001         56.0
    Gino Chouinar  420BD1      001         79.0
    Pierre Tangua  420BD1      001         99.0
    Sylvie Deshai
    Patricia Fort
    Michel Trembl  420BD1      002
    Michel Turcot  420BD1      002
    ```

</details>

2. Changer cette dernière requête pour éliminer les étudiants qui ont une date
   de diplôme différente de '2013-07-31'**

   Avant même de faire cette requête, avez-vous une idée de ce qui va
   disparaitre ?

   Qui a disparu ? et pourquoi ?

   <details>
      <summary>Réponse</summary>   

   Il ne reste que ceux qui ont obtenu leur diplôme à cette date. Les autres,
   incluant Sylvie et Patricia, ont disparu du résultat, car ils ne respectent
   pas les critères du WHERE (le left outer join ne les ramènent pas)

    ```sql
    SELECT e.Nom, n.Sigle, n.Groupe, n.NoteFinale
        FROM Etudiants e
        LEFT OUTER JOIN Notes n
            ON e.CodePermanent = n.CodePermanent
            AND n.Sigle = '420BD1'
        WHERE e.DateDiplome = '2013-07-31' ;
    ```

    </details>

Récapitulation
--------------

Récapitulons avec une très bonne explication trouvée sur Stack Overflow
[http://stackoverflow.com/questions/38549/difference-between-inner-and-outer-join](http://stackoverflow.com/questions/38549/difference-between-inner-and-outer-join)

La voici en français :

Supposons que nous ayons 2 tables

```
tables     A    B
colonne    x    y
           1    3
           2    4
           3    5
           4    6
```

#### `Inner Join`

Un `Inner Join` retournera les lignes en commun dans les deux tables selon le
critère donné, c.-à-d. les 2 enregistrements communs

```sql
SELECT *
FROM A
         INNER JOIN B ON A.x = B.y;
```

ou

```sql
SELECT A.*, B.*
FROM A,
     B
WHERE A.x = B.y;
```

retourne les tuples `(3, 3)` et `(4, 4)` .

#### `Left outer join`

Un left join retourne tous les enregistrements de A plus les enregistrements
communs dans B

```sql
SELECT *
FROM A
         LEFT OUTER JOIN B ON A.x = B.y;
```

retourne `(1, null), (2, null), (3,3), (4,4)`

#### `Full outer join`

Bien que nous ne le voyons pas, voici quand même un exemple.

Un `full outer join` retourne l'union de A et B, c.-à-d. tous les
enregistrements de A et tous les enregistrements de B.

```genericsql
SELECT *
FROM A
         FULL OUTER JOIN b
                         ON A.x = B.y;
```

retourne `(1, null), (2, null), (3,3), (4, 4), (null, 5), (null, 6)`

### Le problème

Je veux afficher le nom de l'étudiant, sa note et le nom du cours. Cette
information est dans 3 tables

### La solution

Joindre les 3 tables dans le `SELECT`.

![DEA_Etudiant](images/DEA_Etudiant.png)

```sql
SELECT *
FROM (Etudiants e
    LEFT OUTER JOIN Notes n
    ON e.CodePermanent = n.CodePermanent )
         LEFT OUTER JOIN Cours c
                         ON n.Sigle = c.Sigle;
```

Le premier `LEFT OUTER JOIN` retourne un ensemble d'enregistrements et cette
table intermédiaire est à son tour jointe à la 3e table via un
autre `LEFT OUTER JOIN`.

Étant donné qu'il a des étudiants qui n'ont pas de cours associé, il faut garder
les `left outer join` jusqu'au bout si on veut afficher tous les étudiants.

#### `Self join`

Un `self join` est simplement un `JOIN` dont la table de gauche et de droite
sont la même.

Imaginez que l'on veuille représenter la relation « être coordonnateur de ». Il
faudrait modifier la table `Professeur` de la façon suivante :

```sql
CREATE TABLE Professeurs
(
    CodeProf      TEXT NOT NULL,
    Departement   TEXT NOT NULL,
    Nom           TEXT,
    LocalId       TEXT,
    Coordonnateur TEXT,
    PRIMARY KEY (CodeProf),
    FOREIGN KEY (Coordonnateur)
        REFERENCES Professeurs (CodeProf)
);
```

Voir l'exemple sur
[http://www.w3resource.com/sql/joins/perform-a-self-join.php](http://stackoverflow.com/questions/38549/difference-between-inner-and-outer-join)

Ouvrez la bd suivante contenant les modifications :
[prof_coordonnateur-sql](bds/prof_coordonnateur_sqlite.zip)

Pour afficher les professeurs et leur coordonnateur, il faut faire la requête
suivante :

```sql
SELECT p.CodeProf, p.Nom, c.CodeProf, c.Nom
FROM Professeurs p
         JOIN Professeurs c
              ON p.Coordonnateur = c.CodeProf;
```

Il est à noter l'utilisation des alias de table. En effet, étant donné que la
table professeurs se retrouve deux fois dans la requête, il serait impossible de
savoir laquelle des deux instances à laquelle nous voulons référer si nous
n'avions pas d'alias de table. Ici, `p` indique que nous désirons utiliser cette
instance de la table pour représenter les professeurs, et `c` pour représenter
les coordonnateurs.

Le ON cause souvent problème. Est-ce que je dois mettre
`p.coordonnateur = c.codeprof`, ou `p.codeprof = c.coordonnateur` ? Pour trouver
la solution, vous devez vous dire : je veux que le coordonnateur d'un professeur
soit égale au
`codeprof` d'un coordonnateur.

#### Alias de nom de champ (`AS`)

Si un identificateur de champ apparaît dans plusieurs tables, et que vous
retournez ces champs, la requête va automatiquement ajouter l'alias de la table
devant le nom du champ.

Exemple : Je veux le nom du professeur ainsi que le nom des cours qu'il donne.

````sql
 SELECT p.nom, c.nom
 FROM (Professeurs p LEFT OUTER JOIN Groupes g
     ON p.CodeProf = g.CodeProf)
          LEFT OUTER JOIN Cours c
                    ON c.Sigle = g.Sigle;
````

Le résultat sera :

```
p.nom       c.nom
Benoit      Base de Donnée 1
```

Pour changer ces noms générés, il faut utiliser la clause `AS`

```sql
SELECT p.nom AS 'Nom du Prof', c.nom AS 'Nom du cours'
FROM (Professeurs p LEFT OUTER JOIN Groupes g
    ON p.CodeProf = g.CodeProf)
         LEFT OUTER JOIN Cours c
                   ON c.Sigle = g.Sigle;
```

Le résultat sera :

```
Nom du Prof  Nom du cours
Benoit       Base de Données 1
```

Si le nom contient des espaces, il faut mettre des guillemets, sinon ce n'est
pas nécessaire.

## Exercices

![DEA_Etudiant](images/DEA_Etudiant.png)

Si vous avez perdu la bd:
[etudiants.sql](bds/etudiants_sqlite.zip)

### Question 1

Listez le nom des profs ainsi que le sigle de leur cours - Le nom du prof est
dans la table `Professeurs`

- Le sigle est dans la table `Groupes`
- Le lien entre un prof et son cours est dans la table `Groupes`

<details>
      <summary>Réponse</summary>  

```sql
SELECT p.Nom, g.Sigle
FROM Professeurs p
         INNER JOIN Groupes g
                    ON p.CodeProf = g.CodeProf;
```

</details>

La solution proposée a un défaut : que se passe-t-il si un prof a deux groupes
pour le même cours ?

<details>
         <summary>Réponse</summary>  

Il est listé 2 fois ; ex : Benoitd pour 420BD1
</details>

Comment régler ce problème ?

<details>
         <summary>Réponse</summary>  

Ajouter la clause DISTINCT

```sql
SELECT DISTINCT p.Nom, g.Sigle
FROM Professeurs p
         INNER JOIN Groupes g
                    ON p.CodeProf = g.CodeProf;
```

</details>

Cette solution a toujours un problème : les profs qui ne donnent pas de cours ne
sont pas listés ; ex : Sylvie.

Comment faire pour régler ce problème ?

<details>
         <summary>Réponse</summary>  

Faire un `LEFT OUTER JOIN`

```sql
SELECT DISTINCT p.Nom, g.Sigle
FROM Professeurs p
         LEFT OUTER JOIN Groupes g
                   ON p.CodeProf = g.CodeProf;
```

</details>

Serait-il possible de faire cette requête sans spécifier les clés de jonctions ?

<details>
         <summary>Réponse</summary>  

Utiliser la clause `NATURAL`

```sql
SELECT DISTINCT p.Nom, g.Sigle
FROM Professeurs p
         NATURAL LEFT JOIN Groupes g;
```

</details>


Quel est le problème avec la clause `NATURAL` ?

<details>
         <summary>Réponse</summary>  

Si les clés changent, la requête pourrait ne plus donner le même résultat.

C'est pour cela que `NATURAL` est rarement utilisé en production.

</details>

### Question 2

Listez le nom des étudiants suivant un cours, le sigle du cours et leur note
finale.

- Le nom de l'étudiant est dans la table `Etudiants`
- Sa note est dans la table Notes s'il est inscrit au cours.
- Le lien est le `CodePermanent`

Vous devez trouver deux façons différentes de faire cette requête.

#### Facon #1 :

- indice : spécifier les champs de la clé

<details>
    <summary>Réponse</summary>

```sql
SELECT e.nom, n.Sigle, n.NoteFinale
FROM Etudiants e
         INNER JOIN Notes N on e.CodePermanent = N.CodePermanent;
```

</details>

#### Facon #2 :

- indice : utiliser `NATURAL`

<details>
   <summary>Réponse</summary>  

```sql
SELECT e.nom, n.Sigle, n.NoteFinale
FROM Etudiants e
         NATURAL JOIN Notes n;
```

</details>

### Question 3

Listez le nom des profs, le sigle et le nom de leur cours

- Le nom du cours est dans la table Cours.
- Le lien entre Cours et Groupes se fait par le Sigle.

<details>
    <summary>Réponse</summary>  

```sql
SELECT DISTINCT p.Nom AS Prof, g.Sigle AS Sigle, c.Nom AS Cours
FROM Professeurs p
         LEFT OUTER JOIN Groupes g ON p.CodeProf = g.CodeProf
         LEFT OUTER JOIN Cours c ON c.sigle = g.sigle
ORDER BY g.Sigle;
```

</details>

Quelle serait la solution si je ne désire pas lister les profs n'ayant pas de
cours ?

<details>
      <summary>Réponse</summary>  

```sql
SELECT DISTINCT p.Nom AS Prof, g.Sigle AS Sigle, c.Nom AS Cours
FROM Professeurs p
         INNER JOIN Groupes g ON p.CodeProf = g.CodeProf
         INNER JOIN Cours c ON c.sigle = g.sigle
ORDER BY g.Sigle;
```

Qu'est ce qui a disparu ?

</details>

### Question 4

Listez le nom des profs, le sigle du cours, le nom du cours et le nom des
étudiants ayant une note.

- Le nom des étudiants est dans la table `Etudiants`
- Le lien entre un étudiant et le groupe est dans la table `Notes`
  (`Sigle` et `Groupe` pour le groupe, et `CodePermanent` pour l'étudiant)

<details>
    <summary>Réponse</summary>  

```sql
SELECT DISTINCT p.Nom   AS Prof,
                g.Sigle AS Sigle,
                c.Nom   AS Cours,
                e.Nom   AS Etudiant
FROM Professeurs p
         LEFT OUTER JOIN Groupes g ON p.CodeProf = g.CodeProf
         LEFT OUTER JOIN Cours c ON c.sigle = g.sigle
         LEFT OUTER JOIN Notes n ON n.Sigle = g.Sigle AND n.Groupe = g.Groupe
         LEFT OUTER JOIN Etudiants e ON n.CodePermanent = e.CodePermanent;
```

Notez que même si je n'avais pas demandé d'afficher le sigle du cours provenant
de la table Groupes, j'aurai quand même dû inclure la table
`Groupes`, car elle fait le lien entre `Prof` et `Etudiants` :
`Prof->Groupes->Notes->Etudiants`

</details>

### Question 5

Listez le Nom des étudiants par ordre alphabétique inverse.

<details>
    <summary>Réponse</summary>  

```sql
SELECT Nom
FROM Etudiants
ORDER BY Nom DESC;
```

</details>

### Question 6

Listez la note finale de tous les étudiants qui ont une date de diplôme égal à
2013-07-31

- affichez le nom de l'étudiant, le sigle du cours, le groupe et sa note finale
- si un étudiant n'a pas de note, il n'a pas besoin d'être listé (donc pas
  besoin de faire de left outer join).
- Triez par le nom de l'étudiant

<details>
    <summary>Réponse</summary>  

```sql
SELECT e.Nom, n.Sigle, n.Groupe, n.NoteFinale
FROM Etudiants e
         INNER JOIN Notes n ON e.CodePermanent = n.CodePermanent
WHERE e.DateDiplome = '2013-07-31'
ORDER BY e.Nom;
```

</details>

### Question 7

Listez les sigles de cours et les profs assigné(s) à ce cours. Un même groupe de
sigles/profs ne devrait pas apparaître deux fois. (partez de la table Groupes
pour obtenir le sigle)

<details>
    <summary>Réponse</summary>  

````sql
SELECT DISTINCT g.Sigle, p.Nom
FROM Groupes g
         INNER JOIN Professeurs p ON g.CodeProf = p.CodeProf;
````

</details>


### Question 8

Listez le nom des professeurs et le nom des étudiants qui ont eu une note
supérieure à 85.

- Notez qu'un prof peut enseigner 2 fois à un étudiant, il faudra donc enlever
  la duplication
- Utilisez des alias pour le nom du prof et de l'étudiant.

<details>
    <summary>Réponse 1</summary>  

````sql
SELECT DISTINCT p.Nom AS Prof, e.Nom AS Etudiant
FROM Professeurs p
         LEFT JOIN Groupes g ON p.CodeProf = g.CodeProf
         LEFT JOIN Cours c ON c.sigle = g.sigle
         LEFT JOIN Notes n ON n.Sigle = g.Sigle AND n.Groupe = g.Groupe
         LEFT JOIN Etudiants e
                   ON n.CodePermanent = e.CodePermanent
WHERE n.NoteFinale > 85;
````

</details>

