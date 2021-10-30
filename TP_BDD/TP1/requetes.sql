drop table DIR;
drop table EMP;

create table EMP(
Nom varchar2(15) not null,
Noss number(15),
Salaire number(5),
Departement varchar2(15),
constraint cle_prim primary key(Noss),
constraint sal_pos check (Salaire > 0)
);

create table DIR(
Noss number(15) primary key,
Departement varchar2(15),
constraint emp_cle_etr foreign key(Noss) references EMP(Noss)
);

insert into EMP values ('NomA',1,1000,'Dep1');
insert into EMP values ('NomB',2,1000,'Dep1');
insert into EMP values ('NomC',3,1000,'Dep2');
insert into EMP values ('NomD',4,1000,'Dep2');

insert into DIR values (1,'Dep1');
insert into DIR values (2,'Dep2');
insert into DIR values (3,'Dep3');

select * from EMP;
select * from DIR;

rem salaire negatif
insert into EMP values ('NomE',5,-200,'Dep3');

rem cle non unique
insert into EMP values ('NomF',1,2000,'Dep3');

rem pb cle etrangere
insert into DIR values (6,'Dep4');

rem Noss trop grand
insert into EMP values ('NomG',12345678901234567,'Dep3');

rem Nom trop grand
insert into EMP values ('ABCDEFGHIJKLMNOPQRSTUV',7,'Dep3');

select * from EMP;
select * from DIR;