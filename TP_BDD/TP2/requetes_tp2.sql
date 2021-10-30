select distinct eleve.nume 
from (eleve 
join (
    select nbfautes, nume 
    from assiste 
    where nbfautes <= 1) t2
    on (eleve.nume = t2.nume));

select eleve.nom from 
(eleve join (
    select distinct assiste.nume from 
    assiste 
    where datea like '%06%') t2 
    on (eleve.nume = t2.nume));

select distinct nume from inscrit where nbfautes >= 5;

select count(*) from (select numq from question where diffic > 3);

select count(*) from 
(
    select distinct appartient.nums, appartient.numc 
    from appartient 
    where appartient.numq in 
    (
        select numq 
        from question 
        where diffic > 3
    )
);

select distinct nums, numcd from 
serie minus
    select distinct appartient.nums, appartient.numc from 
    appartient 
    where appartient.numq in (select numq from question where diffic > 3);

select distinct appartient.nums, appartient.numc from appartient 
where appartient.numq in (select numq from question where diffic > 3)
    intersect
select distinct appartient.nums, appartient.numc from appartient 
where appartient.numq in (select numq from question where diffic = 1);

select numq from question where numq not in (select numq from appartient);

select max(nbfautes) from inscrit;

select nom, prenom from eleve join (
    select nume from inscrit where nbfautes = (select max(nbfautes) from inscrit)) p2
    on (eleve.nume = p2.nume) 
;

select nume, max(nbfautes) from assiste group by nume;



select datee, avg(nbfautes) 
from inscrit 
where datee = 
    (select datee from inscrit where nbfautes < 6) 
and inscrit.nume = 
    (select eleve.nume from eleve where nom like 'Lagaffe');/* Problème de syntaxe avec les dates*/
group by datee

select datee, avg(nbfautes) 
from inscrit   
where datee = 
    (   select i.datee 
        from inscrit i, eleve e 
        where i.nume = e.nume
        and i.nbfautes <6 and e.nom like '%Lagaffe%'
    )
group by datee;

select distinct nume 
from inscrit 
where nbfautes > 5 and nume in 
    (   
        select nume
        from assiste 
        where nbfautes < 6 and datea > 
        (
            select datee 
            from inscrit 
            where nbfautes > 5 and inscrit.nume = assiste.nume
        )
    ); /* Cette requête ne marche pas si l'élève s'est inscrit plus d'une fois au code,
        la question ne précisant pas quel examen de code regarder, nous avons ici supposé
        que nous stockons une seule inscription à l'examen pour chaque élève (la plus récente)*/

select nume, count(*)
from
(
    select nume
    from assiste
)
group by nume;

/* Bonus */

-- Question 15

select nume from
(
    select nume, count(*) nombre
    from
    (
        select nume
        from assiste
    )
    group by nume
)
where nombre > 4;

-- Question 16

select nume, max(nbfautes)
from assiste
group by nume
having 
(
    max(nbfautes) < 6
);

-- Question 17
select nom, prenom
from
(
    select nume from
    (
        select nume, count(*) nombre
        from
        (
            select nume
            from assiste
        )
        group by nume
    )
    where nombre > 3
) assidus
join eleve
on eleve.nume = assidus.nume;


-- Question 18
select nume 
from
(
    select nume, count(*) nombre
    from
    (
        select nume
        from assiste
        where nbfautes < 6
    )
    group by nume
)
where nombre > 3; 


-- Question 19
select numq from
(
    select numq, count(*) nombre
    from appartient
    group by numq
)
where nombre > 1;

-- Question 20
select nums, numcd, count(*) 
from seance
group by nums, numcd;

-- Question 21
-- On considère aussi les résultats aux examens ici, sans plus de précision dans l'énoncé
select numcd, nums, fautes
from seance
(
    select datea, heurea, avg(nbfautes) fautes
    from
    (
        select datea, heurea, nbfautes
        from assiste
        union
        select datee, heuree, nbfautes
        from inscrit
    )
    group by datea, heurea
);