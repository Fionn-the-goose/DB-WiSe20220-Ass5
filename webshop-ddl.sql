CREATE DATABASE magickarten_webshop;
CREATE TABLE Magic_karten(
    KartenNr int,
    Name varchar(255),
    Seltenheit varchar(255),
    Sprache varchar(255),
    Kartentext varchar(255),
    Künstler varchar(255),
    Manakosten varchar(255)
);
CREATE TABLE Kunden(
    KundenNr int,
    Adresse varchar(255),
    Name varchar(255),
    Vorname varchar(255)
)
CREATE TABLE Produkt(
    ProduktNr int,
    Name varchar(255),
    Typ varchar(255),
    Preis float,
)
CREATE TABLE Award(
    Name varchar(255),
    AwardJahr int,
)