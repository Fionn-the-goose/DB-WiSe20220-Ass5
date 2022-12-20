CREATE TABLE Magic_karten(KartenNr int,Name varchar(255),Seltenheit varchar(255),Sprache varchar(255), Kartentext varchar(255),Künstler varchar(255), Manakosten varchar(255),Preis float, PRIMARY KEY(KartenNr));
CREATE TABLE Kunden(KundenNr int,Adresse varchar(255),Name varchar(255),Vorname varchar(255),PRIMARY KEY(KundenNr));
CREATE TABLE Produkt(ProduktNr varchar(255),Name varchar(255),Typ varchar(255),Preis float,PRIMARY KEY(ProduktNr));
CREATE TABLE Award(Name varchar(255),AwardJahr int,PRIMARY KEY(Name));
CREATE TABLE Bestellung(BestellNr int, KundenNr int, ProduktNr int, Datum varchar(255), Rechnung varchar(255), PRIMARY KEY(BestellNr), FOREIGN KEY(KundenNr) REFERENCES Kunde(KundenNr), FOREIGN KEY(ProduktNr) REFERENCES Produkt(ProduktNr));