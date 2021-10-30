drop table EMP;
drop table DIR;

create table EMP(Nom char(30) not null, Noss number(15), Salaire number(12,2)
, Departement varchar2(15), constraint clef_primaire primary key(Noss)
, constraint salaires_positifs check (Salaire > 0));

create table DIR(Noss number(13), Departement varchar2(14)
, constraint clef_etrangere foreign key(Noss) references EMP(Noss));


insert into EMP values('Alphonse Daudet',1,4300,'Dep1');
insert into EMP values('Albert Einstein',2,1,'DepE');
insert into EMP values('Albert Einstein',3,1000,'Dep3');
insert into EMP values('Mister V',4,1000000,'Dep2');
insert into EMP values('Jean Marie Le Pen',5,900,'Dep2');
insert into EMP values('Eric Zemmour',6,10000,'Dep3');
insert into EMP values('Michel Onfray',7,1400,'Dep11');
insert into EMP values('Mathieux Bock-Cotté',8,1000,'Dep13');
insert into EMP values('Valery Giscard',9,1000,'Dep2');


insert into DIR values(1,'Dep1');
insert into DIR values(2,'DepE');
insert into DIR values(3,'Dep3');