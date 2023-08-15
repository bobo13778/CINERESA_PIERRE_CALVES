/*Supprime la version précédente de la base de données si elle existe et crée une base vierge*/

DROP DATABASE IF EXISTS CINERESA;
CREATE DATABASE CINERESA CHARACTER SET utf8;

/*Creation des tables*/

CREATE TABLE UTILISATEURS
(
  id CHAR(36) NOT NULL PRIMARY KEY,
  prenom VARCHAR(250) NOT NULL,
  nom VARCHAR(250) NOT NULL,
  email VARCHAR(250) NOT NULL UNIQUE,
  /*Password hashé généré par BCRYPT stocké*/
  password VARCHAR(60) NOT NULL
) engine=INNODB;

CREATE TABLE ADMINS
(
  utilisateurId CHAR(36) NOT NULL PRIMARY KEY,
  FOREIGN KEY (utilisateurId) REFERENCES UTILISATEURS(id)
) engine=INNODB;

CREATE TABLE TARIFS
(
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(250) NOT NULL,
  prix DECIMAL(5,2) NOT NULL
) engine=INNODB;

/*Création d'une table intermédiaire pour attribuer un tarif à chaque utilisateur, succeptible d'être modifié par la suite*/
CREATE TABLE TARIFUTILISATEURS
(
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  utilisateurId CHAR(36) NOT NULL,
  tarifId INT(10) NOT NULL,
  FOREIGN KEY(utilisateurId) REFERENCES UTILISATEURS(id),
  FOREIGN KEY(tarifId) REFERENCES TARIFS(id)
) engine=INNODB;

CREATE TABLE CINEMAS
(
  id CHAR(36) NOT NULL PRIMARY KEY,
  nom VARCHAR(250) NOT NULL,
  adresse VARCHAR(250) NOT NULL,
  nbSalles INT(10) NOT NULL,
  /*Référence au seul utilisateur par cinéma capable d'ajouter des séances (s'il existe)*/
  superUtilisateurId CHAR(36) UNIQUE, 
  FOREIGN KEY(superUtilisateurId) REFERENCES UTILISATEURS(id)
) engine=INNODB;

CREATE TABLE SALLES
(
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(250) NOT NULL,
  nbSieges INT(10) NOT NULL,
  cinemaId CHAR(36) NOT NULL,
  FOREIGN KEY(cinemaId) REFERENCES CINEMAS(id) ON DELETE CASCADE
) engine=INNODB;

CREATE TABLE FILMS
(
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(250) NOT NULL,
  description TEXT NOT NULL,
  realisateur VARCHAR(250) NOT NULL,
  /*Durée à renseigner en heures,minutes*/
  duree DECIMAL(5,2)
) engine=INNODB;

CREATE TABLE SEANCES
(
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  salleId INT(10)NOT NULL,
  filmId INT(10) NOT NULL,
  dateHoraire DATETIME NOT NULL,
  FOREIGN KEY(salleId) REFERENCES SALLES(id) ON DELETE CASCADE,
  FOREIGN KEY(filmId) REFERENCES FILMS(id) ON DELETE CASCADE
) engine=INNODB;

CREATE TABLE RESERVATIONS
(
  utilisateurId CHAR(36) NOT NULL,
  seanceId INT(10) NOT NULL,
  /*Pour l'instant le paiement en ligne n'est pas implémenté*/
  typePaiement SET('Sur_place', 'En_ligne') DEFAULT 'Sur_place',
  PRIMARY KEY (utilisateurId, seanceId)
) engine=INNODB;


/*SCRIPTS D'ALIMENTATION FACTICE DE DONNEES DANS LA BASE*/

INSERT INTO TARIFS (nom, prix) VALUES 
('Plein tarif', 9.20),
('Etudiant', 7.60),
('Moins de 14 ans', 5.90);

