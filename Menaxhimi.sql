create database Menaxhimi

use Menaxhimi

create table Pronari(
	Id_P int primary key,
	Emri varchar(50)not null,
	Mbiemri varchar(50)not null,
	Vendlindja varchar(30)
);

create table Personi(
	NrPatentShoferi int,
	EmriPersoni varchar(50),
	Profesioni varchar(50),
	ID_Pronari int Foreign key  references Pronari(Id_P),

);
create table Restauranti(
	Emri varchar(50) ,
	Id_Restaurant int primary key,
	NrTelefoni int,
	Qyteti varchar(50) NULL,
	ZipKodi int NULL,
	Rruga varchar(50) NULL,
	Kapaciteti int ,
	Vleresimi int NULL,
	ID_PronariR int foreign key references Pronari(Id_P)
);

create table SherbimeOnline(
	Nr_Porosise int ,
	Emri varchar(50) not null,
	Detajet varchar(50) ,
	Cmimi int not null,
	Adresa varchar(100),
	Primary key(Nr_Porosise,Restauranti_ID),
	Restauranti_ID int references Restauranti(Id_Restaurant)
);
create table Puntoret(
	Nr_Personal int primary key,
	Emri varchar(50) not null,
	Mbiemri varchar(50) not null,
	Vendlindja varchar(30),
	DataLindjes date,
	OrariPunes varchar(20),
	ID_R int foreign key references Restauranti(Id_Restaurant)
	);
	

create table Menaxheri(
	Nr_Menaxherit int primary key,
	NR_P int not null,
	Pervoja int not null,
	Shkollimi varchar(200),
	Raportet varchar(500) null,
	foreign key(NR_P) references Puntoret(Nr_Personal)
);

create table Kamarieri(
	Paga int ,
	Nr_Telefonit int null,
	Kontrata varchar(250) not null,
	Bonuset int not null,
	RaportiDitor varchar(500),
	NR_PersonalK int  primary key,
	foreign key(NR_PersonalK)  references Puntoret(Nr_Personal),
	Menaxheri_ID int foreign key references Menaxheri(Nr_Menaxherit)

);
create table Klienti(
	KlientiId int primary key,	
	Nr_Tavolines int not null,
	Nr_Telefoni int not null,
	Emri varchar(100) not null,
	Mbiemri varchar(100)not null
	
);

create table KamarieriKlienti(
	NR_PK int not null,
	NR_Id int not null,
	Primary key(NR_PK,NR_Id),
	foreign key(NR_PK) references Kamarieri(NR_PersonalK),
	foreign key(NR_Id) references Klienti(KlientiId)

);

create table Faktura(
	Faktura_Id int primary key,
	Emri_Restaurantit varchar(100) not null ,
	Emri_Kamarierit varchar(100) not null,
	Cmimi int ,
	Ora time,
	Metoda_Pageses varchar(100) not null,
	K_Id int  foreign key references Klienti(KlientiId)unique
);
create table Porosia(
	Nr_Porosia int primary key,
	Detajet varchar(500),
	Sasia int null,
	Emri_Porosise varchar(150)
);

create table Kuzhinieri(
	Nr_Telefoni int not null unique,
	Paga int not null,
	NR_PersonalKu int primary key,
	Certifikim varchar(250) not null,
	Kontrata varchar(250) not null,
	OreShtese int null,
	foreign key(NR_PersonalKu) references Puntoret(Nr_Personal) 
);
create table Porosia_Kuzhinieri(
		Nr_PorosiaK int primary key,
		Timer int not null,
		foreign key(Nr_PorosiaK) references Porosia(Nr_Porosia),
		Nr_PersonalKuzhinieri int foreign key references Kuzhinieri(Nr_PersonalKu)
);
create table Restaurant_Klienti(
	Restaurant_IdK int not null,
	Id_Klienti_R int not null,
	foreign key(Restaurant_IdK) references Restauranti(Id_Restaurant),
	foreign key(Id_Klienti_R) references Klienti(KlientiId)
);

