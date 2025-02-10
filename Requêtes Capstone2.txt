-- a) Afficher tous les employés avec leur nom complet et leur adresse.

SELECT CONCAT(First_Name, ' ', Surname) AS `Nom complet`, StreetAddress AS Adresse
FROM companydata_cleaned;


-- b) Afficher tous les départements avec le nombre d'employés dans chaque département.

SELECT dc.Office_Type AS Departement, COUNT(cc.EmployeeID) AS nb_employee
FROM companydata_cleaned AS cc
INNER JOIN department_cleaned AS dc ON cc.Office_Type = dc.Office_Type
GROUP BY dc.Office_Type;

--- c) Afficher le nombre d'employés par sexe.

SELECT Gender, COUNT(EmployeeID) AS Nombre_d_employes
FROM employees_personal_cleaned
GROUP BY Gender;

-- d) Afficher les 5 premiers titres de poste par ordre alphabétique.

SELECT Job_Title
FROM Job_title_cleaned
ORDER BY Job_Title ASC
LIMIT 5;

-- e) Afficher les id des employés ayant un bonus supérieur à 10%.

SELECT EmployeeID
FROM Job_profile_cleaned
WHERE `Bonus_%` > 10;

-- selon comment on comprend l'énoncé

SELECT EmployeeID
FROM Job_profile_cleaned
WHERE `Bonus_%` > 0.1;

-- f) Afficher les niveaux de poste avec le nombre d'employés pour chaque niveau.

SELECT lc.Level, COUNT(cc.EmployeeID) AS Nombre_employee
FROM companydata_cleaned  AS cc
LEFT JOIN Job_profile_cleaned AS jp ON cc.EmployeeID = jp.EmployeeID
LEFT JOIN Levels_cleaned  AS lc ON jp.level_id = lc.level_id
GROUP BY lc.Level;

-- g) Afficher la liste des employés (nom et prénom) qui ont commencé après le 1er janvier 2022.
SELECT First_Name, Surname
FROM Companydata_cleaned
WHERE Start_Date > '2022-01-01';

-- h) Afficher les employés avec leur poste, le département et le niveau de poste.
SELECT cd.First_Name, cd.Surname, jt.Job_title, dc.Office_Type, lc.Level
FROM companydata_cleaned AS cd
LEFT JOIN job_profile_cleaned AS jp ON cd.EmployeeID = jp.EmployeeID
LEFT JOIN job_title_cleaned AS jt ON jp.Job_Profile = jt.Job_Profile
LEFT JOIN department_cleaned AS dc ON cd.Office_Type = dc.Office_Type
LEFT JOIN levels_cleaned AS lc ON jp.level_id = lc.level_id;

-- i) Afficher les employés qui travaillent toujours pour l'entreprise et donner le nombre de ces employés.
SELECT EmployeeID, First_Name, Surname, 
DATEDIFF(Termination_Date, start_Date) AS Nombre_jours_service_employé_parti
FROM companydata_cleaned
WHERE Active_Status_corrige = 1;

-- j) Afficher le taux de rotation par département (nombre d'employés qui ont quitté l'entreprise
--  par rapport au nombre total d'employés).

SELECT Office_Type AS departement,
COUNT(CASE WHEN Active_Status_corrige = 0 THEN EmployeeID END) AS Employe_Partis,
COUNT(CASE WHEN Active_Status_corrige = 1 THEN EmployeeID END) AS Employe_presents,
COUNT(*) AS Nombre_total_employe,
ROUND(COUNT(CASE WHEN Active_Status_corrige = 0 THEN EmployeeID END) / COUNT(*) * 100,2) AS Taux_rotation
FROM companydata_cleaned
GROUP BY Office_Type;
 
-- k) Afficher le nombre total de jours de service pour chaque employé en prenant en 
-- compte la date de début et la date de fin de service (pour les employés qui ont quitté).
 
SELECT First_Name, Surname, Start_Date, Termination_Date, 
    DATEDIFF(IFNULL(Termination_Date, CURDATE()), Start_Date) AS Nombre_Jours_Service
FROM companydata_cleaned;
 
 
-- l) Afficher les employés avec le montant total de leur compensations (salaire + bonus) par ordre croissant des départements.
 
-- Je suppose que 'Bonus_%' est déjà au format %
 
SELECT cc.First_Name, cc.Surname, (jp.Compensation + (jp.Compensation * jp.`Bonus_%`)) AS Montant_Total_Compensation,
    dc.department_id, dc.Office_Type
FROM companydata_cleaned cc
LEFT JOIN job_profile_cleaned AS jp ON cc.EmployeeID = jp.EmployeeID
LEFT JOIN department_cleaned AS dc ON cc.Office_Type = dc.Office_Type
ORDER BY dc.Office_Type ASC;
 
