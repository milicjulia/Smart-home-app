INSERT INTO obaveza (pocetak,trajanje,opis,lokacija,idK,idA)
 VALUES ('2021-02-05 21:30:00.00', '2021-02-05 23:00:00.00', 'rodjendan', 'restoran',1,2);
SELECT * FROM obaveza;
SELECT p.naziv FROM alarm a, pesma p, obaveza o WHERE (a.idA=o.idA) AND (a.idP=p.idP)