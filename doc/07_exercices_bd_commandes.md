Vous devez créer la BD suivante:

![420-bd1-dea_commandes](images/420-BD1-DEA_Commandes.png)

Si vous avez bien créé la bd, vous devriez être capable d'y insérer les
enregistrements suivants.

Si vous obtenez une erreur. Essayez de la trouver. En dernier recours voici la
solution.

<details>
    <summary>Réponse</summary>  

```sql
--
-- commandesTableV1.sql
--
--
-- creation des tables
--
DROP TABLE IF EXISTS clients;
CREATE TABLE clients
(
    noCl      INTEGER PRIMARY KEY,
    nom       TEXT,
    adresse   TEXT,
    ville     TEXT,
    etat      TEXT,
    CP        TEXT,
    codeReg   INTEGER,
    tel       INTEGER,
    vendeur   INTEGER,
    limCredit INTEGER
);

DROP TABLE IF EXISTS produits;
CREATE TABLE produits
(
    noPd   INTEGER PRIMARY KEY,
    descPd TEXT
);

DROP TABLE IF EXISTS prix;
CREATE TABLE prix
(
    noPd      INTEGER,
    prixLst   INTEGER,
    prixMin   INTEGER,
    dateDebut TEXT,
    dateFin   TEXT,
    PRIMARY KEY (noPd, dateDebut),
    FOREIGN KEY (noPd) REFERENCES produits (noPd)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS commandes;
CREATE TABLE commandes
(
    noCm      INTEGER PRIMARY KEY,
    dateCm    TEXT,
    noCl      INTEGER,
    dateEnvoi TEXT,
    total     INTEGER,
    FOREIGN KEY (noCL) REFERENCES clients (noCl)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS items;
CREATE TABLE items
(
    noCm       INTEGER,
    noIt       INTEGER,
    noPd       INTEGER,
    prixActuel INTEGER,
    qte        INTEGER,
    total      INTEGER,
    PRIMARY KEY (noCm, noIt),
    FOREIGN KEY (noPd) REFERENCES produits (noPd)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (noCm) REFERENCES commandes (noCm)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
```

</details>

1. Sélectionner les commandes entre les dateCM suivantes :
   `19900701` et `19900831`

Sur cette liste doit apparaître tous les attributs.

<details>
    <summary>Résultats</summary>  

```sql
noCm        dateCm      noCl        dateEnvoi   total
----------  ----------  ----------  ----------  ----------
540         19900715    202         19900717    861.2
541         19900808    203         19900818    400
542         19900811    208         19900823    2409
605         19900714    106         19900730    8374
606         19900714    100         19900730    3.4
607         19900718    104         19900718    5.6
608         19900725    104         19900725    35.2
609         19900801    100         19900815    102.5
```

</details>

<details>
    <summary>Réponse</summary>  

    ```sql
    select *
    from commandes
    where dateCm between '19900701' and '19900831';
    ```

</details>

2. Sélectionner les commandes du client 104 pour l'année 1991. Sur cette liste
   doit apparaître les attributs suivants : `noCm`, `dateCm`,
   `noCl`

<details>
    <summary>Résultats</summary>  

```
noCm        dateCm      noCl      
----------  ----------  ----------
612         19910115    104       
619         19910222    104
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select noCm, dateCm, noCl
from commandes
where noCl = 104
  and dateCm like '1991%';
```

</details>

3. Sélectionner les clients dont le nom comporte le mot *SPORT*. Sur cette liste
   doit apparaître les attributs suivants : `nom`, `noCl`

<details>
    <summary>Résultats</summary>  

```
nom         noCl      
----------  ----------
JOCKSPORTS  100       
TKB SPORT   101       
K + T SPOR  105       
WOMENS SPO  107       
STADIUM SP  201       
REBOUND SP  203       
AL AND BOB  208       
ALL SPORT   212       
GOOD SPORT  213       
BOB FAMILY  215       
VELO SPORT  223 
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select nom, noCl
from clients
where upper(nom) like upper('%sport%');
```

</details>

4, Sélectionner les produits dans la liste suivante : `102130`, `101860`,
`105125`. Sur cette liste doit apparaître tous les attributs.

<details>
    <summary>Résultats</summary>  