insert into  Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (1,'Bleron','Gashi','Prishtine');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (2,'Vesa','Berisha','Feriza');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (3,'Art','Bajrami','Gjilan');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (4,'Ema','Hyseni','Peje');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (5,'Endrit','Aliaj','Prizren');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (6,'Fitim','Hoxha','Lipjan');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (7,'Dardan','Gashi','Gjakove');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (8,'Genta','Kelmendi','Kline');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (9,'Fitore','Berisha','Suhareke');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (10,'Pashtrik','Osmani','Prishtine');
insert into Pronari(Id_P,Emri,Mbiemri,Vendlindja) values (11,'Dion','Morina','Peje');
select*
from Pronari

insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (01,24,'Inxhinier');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (02,14,'Arkitekt');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (03,12,'Ekonomis');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (04,11,'Gjyqtar');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (05,7,'Gazetar');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (06,8,'Journalist');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (07,32,'Minister');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (08,16,'Rojtar');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (09,18,'Shofer Autobusi');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (10,4,'Menaxher');
insert Personi(ID_Pronari,NrPatentShoferi,Profesioni)values (11,442,'Arkitekt');
select*
from Personi

insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Foleja',011,049123534,'Prishtine',2341,'Lagjia e spitalit',150,9,1);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Loriano',012,045874236,'Lipjan',3246,'Veternik',111,5,2);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Mendi',013,049123534,'Prishtine',2341,'Lagjia e spitalit',150,9,1);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Vali' ,014, 049657814,'Gjilan',4536,'Gavran',140,10 ,3);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Sarajeva',015,045127482,'Ferizaj',4105,'Sheshi',90,9,4);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Veranda',016,044718426,'Suhareke',2383,'Arrat',20,10,5);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Vermica',0117,049847189,'Vermice',1234,'asdaad',10,7,6);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Sharri',0111,049852369,'Prizren',1245,'Shatervan',24,7,7);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Ariu',0112,044985263,'Badovc',7564,'afer liqenit',56,9,8);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('Bjeshka',0116,045156478,'Brezovic',1234,'Afer pistes',12,10,9);
insert Restauranti (Emri,Id_Restaurant,NrTelefoni,Qyteti,ZipKodi,Rruga,Kapaciteti,Vleresimi,ID_PronariR) values ('MC-Donald',0119,045156478,'Prishtine',2341,'Sheshi Nene Tereza',120,10,10);
select*
from Restauranti


insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (13, 011,'Pasta','pasta me djath mozarela',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (14, 012,'Pasta','pasta me djath francez',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (15, 013,'Pasta','pasta me djath italian',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (16, 011,'Pasta','pasta me djath zvicerrian',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (17, 014,'Pasta','pasta me djath italian',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (18, 015,'Pasta','pasta me djath mozarela',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (19, 0111,'Pasta','pasta me djath zvicerrian',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (20, 0117,'Pasta','pasta me djath italian',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (21, 0116,'Pasta','pasta me djath francez',2,'Rruga b-Prishtine');
insert SherbimeOnline(Nr_Porosise,Restauranti_ID,Emri,Detajet,Cmimi,Adresa) values (22, 0112,'Pasta','pasta me djath zvicerrian',2,'Rruga b-Prishtine');
select*
from SherbimeOnline

insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12345678,'Donjet','Dana','Gjakove','1999-06-13','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12359444,'Alma','Zeneli','Prizren','2002-07-29','8-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12742444,'Dior','Dana','Prishtine','1999-08-13','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (16312444,'Enisa','Osmani','Peje','2003-10-07','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (19112444,'Dea','Kuka','Gjilan','2001-11-19','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12311444,'Era','Gashi','Prishtine','2003-05-18','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12355444,'Lorisa','Krasniqi','Ferizaj','2001-12-01','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12369444,'Alisa','Zenuni','Prishtine','2002-04-04','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12399444,'Rita','Beka','Prishtine','2003-04-15','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12335444,'Rinesa','Bajraktari','Gjakove','2003-04-21','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12335894,'Almir','Rraci','FusheKosove','2003-04-21','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12335344,'Ilir','Ujkani','Gjakove','2003-04-21','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (12331944,'Dorant','Bajraktari','Gjilan','2003-06-30','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (18335444,'Dior','Kastrati','Ferizaj','2002-01-25','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (19335444,'Enisa','Balaj','Prishtine','2003-09-04','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (048587575,'Amir','Rexha','Rahovec','2002-11-04','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (87552455,'Masar','Hadumi','Mitrovice','2000-07-24','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (89552455,'Arlind','Mahmuti','Mitrovice','2000-09-28','9-5',0119);

insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (14311444,'Era','Kastrati','Prishtine','1991-05-18','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (57355444,'Lorisa','Kukaj','Ferizaj','1989-12-01','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (36969444,'Alisa','Nikolla','Prishtine','1975-04-04','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (35399444,'Rinor','Beka','Prizren','1993-04-15','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (69335444,'Rinesa','Nikolla','Gjakove','1994-04-21','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (85335894,'Almir','Deda','FusheKosove','1982-04-21','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (75125344,'Ilir','Kukaj','Gjakove','1971-04-21','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (89531944,'Dorant','Xhoci','Gjilan','1970-06-30','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (22335444,'Dior','Nikolla','Prizren','1997-01-25','9-5',0119);
insert Puntoret(Nr_Personal,Emri,Mbiemri,Vendlindja,DataLindjes,OrariPunes,ID_R) values (2135444,'Ded','Dedaj','Prizren','1987-09-04','9-5',0119);
select*
from Puntoret

insert into Menaxheri(Nr_Menaxherit,NR_P,Pervoja,Shkollimi,Raportet) values (115,12345678,3,'Master','Cdo gje ne rregull');




insert into  Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044561875,3,75,'Aktiv',12742444,115);
insert into  Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044561885,3,75,'Aktiv',12359444,115);

insert into Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044561855,3,75,'Aktiv',12742444,115);

insert into Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044561865,3,75,'Aktiv',16312444,115);

insert into Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,04456125,3,75,'Aktiv',19112444,115);

insert into  Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044561175,3,75,'Aktiv',12311444,115);

insert into Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044562575,3,50,'Aktiv',12355444,115);


insert into  Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044566575,3,75,'Aktiv',19335444,115);

insert into Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (400,044564575,3,75,'Aktiv',18335444,115);



insert into Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (350,048587575,5,70,'Aktiv',87552455,115);
insert into Kamarieri(Paga,Nr_Telefonit,Kontrata,Bonuset,RaportiDitor,NR_PersonalK,Menaxheri_ID) 
values (500,048667575,6,70,'Aktiv',89552455,115);

select*
from Kamarieri

insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (001,12,049115372,'Rigon','Gashi');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (002,13,049123425, 'Syela','Krasniqi');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (003,1,049178372,'','Gashi');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (004,14,049535372,'Rita','Gashi');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (005,16,049115372,'Drilon','Gashi');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (006,18,049525372,'Dorant','Hoxha');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (007,22,049595372,'Rigon','HOxha');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (008,15,049175372,'Fisnik','HOxha');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (009,14,049895372,'Flutra','HOxha');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (010,13,049795372,'Laurena','Gashi');
insert Klienti (KlientiId,Nr_Tavolines,Nr_Telefoni,Emri,Mbiemri) values (011,13,049795372,'Laurent','Gashi');
select*
from Klienti


insert KamarieriKlienti(NR_PK,NR_Id)values(12355444,001);
insert KamarieriKlienti(NR_PK,NR_Id)values(12355444,002);
insert KamarieriKlienti(NR_PK,NR_Id)values(12355444,003);
insert KamarieriKlienti(NR_PK,NR_Id)values(19112444,001);
insert KamarieriKlienti(NR_PK,NR_Id)values(12355444,010);
insert KamarieriKlienti(NR_PK,NR_Id)values(12359444,005);
insert KamarieriKlienti(NR_PK,NR_Id)values(12742444,006);
insert KamarieriKlienti(NR_PK,NR_Id)values(12742444,007);
insert KamarieriKlienti(NR_PK,NR_Id)values(16312444,008);
insert KamarieriKlienti(NR_PK,NR_Id)values(18335444,009);
select*
from KamarieriKlienti

insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12315,'MC-Donald','Dior',100,'20:18:10','Kesh',002);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12316,'MC-Donald','Elton',50,'16:44:10','Kartele',008);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12317,'MC-Donald','Elion',44,'16:26:10','Kartele',003);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12318,'MC-Donald','Dior',63,'18:18:10','Kartele',008);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12319,'MC-Donald','Olti',24,'22:23:18','Kesh',001);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12320,'MC-Donald','Enisa',84,'19:46:10','Kesh',004);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12321,'MC-Donald','Andis',89,'20:14:10','Kartele',005);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12322,'MC-Donald','Lorisa',75,'20:55:50','Kesh',006);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12323,'MC-Donald','Lorisa',66,'22:14:40','Kartele',007);
insert Faktura(Faktura_Id,Emri_Restaurantit,Emri_Kamarierit,Cmimi,Ora,Metoda_Pageses,K_Id) values (12324,'MC-donald','Enisa',152,'21:23:30','Kesh',001);
select*
from Faktura 

insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (11,'Tavolina nr 2',3,'Pizza Margarita');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (12,'Tavolina nr 3',1,'Pasta');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (13,'Tavolina nr 4',4,'Hamburger');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (14,'Tavolina nr 2',2,'Sandwitch');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (15,'Tavolina nr 5',5,'Sandwitch');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (16,'Tavolina nr 6',6,'Hamburger');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (17,'Tavolina nr 8',8,'Pasta');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (18,'Tavolina nr 9',9,'Pasta');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (19,'Tavolina nr 11',5,'Pizza Margarita');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (20,'Tavolina nr 13',4,'Pasta');
insert Porosia(Nr_Porosia,Detajet,Sasia,Emri_Porosise) values (21,'Tavolina nr 14',6,'Sandwitch');
select*
from Porosia

insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (044156152,600,'Diplome',10,16,14311444);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (044152052,600,'Diplome',10,17,57355444);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (049156152,600,'Diplome',10,15,36969444);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (048156622,600,'Diplome',10,16,35399444);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (043926962,600,'Diplome',10,16,69335444);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (045716582,600,'Diplome',10,16,85335894);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (044646152,600,'Diplome',10,16,75125344);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (044556152,600,'Diplome',10,16,89531944);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (044016152,600,'Diplome',10,16,22335444);
insert Kuzhinieri (Nr_Telefoni,Paga,Certifikim,Kontrata,OreShtese,NR_PersonalKu) values (044486152,600,'Diplome',10,16,2135444);
select*
from Kuzhinieri

insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (11,22335444,20);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (12,89531944,12);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (13,69335444,23);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (14,85335894,15);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (15,69335444,20);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (16,85335894,30);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (17,35399444,25);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (18,57355444,22);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (19,14311444,28);
insert Porosia_Kuzhinieri(Nr_PorosiaK,Nr_PersonalKuzhinieri,Timer) values (20,36969444,40);
select*
from Porosia_Kuzhinieri

insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,001);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,002);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,003);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,004);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,005);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,006);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,007);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,008);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,009);
insert Restaurant_Klienti(Restaurant_IdK,Id_Klienti_R) values (0119,010);
select*
from Restaurant_Klienti

