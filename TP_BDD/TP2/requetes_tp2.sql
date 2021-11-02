-- Question 1
select distinct nume 
from assiste 
where nbfautes <= 1;

-- Question 2
select distinct eleve.nom 
from 
(
    eleve 
    join 
    (
        select distinct assiste.nume 
        from assiste 
        where datea like '%06-2018'
    ) t2 
    on (eleve.nume = t2.nume)
);

-- Question 3
select distinct nume 
from inscrit 
where nbfautes >= 5;

-- Question 4 
-- Il faut faire attention ici : il existe peut-être des questions répertoriées 
-- qui n'apparaissent pas dans les CDs de l'auto-école
select count(*) 
from 
(
    select numq
    from question 
    where diffic > 3 and numq in appartient
);

-- Question 5
select count(*) 
from 
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

-- Question 6
select distinct nums, numcd from 
serie minus
select distinct appartient.nums, appartient.numc from 
appartient 
where appartient.numq in 
(
    select numq 
    from question 
    where diffic > 3
);

-- Question 7
select distinct appartient.nums, appartient.numc 
from appartient 
where appartient.numq in 
(
    select numq 
    from question 
    where diffic > 3
)
intersect
select distinct appartient.nums, appartient.numc 
from appartient 
where appartient.numq in 
(
    select numq 
    from question 
    where diffic = 1
);

-- Question 8
select numq 
from question 
where numq not in 
(
    select numq 
    from appartient
);

-- Question 9
select max(nbfautes) 
from inscrit;

-- Question 10
select nom, prenom 
from eleve 
join 
(
    select nume 
    from inscrit 
    where nbfautes = 
    (
        select max(nbfautes) 
        from inscrit
    )
) p2
on (eleve.nume = p2.nume);

-- Question 11
select nume, max(nbfautes) 
from assiste 
group by nume;

-- Question 12
select datee, avg(nbfautes) 
from inscrit   
where datee = 
(   
    select i.datee 
    from inscrit i, eleve e 
    where i.nume = e.nume
    and i.nbfautes <6 and e.nom like '%Lagaffe%'
)
group by datee;

-- Question 13
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

-- Question 14
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
select nums, numcd, avg(nbfautes)
from
(
    select datea, heurea, nbfautes
    from 
    assiste
    union
    select datee, heuree, nbfautes
    from inscrit
)
full join seance
on datea = dates and heurea = heures
group by nums, numcd;

-- Question 22
-- On classe ici les séries par difficulté décroissante
select nums, numc, count(*) classement
from
(
    select nums, numc 
    from appartient 
    where numq in 
    (
        select numq 
        from question 
        where diffic > 3
    )
)
group by nums, numc
order by classement desc;

-- Question 23
select datee, heuree 
from
(
    select examen.datee, examen.heuree, inscrit.nbfautes--examen.datee, examen.heuree
    from examen
    full join inscrit
    on examen.datee = inscrit.datee and examen.heuree = inscrit.heuree
)
group by datee, heuree
having min(nbfautes) > 5;


select datee, heuree 
from examen
where not exists
(
    -- Sélection des examens qui ont au moins un admis 
    select datee, heuree, nbfautes
    from
    (
        select examen.datee, examen.heuree, inscrit.nbfautes--examen.datee, examen.heuree
        from examen
        full join inscrit
        on examen.datee = inscrit.datee and examen.heuree = inscrit.heuree
    )
    where nbfautes <= 5
);


