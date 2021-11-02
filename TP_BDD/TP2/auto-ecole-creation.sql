drop table appartient;
drop table question;
drop table inscrit;
drop table assiste;
drop table examen;
drop table seance;
drop table serie;
drop table cd;
drop table eleve;
drop table blyat;

create table eleve(
       nume integer primary key, 
       nom varchar2(20) , 
       prenom varchar2(20), 
       adresse varchar2(40), 
       datenaiss date); 

create table cd(	       
	numcd integer primary key, 
	editeur varchar2(20)); 

create table serie(
	nums integer, 
	numcd integer, 
	primary key (nums,numcd),
	foreign key (numcd) references cd(numcd)); 

create table seance( 
	dates date,
	heures integer,
	check (heures between 9 and 18), 
	nums integer, 
	numcd integer,	
	primary key (dates, heures),
	foreign key (nums,numcd) references serie);

create table examen(
	datee  date,
	heuree  integer,
	check (heuree between 9 and 18),
	primary key (datee,heuree)); 

create table assiste(
	nume integer,
	datea date,
	heurea integer,
	nbfautes integer,
	primary key (nume,datea,heurea),
	foreign key (nume) references eleve,
	foreign key (datea,heurea) references seance(dates,heures));

create table inscrit(
	nume integer, 
	datee  date,
	heuree  integer,
	nbfautes integer,
	primary key (nume,datee,heuree),
	foreign key (datee,heuree) references examen,
	foreign key (nume) references eleve);

create table question(
	numq integer primary key,
	intitule varchar2(200) unique,
	reponse varchar(4),
	diffic integer,
	theme varchar2(25),
	check (diffic between 1 and 4)); 
-- ajout d'un attribut numq pas prevu lors du modele relationnel

create table appartient(
	numq integer, 
	numc integer, 
	nums integer, 
	primary key (numq,numc,nums),
	foreign key (numq) references question,
	foreign key (numc,nums) references serie(numcd,nums), 
	rang integer,
	check (rang between 1 and 40)); 
-- utilisation de numq a la place de intitutle 

