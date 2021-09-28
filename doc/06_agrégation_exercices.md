## Exercices : agrégation

Téléchargez la bd
[EtudiantProgramme.sqlite](bds/EtudiantProgramme.sqlite.zip)

![DEAEtudiantProgramme](images/DEAEtudiantProgramme.png)

Ne vous occupez pas des deux tables additionnelles, nous nous en servirons dans
un exercice plus tard.

Effectuez les requêtes suivantes :

1. Quelle est la moyenne de chaque étudiant ? Affichez le nom et sa moyenne
   globale.

<details>
    <summary>Réponse</summary>  

```sql
SELECT e.Nom, AVG(n.Note)
FROM Etudiants e
         INNER JOIN Etudiants_Cours n ON e.DA = n.EtudiantsDA
GROUP BY e.nom;
```

</details>

2. Quelle est la moyenne pour le cours `420BD1` ? Affichez le nom du cours et la
   moyenne.

<details>
    <summary>Réponse</summary>

```sql
SELECT c.Nom, AVG(n.Note)
FROM "Cours" c
         INNER JOIN Etudiants_Cours n ON c.Id = n.CoursId
WHERE c.Id = '420BD1'
GROUP BY c.Nom;
```

</details>

3. Quelle est la moyenne pour tous les cours ? Affichez le nom du cours et la
   moyenne. Si un cours n'a pas d'étudiants, il **ne** **doit**
   **pas** être listé.

<details>
    <summary>Réponse</summary>  

```sql
SELECT c.Nom, AVG(n.Note)
FROM Cours c
         INNER JOIN Etudiants_Cours n ON c.Id = n.CoursId
GROUP BY c.Nom;
```

</details>

4. Quelle est la moyenne pour tous les cours ? Affichez le nom du cours et la
   moyenne. Si un cours n'a pas d'étudiants, il **doit** être listé

<details>
    <summary>Réponse</summary>  

```sql
SELECT c.Nom, AVG(n.Note)
FROM Cours c
         LEFT OUTER JOIN Etudiants_Cours n ON c.Id = n.CoursId
GROUP BY c.Nom;
```

</details>

5. Combien d'étudiants y a-t-il par cours ? Affichez le nom du cours et le
   nombre
   d'étudiants. Un cours sans étudiants doit afficher 0.

<details>
    <summary>Réponse</summary>  

```sql
SELECT c.Nom, COUNT(DISTINCT n.EtudiantsDa)
FROM Cours c
         LEFT OUTER JOIN Etudiants_Cours n ON c.Id = n.CoursId
GROUP BY c.Nom;
```

</details>

6. Quels sont les étudiants n'ayant pas reçu leur note dans un cours ? Affichez
   le nom de l'étudiant et le nom du cours. Je dois pouvoir différencier le nom
   de l'étudiant du nom du cours. Les étudiants inscrits à aucun cours n'ont pas
   besoin d'être listés.

<details>
    <summary>Réponse</summary>  

```sql
SELECT e.Nom AS 'Etudiant', c.Nom AS 'Cours'
FROM Etudiants e
         INNER JOIN Etudiants_Cours ec ON e.DA = ec.EtudiantsDa
         INNER JOIN Cours c ON ec.CoursId = c.Id
WHERE ec.Note IS NULL;
```

</details>

7. Quelle est la moyenne de chaque étudiant par programme ? Affichez le nom du
   programme, le nom de l'étudiant et sa moyenne. Les programmes sans étudiants
   doivent être affichés.

<details>
    <summary>Réponse</summary>  

```sql
SELECT p.Nom AS Programme, e.Nom AS Etudiant, AVG(n.Note)
FROM Programmes p
         LEFT OUTER JOIN Etudiants e ON p.Id = e.ProgrammesId
         LEFT OUTER JOIN Etudiants_Cours n ON e.DA = n.EtudiantsDa
GROUP BY p.Nom, e.Nom;
```

</details>

8. Quels sont les programmes ayant des étudiants ? Listez seulement le nom du
   programme, sans répétition.

<details>
    <summary>Réponse</summary>  

```sql
SELECT DISTINCT p.Nom
FROM Programmes p
         LEFT OUTER JOIN Etudiants e ON p.Id = e.ProgrammesId
WHERE e.ProgrammesId IS NOT NULL;
```

ou

```sql
SELECT DISTINCT p.Nom
FROM Programmes p
         INNER JOIN Etudiants e ON p.Id = e.ProgrammesId;
```

</details>

9. Quels sont les étudiants ayant une moyenne globale supérieure à 75 ? Affichez
   le nom de l'étudiant et sa moyenne.

<details>
    <summary>Réponse</summary>  

```sql
SELECT e.Nom, AVG(n.Note)
FROM Etudiants e
         INNER JOIN Etudiants_Cours n ON e.DA = n.EtudiantsDA
GROUP BY e.nom
HAVING AVG(n.Note) > 75;
```

</details>

10. Quel est l'étudiant avec la plus haute moyenne ? Affichez le nom et sa
    moyenne.

<details>
    <summary>Réponse</summary>  

```sql
SELECT e.Nom, avg(n.note)
FROM Etudiants e
         LEFT OUTER JOIN Etudiants_Cours n ON e.DA = n.EtudiantsDA
GROUP BY e.Nom
ORDER BY avg(n.note) DESC
LIMIT 1;
```

</details>

11. Combien d'étudiants y a-t-il par programme ? Un programme sans étudiants
    doit afficher 0. Affichez les programmes par ordre décroissant du nombre
    d'étudiants.

<details>
    <summary>Réponse</summary>  

```sql
SELECT p.Nom, COUNT(e.Nom)
FROM Programmes p
         LEFT OUTER JOIN Etudiants e ON p.Id = e.ProgrammesId
GROUP BY p.Nom
ORDER BY COUNT(e.Nom) DESC;
```

</details>

12. Quels sont les programmes ayant plus de 3 étudiants ? Afficher le programme
    et le nombre d'étudiants.

<details>
    <summary>Réponse</summary>  

```sql
SELECT p.Nom, COUNT(e.Nom)
FROM Programmes p
         INNER JOIN Etudiants e ON p.Id = e.ProgrammesId
GROUP BY p.Nom
HAVING COUNT(e.Nom) > 3;
```

</details>

