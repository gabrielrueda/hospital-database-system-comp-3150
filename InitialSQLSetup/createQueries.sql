USE HOSPITAL_DB;

CREATE TABLE Employee (
	FirstName VARCHAR(15),
    MiddleInitials CHAR(2),
	LastName VARCHAR(15),
    SinNumber INT(9),
	EmpID INT(9) PRIMARY KEY,
	Salary DECIMAL(10,2),
    DateHired DATE,
    Province CHAR(2),
    City VARCHAR(15),
    StreetNum INT(5),
    StreetName VARCHAR(25),
    PostalCode CHAR(6)
);


CREATE TABLE Specialization (
	SpecialID SMALLINT(1) PRIMARY KEY,
    SpecialName VARCHAR(50),
    UNIQUE(SpecialName)
);

CREATE TABLE Doctor(
	EmpID INT(9),
	Specialization SMALLINT(1),
	NumPatients int NOT NULL,
    PRIMARY KEY(EmpID),
    FOREIGN KEY(EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY(Specialization) REFERENCES Specialization(SpecialID)
);

CREATE TABLE Hospital
(
    HospitalName VARCHAR(30),
    AddressStreetAddressStreetNo INT,
    AddressStreetAddressName VARCHAR(30),
    AddressCity VARCHAR(20) NOT NULL,
    AddressProvince CHAR(2) NOT NULL,
    AddressPostalCode CHAR(6) NOT NULL,

    AmountOwedToPharmacy DECIMAL(10, 2) DEFAULT 0,

    PRIMARY KEY(HospitalName)
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
    Hospital VARCHAR(30),
	Treatment varchar(50),
	NumberOfDaysAdmitted int NOT NULL,
	TotalFee DECIMAL(10,2) DEFAULT 0,

    PRIMARY KEY(PatientID), 
    FOREIGN KEY(Hospital) REFERENCES Hospital(HospitalName),
    FOREIGN KEY(PrimaryDoctorID) REFERENCES Doctor(EmpID)
);



CREATE TABLE Pharmacy
(
    PharmacyID INT NOT NULL,
    PharmacyName varchar(30) NOT NULL,
    AddressStreetAddressStreetNo SMALLINT,
    AddressStreetAddressName VARCHAR(30),
    AddressStreetAddressSuiteNo SMALLINT,
    AddressCity VARCHAR(20) NOT NULL,
    AddressProvince CHAR(2) NOT NULL,
    AddressPostalCode CHAR(6) NOT NULL,
    PRIMARY KEY(PharmacyID)
);

CREATE TABLE HospitalBills
(
    BillNO INT NOT NULL,
    PharmacyID INT NOT NULL,
    HospitalName VARCHAR(30),
    PrescriptionName VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) DEFAULT 0 NOT NULL,
    
    PRIMARY KEY(BillNO),
    FOREIGN KEY(HospitalName) REFERENCES Hospital(HospitalName),
    FOREIGN KEY(PharmacyID) REFERENCES Pharmacy(PharmacyID)
);



CREATE TABLE Nurse (
	EmpID INT(9),
    Specialization SMALLINT(1),
    Patient1 INT(9),
    Patient2 INT(9),
    
    PRIMARY KEY(EmpID),
    FOREIGN KEY(EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY (Patient1) REFERENCES Patient(PatientID),
    FOREIGN KEY (Patient2) REFERENCES Patient(PatientID),
    FOREIGN KEY(Specialization) REFERENCES Specialization(SpecialID)
);


CREATE TABLE DoctorPatientList(
    DocID int NOT NULL,
    PatientID int NOT NULL,
    FOREIGN KEY(DocID) REFERENCES Doctor(EmpID), 
    FOREIGN KEY(PatientID) REFERENCES Patient(PatientID)
); 

