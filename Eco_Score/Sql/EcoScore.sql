CREATE TABLE produits
(
  idproduit INT PRIMARY KEY NOT NULL auto_increment,
  vendeur VARCHAR(255) NOT NULL,
  nom VARCHAR(255) NOT NULL,
  image VARCHAR(255),
  prix VARCHAR(255) NOT NULL,
  composition VARCHAR(255),
  type VARCHAR(255),
  couleur VARCHAR(255),
  date_ajout VARCHAR(255)
);
     /*idMarque INT
      nbEc int,
      CONSTRAINT FK_marque_prod FOREIGN KEY (idMarque) REFERENCES Marques(idMarque),
      CONSTRAINT FK_ec_prod FOREIGN KEY (nbEc) REFERENCES Empeinte_carbone(nbEc)
)*/

ALTER TABLE produit MODIFY date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;

----Produits_utilisés-----
CREATE TABLE Produits_utilises
(
    idproduit INT NOT NULL,
    DateObt date,
    etat enum('Parfait','Très bon état','bon état','correct','mauvaise état','endomagé'),
    CONSTRAINT PK_ProdU PRIMARY KEY (idproduit),
    CONSTRAINT FK_ProdU_Prod FOREIGN KEY (idproduit) REFERENCES
    produit(idproduit)
   
);


----Produits_likés-----
CREATE TABLE Produits_likes
(
    idproduit INT NOT NULL,
    idUtilisateur INT not null,
    CONSTRAINT PK_ProdL PRIMARY KEY (idproduit),
    CONSTRAINT FK_ProdL_Prod FOREIGN KEY (idproduit) REFERENCES
    produit(idproduit),
    CONSTRAINT FK_ProdL_Util FOREIGN KEY (idUtilisateur) REFERENCES
    Utilisateurs(idUtilisateur)
   
);

