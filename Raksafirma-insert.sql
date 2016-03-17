insert into työntekijä (työntekijätunnus, etunimi, sukunimi, henkilötunnus, lähiosoite, kaupunki, puhelinnumero, sähköposti, koulutus)
values ('T001', 'Maiju', 'Meikäläinen', '030794-143A', 'Raksatie 14', 'Raksala', '+358405394662', 'maiju.meikalainen@suchconstruct.fi', 'Hitsaaja');

insert into työntekijä (työntekijätunnus, etunimi, sukunimi, henkilötunnus, lähiosoite, kaupunki, puhelinnumero, sähköposti, koulutus)
values ('T002', 'Matti', 'Meikäläinen', '051204-312B', 'Raksatie 14', 'Raksala', '+358405904954', 'matti.meikalainen@suchconstruct.fi', 'Timpuri');

insert into työntekijä (työntekijätunnus, etunimi, sukunimi, henkilötunnus, lähiosoite, kaupunki, puhelinnumero, sähköposti, koulutus)
values ('T003', 'Simo', 'Sami', '030588-567U', 'Peräkatu 5', 'Vaasa', '+358441234508', 'Simo.Sami@suchconstruct.fi', 'Rakennusmestari');


Insert into urakoitsija (urakoitsijatunnus, etunimi, sukunimi, yritys, ytunnus)
Values('U001', 'Jyrki', 'Jaakkola', 'Staffpoint', '8459456-3')
insert into urakoitsija(urakoitsijatunnus, etunimi, sukunimi, yritys, ytunnus)
values ('U002', 'Armi', 'Alihankkija', 'Vuokratimpurit Oy','3485345-4')
Insert into urakoitsija (urakoitsijatunnus, etunimi, sukunimi, yritys, ytunnus)
Values('U003', 'Jarno', 'Jaakkola', 'Staffpoint', '8459456-3')


insert into toimittajat (toimittajatunnus, toimittaja,ytunnus)
values ('SP001', 'Rautia', '4556391-3')
insert into toimittajat (toimittajatunnus, toimittaja,ytunnus)
values ('SP002', 'Starkki','6458903-8')
insert into toimittajat (toimittajatunnus, toimittaja,ytunnus)
values ('SP003', 'Puutavara OY','3789413-4')


insert into materiaali (materiaalitunnus, materiaali, hinta)
values ('MAT01', 'Ruuvi', 0.20)
insert into materiaali (materiaalitunnus, materiaali, hinta)
values ('MAT02', 'Lauta 50x100', 1)
insert into materiaali (materiaalitunnus, materiaali, hinta)
values ('MAT03', 'Lauta 50x125', 1.2) 
insert into materiaali (materiaalitunnus, materiaali, hinta)
values ('MAT04', 'Lauta 50x150', 1.5)

insert into varasto (varastotunnus, materiaalitunnus, määrä, hyllykoodi, toimittaja)
values ('VAR01', 'MAT02', 300, '01-1', 'SP003')
insert into varasto (varastotunnus, materiaalitunnus, määrä, hyllykoodi, toimittaja)
values ('VAR01', 'MAT03', 230, '01-4', 'SP003')
insert into varasto (varastotunnus, materiaalitunnus, määrä, hyllykoodi, toimittaja)
values ('VAR01', 'MAT04', 150, '01-2', 'SP003')

insert into työmaa (työmaatunnus, paikkakunta,asiakas,aloituspvm,lopetuspvm)
values('SC001','Vaasa','A001','06.06.2013','07.07.2017')
 


insert into työmaavarasto (varastotunnus, työmaatunnus, hyllykoodi, lähdevarasto,lähdehylly, määrä)
values ('TV1', 'SC001', '01-1','VAR01','01-1', 100)
insert into työmaavarasto (varastotunnus, työmaatunnus, hyllykoodi, lähdevarasto,lähdehylly, määrä)
values ('TV1', 'SC001', '01-2','VAR01','01-2', 50)
insert into työmaavarasto (varastotunnus, työmaatunnus, hyllykoodi, lähdevarasto,lähdehylly, määrä)
values ('TV1', 'SC001', '01-3','VAR01','01-3', 20)


insert into laite (laitetunnus, sarjanumero, nimi, vuokrattu, vuokraaja, työmaa, varasto)
values ('L001', '123-321', 'Saksinosturi', 0, null, null , 'VAR01')  
insert into laite (laitetunnus, sarjanumero, nimi, vuokrattu, vuokraaja, työmaa, varasto)
values ('L003', '678-234', 'Jyrä', 0, null, 'SC003' , null) 
insert into laite (laitetunnus, sarjanumero, nimi, vuokrattu, vuokraaja, työmaa, varasto)
values ('L005', '111-390', 'Kaivuri', 1, 'V002', 'SC001' , null)


insert into vuokraaja (vuokraajatunnus, vuokraaja,ytunnus)
values ('V001', 'Peab','4857345-1')
insert into vuokraaja (vuokraajatunnus, vuokraaja,ytunnus)
values ('V002', 'Pekkaniska','4453677-4')




insert into asiakas (asiakastunnus,ytunnus,yrityksennimi,osoite,yhteyshenkilö,sähköposti, puhelinnumero)
values ('A001', '8573528-4', 'VAMK', 'Wolfintie 30', 'Kenneth Norrgård', 'Kenneth.Norrgård@vamk.fi','+358408936742')

insert into työmaa (työmaatunnus, paikkakunta, asiakas, aloituspvm, lopetuspvm)
values ('SC001', 'Vaasa', 'VAMK', '05.12.2014', '05.05.2015')

insert into työaika (työntekijätunnus, työmaatunnus, päivä, tunnit)
values ('T001', 'SC001', '10.01.2014', 8)
insert into työaika (työntekijätunnus, työmaatunnus, päivä, tunnit)
values ('T002', 'SC001', '10.01.2014', 8)
