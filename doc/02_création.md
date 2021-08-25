Création de tables
==================

Pour créer une table, SQL utilise la commande **CREATE TABLE**

[http://www.sqlite.org/lang_createtable.html](http://www.sqlite.org/lang_createtable.html)

### Création avec l'interface texte

Afin de ne pas abîmer notre BD automobile, nous allons créer une nouvelle BD que nous appellerons simplement
`test1.sqlite`.

Tapez la commande suivante :

````
sqlite3 test1.sqlite
````

Vérifiez que cette BD est vraiment nouvelle en tapant `.tables` qui devrait ne rien afficher.

Allons-y avec une nouvelle table qui reproduira la table Autos de notre BD Automobile.

### Nom des tables et colonnes

Il est fortement recommandé de respecter les majuscules/minuscules pour les noms de tables et des champs.

Mais il est OBLIGATOIRE de respecter le singulier/pluriel. Habituellement, nous utiliserons le standard suivant:

- Nommer les champs (colonnes) au singulier (c'est LE nom, LE prix)
- Nommer les tables au pluriel (ce sont LES autos, LES clients)

Mais il est fréquent de voir le nom des tables au singulier.

Nous verrons plus tard que les tables de jonctions sont plus difficiles à nommer.

````sql
CREATE TABLE Autos
(
    Id      INTEGER PRIMARY KEY,
    Nom     TEXT,
    Prix    INTEGER,
    Couleur TEXT
);
````

Pour vous assurer que la commande a bien fonctionné, tapez la commande
`.schema`. Vous devriez revoir la structure de votre table.

### Avec SQLiteStudio

Vous pouvez aussi vous servir de SQLiteStudio pour vous connecter à cette nouvelle BD et vérifier la structure de votre
table.

1. Dans SQLiteStudio, menu **Base de données/Ajout d'une base de données**

2. Ouvrez `test.sqlite` que vous venez de créer avec l'interface texte.

3. Ensuite **Base de données/Connecter la base de données**

4. Nous allons créer la table Usagers de notre nouvelle BD.

5. Utilisez **Structure/Créer une table**

6. Indiquez le nom de la table : **Usagers**

7. Appuyez sur **Ajouter une colonne** (icone bleu/vert ressemblant à un tableau excel)
    - Nom de la colonne = `Id`
    - Type de données = Integer
    - Allumez **Clé Primaire**
    - Cliquez sur **OK**

8. Ajoutez les autres champs (sans allumez `primary key`) :
    - Prenom (Text)
    - Nom (Text)
    - Age (Integer)
    - Ville (Text)

9. Cliquez sur **Enregistrer les modifications** (le crochet vert)

Et voilà vous avez maintenant 2 tables. Est-ce que l'interface graphique est plus facile? Plus rapide?

### Convention pour les noms

Nous utiliserons les conventions suivantes pour nommer les tables et les champs. Notez que vous pourrez perdre des
points lors des évaluations si vous ne respectez pas ces normes.

- Le nom des tables est au pluriel et commence par une majuscule
  (`Clients` et non `Client`)

- Le nom des champs est au singulier.

- Utiliser le `PascalCasing`. (pas de souligné)

- Ne pas utiliser d'abréviations ambiguës. N'hésitez pas à utiliser un nom long plutôt qu'une abréviation qui peut
  porter à confusion.

- Être consistant dans les noms. Ex : ne pas utiliser CodePostal dans une table et CP dans une autre.

Notez que ces règles sont pour CE cours. Quand vous arriverez en entreprise, celle-ci utilisera ses conventions.

Il est aussi fréquent pour de grosse base de données d'utiliser un dictionnaire de données. Il est alors possible
d'avoir des noms qui ne sont que des clés dans ce dictionnaire.

### Types de données supportés par SQLite

La description exacte des types de données supportées par SQLite est décrite
sur [http://www.sqlite.org/datatype3.html](http://www.w3schools.com/sql/default.asp)

*En résumé* :

Il y a 4 types supportés : `INTEGER`, `REAL`, `TEXT`, `BLOB`. Toutes les autres BD fonctionnent avec un typage statique
rigide. SQLite est une des seules BD permettant une si grande conversion du type des données. Cela permet d'importer des
données vers SQLite très facilement (mais pourrait causer des problèmes lors de l'exportation de SQLite vers une autre
BD).

N'importe quelle valeur peut-être entreposée dans n'importe quelle colonne ; sauf si la colonne est de type INTEGER
`PRIMARY KEY`.

Si une valeur n'est pas du bon type, elle pourra être convertie ; ex :
integer ou real vers string.

Il n'y a pas de type boolean. Utilisez un integer avec 0=false et 1=true.

Il n'y a pas de type pour les dates et l'heure. Utilisez un des 3 formats suivants :

- `TEXT YYYY-MM-DD HH:MM:SS.SSS` (recommandé)

- `REAL` le nombre de jour depuis midi à Greenwich, le 24 novembre 4714 B.C. en accord avec le calendrier Gregorian.

- `INTEGER` le temps en format UNIX, c.-à-d. le nombre de secondes depuis 1970-01-01 00:00:00 UTC

Vous pouvez choisir le format que vous désirez et utiliser les fonctions de conversion fournies par SQLite. Mais soyez
consistant d'une table à l'autre.

Il y aura une conversion automatique si les données ne concordent pas avec le type de la colonne.

Si vous importez le SQL (nous verrons comment faire ça plus tard), il y aura une conversion de types faite selon des
règles précises.


Les contraintes
===============

Lors de la création des tables, nous avons vu qu'il est possible de préciser la clé primaire. Ce genre d'indication s'
appelle une
***contrainte***. Il existe plusieurs types de contraintes. Si elle est appliquée à un champ, on dit que c'est une
contrainte de **champs**, et si elle affecte la table au complet, on dit que c'est une contrainte de
**table**.

[https://www.sqlite.org/lang_createtable.html](http://www.w3schools.com/sql/default.asp)

Voici celles dont nous nous servirons dans le cadre du cours :

#### Primary key

La clé primaire permet d'identifier de façon **unique** un enregistrement.

Les champs ayant cette contrainte font partie de la clé primaire. Il peut y avoir un ou plusieurs champs faisant partie
de cette clé. Quand la clé primaire contient plusieurs champs, on dit qu'elle est
***composée***, sinon elle est ***simple.***

Une clé simple est déclarée à l'aide d'une contrainte de colonne, comme nous l'avons déjà vue :

````sql
CREATE TABLE Autos
(
    Id      INTEGER PRIMARY KEY,
    Nom     TEXT,
    Prix    INTEGER,
    Couleur TEXT
);
````

Quand la clé est composée, on utilise une contrainte de table. Par exemple, sachant que le nom d'un modèle de voiture
est unique, mais que ce même modèle est produit année après année, la clé primaire pourrait être le nom et l'année. La
commande de création serait alors :

````sql
CREATE TABLE Autos2
(
    Annee  TEXT,
    Modele TEXT,
    Prix   INTEGER,
    PRIMARY KEY (Annee, Modele)
);
````

### Rowid: une spécialité SQLite

SQLite permet de n'indiquer aucun champ comme étant la clé primaire. Si tel est le cas, un champ additionnel appelé **
rowid** sera créé automatiquement. Cette règle est particulière à SQLite. Si la table a une clé primaire qui est un
champ INTEGER, ce champ remplace la rowid et est nommé INTEGER PRIMARY KEY. Pour plus d'information, voir
[http://www.sqlite.org/lang_createtable.html#rowid](http://www.w3schools.com/sql/default.asp)

Une autre particularité de SQLite est que la valeur `NULL` est permise dans les champs de la clé primaire. Il est donc
recommandé d'utiliser la contrainte `NOT NULL` sur les champs de la clé primaire.

### Clé naturelle ou artificielle?

Dans la table `Autos2` ci-haut, nous avons utilisé l'année et le modèle comme étant la clé. Un clé qui est dérivée de
donnés se trouvant déjà dans la table est appelée une clé **naturelle**.

Dans la table `Autos`, nous avons utilisé un entier qui ne représente rien. C'est une clé **artificielle** (surrogate) .

Certains diront qu'il faut toujours utiliser une clé artificielle, alors que d'autre utiliseront des clés naturelles. Il
peut parfois être difficile d'avoir une clé naturelle . Par exemple, pour identifier un étudiant nous utiliserons son
DA... est-ce vraiment une clé naturelle? Et si non, que serait une clé naturelle pour un étudiant?

Est-ce que le numéro d'assurance maladie est une clé naturelle ou artificielle?

C'est à votre choix, selon le type de BD. Mais l'important c'est d'être constant. Nous verrons plus tard certaines
raisons d'aller vers un modèle ou l'autre.

### Autres contraintes à connaitre pour le cours

Si vous reprenez le diagramme de
[https://www.sqlite.org/lang_createtable.html](http://www.w3schools.com/sql/default.asp)
voici quelques contraintes qu'il vous faudra connaitre dans le cadre de ce cours. Elles se trouvent sous
`create-table-stmt/column-def/column-constraint`

#### Not Null

Cette contrainte de champ permet d'indiquer qu'on ne veut pas permettre d'avoir une valeur null dans cette colonne.

Notez qu'il y a une clause additionnelle s'appelant « conflict clause ». Nous ne l'étudierons pas pour l'instant et
utiliserons la valeur par défaut qui est de ne rien mettre.

#### Default

Cette contrainte de champs permet d'indiquer la valeur qui sera insérée si l'usager ne met pas de valeur lors du
`INSERT` (que nous verrons plus tard).

#### Unique

Cette contrainte permet d'indiquer que les valeurs de ce champ, ou d'un ensemble de champs, doit être unique parmi les
enregistrements. Cette contrainte, comme primary key, peut être appliquée à un champ unique via une contrainte de
champs, ou à un ensemble de champs via une contrainte de table.

Nous verrons d'autres contraintes plus tard.


Insert et delete
================

INSERT
------

Maintenant que nous avons des tables, il faut mettre des données dans celle-ci.

La commande pour insérer des entrées dans une table est INSERT.

[http://www.sqlite.org/lang_insert.html](http://www.w3schools.com/sql/default.asp)

Exemples :

````sql
INSERT INTO Autos
    ('Id', 'Nom', 'Prix', 'Couleur')
VALUES (1, 'Audi', 52642, 'bleu');
-- ou
INSERT INTO Autos
VALUES (1, 'Audi', 52642, 'bleu');
````

La première forme est celle recommandée. Pourquoi d'après-vous?

En spécifiant le nom des colonnes, on s'assure que les données seront insérées dans la bonne. Imaginez qu'on change la
définition de la table en inversant les colonnes Nom et Couleur (et oui, c'est possible). La deuxième forme insérera
alors Audi dans la colonne Couleur, et bleu dans la colonne Nom.

Tel qu'indiqué précédemment, il ne faut jamais présumer de l'ordre des données lorsqu'on fait affaire avec une BD. Il
faut toujours être le plus explicite possible afin d'éviter des bugs à long terme.

Dans le cadre de ce cours, nous n'utiliserons pas les autres formes de cette commande.

Pour insérer plusieurs lignes à la fois, il est aussi possible d'utiliser cette syntaxe:

```sql
INSERT INTO Autos ('Id', 'Nom', 'Prix', 'Couleur')
VALUES (1, 'Audi', 52642, 'bleu'),
       (2, 'Jetta', 25666, 'rouge'),
       (3, 'Soul', 18881, 'jaune');
```

### Delete

Pour effacer un enregistrement, la commande est DELETE.

La syntaxe complète : [http://www.sqlite.org/lang_delete.html](http://www.w3schools.com/sql/default.asp)

#### Exemples

````sql
DELETE
FROM Autos
WHERE Id = '1';
````

Nous verrons qu'il est possible que le DELETE ne puisse s'exécuter s'il y a des contraintes de clés étrangères qui ne
sont pas respectées
(nous verrons ce concept plus tard).


Commit
------

Aucun changement ne peut être effectué à la BD s'il n'est pas dans une transaction. Toute commande qui change la BD (
c.à.d: à peu près toutes les commandes sauf le `SELECT`) va automatiquement créer une transaction s'il y en a pas déjà
une de commencée. Afin de terminer une transaction, il faut faire un `COMMIT` pour que l'information soit écrite dans la
BD.

[http://www.sqlite.org/lang_transaction.html](http://www.w3schools.com/sql/default.asp)

Il faut donc faire un `COMMIT` après chaque insert. Mais ce `COMMIT` est quelques fois automatique.

Dans l'interface texte de sqlite3, le commit est fait automatiquement après le insert.

Dans l'interface GUI SQLiteStudio, le commit doit être fait manuellement lorsqu'on insère via l'interface graphique;
mais est fait automatiquement dans l'interface texte.


Drop Table
----------

La commande pour détruire une table est : `DROP TABLE`.

[http://www.sqlite.org/lang_droptable.html](http://www.w3schools.com/sql/default.asp)

La clause `IF EXISTS` permet de ne pas afficher un message d'erreur si jamais on essaie d'effacer une table qui n'existe
pas. Nous verrons que c'est utile en programmation.

Il est à noter qu'il se peut qu'il y ait des règles qui vont empêcher d'effacer la table. Nous verrons ces règles plus
tard.

------------------------------------------------------------------------

Notes écrites par Benoit Desrosiers, modifiées par Denis Rinfret.
