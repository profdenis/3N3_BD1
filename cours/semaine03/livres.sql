PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS livres
(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    isbn     TEXT UNIQUE NOT NULL,
    n_copies INTEGER     NOT NULL DEFAULT 0,
    titre    TEXT        NOT NULL,
    edition  INTEGER     NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS clients
(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    nom      TEXT NOT NULL,
    courriel TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS commandes
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    id_client INTEGER NOT NULL REFERENCES clients (id)
);

CREATE TABLE IF NOT EXISTS commandes_livres
(
    id_commande INTEGER REFERENCES commandes (id),
    id_livre    INTEGER REFERENCES livres (id),
    n_copies    INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY (id_commande, id_livre)

);

INSERT INTO livres(isbn, titre)
VALUES ('3213123123', 'Bases de données'),
       ('7645ewr23423', 'Java');

INSERT INTO clients(nom, courriel)
VALUES ('Denis', 'asdsad@asdsad.com'),
       ('Bob', 'asdas@asd.com');

INSERT INTO commandes(id_client)
VALUES (1);

INSERT INTO commandes_livres(id_commande, id_livre, n_copies)
VALUES (1, 1, 3),
       (1, 2, 1);

INSERT INTO commandes_livres(id_commande, id_livre)
VALUES (1, 1);

UPDATE commandes_livres
SET n_copies = n_copies + 1
WHERE id_commande = 1
  AND id_livre = 1;

DELETE
FROM commandes_livres
WHERE id_commande = 1
  AND id_livre = 1;

DELETE
FROM commandes
WHERE id = 1;

SELECT *
FROM commandes
         INNER JOIN clients on commandes.id_client = clients.id;
SELECT commandes.id as id_commande, nom, courriel
FROM commandes
         INNER JOIN clients on commandes.id_client = clients.id;