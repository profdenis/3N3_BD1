# La normalisation

La normalisation correspond au processus d'organisation des données dans une
base de données. Ce processus comprend la création de tables et l'établissement
de relations entre celles-ci conformément à des règles conçues à la fois pour
protéger les données et pour rendre la base de données plus flexible grâce à
l'élimination de la redondance et des dépendances incohérentes.
(source : [http://support.microsoft.com/kb/283878/fr](http://support.microsoft.com/kb/283878/fr))

Il existe plusieurs règles pour faire l'organisation de l'information. Ces
règles sont connues sous le nom de « forme normale ». Nous étudierons les 3
premiers niveaux de forme normale. Il y en a d'autres, plus complexes, mais en
général une BD en 3<sup>e</sup> forme normale est habituellement assez
structurée pour la plupart des applications.

Dans le cadre de BD1, vous ne verrez que la théorie. Nous ne ferrons pas
d'exercices de normalisation. Lors de la conception de votre bd pour votre
travail de session, je vous aiderai à la concevoir.

## Première forme normale (1FN)

### Définition

La définition originale de la 1FN donnée par Codd en 1971 est la suivante :

    Une relation est en première forme normale si aucun de ses
    domaines ne peut contenir des éléments qui soient eux-mêmes des
    ensembles. Une relation qui n'est pas en première forme normale est
    dite non-normalisée

Relation dont tous les attributs :

- contiennent une valeur scalaire (les valeurs ne peuvent pas être divisées en
  plusieurs sous-valeurs dépendant également individuellement de la clé
  primaire)
- contiennent des valeurs non répétitives (le cas contraire consiste à mettre
  une liste dans un seul attribut).
- sont constants dans le temps (utiliser par exemple la date de naissance plutôt
  que l'âge).

Le non-respect des deux premières conditions de la 1FN rend plus lente la
recherche parmi les données parce qu'il faut analyser le contenu des attributs.
La troisième condition quant à elle évite qu'on doive régulièrement mettre à
jour les données.

### Règles

- Éliminer la répétition de groupes dans les différentes tables.
- Créer une table distincte pour chaque jeu de données connexes.
- Identifier chaque jeu de données connexes à l'aide d'une clé primaire.

### Exemple

Un étudiant est inscrit à plusieurs cours. Si nous mettions le sigle du cours
dans la table Etudiants, il faudrait donc qu'il y ait autant de colonnes que le
maximum de cours auxquels l'étudiant peut s'inscrire. Cela créerait donc des
colonnes vides la plupart du temps, car un étudiant n'est pas nécessairement (et
rarement) inscrit au maximum de cours qu'il peut prendre.

De plus, si la direction décide que l'on peut maintenant suivre 1 cours de plus,
il faudrait changer la table pour augmenter ce maximum. Il est aussi difficile
de trouver les cours auxquels un étudiant est inscrit :
est-ce dans Cours1, 2 ou 3 ?

Pour illustrer la règle 1 de la 2<sup>e</sup> définition, imaginez que le Nom
contiendrait le prénom et le nom de la personne. Comment faire pour trier les
résultats d'un select par le nom ou par le prénom. Cela devrait se faire par
l'application qui devrait décomposer le champ en plusieurs composants.

La règle 3 pourrait s'illustrer en ajouter un champ Age de l'étudiant dans
lequel on mettrait son âge au lieu de sa date de naissance. Ce champ devrait
donc être constamment mis à jour.

Pour des raisons de simplicité (et d'espace), je n'ai pas mis ces 2 dernières
informations dans mes exemples.

|**DA**    |**Nom**    |**CoursId1**    |**NomDeCours1**  | **CoursId2**    |**NomDeCours2** |**CoursId3**    |**NomDeCours3** |
---------------|---------------|-------------------|------------|-------------|-----------|----------------|---------------|
|123      | Benoit |    420BD1  |        BD1    |            420PRA   |       Prog1  |                 |        |
|345   |    George |    420CN1   |       Web1  |             420BD1 |         BD1  |              420PRA  |        Prog1 |

**La solution ** : mettre les cours dans une autre table, avec un enregistrement
par étudiant/cours. De cette façon, il n'y pas de perte d'espace, ni aucune
contrainte reliée au nombre max de cours.

Table `Etudiants`

**DA** |  **Nom**
--------|---------
123| Benoit 
345| George

Table `CoursInscrit`

**DA** |  **CoursId** |  **NomDuCours**
--------|-------------|----------------
123 |420BD1 |BD1 
123 |420PRA |Prog1 
345 |420CN1 |Web1 
345 |420BD1 |BD1 
345| 420PRA |Prog1
  
## Deuxième forme normale (2FN)

### Définition

Les attributs d'une relation sont divisés en deux groupes : le premier groupe
est composé de la clé (un ou plusieurs attributs). Le deuxième groupe est
composé des autres attributs (éventuellement vide). La deuxième forme normale
stipule que tout attribut du deuxième groupe ne peut dépendre d'un
sous-ensemble (strict) d'attribut(s) du premier groupe.

En d'autres mots : « Un attribut non-clé ne doit pas dépendre d'une partie de la
clé ».

### Règles

- la table doit être en 1FN
- Créer des tables distinctes pour les jeux de valeurs qui s'appliquent à
  plusieurs enregistrements.
- Établir une relation entre ces tables à l'aide d'une clé étrangère.

### Exemple

Dans l'exemple ci-haut, si le nom du cours 420PRA change pour « Programmation 1
», il faut le changer sur plusieurs enregistrements. Cela peut causer des
problèmes d'intégrité : si je le change à une place, mais oublie de le changer à
l'autre, quelle valeur est la bonne ????

La cause de ce problème est que NomDuCours dépend de CoursId, mais pas de DA.

De plus, qu'advient-il d'un cours lorsqu'il n'y a pas d'étudiants d'inscrit ? Où
sont conservés son code et son nom ?

La 2<sup>e</sup> forme normale oblige un champ à dépendre uniquement de la clé 
primaire
de la table, et non pas d'une sous-partie de celle-ci. Ici, la clé primaire est
DA/CoursId, et l'info sur le cours ne dépend que de CoursId.

La solution : envoyer l'information qui ne dépend pas de la clé au complet dans
une autre table où la clé sera la partie de la clé dont cette information
dépend. Ici, le NomDuCours dépend du CoursId.

Les tables résultantes seront donc :

Table `CoursInscrit`

**DA**  | **CoursId**
--------|--------
123| 420BD1 
123 |420PRA 
345 |420CN1 
345 |420BD1 
345 |420PRA

Table `Cours`

**CoursId** |  **NomDuCours**
-------------|----------------
420BD1 |BD1 
420PRA |Prog1 
420CN1 |Web1


De cette façon, si le nom du cours change, il suffit de le changer à un endroit.

## Troisième forme normale 

### Définition

Les attributs d'une relation sont divisés en deux groupes : le premier groupe
est composé de la clé (un ou plusieurs attributs). Le deuxième groupe est
composé des autres attributs (éventuellement vide). La troisième forme normale
stipule que tout attribut du deuxième groupe ne peut dépendre que d'un
sous-ensemble (strict) d'attribut(s) du deuxième groupe.

En d'autres termes : « Un attribut non-clé ne dépend pas d'un ou plusieurs
attributs ne participant pas à la clé ».

### Règles

- Éliminer les champs qui ne dépendent pas de la clé.

### Exemple

Reprenons la table Etudiants définie lors de la 1FN, et ajoutons l'adresse 
de l'étudiant

Table `Etudiants`

  
**DA** |  **Nom** |  **Adresse**     |     **Ville**  | **Province**
--------|---------|--------------------|-----------|--------------
123| Benoit| 123 route rurale 1| Drummond| Québec 
345| George |34 St-Georges| Drummond | Québec

Bien que la ville est la province soient répétitives, elles sont quand même
dépendantes uniquement de la clé (DA). Mais la province dépend de la Ville.

Pour être en 3FN, il faut donc séparer la Province de cette table.

  
**DA**  | **Nom** |  **Adresse**      |    **Ville**
--------|---------|--------------------|-----------
123 |Benoit |123 Route rurale 1 |Drummond 
345 |George |34 St-Georges |Drummond

Table `Villes`

**Ville** |  **Province**
-----------|--------------
Drummond | Québec


Question : quel est le problème avec le fait d'avoir utilisé le nom de la ville
comme clé primaire de la table Villes ?


<details>
    <summary>Réponse</summary>  

Plusieurs villes peuvent avoir le même nom. Il faudrait donc utiliser un ID et
mettre le nom de la vielle en tant que champ dans la table.

</details>

Il existe 3 autres niveaux de FN, mais nous ne les verrons pas dans le cadre de
ce cours.

Tel qu'indiqué précédemment, vous n'aurez pas à normaliser des tables. Par
contre, il est grandement recommandé de comprendre cette notion afin de
comprendre la raison de certains problèmes qui pourront vous arriver lors du
développement de votre application.

 