INSERT INTO FILMS (nom, description, realisateur, duree) VALUES
("La cité de la peur", "L'histoire se déroule dans les années 1990 durant le festival de Cannes, les projectionnistes d'un mauvais film d'horreur nommé Red Is Dead sont assassinés successivement par un mystérieux tueur armé d'un marteau et une faucille comme dans le film. L'attachée de presse du film, Odile Deray (Chantal Lauby), comprend rapidement l'intérêt de ces meurtres pour la notoriété du film, elle fait venir l'acteur principal, Simon Jérémi (Dominique Farrugia), et engage un garde du corps, Serge Karamazov (Alain Chabat). Le commissaire Bialès (Gérard Darmon) est chargé d'enquêter sur ces meurtres.", "Alain Berbérian", 1.33),
("Avatar 2", "Sur Pandora, plus d'une décennie après la guerre entre le peuple autochtone des Na'vi et les humains de la Ressource Development Administration (RDA), Jake Sully assume désormais son rôle de chef des Omaticaya. Avec sa compagne, Neytiri, ils s'occupent de leur famille : Neteyam, leur fils aîné, Lo'ak, son frère, Kiri, leur fille adoptive (mystérieusement née de l'avatar inerte de la Dre Grace Augustine), Spider, un garçon humain abandonné sur la planète, et Tuk, leur fille cadette. C'est alors que la RDA et ses troupes reviennent en force sur Pandora. Leur mission est de préparer la planète à devenir une nouvelle Terre et accueillir leur exode. Jake, Neytiri et les Omaticaya sont les premiers à s'opposer à eux. Cependant, les humains ont également dans leurs rangs une escouade de « recombinés » : des avatars Na'vi avec les souvenirs de soldats décédés. Leur chef n'est autre que le colonel Quaritch, qui avait pris soin de faire une sauvegarde de sa mémoire et de sa personnalité avant la bataille où il perdit la vie.", "James Cameron", 3.12),
("Il était une fois dan l'Ouest", "Le film décrit deux conflits se déroulant à Flagstone, une ville fictive de l'Ouest américain, d'une part la lutte autour de l'arrivée du chemin de fer dans la ville et d'autre part la vengeance d'un homme contre un tueur froid et sanguinaire.", "Sergio Leone", 2.45),
("Interstellar", "Alors que la Terre se meurt, une équipe d'astronautes franchit un trou de ver apparu près de Saturne et conduisant à une autre galaxie, afin d'explorer un nouveau système stellaire dans l'espoir de trouver une planète habitable et d'y établir une colonie spatiale pour sauver l'humanité.", "Christopher Nolan", 2.49),
("Matrix", "Thomas A. Anderson18, un jeune informaticien connu dans le monde du hacking sous le pseudonyme de Neo19, est contacté via son ordinateur par ce qu'il pense être un groupe de hackers. Ils lui font découvrir que le monde dans lequel il vit n'est qu'un monde virtuel appelé la Matrice, à l'intérieur duquel les êtres humains sont gardés inconsciemment sous contrôle.", "The Wachowski", 2.16);

/*Utilisation d'UUID 'en dur' pour pouvoir les réutiliser dans l'alimentation des autres tables. UUID() à utiliser dans la version de production*/
INSERT INTO UTILISATEURS (id, prenom, nom, email, password) VALUES
("a77935c5-3a8e-11ee-8d31-9671e606a27d","Jean", "Michel", "jean.michel@test.com", "$2y$10$chHZ49IW/3KT1rGIriXVpO.QeSLdcVsW1esir3kHaciXG3O1Ckt06"),
("a779380e-3a8e-11ee-8d31-9671e606a27d","Lea", "Dupont", "lea.dupont@test.com", "$2y$10$K1sUDcQN/GnF2Ob33vhOtu513kv0YCpZmbSrKFOIJr15aaDKO4r8O"),
("a7793885-3a8e-11ee-8d31-9671e606a27d","Isabelle", "Mono", "isabelle.mono@test.com", "$2y$10$UTFUxWFM1zcVL16gZwA3jeOWgaK4BmvrhwPrqX3bk0i8BH6Dl1gl."),
("a7793897-3a8e-11ee-8d31-9671e606a27d","Théo", "Alvez", "theo.alvez@test.com", "$2y$10$fX.qrOaoUxMG7YwNOZbMquvAnDbEMorwh0ZFyEYsX0dl5FbiNrKua"),
("a77938a6-3a8e-11ee-8d31-9671e606a27d","Franck", "Dupuy", "franck.dupuy@test.com", "$2y$10$i4Uu47TP0YOQla22pckpyOvHIePQs.Z0EC4wo7BYWrmJ.G9uicl02");

