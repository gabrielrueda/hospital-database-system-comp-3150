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