----- Hauts -----
CREATE TABLE Hauts
(
    idproduit INT NOT NULL,
    TailleH VARCHAR(5),
    CONSTRAINT PK_Haut PRIMARY KEY (idproduit),
    CONSTRAINT FK_Haut_prod FOREIGN KEY (idproduit) REFERENCES
    produit(idproduit)
   
);
----- Bas --------
CREATE TABLE Bas
(
    idproduit INT NOT NULL,
    TailleB VARCHAR(5),
    CONSTRAINT PK_Bas PRIMARY KEY (idproduit),
    CONSTRAINT FK_Bas_prod FOREIGN KEY (idproduit) REFERENCES
    produit(idproduit)
   
);
---- Accessoires ------
CREATE TABLE Accessoires
(
    idproduit INT NOT NULL,
    TailleA VARCHAR(5),
    CONSTRAINT PK_Accessoires PRIMARY KEY (idproduit),
    CONSTRAINT FK_Accessoires_prod FOREIGN KEY (idproduit) REFERENCES
    produit(idproduit)
);
---- Chaussures ----
CREATE TABLE Chaussures
(
    idproduit INT NOT NULL,
    TailleC VARCHAR(5),
    CONSTRAINT PK_Chaussures PRIMARY KEY (idproduit),
    CONSTRAINT FK_Chaussures_prod FOREIGN KEY (idproduit) REFERENCES
    produit(idproduit)
);
---- Test_Animal----
CREATE TABLE Test_Animal
(
    TestA boolean not null,
    idproduit int,
    CONSTRAINT PK_Test_Animal PRIMARY KEY (TestA),
    CONSTRAINT FK_Test_Animal FOREIGN KEY (idproduit) REFERENCES
    produit(idproduit)
);
---- Matières ----
CREATE TABLE Matieres
(
    idMat INT not null,
    TypeMat VARCHAR(255) not null,
    BioMat boolean,
    idVille int,
    CONSTRAINT PK_Mat PRIMARY KEY (idMat),
    CONSTRAINT FK_mat_ville FOREIGN KEY (idVille) REFERENCES Villes(idVille)

   
);
---- Usines ----
CREATE TABLE Usines
(
    idUsine INT not null,
    nomUsine VARCHAR(255) not null,
    nbSal VARCHAR(255),
    idVille int,
    CONSTRAINT PK_Usine PRIMARY KEY (idUsine),
       CONSTRAINT FK_usine_ville FOREIGN KEY (idVille) REFERENCES Villes(idVille)

   
);
---- Empreinte Carbone ----
CREATE TABLE Empeinte_carbone
(
    nbEc INT not null,
    CONSTRAINT PK_Ec PRIMARY KEY (nbEc)

   
);
----Marques----
CREATE TABLE Marques
(
    idMarque INT not null,
    libelleMarque VARCHAR(255) not null,
    siret VARCHAR(255) not null,
    adresse VARCHAR(255),
    CONSTRAINT PK_Marque PRIMARY KEY (idMarque)

   
);
---- Plateformes ----
CREATE TABLE Plateformes
(
    idPlat INT not null,
    nomPlateforme VARCHAR(255) not null,
    urlPlatforme VARCHAR(255),
    CONSTRAINT PK_Plat PRIMARY KEY (idPlat)

   
);
----Pays----
CREATE TABLE Pays
(
    idPays INT not null,
    nomPays VARCHAR(255) not null,
    CONSTRAINT PK_Pays PRIMARY KEY (idPays)

   
);
----Régions----
CREATE TABLE Regions
(
    idRegion INT not null,
    nomRegion VARCHAR(255) not null,
    idPays int,
    CONSTRAINT PK_Region PRIMARY KEY (idRegion),
    CONSTRAINT FK_Region FOREIGN KEY (idPays) REFERENCES Pays(idPays)

   
);
----Villes----
CREATE TABLE Villes
(
    idVille INT not null,
    nomVille VARCHAR(255) not null,
    idRegion INT,
    CONSTRAINT PK_Ville PRIMARY KEY (idVille),
    CONSTRAINT FK_ville FOREIGN KEY (idRegion) REFERENCES Regions(idRegion)

   
);
----Utilisateurs----
CREATE TABLE Utilisateurs
(
    idUtilisateur INT not null,
    nomUtilisateur VARCHAR(255) not null,
    prenomUtilisateur VARCHAR(255) not null,
    dateNaissUtilisateur date,
    mailUtilisateur VARCHAR(255) not null,
    mdpUtilisateur VARCHAR(255) not null,
    CONSTRAINT PK_User PRIMARY KEY (idUtilisateur)

   
);
----Dotations----
CREATE TABLE Dotations
(
    idDotation INT not null,
    labelDotation VARCHAR(255) not null,
    dateDotation date,
    CONSTRAINT PK_Dotation PRIMARY KEY (idDotation)

   
);
----Monétaires----
CREATE TABLE Monetaires
(
    idDotation INT not null,
    montantDotation VARCHAR(255) not null,
    CONSTRAINT PK_Dotation_Monetaire PRIMARY KEY (idDotation),
    CONSTRAINT FK_Dotation_Monetaire FOREIGN KEY (idDotation) REFERENCES Dotations(idDotation)

   
);
----Matériels----
CREATE TABLE Materiels
(
    idDotation INT not null,
    quantiteDotation VARCHAR(255),
    CONSTRAINT PK_Dotation_Materiel PRIMARY KEY (idDotation),
    CONSTRAINT FK_Dotation_Materiel FOREIGN KEY (idDotation) REFERENCES Dotations(idDotation)

   
);
----Prestataires----
CREATE TABLE Prestataires
(
    idPrestataire INT not null,
    labelPrestataire VARCHAR(255) not null,
    typePrestataire VARCHAR(255) not null,
    raisonSocial VARCHAR(255) not null,
    CONSTRAINT PK_idPrestataire PRIMARY KEY (idPrestataire)

   
);
----Bennes----
CREATE TABLE Bennes
(
    idBenne INT not null,
    labelBenne VARCHAR (255),
    dateDepot date,
    idVille int,
    CONSTRAINT PK_idBenne PRIMARY KEY (idBenne),
    CONSTRAINT FK_benne_ville FOREIGN KEY (idVille) REFERENCES Villes(idVille)
   
);
----Sujets----Fid
CREATE TABLE Sujets
(
    idSujet INT not null,
    labelSujet VARCHAR (255),
    CONSTRAINT PK_idSujet PRIMARY KEY (idSujet)
   
);
----Date_Heure_Avis----
CREATE TABLE DHA
(
    idDha INT not null,
    DateAvis date,
    HeureAvis time,
    CONSTRAINT PK_idDha PRIMARY KEY (idDha)
   
);

-----Relations devenant Tables :

----Concevoir---
CREATE TABLE Concevoir
(
    idproduit INT not null,
    idMat INT not null,
    Quantite_Utile VARCHAR(255),
    CONSTRAINT PK_Prod PRIMARY KEY (idproduit, idMat),
    CONSTRAINT FK_Prod FOREIGN KEY (idproduit) REFERENCES produit(idproduit),
    CONSTRAINT FK_Mat FOREIGN KEY (idMat) REFERENCES Matieres(idMat)

   
);
----scanner----
CREATE TABLE scanner
(
    idproduit INT not null,
    idUtilisateur INT not null,
    Note VARCHAR(255),
    CONSTRAINT PK_Prod_scan PRIMARY KEY (idproduit,idUtilisateur),
    CONSTRAINT FK_Prod_scan FOREIGN KEY (idproduit) REFERENCES produit(idproduit),
    CONSTRAINT FK_Utilisateur FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur)

   
);