```sql
noPd        descPd          
----------  ----------------
101860      SP TENNIS RACKET
102130      RH: "GUIDE TO TE
105125      YELLOW JERSEY WA
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select *
from produits
where noPd in (102130, 101860, 105125);
```

</details>

5. Donner la liste des produits commandés sans répétition. Sur cette liste doit
   apparaître les attributs suivants : `noPd`

<details>
    <summary>Résultats</summary>  

```
noPd      
----------
100861    
100890    
100860    
200376    
100870    
101863    
102130    
100871    
101860    
200380    
105123    
105124    
102136    
105127    
105125    
104350    
104351    
104362    
104352    
104360    
102134    
104361    
103120    
103131    
103141    
103121    
103130    
103140    
102132
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select distinct noPd
from items;
```

</details>

6. Trier les prix des produits suivant l'ordre croissant des produits et l'ordre
   décroissant des dates par produit. Sur cette liste doit apparaître les
   attributs suivants : `noPd`,
   `dateDebut`, `prixLst`

<details>
    <summary>Résultats</summary>  

```
noPd        dateDebut   prixLst   
----------  ----------  ----------
100860      19900601    35        
100860      19900101    32        
100860      19890101    30        
100861      19900601    45        
100861      19900101    42        
100861      19890101    39        
100870      19900101    2.8            
...     
105127      19901115    6         
105128      19901115    10        
200376      19901115    2.4       
200380      19901115    4    
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select noPd, dateDebut, prixLst
from prix
order by noPd, dateDebut desc;
```

</details>

7. Trouver le client de la commande 601. Sur cette liste doit apparaître les
   attributs suivants: `noCm`, `dateCm`,
   `noCl`, `tel`

<details>
    <summary>Résultats</summary>  

```
noCm        dateCm      noCl        tel       
----------  ----------  ----------  ----------
601         19900501    106         3649777
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select noCm, dateCm, cm.noCl, tel
from commandes cm
         inner join clients cl on cm.noCl = cl.noCl
where noCm = 601;
```

</details>

8. Trouver les produits de la commande 601. Sur cette liste doit apparaître les
   attributs suivants : `noIt`, `noPd`, `qte`

<details>
    <summary>Résultats</summary>  

```
noIt        noPd        qte       
----------  ----------  ----------
1           200376      12        
2           100860      1 
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select noIt, noPd, qte
from items it
where it.noCm = 601;
```

</details>

9. Trouver les descriptions des produits de la commande 601. Sur cette liste
   doit apparaître les attributs suivants : `noCm`, `noPd`,
   `descPd`, `prixActuel`

<details>
    <summary>Résultats</summary>  

```
noCm        noPd        descPd                prixActuel
----------  ----------  --------------------  ----------
601         200376      SB ENERGY BAR-6 PACK  2.4       
601         100860      ACE TENNIS RACKET I   32
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select noCm, it.noPd, descPd, prixActuel
from items it
         inner join produits pd on it.noPd = pd.noPd
where noCm = 601;
```

</details>

11. Trouver la liste des prix antérieurs au prix courant pour les produits entre
    100860 et 100869. Sur cette liste doit apparaître les attributs
    suivants : `noPd`, `descPd`, `prixLst`,
    `dateDebut`, `dateFin`

<details>
    <summary>Résultats</summary>  

```
noPd        descPd               prixLst     dateDebut   dateFin   
----------  -------------------  ----------  ----------  ----------
100860      ACE TENNIS RACKET I  30          19890101    19891231  
100860      ACE TENNIS RACKET I  32          19900101    19900531  
100861      ACE TENNIS RACKET I  39          19890101    19891231  
100861      ACE TENNIS RACKET I  42          19900101    19900531
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select pd.noPd, descPd, prixLst, dateDebut, datefin
from produits pd
         inner join prix px on pd.noPd = px.noPd
where pd.noPd between 100860 and 100869
  and datefin is not null;
```

</details>

12. Trouver le client et les produits de la commande 601. Sur cette liste doit
    apparaître les attributs suivants : `cnoCm`, `dateCm`, `noCl`,
    `tel`, `noIt`, `noPd`, `prixActuel`, `qte`

<details>
    <summary>Résultats</summary>  

