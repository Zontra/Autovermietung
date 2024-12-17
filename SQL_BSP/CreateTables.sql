DROP TABLE IF EXISTS Stundenplan;
DROP TABLE IF EXISTS Raeume;
DROP TABLE IF EXISTS Pruefungen;
DROP TABLE IF EXISTS Lehrer;
DROP TABLE IF EXISTS Gegenstaende;
DROP TABLE IF EXISTS Schueler;
DROP TABLE IF EXISTS Klassen;

--Create Tables

CREATE TABLE Klassen (
    K_ID VARCHAR(10) PRIMARY KEY,
    K_Bez VARCHAR(50),
    K_S_Klaspr INT,
    K_S_Klasprstv INT,
    K_L_Klavst VARCHAR(10)
);


CREATE TABLE Schueler (
    S_SCHNR INT PRIMARY KEY,
    S_Name VARCHAR(50),
    S_Vorname VARCHAR(50),
    S_Gebdat DATE,
    S_Adresse VARCHAR(100),
    S_K_Klasse VARCHAR(10),
    FOREIGN KEY (S_K_Klasse) REFERENCES Klassen(K_ID)
);


ALTER TABLE Klassen
ADD  FOREIGN KEY (K_S_Klaspr) REFERENCES Schueler(S_SCHNR);

ALTER TABLE Klassen
ADD FOREIGN KEY (K_S_Klasprstv) REFERENCES Schueler(S_SCHNR);

ALTER TABLE Schueler
ADD FOREIGN KEY (S_K_Klasse) REFERENCES Klassen(K_ID);


CREATE TABLE Gegenstaende (
    G_ID VARCHAR(10) PRIMARY KEY,
    G_Bez VARCHAR(50)
);



CREATE TABLE Lehrer (
    L_ID VARCHAR(10) PRIMARY KEY,
    L_Name VARCHAR(50),
    L_Vorname VARCHAR(50),
    L_Gebdat DATE,
    L_Gehalt DECIMAL(10, 2),
    L_L_Chef VARCHAR(10),
    FOREIGN KEY (L_L_Chef) REFERENCES Lehrer(L_ID)
);

CREATE TABLE Pruefungen (
    P_Datum DATE,
    P_S_Kandidat INT,
    P_L_Pruefer VARCHAR(10),
    P_G_Fach VARCHAR(10),
    P_Art VARCHAR(10),
    P_Note INT,
    PRIMARY KEY (P_Datum, P_S_Kandidat, P_L_Pruefer, P_G_Fach),
    FOREIGN KEY (P_S_Kandidat) REFERENCES Schueler(S_SCHNR),
    FOREIGN KEY (P_L_Pruefer) REFERENCES Lehrer(L_ID),
    FOREIGN KEY (P_G_Fach) REFERENCES Gegenstaende(G_ID)
);


CREATE TABLE Raeume (
    R_ID VARCHAR(10) PRIMARY KEY,
    R_Plaetze INT
);

INSERT INTO Raeume (R_ID, R_Plaetze) VALUES
('B1', 22),
('B2', 24),
('LA1', 10),
('LA2', 18),
('LA3', 2);

CREATE TABLE Stundenplan (
    ST_K_Klasse VARCHAR(10),
    ST_L_Lehrer VARCHAR(10),
    ST_G_Fach VARCHAR(10),
    ST_Stunde VARCHAR(10),
    ST_R_Raum VARCHAR(10),
    PRIMARY KEY (ST_K_Klasse, ST_Stunde),
    FOREIGN KEY (ST_K_Klasse) REFERENCES Klassen(K_ID),
    FOREIGN KEY (ST_L_Lehrer) REFERENCES Lehrer(L_ID),
    FOREIGN KEY (ST_G_Fach) REFERENCES Gegenstaende(G_ID),
    FOREIGN KEY (ST_R_Raum) REFERENCES Raeume(R_ID)
);

--Inserts

