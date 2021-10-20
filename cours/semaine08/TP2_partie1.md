# 420-3N3-DM Exploitation d'un système de gestion de base de données

## Travail Pratique 2 -- Première Partie

### Requêtes SQL sur la BD Sakila

#### Remise : 7 novembre (avant minuit)

Répondez aux requêtes suivantes sur la base de données Sakila.

1. Trouvez tous les clients vivant au Canada. Donnez le prénom, le nom de
   famille et le courriel de ces clients. Triez en ordre croissant de nom de
   famille et ensuite de prénom.
2. Combien d'employés vivent au Canada ? Renommez la colonne contenant ce nombre
   correctement.
3. Trouvez la ville et le pays de la cliente avec ce courriel :
   `SHARON.ROBINSON@sakilacustomer.org`
4. Trouvez le nombre de clients par pays.
5. Trouvez les clients qui n'ont jamais loué de films. Donnez le prénom, le nom
   de famille et le courriel de ces clients.
6. Trouvez les clients qui ont des locations qui n'ont pas été retournées.
   Donnez le prénom, le nom de famille et le courriel de ces clients.
7. Trouvez le nombre de locations par client. Triez selon le nombre décroissant
   de locations. Conservez seulement les clients qui ont au moins 30 locations.
   Donnez le `customer_id`, le courriel et le nombre de locations de chaque
   client.
8. Trouvez les clients qui ont moins de 15 locations. Donnez seulement le
   `customer_id` et le courriel de chaque client.
9. Trouvez le montant total de tous les paiements effectués. Arrondissez la
   somme à 2 décimales près.
10. Trouvez le montant total de tous les paiements effectués à chaque jour. Les
    jours sans aucun paiement ne doivent pas être inclus. Vous pouvez utiliser
    la fonction `date` pour extraire la date d'une colonne de type
    `timestamp`. Arrondissez la somme à 2 décimales près.
11. Trouvez le nombre de fois que le film `CONNECTION MICROCOSMOS` a été loué.
12. Trouvez les films qui n'ont jamais été loués. Donnez le
    `film_id` et le titre de chaque film.
13. Trouvez le nombre de fois que chaque film a été loué. Donnez le
    `film_id` et le titre de chaque film en plus du nombre de locations. Triez
    en ordre décroissant du nombre de locations. N'oubliez pas les films qui 
    n'ont jamais été loués. Assurez-vous que vos résultats concordent avec 
    ceux de la question précédente.
14. Trouvez la durée moyenne des films. Présentez les résultats sur 3 
    colonnes (chacune des nombres entiers) : `heures`, `minutes` et `secondes`.
15. 