```
noCm        dateCm      noCl        tel         noIt        noPd        prixActuel  qte       
----------  ----------  ----------  ----------  ----------  ----------  ----------  ----------
601         19900501    106         3649777     1           200376      2.4         12        
601         19900501    106         3649777     2           100860      32          1         
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select cm.noCm,
       dateCm,
       cm.noCl,
       tel,
       noIt,
       noPd,
       prixActuel,
       qte
from commandes cm
         inner join clients cl on cm.noCl = cl.noCl
         inner join items it on cm.noCm = it.noCm
where cm.noCm = 601;
```

</details>

13. Extraire les données qui permettent de produire la commande 601. Sur cette
    liste doit apparaître les attributs suivants : `noCm`, `dateCm`, `noCl`,
    `tel`, `noIt`, `noPd`, `descPd`, `prixActuel`, `qte`

<details>
    <summary>Résultats</summary>  

```
noCm        dateCm      noCl        tel         noIt        noPd        prixActuel  qte       
----------  ----------  ----------  ----------  ----------  ----------  ----------  ----------
601         19900501    106         3649777     1           200376      2.4         12        
601         19900501    106         3649777     2           100860      32          1         
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select cm.noCm,
       dateCm,
       cm.noCl,
       tel,
       noIt,
       noPd,
       prixActuel,
       qte
from commandes cm
         inner join clients cl on cm.noCl = cl.noCl
         inner join items it on cm.noCm = it.noCm
where cm.noCm = 601;
```

</details>

14. Tous les clients de l'état 'MA' avec la liste de leurs commandes peu importe
    si le client a des commandes, selon l'ordre croissant des numéros de client
    et l'ordre décroissant des dates de commandes. Sur cette liste doit
    apparaître les attributs suivants : `noCl`, `nom`, `noCm`, `dateCm`

<details>
    <summary>Résultats</summary>  

```
noCl        nom         noCm        dateCm    
----------  ----------  ----------  ----------
202         HOOPS       571         19910802  
202         HOOPS       570         19910717  
202         HOOPS       567         19910705  
202         HOOPS       547         19901016  
202         HOOPS       544         19900911  
202         HOOPS       540         19900715  
202         HOOPS       539         19900626  
202         HOOPS       524         19900222  
202         HOOPS       511         19890817  
202         HOOPS       502         19890210  
207         FAST BREAK  561         19910420  
207         FAST BREAK  521         19891120  
207         FAST BREAK  514         19890905  
211         AT BAT                            
216         THE ALL AM                        
223         VELO SPORT  560         19910425  
223         VELO SPORT  556         19910310  
223         VELO SPORT  552         19910202  
227         THE TOUR    565         19910601      
```

Remarquez les clients 211 et 216 qui n'ont pas de commande.

</details>

<details>
    <summary>Réponse</summary>  

```sql
select cl.noCl, nom, noCm, dateCm
from clients cl
         left outer join commandes cm on cl.noCl = cm.noCl
where etat = 'MA'
order by cl.noCl, dateCm desc;
```

</details>

15. Tous les produits avec leurs commandes, peu importe si le produit a des
    commandes, selon l'ordre croissant des numéros de produits et l'ordre
    décroissant des dates de commandes. Sur cette liste doit apparaître les
    attributs suivants : `noPd`, `descPd`, `noCm`,
    `dateCm`

<details>
    <summary>Résultats</summary>  

```
noPd        descPd               noCm        dateCm    
----------  -------------------  ----------  ----------
100860      ACE TENNIS RACKET I  620         19910312  
100860      ACE TENNIS RACKET I  618         19910215  
100860      ACE TENNIS RACKET I  617         19910205  
100860      ACE TENNIS RACKET I  614         19910201  
100860      ACE TENNIS RACKET I  612         19910115  
100860      ACE TENNIS RACKET I  610         19910107  
100860      ACE TENNIS RACKET I  604         19900615  
100860      ACE TENNIS RACKET I  603         19900605  
100860      ACE TENNIS RACKET I  601         19900501  
100861      ACE TENNIS RACKET I  621         19910315  
100861      ACE TENNIS RACKET I  618         19910215  
...
105125      YELLOW JERSEY WATER  549         19901227  
105125      YELLOW JERSEY WATER  516         19890930  
105126      YELLOW JERSEY BOTTL                        
105127      YELLOW JERSEY FRAME  553         19910202  
105127      YELLOW JERSEY FRAME  549         19901227  
105127      YELLOW JERSEY FRAME  559         19901116  
105128      YELLOW JERSEY SADDL                        
200376      SB ENERGY BAR-6 PAC  578         19911119  
200376      SB ENERGY BAR-6 PAC  576         19911013  
...
200380      SB VITA SNACK-6 PAC  557         19910308  
200380      SB VITA SNACK-6 PAC  619         19910222  
200380      SB VITA SNACK-6 PAC  617         19910205  
200380      SB VITA SNACK-6 PAC  613         19910201      
```

