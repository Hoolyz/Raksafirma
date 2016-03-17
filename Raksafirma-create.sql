CREATE DATABASE t4_Raksafirma

use t4_Raksafirma

create table työntekijä (
työntekijätunnus char (4) not null ,
etunimi varchar (50) not null ,
sukunimi varchar (50) not null ,
henkilötunnus char (11) not null ,
lähiosoite varchar (50) not null ,
kaupunki varchar (50) not null ,
puhelinnumero char (13) not null ,
sähköposti varchar (50) not null ,
koulutus varchar (50) not null ,
primary key (työntekijätunnus) ) ;

create table urakoitsija (
urakoitsijatunnus char (4) not null ,
etunimi varchar (50) not null ,
sukunimi varchar (50) not null ,
yritys varchar (50) not null ,
ytunnus char (9) not null ,
primary key (urakoitsijatunnus) ) ;


create table toimittajat (
toimittajatunnus char (5) not null ,
toimittaja varchar (50) not null ,
ytunnus char (9) not null ,
primary key (toimittajatunnus) ) 


create table materiaali (
materiaalitunnus char (5) not null ,
materiaali varchar (50) not null ,
hinta decimal (9,2) not null ,
primary key (materiaalitunnus) ) ;


create table varasto (
varastotunnus char (5) not null ,
materiaalitunnus char  (5) not null ,
määrä int not null ,
hyllykoodi char (6) not null ,
toimittaja char (5) not null ,
primary key (varastotunnus,hyllykoodi) ,
foreign key (materiaalitunnus) references materiaali ,
foreign key (toimittaja) references toimittajat )



create table vuokraaja (
vuokraajatunnus char (4) not null ,
vuokraaja varchar (50) not null ,
ytunnus char (9) not null ,
primary key (vuokraajatunnus) );


create table asiakas (
asiakastunnus char (4) not null ,
ytunnus char (9) not null ,
yrityksennimi varchar (50) not null ,
osoite varchar (50) not null ,
yhteyshenkilö varchar (50) not null ,
sähköposti varchar (50) not null ,
puhelinnumero char (13) not null ,
primary key (asiakastunnus) )


create table työmaa (
työmaatunnus char (5) not null ,
paikkakunta varchar (50) not null ,
asiakas char (4) not null ,
aloituspvm date not null ,
lopetuspvm date not null ,
primary key (työmaatunnus) ,
foreign key (asiakas) references asiakas )



create table työmaavarasto (
varastotunnus char (3) not null ,
työmaatunnus char (5) not null ,
hyllykoodi char (6) not null ,
lähdevarasto char  (5) not null ,
lähdehylly char (6) not null ,
määrä int not null ,
primary key (varastotunnus,hyllykoodi) ,
foreign key (työmaatunnus) references työmaa ,
foreign key (lähdevarasto,lähdehylly) references varasto(varastotunnus,hyllykoodi)  ,
);

create table työaika (
työaikatunnus int identity (1,1) not null ,
työntekijätunnus char (4) ,
urakoitsijatunnus char (4) ,
työmaatunnus char (5) not null ,
päivä date not null ,
tunnit decimal (2,1) not null ,
primary key (työaikatunnus) ,
foreign key(työntekijätunnus) references työntekijä ,
foreign key(urakoitsijatunnus) references urakoitsija ,
foreign key (työmaatunnus) references työmaa) ;

create table laite (
laitetunnus char (4) not null ,
sarjanumero varchar (50) not null ,
nimi varchar (50) not null ,
vuokrattu smallint check (vuokrattu=0 or vuokrattu =1) not null ,
vuokraaja char (4) ,
työmaa char (5) ,
varasto char (5) , 
hyllykoodi char (6) ,
primary key (laitetunnus) ,
foreign key (vuokraaja) references vuokraaja ,
foreign key (työmaa) references työmaa ,
foreign key (varasto,hyllykoodi) references varasto(varastotunnus,hyllykoodi)) 
