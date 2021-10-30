drop table PDT_FOUR cascade constraint;
drop table COMMANDE cascade constraint;
drop table CLIENT cascade constraint;
drop table PDT cascade constraint;
drop table FOUR cascade constraint;

/* client -> nom, prenom, adresse, codepost */
create table CLIENT
(
	idclient number(3,0) not null,
	nom varchar(100) not null,
	prenom varchar(50),
	adresse varchar(100),
	codepost varchar(5),
	constraint cle_CLIENT primary key(idclient)
);

/* produit -> designation, prix */
create table PDT
(
	produit number(3,0) not null,
	designation varchar(100) not null,
	prix number(4,1),
	constraint cle_PDT primary key(produit)
);

/* four -> nom */
create table FOUR
(
	four number(3,0) not null,
	nom varchar(100) not null,
	constraint cle_FOUR primary key(four)
);

/* produit, four -> -*/
create table PDT_FOUR
(
	produit number(3,0) not null,
	four number(3,0) not null,
	constraint cle_PDT_FOUR primary key(produit, four),
	constraint cle_PF_PDT foreign key(produit) references PDT, 
	constraint cle_PF_FOUR foreign key(four) references FOUR 
);

/* client, produit, date_com -> qte ==> OK */
create table COMMANDE
(
	client number(3,0) not null,
	produit number(3,0) not null,
	datec date not null,
	qte number(4,0) not null, 
	constraint cle_COMMANDE primary key(client, produit),
	constraint cle_COM_CLIENT foreign key(client) references CLIENT(idclient), 
	constraint cle_COM_PDT foreign key(produit) references PDT 
);

insert into CLIENT values (123, 'Dupont', 'Pierre', '19 rue fdsfds', '93100');
insert into CLIENT values (124, 'Durand', 'Paul', '19 rue fdsfds', '94100');
insert into CLIENT values (125, 'Martinez', 'Jacques', '19 rue fdsfds', '93430');
insert into CLIENT values (126, 'Legrand', 'Martin', '19 rue fdsfds', '94100');
insert into CLIENT values (127, 'Lemaire', 'Rene', '19 rue fdsfds', '94100');

insert into PDT values (223, 'super ordi', 105.5);
insert into PDT values (224, 'portable', 115.5);
insert into PDT values (225, 'pda', 125.5);
insert into PDT values (226, 'telephone', 95.5);
insert into PDT values (227, 'mp3', 100.5);

insert into FOUR values (323, 'Huggy les bons tuyaux');
insert into FOUR values (324, 'PC pas cher');
insert into FOUR values (325, 'high tech SARL');
insert into FOUR values (326, 'numerique');
insert into FOUR values (327, ' SARL progres');

insert into PDT_FOUR values (223, 323);
insert into PDT_FOUR values (224, 324);
insert into PDT_FOUR values (225, 325);
insert into PDT_FOUR values (226, 326);
insert into PDT_FOUR values (227, 327);
insert into PDT_FOUR values (227, 326);

insert into COMMANDE values (123,223,'01/01/2012',2); 
insert into COMMANDE values (124,223,'01/02/2012',1); 
insert into COMMANDE values (124,224,'01/03/2012',2); 
insert into COMMANDE values (125,226,'01/04/2012',3);
