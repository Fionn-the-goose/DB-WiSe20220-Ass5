INSERT INTO Magic_karten(KartenNr, Name, Seltenheit, Sprache, Kartentext, Künstler, Manakosten, Preis) VALUES(30000, 'Aasfressende Ameisen', 'uncommon', 'deutsch', 'Krieg ist kein Picknick pflegte mein Vater zu sagen. Doch die Ameisen schienen anderer Meinung zu sein', 'unknown', '2+2 black', 0.99);
INSERT INTO Magic_karten(KartenNr, Name, Seltenheit, Sprache, Kartentext, Künstler, Manakosten, Preis) VALUES(20370, 'Black Cat', 'common', 'english', 'Its last life is spend tormenting your dreams', 'unknown', '1+1 black', 1.99);
INSERT INTO Magic_karten(KartenNr, Name, Seltenheit, Sprache, Kartentext, Künstler, Manakosten, Preis) VALUES(12345, 'Negate', 'uncommon', 'english', 'Shatter your opponents spell with enough force, and youll shatter their confidence with it.', 'Dominik Mayer', '1+1blau', 1.99);

INSERT INTO Kunden(KundenNr, Adresse, Name, Vorname) VALUES(10000, 'Weimar Strasse_A Nr.15', 'Telle', 'Anne');
INSERT INTO Kunden(KundenNr, Adresse, Name, Vorname) VALUES(10001, 'Weimar Strasse_B Nr.12', 'Trojan', 'Marie');
INSERT INTO Kunden(KundenNr, Adresse, Name, Vorname) VALUES(10002, 'Weimar Strasse_C Nr.9', 'Erickson', 'Fionn');

INSERT INTO Produkt(ProduktNr, Name, Typ, Preis, Award) VALUES('C-12', 'Negate', 'Magic-Karte', 1.99, 'Most Hated');
INSERT INTO Produkt(ProduktNr, Name, Typ, Preis, Award) VALUES('C-10', 'Der Ur-Drache', 'Magic_Karte', 129.99, 'none');
INSERT INTO Produkt(ProduktNr, Name, Typ, Preis, Award) VALUES('M-2', 'Killer Hamster', 'Plushie', 30.0, 'Fanfavorite');

INSERT INTO Award(Name, AwardJahr) VALUES('Most silliest', 2022);
INSERT INTO Award(Name, AwardJahr) VALUES('Fanfavorite', 2012);
INSERT INTO Award(Name, AwardJahr) VALUES('Most Hated', 2015);

INSERT INTO Bestellung(BestellNr, KundenNr, ProduktNr, Datum, Rechnung) VALUES('120', '10001', 'M-2', "10.08.2020", "Coole Rechnung1");
INSERT INTO Bestellung(BestellNr, KundenNr, ProduktNr, Datum, Rechnung) VALUES('110', '10001', 'M-2', "24.12.2022", "Coole Rechnung2");
INSERT INTO Bestellung(BestellNr, KundenNr, ProduktNr, Datum, Rechnung) VALUES('140', '10001', 'M-2', "10.09.2019", "Coole Rechnung3");