INSERT INTO Lehrer (L_ID, L_Name, L_Vorname, L_Gebdat, L_Gehalt, L_L_Chef) VALUES
('B1', 'Berger', 'Alfred', '1945-03-02', 400.00, NULL),
('HA', 'Hanke', 'Gustav', '1950-12-12', 300.00, 'B1'),
('PI', 'Pirkner', 'Walter', '1955-06-22', 220.00, 'B1'),
('BE', 'Beringer', 'Alfred', '1961-07-15', 220.00, 'HA'),
('BI', 'Bilek', 'Hans', '1932-03-03', 280.00, 'HA'),
('LN', 'Lenau', 'Nikolaus', '1938-02-22', 180.00, 'HA'),
('LI', 'Lindner', 'Kristine', '1958-12-12', 300.00, 'HA'),
('PS', 'Preißl', 'Johann', '1956-07-05', 82.00, 'HA'),
('SG', 'Siegel', 'Heinz', NULL, NULL, 'HA'),
('AU', 'Auwald', 'Herbert', '1946-09-07', 150.00, 'LN'),
('MY', 'Mayer', 'Walter', '1947-04-01', 120.00, 'LN'),
('AS', 'Aschauer', 'Anton', '1961-08-19', 180.00, 'PI');

INSERT INTO Klassen (K_ID, K_Bez, K_L_Klavst) VALUES
('03TA', 'Kolleg 03ta', 'BE'),
('03TB', 'Kolleg 03tb', 'BI');

INSERT INTO Schueler (S_SCHNR, S_Name, S_Vorname, S_Gebdat, S_Adresse, S_K_Klasse) VALUES
(1, 'Adler', 'Richard', '1966-03-12', 'Gumpendorf', '03TA'),
(4, 'Kneippp', 'Sebastian', '1967-12-24', 'Fuenfhaus', '03TA'),
(16, 'Geyer', 'Walli', '1966-07-23', 'Simmering', '03TA'),
(19, 'Sitzenbleiber', 'Eusebius', '1951-02-22', 'Schweiz', '03TA'),
(22, 'Huber', 'Seppl', '1968-02-02', 'Margareten', '03TA'),
(55, 'Schulz', 'Xandl', '1964-09-03', 'Doebling', '03TB'),
(74, 'Hundertwasser', 'Friederike', '1961-02-02', 'Landstrasse', '03TA'),
(77, 'Berger', 'Balduin', '1964-03-13', 'Favoriten', '03TB'),
(84, 'Feuerstein', 'Bebbles', '1966-06-12', 'Steintal', '03TB'),
(88, 'Mayer', 'Barbara', '1965-05-23', 'Ottakring', '03TB'),
(111, 'Sandler', 'Eberhard', '1959-04-19', 'Hoechststaettpl', '03TB'),
(122, 'Graf', 'Bobby', '1962-01-01', 'Doebling', '03TA'),
(1266, 'Schlager', 'Ronnie', '1963-04-23', 'Ottakring', '03TB');

UPDATE Klassen
SET K_S_Klaspr = 1, K_S_Klasprstv = 122
WHERE K_ID = '03TA';

UPDATE Klassen
SET K_S_Klaspr = 1266, K_S_Klasprstv = 111
WHERE K_ID = '03TB';

INSERT INTO Gegenstaende (G_ID, G_Bez) VALUES
('AM', 'Mathematik'),
('BO', 'Betriebliche Org.'),
('PR', 'Programmieren'),
('PRRV', 'Prozessrechnerverb.'),
('RW', 'Rechnungswesen'),
('SEP', 'System-Einsatzplan.'),
('TDO', 'Technische Datenorg.');

