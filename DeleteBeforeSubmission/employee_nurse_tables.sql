-- create table for employees
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
    postal_code VARCHAR(6)
    );
    
 -- creat specialization table
 CREATE TABLE Specialization (
	special_ID SMALLINT(1) PRIMARY KEY,
    special_name VARCHAR(15)
    );
    
 -- create nurse table
CREATE TABLE Nurse (
	emp_ID INT(9) PRIMARY KEY,
    specialization SMALLINT(1),
    patient_1 INT(9),
    patient_2 INT(9),
    
    FOREIGN KEY(emp_ID) REFERENCES Employee(emp_ID),
    FOREIGN KEY(specialization) REFERENCES Specialization(special_ID)
    -- FOREIGN KEY (patient_1) REFERENCES [Patient].PatientID
    -- FOREIGN KEY (patient_2) REFERENCES [Patient].PatientID
    );
    
    
-- insert all specializations
INSERT INTO Specialization VALUES(1,'Ambulatory');
INSERT INTO Specialization VALUES(2,'Cardiology');
INSERT INTO Specialization VALUES(3,'Dermatology');
INSERT INTO Specialization VALUES(4,'Emergency');
INSERT INTO Specialization VALUES(5,'Maternity');
INSERT INTO Specialization VALUES(6,'Neo-natal');
INSERT INTO Specialization VALUES(7,'Surgery');
    

-- insert all employees
INSERT INTO Employee VALUES('Sophie', 'C','Sears',807616275,332633253,158488.00,'1997-07-16','ON','Windsor',816,'S. Helen St','E8R3K1');
INSERT INTO Employee VALUES('Carlos', 'M', 'Padilla',382498317,243512326,154451.00,'1996-01-17','ON','Windsor',2542,'MacLaren St','K1P5M7');
INSERT INTO Employee VALUES('Lillian', 'J', 'Alvarez',455209551,437256322,121491.00,'1999-06-01','ON', 'Tecumseh',385,'S. Rockwell St',  'H2V6T1');
INSERT INTO Employee VALUES('Yasir', 'L', 'Hodges' ,657728264,535643266,129213.00,'2001-01-02','ON','Leamington',6,'Randall Mill Dr',  'L9H4E5');
INSERT INTO Employee VALUES('Aiza', 'K', 'Hooper',594540705,735254623,159376.00,'2017-05-17','ON','Windsor',65,'Prospect St','E6B3X9');
INSERT INTO Employee VALUES('Zakaria', 'V', 'Olsen',663191870,737343256,147905.00,'2020-12-28', 'ON','Windsor',2904, 'Lauzon Parkway',  'N9A183');
INSERT INTO Employee VALUES('Dillon', 'M', 'Lynn', 285495470,845393295,128371.00,'2011-08-02','ON','LaSalle',979,'Pacific Ave',  'A1N7X6');
INSERT INTO Employee VALUES('Grover', 'Q', 'Hayden',344293002,854757464,130510.00,'1999-06-03', 'ON','Windsor',829,'Goyeau Ave',  'N9A1H9');
INSERT INTO Employee VALUES('Orlando', 'D', 'Mcbride' ,263901249,958658445,128112.00,'2010-10-05','ON','Windsor',747,'N. Illinois Dr',  'H8Y2X3');
INSERT INTO Employee VALUES('Robert', 'L', 'Griffin' ,651161655,983898215,82320.00,'2012-01-23','ON','Windsor',4767,'Goyeau Ave',  'N8Y4V1');
INSERT INTO Employee VALUES('Abdullahi', 'H','Coleman' ,428751914,679872434,66491.00,'2005-12-19','ON','Windsor',4,'Baker Rd','E6K2X6');
INSERT INTO Employee VALUES('Dawn', 'J','Ortiz' ,914013974,688068529,84937.00,'2021-08-30','ON','Leamington',  89,'High Ridge Rd',  'T7V7A7');
INSERT INTO Employee VALUES('Dana', 'M', 'Campos' ,746371072,884945664,69457.00,'2003-04-21','ON','Tecumseh',29,'Manchester Rd',  'V2G9K3');
INSERT INTO Employee VALUES('Ismail','D','Hines',782230653,909474653, 81612.00,'2006-02-02','ON','Windsor',810,'Golf St','J9T6Y1');
INSERT INTO Employee VALUES('Libbie', 'K', 'Whitney' ,636906353, 211783330,67311.00,'2023-11-10','ON','Windsor',3,'North Arlington St','L1E4L7');
INSERT INTO Employee VALUES('Ellis','M','Kerr',452745273,865726055,66728.00,'2002-10-23','ON','LaSalle',7121,'Wall Dr','B2E7M0');
INSERT INTO Employee VALUES('Alicia', 'M','Campbell',880946090,264828278,80985.00,'2012-08-08','ON','Windsor',35,'Canterbury Rd','T7E1V4');
INSERT INTO Employee VALUES('Alistair', 'J','Solis',592973624,299579933,74419.00,'2010-03-16','ON','Windsor',345,'Ellis Ave','N8T4A3');
INSERT INTO Employee VALUES('Sadie', 'C','Calhoun',666585428,181729913,72342.00,'2004-01-22','ON','Windsor',7923,'Country St','N8N9E5');
INSERT INTO Employee VALUES('Ruqayyah', 'O','Martinez',921363293,556789065,79336.00,'2012-08-10','ON','Windsor',99,'Parker St','T7Z4J2');
INSERT INTO Employee VALUES('Joanne', 'K', 'Estez' ,874977043,542728140,83779.00,'2005-05-09','ON','Tecumseh',9997, 'Oakwood St','T1P2E4');
INSERT INTO Employee VALUES('Austin', 'L','Schaefer',638499344,688624307,76275.00,'2012-04-25','ON','Windsor',615,'East Shore Ave','A2H4N5'); 
INSERT INTO Employee VALUES('Raees', 'S', 'Lester',146854037,478116982,83577.00,'2010-08-25','ON','Windsor',277,'Kent St','G6G4E2');
INSERT INTO Employee VALUES('Alys', 'L', 'Mcguire',591315258,361627012,77151.00,'2005-04-07','ON','Kingsville',210,'Ivy Ave','B2J7L9');

-- insert all nurses
INSERT INTO Nurse VALUES(983898215,4,324212123,452346323);
INSERT INTO Nurse VALUES(679872434,7,354234322,NULL);
INSERT INTO Nurse VALUES(688068529,1,344532423,623434362);
INSERT INTO Nurse VALUES(884945664,2,635423432,354234322);
INSERT INTO Nurse VALUES(909474653,4,NULL,NULL);
INSERT INTO Nurse VALUES(211783330,4,342345623,452346323);
INSERT INTO Nurse VALUES(865726055,7,635243221,634233232);
INSERT INTO Nurse VALUES(264828278,4,354234322,NULL);
INSERT INTO Nurse VALUES(299579933,1,342345623,NULL);
INSERT INTO Nurse VALUES(181729913,5,623434362,344532423);
INSERT INTO Nurse VALUES(556789065,4,635423432,354623432);
INSERT INTO Nurse VALUES(542728140,3,354623432,635423432);
INSERT INTO Nurse VALUES(688624307,6,354234322,NULL);
INSERT INTO Nurse VALUES(478116982,2,452346323,354234322);
INSERT INTO Nurse VALUES(361627012,1,634233232,344532423);

select * from Employee;
select * from Nurse;
select * from Specialization;