Remarquez les produits 105126 et 105128 qui n'ont pas de commande.

</details>

<details>
    <summary>Réponse</summary>  

```sql
select pd.noPd, descPd, cm.noCm, dateCm
from produits pd
         left outer join
     (commandes cm inner join items it on cm.noCm = it.noCm)
     on pd.noPd = it.noPd
order by pd.noPd, dateCm desc;
```

</details>



16. Trouver le total de la facture 601 en multipliant le prixActuel de chaque
article par la qte.
Sur cette liste doit apparaître les attributs suivants : `total`

<details>
    <summary>Résultats</summary>  

```
total     
----------
60.8
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select sum(prixActuel*qte) as  total
from items
where noCm = 601;
```

</details>

17. Trouver le total de chaque produit vendu et ordonner selon l'ordre
décroissant des totaux.
Sur cette liste doit apparaître les attributs suivants : `noPd`, `total`

<details>
    <summary>Résultats</summary>  

```
noPd        total     
----------  ----------
100890      29688     
100860      22120     
105123      21524.0   
105124      19885     
103120      15666.2       
...    
102136      1706.6    
104361      1300      
105125      1075.0    
102134      669.8     
102132      556.75
```

</details>


<details>
    <summary>Réponse</summary>  

```sql
select noPd, sum(prixActuel*qte) as total
from items
group by noPd
order by total desc;
```

</details>

18. Trouver le total des commandes par client selon l'ordre décroissant des
totaux.
Sur cette liste doit apparaître les attributs suivants : `noCl`, `total`

<details>
    <summary>Résultats</summary>  

```
noCl        total     
----------  ----------
105         46370     
102         27348     
221         24640     
...   
223         712.8     
107         710       
222         387.2     
225         377       
101         101.4
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select cm.noCl, sum(total) as total
from commandes cm
group by cm.noCl
order by total desc;
```

</details>

19. Trouver le total des commandes par client selon l'ordre décroissant des
totaux pour les clients ayant acheté pour plus de $15000.00 .
Sur cette liste doit apparaître les attributs suivants : `noCl`, `total`

<details>
    <summary>Résultats</summary>  

```
noCl        total     
----------  ----------
105         46370     
102         27348     
221         24640     
208         21119.8   
201         16333.2   
204         15071.4
```

</details>

<details>
    <summary>Réponse</summary>  

```sql
select cm.noCl, sum(total) as "total"
from commandes cm
group by cm.noCl
having sum(total) > 15000
order by 2 desc;
```

</details>

20. Donner le total des commandes par année pour chaque client suivant l'ordre
décroissant des montants de commandes par client et suivant l'ordre croissant
des clients.
Sur cette liste doit apparaître les attributs suivants : `noCl`, `an`, `total`

<details>
    <summary>Résultats</summary>  

```
noCl        an          total     
----------  ----------  ----------
100         1991        5180      
100         1990        105.9     
101         1991        101.4     
102         1991        27068        
...     
226         1989        1174      
227         1991        4900      
228         1991        4400      
228         1989        2701
```

</details>

<details>
    <summary>Réponse</summary>  

Pour extraire l'année, vous aurez besoin de la fonction substr()

</details>

<details>
    <summary>Réponse</summary>  

```sql
select noCl, substr(dateCm, 1, 4) as an, sum(total) as total
from commandes cm
group by noCl, substr(dateCm, 1, 4)
order by noCl, total desc;
```

</details>


