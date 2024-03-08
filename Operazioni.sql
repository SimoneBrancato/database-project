/* 
	##################################
	# GESTIONE COMPAGNIA DI SOFTWARE # 
    #          OPERAZIONI            #
    ##################################

*/

-- O1 Inserire un nuovo membro del personale
INSERT INTO Personale VALUES
(5564, "Fabio", "Fazio", "Data Analyst", 355, 2200, "Dipendente");


-- O2 Emettere stipendio di ogni membro del personale
INSERT INTO EmissioneStipendio(impiegato, dataemissione, importo)
SELECT p.id, "2024-08-01" , p.stipendio
FROM Personale p;


-- O3 Inserire un nuovo cliente
INSERT INTO Cliente VALUES
(56477745699, "STMicroelectronics", "via Termini 66, Roma");


-- O4 Inserire un nuovo progetto
INSERT INTO Progetto VALUES
(899, "Embedded AMD", "Sviluppo software embedded per AMD", "In corso", 47428823111);


-- O5 Modificare lo stato di un progetto
UPDATE Progetto p
SET p.stato = "Completato"
WHERE p.id = 102;


-- O6 Inserire un nuovo software
INSERT INTO Software VALUES
("FrontendTN", "Frontend per TourismNOW", 101);


-- O7 Rilasciare nuova versione software
INSERT INTO VersioneSoftware VALUES
("WhatsAds", "1.6", "Aggiunto Facade", '2024-03-21');


-- O8 Registrare un nuovo bug
INSERT INTO Bug VALUES
("Facade error", "WhatsAds", "1.6", "Compile error linea 61 modulo Facade", 2, "Aperto");


-- O9 Modificare lo stato di un bug
UPDATE Bug b
SET b.stato = "Risolto"
WHERE b.titolo = "Dati inconsistenti"
AND b.nomesoftware = "InstaAnalysis"
AND b.versionesoftware = "1.2";


-- O10 Visualizzare il numero dei membri di un team
SELECT t.nome as Team, COUNT(*) as NumeroMembri 
FROM Personale p, Team t
WHERE p.team = t.codice
AND t.codice = 355;


-- O11 Calcolare il numero di bug individuati in una versione software
SELECT b.nomesoftware as Software, b.versionesoftware as Versione, COUNT(*) as NumeroBug
FROM Bug b
WHERE b.nomesoftware = "InstaAnalysis"
AND b.versionesoftware = "1.2";


-- O12 Visualizzare i clienti che hanno commissionato più progetti
SELECT c.azienda, COUNT(*) as NumeroProgetti
FROM Cliente c JOIN Progetto p
ON c.partitaiva = p.azienda
GROUP BY c.azienda
HAVING NumeroProgetti >= ALL (
								SELECT COUNT(*)
								FROM Cliente c2 JOIN Progetto p2
								ON c2.partitaiva = p2.azienda
								GROUP BY c2.azienda
                            );
      
      
-- O13 Visualizzare i team che lavorano a più progetti
SELECT t.codice, t.nome, COUNT(*) as NumeroProgetti
FROM Team t 
JOIN ProgettoTeam pt ON t.codice = pt.codiceteam
JOIN Progetto p ON pt.idprogetto = p.id
GROUP BY t.codice
HAVING NumeroProgetti >= ALL (
								SELECT COUNT(*)
								FROM Team t2 
								JOIN ProgettoTeam pt2 ON t2.codice = pt2.codiceteam
								JOIN Progetto p2 ON pt2.idprogetto = p2.id
								GROUP BY t2.nome
							);
                            





