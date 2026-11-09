USE magasin;

-- Recherche des jeux dont le prix est compris entre 10 et 20 euros.
-- Données recherchées : titre, description et prix du jeu.

select j_titre,j_description,j_prix 
from Jeu 
WHERE j_prix Between 10 and 20 ; 

-- Va permettre de trier les jeux par leur genre.
-- Données recherchées : titre du jeu, description du jeu et nom du genre du jeu vidéo.

SELECT J.j_titre,J.j_description,G.g_nom
from Jeu J 
inner join Catégoriser C on J.j_id=C.J_id
inner join Genre G on G.g_id =C.g_id
Order by g_nom ASC ;

-- Cette commande va permettre de consulter l'historique des commandes d'un utilisateur.
-- Données recherchées : pseudo de l'utilisateur, titre du jeu, date de commande et prix total de la commande.

Select U.u_pseudo,U.u_email,J.j_titre,C.c_date_heure,C.c_prix_total
from Utilisateur U 
join commande C on  U.u_id= C.u_id 
join Composer Co on C.c_id = Co.c_id
join Jeu J on Co.J_id =J.j_id;Select U.u_pseudo,U.u_email,J.j_titre,C.c_date_heure,C.c_prix_total
from Utilisateur U 
join commande C on  U.u_id= C.u_id 
join Composer Co on C.c_id = Co.c_id
join Jeu J on Co.J_id =J.j_id;

-- Cette requête permet à la plateforme de connaître le nombre total d'utilisateurs par pays.
-- Données recherchées : nom du pays de l'utilisateur et nombre total de joueurs par pays.

SELECT U.u_pays, COUNT(U.u_id) AS nb_joueurs
FROM Utilisateur U
GROUP BY U.u_pays
ORDER BY nb_joueurs DESC;


-- Cette requête permet d'afficher la liste de souhaits des utilisateurs.
-- Données recherchées : pseudo de l'utilisateur et titre des jeux présents dans sa liste de souhaits.

SELECT U.u_pseudo, J.j_titre
FROM Utilisateur U
INNER JOIN Liste_de_souhaits S ON U.u_id = S.u_id
INNER JOIN Jeu J ON S.j_id = J.j_id
ORDER BY U.u_pseudo ASC, J.j_titre ASC;



-- Cette requête permet de connaître le nombre de joueurs possédant chaque jeu par pays.
-- Données recherchées : titre du jeu, pays des utilisateurs et nombre de joueurs par pays.
SELECT J.j_titre, U.u_pays,
       COUNT(U.u_id) AS nb_joueurs
FROM Jeu J
INNER JOIN Posséder P ON J.j_id = P.j_id
INNER JOIN Utilisateur U ON P.u_id = U.u_id
GROUP BY J.j_id, J.j_titre, U.u_pays
ORDER BY nb_joueurs DESC;

-- Cette requête permet de calculer le pourcentage moyen de succès débloqués par les joueurs pour chaque jeu.
-- Données recherchées : titre du jeu et pourcentage moyen de succès débloqués par les joue

SELECT J.j_titre,
     ROUND(AVG(
    (SELECT COUNT(*) * 100.0
     FROM Débloquer D
     INNER JOIN Succès S ON D.s_id = S.s_id
     WHERE D.u_id = P.u_id
     AND S.j_id = J.j_id)
    /
    (SELECT COUNT(*)
     FROM Succès S2
     WHERE S2.j_id = J.j_id)
), 1) AS pourcentage_moyen
FROM Posséder P
INNER JOIN Jeu J ON P.j_id = J.j_id
GROUP BY J.j_id, J.j_titre;


--  Cette requête permet d'avoir la note moyenne d'un jeux
-- Données recherchées : titre du jeu et note du jeu 

SELECT J.j_titre,
       ROUND(AVG(E.ev_note), 2) AS note_moyenne
