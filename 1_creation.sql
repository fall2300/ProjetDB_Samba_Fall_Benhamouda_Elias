CREATE TABLE Utilisateur(
   u_id INT,
   u_pseudo VARCHAR(50),
   u_email VARCHAR(100) NOT NULL,
   u_mdp VARCHAR(255),
   u_date_inscription DATE,
   u_pays VARCHAR(50),
   u_statut_connexion VARCHAR(20),
   PRIMARY KEY(u_id)
);

CREATE TABLE Editeur(
   ed_id INT,
   ed_nom VARCHAR(100),
   ed_pays VARCHAR(50),
   PRIMARY KEY(ed_id)
);

CREATE TABLE Commande(
   c_id INT,
   c_date_heure DATETIME,
   c_prix_total REAL,
   c_mode_paiement VARCHAR(50),
   u_id INT NOT NULL,
   PRIMARY KEY(c_id),
   FOREIGN KEY(u_id) REFERENCES Utilisateur(u_id)
);

CREATE TABLE Jeu(
   j_id INT,
   j_titre VARCHAR(150),
   j_description VARCHAR(2000),
   j_prix REAL,
   j_date_sortie DATE,
   PRIMARY KEY(j_id)
);

CREATE TABLE Genre(
   g_id INT,
   g_nom VARCHAR(50),
   PRIMARY KEY(g_id)
);

CREATE TABLE Succès(
   s_id INT,
   s_nom VARCHAR(100),
   s_desc VARCHAR(250),
   j_id INT NOT NULL,
   PRIMARY KEY(s_id),
   FOREIGN KEY(j_id) REFERENCES Jeu(j_id)
);

CREATE TABLE Posséder(
   u_id INT,
   j_id INT,
   date_acquisition_jeu DATE,
   drm VARCHAR(50),
   tps_jeu REAL,
   PRIMARY KEY(u_id, j_id),
   FOREIGN KEY(u_id) REFERENCES Utilisateur(u_id),
   FOREIGN KEY(j_id) REFERENCES Jeu(j_id)
);

CREATE TABLE Editer(
   ed_id INT,
   j_id INT,
   PRIMARY KEY(ed_id, j_id),
   FOREIGN KEY(ed_id) REFERENCES Editeur(ed_id),
   FOREIGN KEY(j_id) REFERENCES Jeu(j_id)
);

CREATE TABLE Catégoriser(
   j_id INT,
   g_id INT,
   PRIMARY KEY(j_id, g_id),
   FOREIGN KEY(j_id) REFERENCES Jeu(j_id),
   FOREIGN KEY(g_id) REFERENCES Genre(g_id)
);

CREATE TABLE Evaluer(
   u_id INT,
   j_id INT,
   ev_note BYTE,
   ev_review VARCHAR(1000),
   ev_date DATE,
   PRIMARY KEY(u_id, j_id),
   FOREIGN KEY(u_id) REFERENCES Utilisateur(u_id),
   FOREIGN KEY(j_id) REFERENCES Jeu(j_id)
);

CREATE TABLE Composer(
   c_id INT,
   j_id INT,
   PRIMARY KEY(c_id, j_id),
   FOREIGN KEY(c_id) REFERENCES Commande(c_id),
   FOREIGN KEY(j_id) REFERENCES Jeu(j_id)
);

CREATE TABLE Liste_de_souhaits(
   u_id INT,
   j_id INT,
   w_date DATE,
   PRIMARY KEY(u_id, j_id),
   FOREIGN KEY(u_id) REFERENCES Utilisateur(u_id),
   FOREIGN KEY(j_id) REFERENCES Jeu(j_id)
);

CREATE TABLE Débloquer(
   u_id INT,
   s_id INT,
   d_date DATETIME,
   PRIMARY KEY(u_id, s_id),
   FOREIGN KEY(u_id) REFERENCES Utilisateur(u_id),
   FOREIGN KEY(s_id) REFERENCES Succès(s_id)
);
