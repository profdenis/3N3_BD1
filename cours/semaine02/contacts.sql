-- sans AUTOINCREMENT
DROP TABLE contacts;
CREATE TABLE contacts
(
    id        INTEGER PRIMARY KEY,
    nom       TEXT NOT NULL,
    telephone TEXT,
    courriel  TEXT
);

INSERT INTO contacts
VALUES (1, 'Denis', NULL, 'denis.rinfret@cegepdrummond.ca');

INSERT INTO contacts (id, nom, telephone, courriel)
VALUES (2, 'Alice', '555-555-5555', NULL);

INSERT INTO contacts (id, nom)
VALUES (3, 'Bob');


-- avec AUTOINCREMENT
DROP TABLE contacts;
CREATE TABLE contacts
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    nom       TEXT NOT NULL,
    telephone TEXT,
    courriel  TEXT
);

INSERT INTO contacts (nom, courriel)
VALUES ('Denis', 'denis.rinfret@cegepdrummond.ca');

INSERT INTO contacts (nom, telephone)
VALUES ('Alice', '555-555-5555');

INSERT INTO contacts (nom)
VALUES ('Bob');