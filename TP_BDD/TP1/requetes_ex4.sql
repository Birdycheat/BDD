select * from FOUR;
select * from PDT ORDER BY prix ASC;
select produit from (select * from PDT ORDER BY prix ASC);
select nom, prenom from CLIENT;
select four, produit from PDT_FOUR WHERE produit = (select produit from (select * from PDT ORDER BY prix ASC) WHERE rownum <= 1); # F
/* 5) Il n'y a ici qu'un seul fournisseur et un seul produit respectant ces conditions, mais il se peut qu'il y ait plusieurs fournisseurs vendant les produits ayant le même prix le plus bas ou à l'inverse un fournisseur qui vend plusieurs produits ayant le même prix le plus bas*/

select * from PDT_FOUR WHERE four = (select four from (select four, produit from PDT_FOUR WHERE produit = (select produit from (select * from PDT ORDER BY prix ASC) WHERE rownum <= 1))); 

select four from PDT_FOUR WHERE produit = 223 or produit = 227;
select four from PDT_FOUR INNER JOIN PDT ON PDT.produit = PDT_FOUR.produit and (PDT.produit = 223 or PDT.produit = 227); /*Autre requête possible avec jointure mais complètement farfelu...*/
select nom from CLIENT WHERE codepost like '93%';
select four from FOUR WHERE nom like '%SARL%';
select idclient from CLIENT INNER JOIN COMMANDE ON CLIENT.idclient = COMMANDE.client WHERE produit = (select produit from (select * from PDT ORDER BY prix ASC) WHERE rownum <= 1);
/* Les autres cas sont possibles si plusieurs produits au plus bas prix existent ou plusieurs client en achetant*/

select * from COMMANDE ORDER BY client DESC;
select * from COMMANDE ORDER BY datec DESC;
select * from COMMANDE ORDER BY qte DESC;

select client from COMMANDE ORDER BY client DESC;
select client from COMMANDE ORDER BY datec DESC;
select client from COMMANDE ORDER BY qte DESC;

select idclient from CLIENT WHERE idclient not in (select idclient from CLIENT JOIN COMMANDE ON CLIENT.idclient = COMMANDE.client);

select PDT.produit from PDT JOIN COMMANDE ON PDT.produit = COMMANDE.produit WHERE PDT.prix >= 10;