FROM Jeu J
INNER JOIN Evaluer E ON J.j_id = E.j_id
GROUP BY J.j_id, J.j_titre
ORDER BY note_moyenne DESC;

	-- Cette requête permet d'identifier le succès le plus rarement débloqué pour chaque jeu.
	-- Données recherchées : titre du jeu, nom du succès et nombre de joueurs ayant débloqué ce succès.

	SELECT 
		J.j_titre AS titre,
		S.s_nom AS succes,
		COUNT(D.u_id) AS nb_joueurs
	FROM Jeu J
	JOIN Succès S ON J.j_id = S.j_id
	LEFT JOIN Débloquer D ON S.s_id = D.s_id
	GROUP BY J.j_id, J.j_titre, S.s_id, S.s_nom
	HAVING COUNT(D.u_id) = (
		SELECT MIN(nb_deblocages)
		FROM (
			SELECT COUNT(D2.u_id) AS nb_deblocages
			FROM Succès S2
			LEFT JOIN Débloquer D2 ON S2.s_id = D2.s_id
			WHERE S2.j_id = J.j_id
			GROUP BY S2.s_id
		) AS t
	);

	-- Cette requête permet d'obtenir liste des succès débloquer pour tous les joueurs.
    -- Données recherchées : pseudo, titre du jeu, nom du succès, description du succès, date d'obtention.    
    SELECT 
    u.u_pseudo, 
    j.j_titre, 
    s.s_nom AS succes_nom, 
    s.s_desc AS succes_description, 
    d.d_date
FROM Débloquer d
JOIN Utilisateur u ON d.u_id = u.u_id
JOIN Succès s ON d.s_id = s.s_id
JOIN Jeu j ON s.j_id = j.j_id
ORDER BY u.u_id, d.d_date;

	-- Cette requête permet d'obtenir le classement des jeux les plus venus de la plateforme.
    -- Données recherchées: id du jeu, titre du jeu, nombre total d'achat.
SELECT 
    j.j_id, 
    j.j_titre, 
    COUNT(p.u_id) AS total_possessions
FROM Jeu j
LEFT JOIN Posséder p ON j.j_id = p.j_id
GROUP BY j.j_id, j.j_titre
ORDER BY total_possessions DESC;

	-- Cette requête permet d'obtenir le jeu le plus populaire par éditeur.
    -- Données recherchéees: Nom de l'éditeur, titre du jeu, nombre de ventes
SELECT 
    e.ed_nom, 
    j.j_titre, 
    COUNT(c.c_id) AS nb_ventes
FROM Editeur e
JOIN Editer ed ON e.ed_id = ed.ed_id
JOIN Jeu j ON ed.j_id = j.j_id
LEFT JOIN Composer c ON j.j_id = c.j_id
GROUP BY e.ed_id, e.ed_nom, j.j_id, j.j_titre
HAVING COUNT(c.c_id) = (
    SELECT MAX(sub_ventes)
    FROM (
        SELECT COUNT(c2.c_id) AS sub_ventes
        FROM Editer ed2
        JOIN Jeu j2 ON ed2.j_id = j2.j_id
        LEFT JOIN Composer c2 ON j2.j_id = c2.j_id
        WHERE ed2.ed_id = e.ed_id
        GROUP BY j2.j_id
    ) AS t
);

	-- Cette requête permet d'obtenir la liste des utilisateurs n'ayant jamais acheté de jeu sur la plateforme.
    -- id, pseudo, email de l'utilisateur
SELECT 
    u.u_id, 
    u.u_pseudo, 
    u.u_email
FROM Utilisateur u
LEFT JOIN Posséder p ON u.u_id = p.u_id
WHERE p.j_id IS NULL;


	-- Cette requête permet d'afficher la liste des jeux n'ayant aucune évaluation.
    -- Données recherchées: id et titre du jeu
SELECT 
    j.j_id, 
    j.j_titre
FROM Jeu j
LEFT JOIN Evaluer e ON j.j_id = e.j_id
WHERE e.u_id IS NULL;

	-- Cette requête permet d'obtenir le temps de jeu moyen par jeu. 
    -- Données recherchées: id et titre du jeu, temps de jeu moyen.
SELECT 
    j.j_id, 
    j.j_titre, 
    ROUND(AVG(p.tps_jeu), 2) AS temps_jeu_moyen_heures
FROM Jeu j
JOIN Posséder p ON j.j_id = p.j_id
GROUP BY j.j_id, j.j_titre
ORDER BY temps_jeu_moyen_heures DESC;