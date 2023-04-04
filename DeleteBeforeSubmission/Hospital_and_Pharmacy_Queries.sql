USE HOSPITAL_DB;

CREATE TABLE HOSPITAL
(
    HospitalName VARCHAR(30),
    Address_StreetAddress_StreetNo SMALLINT,
    Address_StreetAddress_Name VARCHAR(30),
    Address_City VARCHAR(20) NOT NULL,
    Address_Province CHAR(2) NOT NULL,
    Address_PostalCode CHAR(6) NOT NULL,

    Amount_Owed_To_Pharmacy DECIMAL(10, 2) DEFAULT 0,

    Patient_1 INT, 
    Patient_2 INT, 
    Patient_3 INT, 
    Patient_4 INT, 
    Patient_5 INT, 
    Patient_6 INT, 
    Patient_7 INT, 
    Patient_8 INT, 
    Patient_9 INT, 
    Patient_10 INT, 

    PRIMARY KEY(HospitalName),

    FOREIGN KEY(Patient_1) REFERENCES Patient(PatientID), 
    FOREIGN KEY(Patient_2) REFERENCES Patient(PatientID),
    FOREIGN KEY(Patient_3) REFERENCES Patient(PatientID), 
    FOREIGN KEY(Patient_4) REFERENCES Patient(PatientID), 
    FOREIGN KEY(Patient_5) REFERENCES Patient(PatientID), 
    FOREIGN KEY(Patient_6) REFERENCES Patient(PatientID),
    FOREIGN KEY(Patient_7) REFERENCES Patient(PatientID), 
    FOREIGN KEY(Patient_8) REFERENCES Patient(PatientID), 
    FOREIGN KEY(Patient_9) REFERENCES Patient(PatientID), 
    FOREIGN KEY(Patient_10) REFERENCES Patient(PatientID)
);

CREATE TABLE PHARMACY
(
    PharmacyID INT NOT NULL,
    PharmacyName varchar(30) NOT NULL,
    Address_StreetAddress_StreetNo SMALLINT,
    Address_StreetAddress_Name VARCHAR(30),
    Address_StreetAddress_SuiteNo SMALLINT,
    Address_City VARCHAR(20) NOT NULL,
    Address_Province CHAR(2) NOT NULL,
    Address_PostalCode CHAR(6) NOT NULL,
    PRIMARY KEY(PharmacyID)
);

CREATE TABLE HOSPITALBILLS
(
    Bill_NO INT NOT NULL,
    Pharmacy_ID INT NOT NULL,
    Hospital_Name VARCHAR(30),
    PrescriptionName VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) DEFAULT 0 NOT NULL,
    
    PRIMARY KEY(Bill_NO),
    FOREIGN KEY(Hospital_Name) REFERENCES HOSPITAL(HospitalName),
    FOREIGN KEY(Pharmacy_ID) REFERENCES PHARMACY(PharmacyID)
);




-- INSERT QUERIES --

USE HOSPITAL_DB;

INSERT INTO HOSPITAL
VALUES ("Metropolitan", 1995, "Lens Ave", "Windsor","ON", "N8W1L9", 0);

INSERT INTO HOSPITAL
VALUES ("Outlette", 1030, "Ouellette Ave", "Windsor","ON", "N9A1E1", 0);

INSERT INTO HOSPITAL
VALUES ("Grace", 1453, "Prince Rd.", "Windsor","ON", "N9C3Z4", 0);

INSERT INTO PHARMACY
VALUES (164187546, "Shoppers", 1421, "Grand Marais Rd W",0, "Windsor","ON", "N9E4V1");

INSERT INTO PHARMACY
VALUES (198653537, "Loblaw", 2430, "Dougall Ave",0, "Windsor","ON", "N8X1T2");

INSERT INTO PHARMACY
VALUES (147289473, "Grand Marais", 2930, "Dominion Blvd",0, "Windsor","ON", "N9E2M2");

-- TEST IF VALUES UPDATED --
USE HOSPITAL_DB;
SELECT * FROM PHARMACY

SELECT * FROM HOSPITAL


-- DELETE TABLES --

USE HOSPITAL_DB;
DROP TABLE HOSPITALBILLS;

DROP TABLE PHARMACY;

DROP TABLE HOSPITAL;

