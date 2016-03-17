
/* Proc that gets data from 3 tables */

Create Proc TyömaaVarastoMateriaalit
AS
select distinct työmaavarasto.työmaatunnus,työmaavarasto.varastotunnus,varasto.varastotunnus AS LähtöVarasto,materiaali,työmaavarasto.määrä
from työmaavarasto
inner join varasto
on työmaavarasto.lähdevarasto = varasto.varastotunnus
inner join materiaali
on varasto.materiaalitunnus = materiaali.materiaalitunnus

exec TyömaaVarastoMateriaalit


/* Proc that receives single parameter */

Create Proc HaeTyöaika
@haettavatunnus varchar(4)
as
Select työntekijätunnus,työmaatunnus,päivä,tunnit
from työaika
where @haettavatunnus = työntekijätunnus

exec HaeTyöaika 'T004'

/* Proc that receives 2 parameters */

Create Proc UrakoitsijaTyöaika
@haettavatunnus varchar(4),
@haettavapäivä date
AS
select urakoitsijatunnus,työmaatunnus,päivä,tunnit
from työaika
where @haettavatunnus = urakoitsijatunnus
AND
@haettavapäivä = päivä

exec UrakoitsijaTyöaika 'U001' , '2014-10-11'

 

 /* Proc that updates fields in given field */

create proc päivitäMateriaalinMäärä
@varastotunnus char(5), @materiaalitunnus char(5) , @uusiMäärä int
as
update varasto
set määrä = @uusiMäärä
where materiaalitunnus = @materiaalitunnus and varastotunnus = @varastotunnus

exec päivitäMateriaalinMäärä 'VAR01', 'MAT05', 210


/* Proc that deletes all rows with same id */

create proc poistaToimittaja
@toimittajaTunnus char(5)
as
update varasto
set toimittaja=null
where toimittaja = @toimittajaTunnus
delete
from toimittajat
where toimittajatunnus = @toimittajaTunnus

exec poistaToimittaja 'SP002'