update Restauranti
set ZipKodi = 2341
where Id_Restaurant = 0119;
update Klienti
set Emri='Armend' 
where KlientiId=003;
update Klienti
set Emri = 'Rigon' , Mbiemri = 'Fazliu' , Nr_Telefoni= 044512349
where KlientiId = 001;
update Klienti 
set Emri = 'Auron' , Mbiemri = 'Bytyqi' , Nr_Telefoni = 049234532
where KlientiId = 002;
update Klienti 
set Emri = 'Genti ' , Mbiemri = 'Gashi' , Nr_Telefoni = 045126486
where KlientiId = 004;
update Puntoret
set Emri = 'Fitim ' , Mbiemri = 'Haziri' 
where Nr_Personal = 12345678;
update Puntoret
set Emri = 'Shpejtim' , Mbiemri = 'Hoti'
where Nr_Personal = 12359444;
update Puntoret
set Emri = 'Valent' , Mbiemri = 'Kryeziu'
where Nr_Personal = 2135444;
update Faktura 
set Emri_Kamarierit = 'Edi' 
where Faktura_Id = 12315;
update Faktura
set Emri_Kamarierit = 'Blerim'
where Faktura_Id = 12316;
update Menaxheri 
set Shkollimi = 'bachelor'
where Nr_Menaxherit = 115;
update Menaxheri
set Shkollimi = 'dr'
where Nr_Menaxherit = 115;
update Menaxheri
set Pervoja = 5
where NR_P = 12345678;
update Restauranti
set Emri = 'Oxygen'
where Id_Restaurant = 011;
update Restauranti
set Emri = 'Sarajeva'
where Id_Restaurant = 015;
update Kuzhinieri
set Paga = 700
where NR_PersonalKu = 2135444;
update Kuzhinieri
set Kontrata = 5
where NR_PersonalKu = 2135444;
update Kuzhinieri 
set OreShtese = 20
where NR_PersonalKu = 2135444;
update Porosia
set Sasia = 7
where Nr_Porosia = 11;
update Porosia
set Emri_Porosise = 'shpageta'
where Nr_Porosia = 12;
update SherbimeOnline
set Detajet = 'djath mozarela'
where Emri = 'pasta';
update SherbimeOnline 
set Cmimi = 2
where Emri = 'Hamburger';



delete from Restauranti where Vleresimi = 5;
delete from Personi where Profesioni = 'Gjyqtar';
delete from Faktura  where Cmimi = 75;
delete from Faktura  where Cmimi = 66;
delete from Personi where Profesioni = 'Avokat';
delete from Klienti where KlientiId = 011;
delete from Puntoret where Nr_Personal = 12335894;
delete from Porosia where Nr_Porosia = 20;
delete from Porosia where Nr_Porosia = 21;
delete from Kamarieri where NR_PersonalK = 19335444;

--1 Donjet Dana--
select *
from Puntoret
where Vendlindja ='Prishtine';

select *
from Puntoret
where Emri = 'Dior';

select Emri,Mbiemri,Vendlindja
from Puntoret 
where Emri = 'Dior';

select Mbiemri
from Puntoret
group by Mbiemri;

--2 Donjet Dana--
select Restaurant_IdK
from Restaurant_Klienti
where Id_Klienti_R = 002 
Group by Restaurant_IdK;

select Timer
from Porosia_Kuzhinieri
where Timer > 20 ;

select *
from Klienti
where Nr_Tavolines = 13 ;

select Emri_Porosise
from Porosia p
where p.Detajet = 'Tavolina nr 2';

--3 Donjet Dana--

SELECT Vendlindja, COUNT(*) AS puntori_count
FROM Puntoret 
GROUP BY Vendlindja
ORDER BY puntori_count DESC;


SELECT MAX(Paga) as Second_BiggestSalary
FROM Kamarieri
WHERE Paga NOT IN (
  SELECT MAX(Paga)
  FROM Kamarieri
)



SELECT Emri_Kamarierit, COUNT(K_Id) AS Total_Clients
FROM Faktura
GROUP BY Emri_Kamarierit
HAVING COUNT(K_Id) = (SELECT MAX(cnt) 
                      FROM (SELECT COUNT(K_Id) as cnt
                            FROM Faktura 
                            GROUP BY Emri_Kamarierit) as t)


