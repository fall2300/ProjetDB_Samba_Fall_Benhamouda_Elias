# ProjetDB_Samba_Fall_Benhamouda_Elias

## auteur : Samba Fall , Benhamouda Elias

# Règles de gestion des données 


## Gestion des utilisateurs:
 Tout utilisateur possède un profil unique identifié par un pseudo, une adresse email, un mot de passe haché, une date d'inscription, un pays de résidence et un statut de connexion.

## Gestion des éditeurs et développeurs :
 Un jeu est rattaché à un éditeur ou un studio de développement (nom, pays d'origine). Un éditeur peut publier un ou plusieurs jeux.

## Catalogue des jeux :
 Un jeu se caractérise par son titre, sa description détaillée, son prix de base et sa date de sortie officielle.

## Catégorisation des jeux :
 Un jeu peut être associé à plusieurs genres ou catégories (ex: Action, RPG, Simulation), et une catégorie regroupe plusieurs jeux.

## Gestion des achats et commandes : Un utilisateur peut passer des commandes contenant un ou plusieurs jeux. Chaque commande est enregistrée avec sa date et heure, son montant total et le mode de paiement utilisé.

## Gestion de la bibliothèque personnelle :
 Chaque utilisateur possède une bibliothèque personnelle unique. Tout jeu acheté s'y ajoute automatiquement. La bibliothèque centralise pour chaque jeu possédé : une date d'acquisition, une clé de licence unique (DRM), et un suivi précis du temps de jeu cumulé (en heures).

## Système d'évaluations :
 Un utilisateur possédant un jeu dans sa bibliothèque peut laisser une (et une seule) évaluation pour ce jeu, comprenant une note chiffrée, un commentaire textuel et la date de rédaction.

## Liste de souhaits (Wishlist) :
 Un utilisateur peut ajouter des jeux à sa liste de souhaits personnelle pour planifier un achat futur, avec mémorisation de la date d'ajout.

## Gestion des succès (Achievements) :
 Chaque jeu propose une liste de succès ou trophées (nom, description de l'objectif). Le système enregistre la date et l'heure exactes de déblocage de chaque succès par un utilisateur.

## 2. Dictionnaire de données brutes (Intégrant les 3 thématiques)
## 2. Dictionnaire de données brutes (Intégrant les 3 thématiques)

## 2. Dictionnaire de données brutes (34 données)

| N° | Signification de la donnée | Type | Taille |
|---:|---|---|---|
| 1 | Identifiant unique de l'utilisateur | Integer | 8 chiffres |
| 2 | Pseudo de l'utilisateur | Varchar | 30 caractères |
| 3 | Adresse email de l'utilisateur | Varchar | 100 caractères |
| 4 | Mot de passe haché | Varchar | 255 caractères |
| 5 | Date d'inscription de l'utilisateur | DATE | 10 caractères |
| 6 | Pays de résidence de l'utilisateur | Varchar | 50 caractères |
| 7 | Statut de connexion de l'utilisateur | Varchar | 20 caractères |
| 8 | Identifiant unique du jeu | Integer | 8 chiffres |
| 9 | Titre du jeu | Varchar | 150 caractères |
| 10 | Description complète du jeu | Varchar | 2000 caractères |
| 11 | Prix de base du jeu | Float | 6 chiffres (ex: 999.99) |
| 12 | Date de sortie officielle du jeu | DATE | 10 caractères |
| 13 | Identifiant unique de l'éditeur | Integer | 6 chiffres |
| 14 | Nom de l'éditeur | Varchar | 100 caractères |
| 15 | Pays du siège de l'éditeur | Varchar | 50 caractères |
| 16 | Identifiant unique de la catégorie | Integer | 4 chiffres |
| 17 | Nom de la catégorie (Genre) | Varchar | 50 caractères |
| 18 | Identifiant unique de la commande | Integer | 10 chiffres |
| 19 | Date et heure de la commande | DATETIME | 19 caractères (AAAA-MM-JJ HH:MM:SS) |
| 20 | Montant total payé pour la commande | Float | 6 chiffres |
| 21 | Mode de paiement utilisé | Varchar | 30 caractères |
| 22 | Identifiant unique de la bibliothèque | Integer | 8 chiffres |
| 23 | Date d'acquisition du jeu (dans la bibliothèque) | DATE | 10 caractères |
| 24 | Clé de licence unique (DRM) | Varchar | 50 caractères |
| 25 | Temps de jeu cumulé (en heures) | Float | 7 chiffres (ex: 1250.5) |
| 26 | Identifiant unique de l'évaluation | Integer | 10 chiffres |
| 27 | Note attribuée au jeu | Integer | 2 chiffres |
| 28 | Commentaire textuel de l'évaluation | Varchar | 1000 caractères |
| 29 | Date de rédaction de l'évaluation | DATE | 10 caractères |
| 30 | Date d'ajout d'un jeu à la liste de souhaits | DATE | 10 caractères |
| 31 | Identifiant unique du succès (trophée) | Integer | 6 chiffres |
| 32 | Nom du succès | Varchar | 100 caractères |
| 33 | Description de l'objectif du succès | Varchar | 250 caractères |
| 34 | Date et heure d'obtention du succès | DATETIME | 19 caractères (AAAA-MM-JJ HH:MM:SS) |