INSERT INTO Pruefungen (P_Datum, P_S_Kandidat, P_L_Pruefer, P_G_Fach, P_Art, P_Note) VALUES
('1987-12-24', 55, 'LI', 'TDO', 'M', 5),
('1988-01-01', 1, 'PS', 'TDO', 'M', 1),
('1988-01-04', 1266, 'BI', 'BO', 'M', 3),
//('1988-01-12', 3, 'SG', 'TDO', 'M', 1),
('1988-01-12', 22, 'PS', 'TDO', 'M', 2),
('1988-02-06', 111, 'HA', 'AM', 'M', 4),
('1988-04-15', 19, 'SG', 'TDO', 'M', 5),
('1988-06-07', 111, 'SG', 'TDO', 'M', 1),
('1989-03-15', 1, 'AU', 'BO', '121', 2),
('1989-03-15', 22, 'AU', 'BO', '121', 4),
('1989-03-15', 111, 'SG', 'TDO', 'F', 4),
('1989-04-01', 1, 'AS', 'AM', NULL, 2),
('1989-04-01', 1, 'HA', 'AM', 'M', 4),
('1989-04-01', 4, 'AS', 'AM', NULL, 3);


INSERT INTO Stundenplan (ST_K_Klasse, ST_L_Lehrer, ST_G_Fach, ST_Stunde, ST_R_Raum) VALUES
('03TA', 'BI', 'BO', 'DI1', 'B1'),
('03TA', 'BI', 'BO', 'DI2', 'B1'),
('03TA', 'HA', 'PR', 'DI3', 'LA3'),
('03TA', 'HA', 'PR', 'DI4', 'LA3'),
('03TA', 'HA', 'PR', 'DI5', 'LA3'),
('03TA', 'B1', 'AM', 'DO1', 'B1'),
('03TA', 'B1', 'AM', 'DO2', 'B1'),
('03TA', 'BI', 'BO', 'DO3', 'B1'),
('03TA', 'BE', 'PR', 'DO4', 'LA1'),
('03TA', 'BE', 'PR', 'DO5', 'LA1'),
('03TA', 'PS', 'TDO', 'MI1', 'LA2'),
('03TA', 'PS', 'TDO', 'MI2', 'LA2'),
('03TA', 'PS', 'TDO', 'MI3', 'B1'),
//('03TA', 'BI', 'RWO', 'MI4', 'B1'),
//('03TA', 'BI', 'RWO', 'MI5', 'B1'),
('03TA', 'LI', 'TDO', 'MO1', 'B1'),
('03TA', 'LI', 'TDO', 'MO2', 'B1'),
('03TA', 'LI', 'TDO', 'MO3', 'B1'),
('03TA', 'BE', 'SEP', 'MO4', 'B1'),
('03TA', 'BE', 'SEP', 'MO5', 'B1'),
('03TA', 'PS', 'PR', 'MO7', 'LA1'),
('03TA', 'PS', 'PR', 'MO8', 'LA1'),
('03TB', 'PS', 'PR', 'DI1', 'LA1'),
('03TB', 'PS', 'PR', 'DI2', 'LA1'),
('03TB', 'HA', 'PR', 'DI3', 'LA2'),
('03TB', 'HA', 'PR', 'DI4', 'LA2'),
('03TB', 'HA', 'PR', 'DI5', 'LA2'),
('03TB', 'PS', 'TDO', 'DO1', 'B2'),
('03TB', 'PS', 'TDO', 'DO2', 'B2'),
('03TB', 'B1', 'AM', 'DO3', 'B2'),
('03TB', 'B1', 'AM', 'DO4', 'B2'),
('03TB', 'BI', 'RW', 'MI1', 'B2'),
('03TB', 'BI', 'RW', 'MI2', 'B2'),
('03TB', 'BI', 'RW', 'MI3', 'B2'),
('03TB', 'LI', 'TDO', 'MI4', 'B2'),
('03TB', 'LI', 'TDO', 'MI5', 'B2'),
('03TB', 'BI', 'BO', 'MO1', 'B2'),
('03TB', 'BI', 'BO', 'MO2', 'B2'),
('03TB', 'BI', 'BO', 'MO3', 'B2'),
('03TB', 'BE', 'SEP', 'MO4', 'B2'),
('03TB', 'BE', 'SEP', 'MO5', 'B2');