SELECT Emri_Restaurantit, COUNT(K_Id) AS Total_Clients
FROM Faktura
GROUP BY Emri_Restaurantit
HAVING COUNT(K_Id) = (SELECT MAX(cnt) 
                      FROM (SELECT COUNT(K_Id) as cnt
                            FROM Faktura 
                            GROUP BY Emri_Restaurantit) as t)

--simple subqueries Donjet Dana--
SELECT Klienti.Emri, Klienti.Mbiemri, SUM(Faktura.Cmimi) as Total_Porosia
FROM Klienti
INNER JOIN Faktura
ON Klienti.KlientiId = Faktura.K_Id
GROUP BY Klienti.Emri, Klienti.Mbiemri
HAVING SUM(Faktura.Cmimi) > 50
ORDER BY Total_Porosia DESC;
;

SELECT AVG(ku.Paga) as paga_Mesatare
FROM Kamarieri ku
WHERE ku.Paga > 
  (SELECT  ku.Paga
   FROM Kamarieri ku
	where ku.NR_PersonalK = 87552455 );

SELECT ID_PronariR, COUNT(*) as restaurant_Pronari
FROM Restauranti
GROUP BY ID_PronariR
HAVING COUNT(*) > 1;

SELECT Profesioni, COUNT(*) as Profesioni_MeIShpeshte
FROM Personi
GROUP BY Profesioni
HAVING COUNT(*) > 1;

--Advanced Subqueries  Donjet Dana--
SELECT r.Emri
FROM Restauranti r
WHERE r.ID_PronariR = (SELECT Id_P FROM Pronari WHERE Emri = 'Dardan' );


SELECT Emri, Mbiemri
FROM Klienti
WHERE KlientiId IN (SELECT K_Id FROM Faktura WHERE Emri_Restaurantit = 'MC-Donald');

SELECT Puntoret.Emri, Puntoret.Mbiemri, Menaxheri.Nr_Menaxherit, Restauranti.Emri
FROM Kamarieri
JOIN Puntoret ON Kamarieri.NR_PersonalK = Puntoret.Nr_Personal
JOIN Menaxheri ON Kamarieri.Menaxheri_ID = Menaxheri.Nr_Menaxherit
JOIN Restauranti ON Puntoret.ID_R = Restauranti.Id_Restaurant;

SELECT SherbimeOnline.Emri, SherbimeOnline.Detajet, Restauranti.Emri
FROM SherbimeOnline
JOIN Restauranti ON SherbimeOnline.Restauranti_ID = Restauranti.Id_Restaurant;



--Union/Prerja/Diferenca Donjet Dana

SELECT k.NR_PersonalK
FROM Kamarieri k
WHERE k.NR_PersonalK IN (
  SELECT p.Nr_Personal
  FROM Puntoret p
  WHERE p.DataLindjes BETWEEN '2000-01-01' AND '2010-01-01'
)
EXCEPT
SELECT k.NR_PersonalK
FROM Kamarieri k
WHERE k.NR_PersonalK IN (
  SELECT p.Nr_Personal
  FROM Puntoret p
  WHERE p.DataLindjes BETWEEN '1950-01-01' AND '2000-01-01'
);

SELECT k.NR_PersonalK
FROM Kamarieri k
WHERE k.NR_PersonalK IN (
  SELECT p.Nr_Personal
  FROM  Puntoret p 
  WHERE p.Mbiemri='Krasniqi'
)
Union
SELECT k.NR_PersonalKu
FROM Kuzhinieri k
WHERE k.NR_PersonalKu IN (
  SELECT p.Nr_Personal
  FROM Puntoret p
  WHERE p.Mbiemri='Nikolla'
);




SELECT  p.ID_Pronari
FROM Personi p
WHERE ID_Pronari IN (
  SELECT Id_P
  FROM Pronari
  WHERE Emri = 'Bleron'
)
UNION
SELECT k.NR_PersonalK
FROM Kamarieri k
WHERE NR_PersonalK IN (
  SELECT Nr_Personal
  FROM Puntoret
  WHERE Emri = 'Dior'
);

