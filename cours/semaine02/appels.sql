CREATE TABLE appels
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    telephone  TEXT NOT NULL DEFAULT 'inconnu',
    date       TEXT NOT NULL,
    heure      TEXT NOT NULL,
    contact_id INTEGER REFERENCES contacts (id)
);

INSERT INTO appels (date, heure)
VALUES ('2021-09-02', '10:00');

INSERT INTO appels (telephone, date, heure, contact_id)
VALUES ('555-555-5555', '2021-09-01', '9:00', 2);

INSERT INTO appels (telephone, date, heure, contact_id)
VALUES ('555-555-5555', '2021-09-01', '9:00', 8);

DELETE
FROM appels
WHERE id = 4;


-- avec date et heure par défaut
DROP TABLE appels;
CREATE TABLE appels
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    telephone  TEXT DEFAULT 'inconnu' NOT NULL,
    date       TEXT DEFAULT CURRENT_DATE NOT NULL,
    heure      TEXT DEFAULT CURRENT_TIME NOT NULL,
    contact_id INTEGER REFERENCES contacts (id)
);

INSERT INTO appels (telephone) VALUES ('444-444-4444');
INSERT INTO appels DEFAULT VALUES ;