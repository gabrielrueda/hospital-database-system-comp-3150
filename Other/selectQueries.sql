USE HOSPITAL_DB;

-- Just Write all the queries we use in our program here --


-- Doctor Profile --

SELECT CONCAT(e.FirstName,' ', e.MiddleInitials, '. ',  e.LastName), 
s.SpecialName, 
CONCAT(e.StreetNum, ' ' , e.StreetName, ', ' , e.City, ', ', e.Province, ', ',  e.PostalCode),
e.DateHired,
e.SinNumber,
CONCAT('$', e.Salary)
FROM Doctor as d, Employee as e, Specialization as s
WHERE d.EmpID = e.EmpID AND d.Specialization = s.SpecialID
AND e.FirstName="Carlos";


-- Add Doctor --
USE HOSPITAL_DB;

-- Add Doctor Part -- 
SELECT @NewEmpID := MAX(EmpID)+1 FROM Employee;
INSERT IGNORE into Specialization 
VALUES((SELECT MAX(SpecialID)+1 FROM Specialization S),
 "Gastroenterology");
INSERT INTO Employee VALUES('Gabriel', 'I','Rueda',3479534,@NewEmpID,158488.00,'2022-04-20','ON','Windsor',816,'University AVE','N1E656');
INSERT INTO Doctor VALUES(@NewEmpID, (SELECT SpecialID FROM Specialization WHERE SpecialName='Gastroenterology'), 0);


SELECT * FROM Employee;

-- ALTER TABLE Specialization
-- ADD UNIQUE (SpecialName); 



DELETE FROM Specialization
WHERE SpecialID=15;


SELECT * FROM Specialization;


-- getDoctorPatientList -- 

SELECT Pat.PatientID, CONCAT(Pat.FirstName,' ', Pat.LastName), Pat.Disease, Pat.Treatment
FROM Patient as Pat 
WHERE Pat.PatientID IN (SELECT DPList.PatientID FROM DoctorPatientList as DPList WHERE DPList.DocID=243512326);


SELECT CONCAT(E.FirstName,' ', E.LastName), E.empID FROM Employee as E
WHERE EmpID IN (SELECT N.EmpID FROM Nurse as N WHERE N.Patient1=354234322 OR N.Patient2=354234322)


-- payBills --
SELECT Treatment, TotalFee FROM Patient WHERE PatientID=324212123;

UPDATE Patient SET Treatment=NULL, TotalFee=0 WHERE PatientID=324212123;

DELETE FROM HospitalBills WHERE PrescriptionName='Meds' and Amount=555.55;



-- Patient List --
SELECT CONCAT(FirstName, ' ', LastName), PatientID FROM Patient

SELECT CONCAT(FirstName, ' ', LastName), EmpID FROM Employee as E WHERE EmpID IN (SELECT EmpID FROM Doctor);

SELECT CONCAT(FirstName, ' ', LastName), EmpID FROM Employee as E WHERE EmpID IN (SELECT EmpID FROM Nurse);



-- Patient Profile --
select * from Patient where Hospital = 'Grace';
select * from Patient where Hospital = 'Metorpolitan';
select * from Patient where Hospital = 'Outlette';

-- Modified Patient Profile --

SELECT CONCAT(pat.FirstName,' ',  pat.LastName), pat.age, CONCAT(pat.StreetNumber, ' ' , pat.StreetName, ', ' , pat.City, ', ', pat.Province, ', ',  pat.PostalCode), pat.MobilePhone, pat.HomePhone, pat.Disease, pat.PatientID, pat.Hospital FROM Patient as pat WHERE pat.FirstName="Jade" AND pat.LastName="Silva";



-- Relocate Patient -- 
update Patient set Hospital = %s where PatientID = '324212123'


-- Treat Patient --

SELECT @NewBillNo := MAX(BillNO)+1 FROM HospitalBills;

insert into HospitalBills values (@NewBillNO, 
(SELECT Ph.PharmacyID FROM Pharmacy as Ph WHERE Ph.PharmacyName='Grand Marais'), 
(SELECT Pat.Hospital FROM Patient as Pat WHERE Pat.PatientID=354234322), 
'Closed Reduction', 
'3283.00');

select * FROM `HospitalBills`;

select Treatment, TotalFee from Treatments where PatientID = '324212123'