----Fabriquer----
CREATE TABLE fabriquer
(
    idproduit INT not null,
    idUsine INT not null,
    CONSTRAINT PK_Prod_fab PRIMARY KEY (idproduit, idUsine),
    CONSTRAINT FK_Prod_fab FOREIGN KEY (idproduit) REFERENCES produit(idproduit),
    CONSTRAINT FK_Usine_fab FOREIGN KEY (idUsine) REFERENCES Usines(idUsine)

   
);
----Vendre----
CREATE TABLE vendre
(
    idproduit INT not null,
    idPlat INT not null,
    prixVente VARCHAR(50),
    CONSTRAINT PK_Prod_vendre PRIMARY KEY (idproduit,idPlat),
    CONSTRAINT FK_Prod_vendre FOREIGN KEY (idproduit) REFERENCES produit(idproduit),
    CONSTRAINT FK_Plat_vendre FOREIGN KEY (idPlat) REFERENCES Plateformes(idPlat)

   
);
----Donner----
CREATE TABLE donner
(
    idUtilisateur INT not null,
    idDotation INT not null,
    CONSTRAINT PK_util_don PRIMARY KEY (idUtilisateur, idDotation),
    CONSTRAINT FK_util_don FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur),
    CONSTRAINT FK_donation_don FOREIGN KEY (idDotation) REFERENCES Dotations(idDotation)

   
);
----Déposer----
CREATE TABLE déposer
(
    idBenne INT not null,
    idDotation INT not null,
    CONSTRAINT PK_benne_depot PRIMARY KEY (idBenne, idDotation),
    CONSTRAINT FK_benne_depot FOREIGN KEY (idBenne) REFERENCES Bennes(idBenne),
    CONSTRAINT FK_donation_depot FOREIGN KEY (idDotation) REFERENCES Materiels(idDotation)

   
);
----Recevoir----
CREATE TABLE recevoir
(
    idPrestataire INT not null,
    idDotation INT not null,
    CONSTRAINT PK_prest_recev PRIMARY KEY (idPrestataire, idDotation),
    CONSTRAINT FK_prest_recev FOREIGN KEY (idPrestataire) REFERENCES Prestataires(idPrestataire),
    CONSTRAINT FK_donation_recev FOREIGN KEY (idDotation) REFERENCES Monetaires(idDotation)

   
);
----Avis----
CREATE TABLE avis
(
    idUtilisateur INT not null,
    idDha INT not null,
    idSujet int not null,
    commentaire VARCHAR(50),
    nbEtoile int,
    CONSTRAINT PK_user_avis PRIMARY KEY (idUtilisateur, idDha, idSujet),
    CONSTRAINT FK_user_avis FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur),
    CONSTRAINT FK_DHA_avis FOREIGN KEY (idDha) REFERENCES DHA(idDha),
    CONSTRAINT FK_sujet_avis FOREIGN KEY (idSujet) REFERENCES Sujets(idSujet)
   

   
);

create table avoir (
    idproduit
    int (3) not null,
    idPlat int(3) not null,
    prix float,
    primary key(idproduit, idPlat),
    foreign key (idproduit) references produit(idproduit),
    foreign key(idPlat) references plateformes (idPlat)
);



update commande com, concerner c
    set MTHT = (select SUM(p.prix_unit*c.quantitecom) from produit p, concerner c where p.refp = c.refp)
    where com.numcom =c.numcom ;

update commande com
set MTHT=(select prix_unit * quantitecom from
concerner c, produit p where c.refp=p.refp and co.numcom=c.numcom),
TVA = MTHT * 0.2,
MTTC = MTHT +TVA;


drop trigger if exists Calcul_Montant_Commande;
delimiter //
create trigger Calcul_Montant_Commande
before insert on concerner
for each row
begin
update commande com set
MTHT=(select prix_unit * new.quantitecom from
produit p where new.refp=p.refp and com.numcom=new.numcom),
TVA = MTHT * 0.2,
MTTTC = MTHT + TVA
where com.numcom=new.numcom;
end //
delimiter ;

create view vueproduits as ( select pr.nom, pf.nomPlateforme, a.prix
from produits pr, plateformes pf, avoir a
where pr.idproduit = a.idproduit
and  pf.idPlat = a.idPlat);

