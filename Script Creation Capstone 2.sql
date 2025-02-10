CREATE DATABASE Capstone2

USE Capstone2

CREATE TABLE  Companydata_cleaned (
     EmployeeID int DEFAULT NULL,
     First_Name varchar(255) DEFAULT NULL,
     Surname varchar(255) DEFAULT NULL,
     StreetAddress varchar(255) DEFAULT NULL,
     Age  int DEFAULT NULL,
     Office varchar(255) DEFAULT NULL,
     Office_Type varchar(255) DEFAULT NULL,
     Notes  varchar(255) DEFAULT NULL,
     Start_Date  datetime DEFAULT NULL,
     Termination_Date  datetime DEFAULT NULL,
     Active_Status_corrige varchar(255) DEFAULT NULL,
    PRIMARY KEY (EmployeeID)
);

CREATE TABLE  department_cleaned (
     department_id varchar(255) DEFAULT NULL,
     Office_Type varchar(255) DEFAULT NULL,
    PRIMARY KEY (department_id)
);

CREATE TABLE levels_cleaned (
     level_id varchar(255) DEFAULT NULL,
    `Level`varchar(255) DEFAULT NULL,
    PRIMARY KEY (level_id)
);

CREATE TABLE  Job_title_cleaned (
     Job_title  varchar(255) DEFAULT NULL,
     Job_profile varchar(255) DEFAULT NULL,
    PRIMARY KEY (`Job_profile`)
);

CREATE TABLE IF NOT EXISTS employees_personal_cleaned (
     EmployeeID  int(11) DEFAULT NULL,
     Gender varchar(255) DEFAULT NULL,
     Disability int(11) DEFAULT NULL,
     Education varchar(255) DEFAULT NULL,
    PRIMARY KEY (`EmployeeID`)
    -- FOREIGN KEY (`EmployeeID`) REFERENCES `Companydata_cleaned`(`EmployeeID`)
);

CREATE TABLE IF NOT EXISTS job_profile_cleaned (
     id int(11) DEFAULT NULL,
     EmployeeID int(11) DEFAULT NULL,
     department_id varchar(255) DEFAULT NULL,
     level_id varchar(255) DEFAULT NULL,
     Job_Profile  varchar(255) DEFAULT NULL,
     Compensation  varchar(255) DEFAULT NULL,
     Bonus_% FLOAT DEFAULT NULL,
    PRIMARY KEY (`EmployeeID`)
--    FOREIGN KEY (`EmployeeID`) REFERENCES Companydata_cleaned (`EmployeeID`),
--    FOREIGN KEY (`level_id`) REFERENCES levels_cleaned (`level_id`),
--    FOREIGN KEY (`department_id`) REFERENCES Departement_cleaned (`department_id`),
--    FOREIGN KEY (`Job_profile`) REFERENCES Job_title_cleaned (`Job_profile`),
    
);