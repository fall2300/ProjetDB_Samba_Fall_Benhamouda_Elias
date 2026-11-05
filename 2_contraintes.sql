USE magasin;


USE magasin;

ALTER TABLE Evaluer
ADD CONSTRAINT chk_note
CHECK (ev_note BETWEEN 1 AND 20);

alter table Utilisateur 
add constraint chk_status
CHECK (u_statut_connexion in('en ligne','hors ligne' ,'inactif')); 

ALTER TABLE Jeu
ADD CONSTRAINT chk_prix
CHECK (j_prix BETWEEN 0 AND 200);  


ALTER TABLE Utilisateur
    MODIFY u_pays Varchar (50) DEFAULT "France";
    
ALTER TABLE Editeur
    MODIFY ed_pays Varchar (50) DEFAULT "France"; 

    
    