INSERT INTO CINEMAS (id, nom, adresse, nbSalles, superUtilisateurId) VALUES
("fbbb87c2-3a8f-11ee-8d1b-9671e606a27d", "Pathé Mulhouse", "5 rue du poteau 68000 MULHOUSE",6 , "a77935c5-3a8e-11ee-8d31-9671e606a27d"),
("fbbb897c-3a8f-11ee-8d1b-9671e606a27d", "UGC Toulouse", "18 route du sel 31000 TOULOUSE",8 , "a779380e-3a8e-11ee-8d31-9671e606a27d"),
("fbbb89f3-3a8f-11ee-8d1b-9671e606a27d", "CGR Caen", "4 avenue de la galette 14000 CAEN",4 , "a7793885-3a8e-11ee-8d31-9671e606a27d");

INSERT INTO ADMINS (utilisateurId) VALUES
("a7793897-3a8e-11ee-8d31-9671e606a27d"),
("a77938a6-3a8e-11ee-8d31-9671e606a27d");

INSERT INTO SALLES (nom, nbSieges, cinemaId) VALUES
("Salle 1",100 , "fbbb87c2-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 2",100 , "fbbb87c2-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 3",80 , "fbbb87c2-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 4",80 , "fbbb87c2-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 5",60 , "fbbb87c2-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 6",60 , "fbbb87c2-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 7",150 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 8",150 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 1",150 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 2",150 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 3",120 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 4",120 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 5",80 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 6",80 , "fbbb897c-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 1",100 , "fbbb89f3-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 2",80 , "fbbb89f3-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 3",80 , "fbbb89f3-3a8f-11ee-8d1b-9671e606a27d"),
("Salle 4",60 , "fbbb89f3-3a8f-11ee-8d1b-9671e606a27d");


INSERT INTO TARIFUTILISATEURS (utilisateurId, tarifId) VALUES
("a77935c5-3a8e-11ee-8d31-9671e606a27d", "1"),
("a779380e-3a8e-11ee-8d31-9671e606a27d", "1"),
("a7793885-3a8e-11ee-8d31-9671e606a27d", "2"),
("a7793897-3a8e-11ee-8d31-9671e606a27d", "1"),
("a7793897-3a8e-11ee-8d31-9671e606a27d", "3");

INSERT INTO SEANCES (salleId, filmId, dateHoraire) VALUES
(1, 1, "2023-08-25 19:30:00"),
(2, 2, "2023-08-25 11:20:00"),
(3, 3, "2023-08-26 18:00:00"),
(4, 4, "2023-08-29 17:30:00"),
(5, 5, "2023-08-22 10:30:00"),
(6, 1, "2023-08-24 20:30:00");

INSERT INTO RESERVATIONS (utilisateurId, seanceId) VALUES
("a77935c5-3a8e-11ee-8d31-9671e606a27d", 1),
("a779380e-3a8e-11ee-8d31-9671e606a27d", 3),
("a7793885-3a8e-11ee-8d31-9671e606a27d", 4),
("a7793897-3a8e-11ee-8d31-9671e606a27d", 6),
("a77935c5-3a8e-11ee-8d31-9671e606a27d", 2);

GRANT ALL PRIVILEGES ON CINERESA.* TO 'theo.alvez@localhost' IDENTIFIED BY '$2y$10$fX.qrOaoUxMG7YwNOZbMquvAnDbEMorwh0ZFyEYsX0dl5FbiNrKua';

GRANT ALL PRIVILEGES ON CINERESA.* TO 'franck.dupuy@localhost' IDENTIFIED BY '$2y$10$i4Uu47TP0YOQla22pckpyOvHIePQs.Z0EC4wo7BYWrmJ.G9uicl02';