INSERT INTO produits VALUES (1,"ASOS","New Balance - 2002 - Baskets - Marron","https://images.asos-media.com/products/new-balance-2002-baskets-marron/202381684-1-brown?$n_640w$&wid=513&fit=constrain","140,00 €",NULL,"chaussures","Marron","2023-02-27");
INSERT INTO produits VALUES (2,"ASOS","New Balance - 2002 - Baskets - Blanc cassé","https://images.asos-media.com/products/new-balance-2002-baskets-blanc-casse/202382010-1-offwhite?$n_480w$&amp","140,00 €",NULL,"chaussures","Blanc cassé","2023-02-27");
INSERT INTO produits VALUES (3,"ASOS","New Balance - 2002 - Baskets - Blanc cassé","https://images.asos-media.com/products/new-balance-2002-baskets-blanc-casse/203636016-1-offwhite?$n_480w$&amp","170,00 €",NULL,"chaussures","Blanc cassé","2023-02-27");
INSERT INTO produits VALUES (4,"ASOS","New Balance - 2002 - Mules - Noir","https://images.asos-media.com/products/new-balance-2002-mules-noir/203636046-1-black?$n_480w$&amp","130,00 €",NULL,"chaussures","Noir","2023-02-27");
INSERT INTO produits VALUES (5,"ASOS","New Balance - 2002 - Mules - Gris",NULL,"130,00 €",NULL,"chaussures","Gris","2023-02-27");
INSERT INTO produits VALUES (6,"ASOS","New Balance - 2002 - Baskets - Gris Multicolore",NULL,"150,00 €",NULL,"chaussures","Gris Multicolore","2023-02-27");
INSERT INTO produits VALUES (7,"ASOS","New Balance - 2002 - Baskets - Fauve",NULL,"170,00 €",NULL,"chaussures","Fauve","2023-02-27");
INSERT INTO produits VALUES (8,"ASOS","New Balance - 2002 - Baskets - Bleu foncé",NULL,"140,00 €",NULL,"chaussures","Bleu foncé","2023-02-27");
INSERT INTO produits VALUES (9,"ASOS","New Balance - 2002 - Baskets - Bleu/blanc cassé",NULL,"140,00 €",NULL,"chaussures","Bleu/blanc cassé","2023-02-27");
INSERT INTO produits VALUES (10,"ASOS","New Balance - 2002 - Baskets - Orange",NULL,"140,00 €",NULL,"chaussures","Orange","2023-02-27");
INSERT INTO produits VALUES (11,"ASOS","New Balance - Baskets 2002 - Noir",NULL,"140,00 €",NULL,"chaussures","Noir","2023-02-27");
INSERT INTO produits VALUES (12,"Zalando","Pier One - 5 PACK - T-shirt basique",NULL,"29,99 €",NULL,NULL,"Noir","2023-02-27");
INSERT INTO produits VALUES (13,"Wordans","Gildan GN410 - Tee Shirt Homme Coton Premium",NULL,"4,00 €",NULL,NULL,"Noir","2023-02-27");
INSERT INTO produits VALUES (14,"Jules","Tee shirt basique col rond - Noir",NULL,"9,99 €",NULL,NULL,"Noir","2023-02-27");
INSERT INTO produits VALUES (15,"Celio","Essentiel - le T-shirt regular 100% coton - noir",NULL,"9,99 €",NULL,NULL,NULL,"2023-02-27");
INSERT INTO produits VALUES (16,"Carhartt","LOOSE FIT MIDWEIGHT SWEATSHIRT",NULL,"59,95 €",NULL,NULL,NULL,"2023-02-27");
INSERT INTO produits VALUES (17,"Zalando","Carhartt WIP - HOODED CHASE - Sweat à capuche",NULL,"66,95 €",NULL,NULL,NULL,"2023-02-27");
INSERT INTO produits VALUES (18,"Carhartt","LOOSE FIT MIDWEIGHT CREWNECK POCKET SWEATSHIRT",NULL,"52,95 €",NULL,NULL,NULL,"2023-02-27");
INSERT INTO produits VALUES (19,"The North Face","SWEAT À CAPUCHE SEASONAL DREW PEAK POUR HOMME",NULL,"40,00 €",NULL,NULL,NULL,"2023-02-27");

insert into plateformes values (4, 'ASOS', 'asos.fr');
insert into plateformes values (5, 'Zalando', 'asos.fr');
insert into plateformes values (6, 'Wordans', 'zalando.fr');
insert into plateformes values (7, 'Jules', 'jules.fr');
insert into plateformes values (8, 'Celio', 'celio.com');
insert into plateformes values (9, 'Carhartt', 'carhartt.com');
insert into plateformes values (10, 'The North Face', 'thenorceface.fr');