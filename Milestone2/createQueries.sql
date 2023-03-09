USE HOSPITAL_DB;

-- DROP TABLE Doctor_Patient_List;
-- DROP TABLE Nurse;
-- DROP TABLE Hospital_Bills;
-- DROP TABLE Pharmacy;
-- DROP TABLE Hospital;
-- DROP TABLE Patient;
-- DROP TABLE Doctor;
-- DROP TABLE Specialization;
-- DROP TABLE Employee;

CREATE TABLE Employee (
	f_name VARCHAR(15),
    m_initials CHAR(2),
	l_name VARCHAR(15),
    sin_number INT(9),
	emp_ID INT(9) PRIMARY KEY,
	salary DECIMAL(10,2),
    date_hired DATE,
    province CHAR(2),
    city VARCHAR(15),
    street_num INT(5),
    street_name VARCHAR(25),
    postal_code CHAR(6)
);


CREATE TABLE Specialization (
	special_ID SMALLINT(1) PRIMARY KEY,
    special_name VARCHAR(50)
);

CREATE TABLE Doctor(
	emp_ID INT(9),
	specialization SMALLINT(1),
	NumPatients int NOT NULL,
    PRIMARY KEY(emp_ID),
    FOREIGN KEY(emp_ID) REFERENCES Employee(emp_ID),
    FOREIGN KEY(specialization) REFERENCES Specialization(special_ID)
);

CREATE TABLE Patient(
	PatientID int NOT NULL,
	SIN int NOT NULL,
	FirstName varchar(50) NOT NULL,
	MiddleName varchar(50) NULL,
	LastName varchar(50) NOT NULL,
	Age int NOT NULL,
	City varchar(50) NOT NULL,
	Province char(2) NOT NULL,
	PostalCode char(6) NOT NULL,
	StreetName varchar(50) NOT NULL,
	StreetNumber int NOT NULL,
	ApartmentNumber int,
	MobilePhone char(10) NOT NULL,
	HomePhone char(10) NOT NULL,
	PrimaryDoctorID int NOT NULL,
	Disease varchar(50) NOT NULL,
	Treatment varchar(50) NOT NULL,
	NumberOfDaysAdmitted int NOT NULL,
	TotalFee DECIMAL(10,2) NOT NULL,

    PRIMARY KEY(PatientID), 
    FOREIGN KEY(PrimaryDoctorID) REFERENCES Doctor(emp_ID)
);



CREATE TABLE Hospital
(
    HospitalName VARCHAR(30),
    Address_StreetAddress_StreetNo INT,
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

CREATE TABLE Pharmacy
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

CREATE TABLE Hospital_Bills
(
    Bill_NO INT NOT NULL,
    PharmacyID INT NOT NULL,
    HospitalName VARCHAR(30),
    PrescriptionName VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) DEFAULT 0 NOT NULL,
    
    PRIMARY KEY(Bill_NO),
    FOREIGN KEY(HospitalName) REFERENCES Hospital(HospitalName),
    FOREIGN KEY(PharmacyID) REFERENCES Pharmacy(PharmacyID)
);



CREATE TABLE Nurse (
	emp_ID INT(9),
    specialization SMALLINT(1),
    patient_1 INT(9),
    patient_2 INT(9),
    
    PRIMARY KEY(emp_ID),
    FOREIGN KEY(emp_ID) REFERENCES Employee(emp_ID),
    FOREIGN KEY (patient_1) REFERENCES Patient(PatientID),
    FOREIGN KEY (patient_2) REFERENCES Patient(PatientID),
    FOREIGN KEY(specialization) REFERENCES Specialization(special_ID)
);


CREATE TABLE Doctor_Patient_List(
    DocID int NOT NULL,
    PatientID int NOT NULL,
    FOREIGN KEY(DocID) REFERENCES Doctor(emp_ID), 
    FOREIGN KEY(PatientID) REFERENCES Patient(PatientID)
); 

