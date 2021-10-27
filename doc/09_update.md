# `UPDATE` et `DELETE`

Deux types de mises à jour possibles :

1. modifier un enregistrement existant;

2. effacer un enregistrement.

## `Update`

Pour modifier un enregistrement, la commande est `UPDATE`

La syntaxe
complète : [http://www.sqlite.org/lang_update.html](http://www.sqlite.org/lang_update.html)

### Exemples

Téléchargez la BD
[EtudiantProgramme.sqlite](bds/EtudiantProgramme.sqlite.zip)
(si vous l'avez déjà, faites en une copie, car nous allons la modifier).

Commençons par mettre la validation des foreign keys à ON

````sql
PRAGMA FOREIGN_KEYS = ON;
````

Nous sommes maintenant prêts à changer les données :

````sql
UPDATE Etudiants
SET Nom='Benoit Allard'
WHERE DA = 'ALLM111111';
````

Si la clause `WHERE` ne retourne pas d'enregistrements, rien ne sera fait.

````sql
UPDATE Etudiants
SET Nom='Mauvais Where'
WHERE DA = '12345';
````

Pour changer plusieurs enregistrements en une seule commande :

```sql
UPDATE Etudiants
SET ProgrammesId=410
WHERE ProgrammesId = 420;
```

Noter que ce n'est pas la clé. Le `where` n'a pas besoin d'utiliser les clés.

Pour changer une valeur à partir de sa valeur existante.

````sql
UPDATE Etudiants
SET Nom= Nom || ' Junior'
WHERE DA = 'ALLM111111';
````

Pour changer plusieurs colonnes.

````sql
UPDATE Etudiants
SET Nom='Michel Allard',
    ProgrammesId=420
WHERE DA = 'ALLM111111';
````

Bien entendu, les règles de FK doivent être respectées.

````sql
UPDATE Etudiants
SET ProgrammesId=666
WHERE ProgrammesId = 412;
````

## Delete

Pour effacer un enregistrement, la commande est `DELETE`

La syntaxe
complète : [http://www.sqlite.org/lang_delete.html](http://www.sqlite.org/lang_delete.html)

### Exemples

````sql
DELETE
FROM Cours
WHERE Id = '420PRA';
````

Ici aussi, les FK doivent être respectées

````sql
DELETE
FROM Cours
WHERE Id = '420BD1';
````

# Import/Export

Jusqu'à maintenant, nous avons fait les ajouts et mise-à-jour manuellement. Mais
si je veux passer de l'information d'une bd à une autre, est-ce que je dois
retaper toutes les commandes de création ?

La réponse : non. Il est possible d'extraire les commandes ayant permis la
création de la BD dans un fichier texte et de rejouer ces commandes.

## Dans sqlite3

La commande est : `.dump`

Mais cette commande affiche le résultat à l'écran. Il faut donc indiquer que
l'on veut envoyer le résultat dans un fichier :
`.output nomdufichier`

Et une fois terminer, remettre l'output à l'écran : `.output stdout`

Le fichier contient les commandes de création de tables, ainsi que les inserts.
À noter la commande `PRAGMA foreign_keys=OFF;` insérée au début du fichier.

Pour relire l'information, il suffit d'ouvrir une nouvelle bd et de faire un
`.read nomdufichier`

## Dans SqliteStudio

Dans le menu **Databases**, vous trouverez **Export database**

Il est possible d'exporter uniquement la structure sans les données.

Et il est possible d'exporter dans d'autres formats, tels que SQL, HTML, XML.

De plus, il est possible d'exporter les données d'une table dans le menu
**Tables/Export Table**

Avec cette option d'export, il est possible d'exporter dans d'autres formats
tels que CSV, JSON, XLS...

CSV est un format intéressant afin d'analyser les données avec Excel. En effet,
un fichier CSV peut être lu directement par Excel (et par d'autres outils)

# Date et heure

Afin de manipuler les dates, SQLite propose un ensemble de fonctions. Vous
trouverez la liste complète sous
[http://sqlite.org/lang_datefunc.html](http://sqlite.org/lang_datefunc.html)

## Exemples

Nous utiliserons la BD
[manipulationDate.sqlite](bds/manipulationDate.sqlite.zip)

1. Extraire la journée de naissance

````sql
SELECT strftime('%d', naissance)
FROM exDate;
````

2. Extraire la journée de la semaine des naissances

````sql
SELECT strftime('%w', naissance)
FROM exDate;
````

3. Afficher la date du vendredi de la semaine des naissances

````sql
SELECT date(naissance, 'weekday 5')
FROM exDate;
````

4. Afficher la date d'aujourd'hui.

````sql
SELECT date('now');
````

5. Afficher l'heure présente

````sql
SELECT datetime('now', 'localtime');
````

6. Même chose, mais juste l'heure sans la date

````sql
SELECT strftime('%H:%M:%S', 'now', 'localtime');
````

# Nombres entiers et réels

Si vous divisez deux entiers, le résultat sera la valeur entière de la
division : `SELECT 13/3;` → 4, et non pas 4.3333

Pour obtenir une réponse en virgule flottante, il suffit de multiplier un des
deux entiers par 1.0 : `SELECT 1.0*13/3;` → 4.333

Ou de faire une conversion de type (casting) : `SELECT cast(13 as float)/3;` →
4.333

# `SELECT` imbriqué dans des `INSERT`, `UPDATE`, `DELETE`

Jusqu'à maintenant, nous avons utilisé le select imbriqué uniquement dans un
autre select. Il est aussi possible de l'utiliser dans une commande de mise à
jour (`insert`, `update`, `delete`).

## Exemples

Nous allons créer une table contenant toutes les notes de tous les étudiants
pour tous les cours.

Il est important de noter ici que _cette nouvelle table n'est pas normalisée_
puisqu'elle contiendra de l'information qui peut être dérivée à partir d'autres
tables. Nous verrons le concept de la normalisation plus tard.

Commençons par créer la table :

```sql
CREATE TABLE ToutesLesNotes
(
    DA              Text,
    NomEtudiant     Text,
    CoursId         Text,
    NomCours        Text,
    Note            Integer,
    MoyenneDuGroupe Real,
    PRIMARY KEY (DA, CoursId)
);
```

Insérons maintenant l'information provenant des autres tables :

```sql
    INSERT INTO ToutesLesNotes (DA, NomEtudiant, CoursId, NomCours, Note)
    SELECT e.DA, e.Nom, c.Id, c.Nom, n.Note
    FROM (Etudiants e
        LEFT JOIN Etudiants_Cours n
        ON e.DA = n.EtudiantsDa)
             LEFT JOIN Cours c
                       ON n.CoursId = c.Id;
```

Oups, il manque la moyenne...

Commençons par vider la table

```sql
    DELETE
    FROM ToutesLesNotes
    WHERE 1 = 1;
```

Maintenant, modifions la requête précédente afin de calculer la moyenne :

```sql
INSERT INTO ToutesLesNotes (DA, NomEtudiant, CoursId, NomCours, Note, MoyenneDuGroupe)
SELECT e.DA,
       e.Nom,
       c.Id,
       c.Nom,
       n.Note,
       (SELECT AVG(Note)
        FROM Etudiants_Cours a
        WHERE a.CoursId = c.ID)
FROM (Etudiants e
    LEFT JOIN Etudiants_Cours n
    ON e.DA = n.EtudiantsDa)
         LEFT JOIN Cours c
                   ON n.CoursId = c.Id;
```

Une view est tout simplement une table virtuelle basée sur un select.

# Vues (`VIEW`)

[http://sqlite.org/lang_createview.html](http://sqlite.org/lang_createview.html)

Les views sont aussi listées avec la commande `.table`.

Mais il est facile de voir si c'est une view en utilisant `.schema`

Dans sqlitestudio, elles apparaissent sous les _Views_.

## Utilisation

Une `view` peut être utilisée partout où une table peut l'être. Il est par
contre interdit d'insérer ou d'effacer des enregistrements dans une view.

Il est important de comprendre qu'une `view` peut sembler simple
(retourner 2-3 champs) mais que la requête sous-jacente est très complexe
(plusieurs join avec des agrégations, des conditions complexes et des
sous-requêtes). Il ne faut donc pas s'étonner si une requête est très lente lors
de l'utilisation d'une view.

### Exemple

Au lieu de créer une vraie table qui duplique l'information pour entreposer les
notes, on peut créer une `view` :

**Note** : si la view est déjà dans la BD, la commande pour l'effacer est :
`drop view touteslesnotesv;`

````sql
CREATE VIEW ToutesLesNotesV AS
SELECT e.DA,
       e.Nom                    as NomEtudiant,
       c.Id,
       c.Nom                    as NomCours,
       n.Note,
       (SELECT AVG(Note)
        FROM Etudiants_Cours a
        WHERE a.CoursId = c.ID) as Moyenne
FROM (Etudiants e
    LEFT JOIN Etudiants_Cours n
    ON e.DA = n.EtudiantsDa)
         LEFT JOIN Cours c
                   ON n.CoursId = c.Id;
````

Et l'utiliser comme toute autre table :

````sql
SELECT moyenne
FROM ToutesLesNotesV;
SELECT NomEtudiant, moyenne
FROM ToutesLesNotesV
GROUP BY NomEtudiant;
````