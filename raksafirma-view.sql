
/* View that fetches data from 3 tables */

GO
Create View ToimittajatTavaroittain
AS
Select
toimittajat.toimittaja,varasto.varastotunnus,materiaali.materiaalitunnus,materiaali.materiaali
from toimittajat
Inner join varasto
ON toimittajat.toimittajatunnus = varasto.toimittaja
INNER JOIN materiaali
on varasto.materiaalitunnus = materiaali.materiaalitunnus

GO
Create View TyöntekijätTyömaa
AS
select etunimi,sukunimi,työntekijä.työntekijätunnus
from työntekijä
inner join työaika
ON työaika.työntekijätunnus = työntekijä.työntekijätunnus
where työmaatunnus = 'SC001'

UNION

Select etunimi,sukunimi,urakoitsija.urakoitsijatunnus
from urakoitsija
INNER JOIN työaika
ON työaika.urakoitsijatunnus = urakoitsija.urakoitsijatunnus
where työmaatunnus = 'SC001'

/* View that  sums up fields from 2 tables */
 
Go 
Create view TyöntekijöidenTehdytTunnit
AS
select työntekijätunnus,Sum(tunnit+ylityötunnit) AS 'Tehdyt Tunnit'
from työaika
Where työntekijätunnus IS NOT NULL
group by työntekijätunnus

/* View that fetches  only certain fields from table */

Go
Create View EnsimmäisenHyllyrivinTavarat
AS
SELECT varastotunnus,hyllykoodi,määrä
FROM työmaavarasto
WHERE hyllykoodi LIKE '01%' 
AND työmaatunnus = 'SC003'

/* View inserts data in to table */

go
create view Työmaat as
select työmaatunnus, paikkakunta, asiakas, aloituspvm, lopetuspvm
from työmaa

insert into Työmaat(työmaatunnus, paikkakunta, asiakas, aloituspvm, lopetuspvm)
values ('SC004', 'Pietarsaari', 'A003', '04.06.2014', '07.04.2015')

/* View that counts certain fields in to own value */

go
Create view MateriaalinArvo
AS
select varastotunnus,varasto.materiaalitunnus,materiaali.materiaali,toimittaja,määrä,FORMAT(varasto.määrä * materiaali.hinta ,'N', 'EN-us') AS 'MateriaalinArvo'
from varasto
inner join materiaali
on varasto.materiaalitunnus = materiaali.materiaalitunnus
Where varasto.materiaalitunnus = 'MAT03'
 