# Un trie selon le prix des jeux

select j_titre,j_description,j_prix 
from Jeu 
WHERE j_prix Between 10 and 20 ; 


# les jeu trier par genre
SELECT J.j_titre,J.j_description,G.g_nom
from Jeu J 
inner join Catégoriser C on J.j_id=C.J_id
inner join Genre G on G.g_id =C.g_id
Order by g_nom ASC ;


# historique de commande de l'utilisateur en commande 

Select U.u_pseudo,U.u_email,J.j_titre,C.c_date_heure,C.c_prix_total
from Utilisateur U 
join commande C on  U.u_id= C.u_id 
join Composer Co on C.c_id = Co.c_id
join Jeu J on Co.J_id =J.j_id;

# Un requete qui le nombre joueur que le pays a commandé 

SELECT U.u_pays, COUNT(U.u_id) AS nb_joueurs
FROM Utilisateur U
GROUP BY U.u_pays
ORDER BY nb_joueurs DESC;


# Une requete qui affiche la liste de souhait du utilisateur 
#Select  J.j_titre 

# Le nombre de joeur un jeux précis par pays 

# Le pourcentage de succée débloqué par moyenne par jeux

# La note moyenne par jeux 

# Le succée le plus rare débloquer par jeux




 


