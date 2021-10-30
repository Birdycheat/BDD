drop table CLIENT;
drop table PRODUIT;
drop table FOURNISSEUR;
/*drop table COMMANDE_PRODUIT;*/
drop table COMMANDE;
drop table FOURNIT;

create table CLIENT(
    numClient number(3), 
    nom varchar2(50), 
    prenom varchar2(50), 
    adresse varchar2(100), 
    codePostal number(3), 
    constraint clef_primaire1 primary key(numClient));

create table PRODUIT(
    numProduit number(3), 
    designation varchar2(50), 
    prixUnitaire number(3), 
    constraint clef_primaire2 primary key(numProduit));

create table FOURNISSEUR(
    numFournisseur number(3), 
    raisonSociale varchar2(10), 
    constraint clef_primaire3 primary key(numFournisseur));

/*create table COMMANDE_PRODUIT(
    numClient number(3), 
    numProduit number(3), 
    quantite number(3), 
    numFournisseur number(3), 
    constraint clef_etrangere1 foreign key(numClient) references CLIENT(numClient),
    constraint clef_etrangere2 foreign key(numProduit) references PRODUIT(numProduit), 
    constraint clef_etrangere3 foreign key(numFournisseur) references FOURNISSEUR(numFournisseur));*/

create table COMMANDE(
    numClient number(3), 
    numProduit number(3), 
    quantite number(3), 
    constraint clef_etrangere5 foreign key(numClient) references CLIENT(numClient), 
    constraint clef_etrangere6 foreign key(numProduit) references PRODUIT(numProduit));

create table FOURNIT(
    numFournisseur number(3), 
    numProduit number(3), 
    constraint clef_etrangere7 foreign key(numFournisseur) references FOURNISSEUR(numFournisseur), 
    constraint clef_etrangere8 foreign key(numProduit) references PRODUIT(numProduit));


insert into CLIENT values(1, 'Pogba','Paul', '1 rue de la Birche, Nomansland', 777);
insert into CLIENT values(2, 'Chirac','Jacques', '1 rue de la Birche, Nomansland', 777); 
insert into CLIENT values(3, 'Curie','Pierre', '1 rue de la Birche, Nomansland', 777); 
insert into CLIENT values(4, 'Jospin','Philippe', '1 rue de la Birche, Nomansland', 777); 
insert into CLIENT values(5, 'Lacigale','Caroline', '1 rue de la Birche, Nomansland', 777); 

insert into PRODUIT values(1, 'Raquette', 20);
insert into PRODUIT values(2, 'Balle', 2); 
insert into PRODUIT values(3, 'Fil ECO+', 0); 
insert into PRODUIT values(4, 'Bible', 5); 
insert into PRODUIT values(5, 'Blu-ray Pirates des caraïbes', 20);

insert into FOURNISSEUR values(1, 'SAS');
insert into FOURNISSEUR values(2, 'SARL'); 
insert into FOURNISSEUR values(3, 'EIRL'); 
insert into FOURNISSEUR values(4, 'SARL'); 
insert into FOURNISSEUR values(5, 'SAS');

/*insert into COMMANDE_PRODUIT values();
insert into COMMANDE_PRODUIT values(); 
insert into COMMANDE_PRODUIT values(); 
insert into COMMANDE_PRODUIT values(); 
insert into COMMANDE_PRODUIT values();*/

insert into COMMANDE values(1, 1, 1);
insert into COMMANDE values(2, 2, 1); 
insert into COMMANDE values(3, 3, 1); 
insert into COMMANDE values(4, 4, 1); 
insert into COMMANDE values(5, 5, 1);

insert into FOURNIT values(1,1);
insert into FOURNIT values(2,2); 
insert into FOURNIT values(3,3); 
insert into FOURNIT values(4,4); 
insert into FOURNIT values(5,5);

select * from CLIENT;
select * from PRODUIT;
select * from FOURNISSEUR;
select * from COMMANDE_PRODUIT;
select * from COMMANDE;
select * from FOURNIT;