SELECT p.ID_Pronari
FROM Personi p
WHERE p.ID_Pronari IN (
  SELECT p.Id_P
  FROM Pronari p
  WHERE p.Vendlindja = 'Prishtine'
)
Union
SELECT NR_PersonalK
FROM Kamarieri k
WHERE NR_PersonalK IN (
  SELECT pr.Nr_Personal
  FROM Puntoret pr
  WHERE pr.Vendlindja = 'Prishtine'
);














--Storage Procedures Donjet Dana- -



CREATE PROCEDURE GetRestaurantInfo (@Id_Restaurant INT)
AS
BEGIN
	SELECT * FROM Restauranti WHERE Id_Restaurant = @Id_Restaurant;
END

CREATE PROCEDURE sp_InsertPronari (@IdP int, @Emri varchar(50), @Mbiemri varchar(50), @Vendlindja varchar(30))
AS
BEGIN
    INSERT INTO Pronari (Id_P, Emri, Mbiemri, Vendlindja)
    VALUES (@IdP, @Emri, @Mbiemri, @Vendlindja)
END

CREATE PROCEDURE CheckKamarierStatus (@NR_PK INT)
AS
BEGIN
   DECLARE @Menaxher_ID INT
   SET @Menaxher_ID = (SELECT Menaxheri_ID FROM Kamarieri WHERE NR_PersonalK = @NR_PK)

   IF @Menaxher_ID IS NULL
   BEGIN
      PRINT 'This waiter does not have a manager assigned yet.'
   END
   ELSE
   BEGIN
      PRINT 'This waiter has a manager assigned.'
   END
END

CREATE PROCEDURE CheckRestaurantCapacity (@Emri_Restaurantit VARCHAR(100))
AS
BEGIN
   DECLARE @Capacity INT
   SET @Capacity = (SELECT Kapaciteti FROM Restauranti WHERE Emri = @Emri_Restaurantit)

   IF @Capacity <= 0
   BEGIN
      PRINT 'This restaurant is full.'
   END
   ELSE
   BEGIN
      PRINT 'This restaurant has seats available.'
      SET @Capacity = @Capacity - 1
      UPDATE Restauranti
      SET Kapaciteti = @Capacity
      WHERE Emri = @Emri_Restaurantit
   END
END





----Rigon Gashi

select Emri
 from Puntoret
 where Emri ='Rigon';

select*from Kuzhinieri
where Nr_Telefoni = 044156152;

select KlientiId ,Nr_Porosia,Faktura_ID
from Klienti,Faktura ,Porosia
where Nr_Porosia = 2;

select*
from Menaxheri
where Pervoja like 'Bachelor';

select Emri,Mbiemri
from Pronari
where Id_P = 1;
 /*query te thjeshta me dy ose me shume tabela*/

 select p.Nr_Porosia,k.KlientiId
 from Porosia p , Klienti k
 where p.Nr_Porosia = k.KlientiId and p.Emri_Porosise like 'Pasta' and k.Nr_Tavolines like '12';
 /*selektohet numri i porosive qe jan ne list te porosive qe kane emrin pasta dhe numrin e tavolines per sherbim e kane 12*/

 

 select*
 from Puntoret p , Pronari pp
 where p.Emri = pp.Emri;
 /*selektohen puntoret si dhe pronarit qe i perkasin*/




 


 select k.Nr_PorosiaK , count(*) as numri_porosive
 from Porosia_Kuzhinieri k  inner join Porosia p
 on k.Nr_PorosiaK = p.Nr_Porosia
 where k.timer like '20'
 group by k.Nr_PorosiaK;
 /*selektohen numri i porosive te derguara te kuzhinieri si dhe ato qe kan timerin vetem 20 min*/

 select count(*) as numri_Puntoreve
 from Puntoret p inner join Kamarieri k
 on p.OrariPunes = k.Kontrata
 where p.Emri like 'Donat';
 /*selektohen numri i puntoreve te cilet jan kamarier dhe orari i punes a eshte i barabart me kontrat si dhe ne baze te emrit te caktuar*/




