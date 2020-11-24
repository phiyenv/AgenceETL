
create table Station(
NomStation varchar(30),
Capacite integer not null ,
Lieu varchar(30) not null UNIQUE,
Region varchar(30), 
Tarif integer default 0 CHECK ( Tarif > 0 ),
primary key (NomStation)
);

create table Client(
IdClient integer,
Nom varchar(30) not null,
Prenom varchar(30),
Ville varchar(30) not null,
Region varchar(30),
Solde integer default 0 not null,
primary key (IdClient)
);

create table Activite(
NomStation varchar(30),
Libelle varchar(30),
Prix integer default 0,
primary key (NomStation,Libelle),
foreign key (NomStation) references Station(NomStation) ON DELETE CASCADE
);

create table Sejour(
IdSejour integer,
IdClient integer,
NomStation varchar(30),
Libelle varchar(30),
Debut date,
NbPlaces integer not null,
primary key (IdSejour),
foreign key (IdClient) references Client(IdClient),
foreign key (NomStation,libelle) references Activite(NomStation, Libelle) ON DELETE CASCADE
);



/*****************************entrepot de données**************************/

create table dimStation(
NomStation varchar(30),
Capacite integer not null ,
Lieu varchar(30) not null UNIQUE,
Region varchar(30), 
Tarif integer default 0 CHECK ( Tarif > 0 ),
primary key (NomStation)
);

create table dimClient(
IdClient integer,
Nom varchar(30) not null,
Prenom varchar(30),
Ville varchar(30) not null,
Region varchar(30),
Solde integer default 0 not null,
primary key (IdClient)
);

create table dimActivite(
NomStation varchar(30),
Libelle varchar(30),
Prix integer default 0,
primary key (NomStation,Libelle),
foreign key (NomStation) references Station(NomStation) ON DELETE CASCADE
);

create table dimTemps(
numt integer,
mois integer,
annee integer,
constraint pkDimTemps primary key(numt));

create table FactSejour(
IdSejour integer,
IdClient integer,
NomStation varchar(30),
Libelle varchar(30),
numt integer,
Debut date,
NbPlaces integer not null,
primary key (IdSejour),
foreign key (IdClient) references dimClient(IdClient),
foreign key (numt) references dimTemps(numt),
foreign key (NomStation,libelle) references dimActivite(NomStation, Libelle) ON DELETE CASCADE
);


/*************************fin de l'écriture de l'entrepot de données*********************/





--Insertion de tuples
INSERT INTO Station VALUES ('Venusa','350','Guadeloupe','Antilles','1200');
INSERT INTO Station VALUES ('Auron', '500','Sainte Etienne', 'Nice','2500');
INSERT INTO Activite VALUES ('Venusa','Voile','150');
INSERT INTO Activite VALUES ('Venusa','Plongee','120');
INSERT INTO Activite VALUES ('Auron', 'Ski','160');
INSERT INTO Activite VALUES ('Auron', 'Escalade','160');
INSERT INTO Client VALUES ('10', 'Fogg', 'Phileas', 'Londres', 'Europe','12465'); 
INSERT INTO Client VALUES ('20', 'Pascal','Blaise','Paris','Europe','6763');
INSERT INTO Client VALUES ('30', 'Kerouac','Jack','New York','Amérique','9812');
INSERT INTO Sejour VALUES ('1','20', 'Venusa', 'Plongee', '2003-08-03', '4');
INSERT INTO Sejour VALUES ('2','10', 'Auron', 'Ski','2019-06-13', '3');
INSERT INTO Sejour VALUES ('3','30', 'Venusa', 'Voile', '2018-02-07', '5');
INSERT INTO Sejour VALUES ('4','20', 'Auron', 'Ski','2017-11-21', '5');

