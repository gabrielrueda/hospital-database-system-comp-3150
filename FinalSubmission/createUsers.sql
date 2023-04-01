USE HOSPITAL_DB;

-- Doctor User -- 
CREATE USER 'doctor'@'localhost' 
IDENTIFIED BY 'doctor123';

GRANT INSERT, SELECT, UPDATE 
ON HOSPITAL_DB.Doctor TO 'doctor'@'localhost';

GRANT INSERT, SELECT, UPDATE 
ON HOSPITAL_DB.Employee TO 'doctor'@'localhost';

GRANT INSERT, SELECT, UPDATE 
ON HOSPITAL_DB.DoctorPatient TO 'doctor'@'localhost';

GRANT SELECT, UPDATE 
ON HOSPITAL_DB.Patient TO 'doctor'@'localhost';

GRANT INSERT, SELECT, UPDATE 
ON HOSPITAL_DB.Specialization TO 'doctor'@'localhost';

FLUSH PRIVILEGES;

SELECT * FROM Doctor

SELECT * FROM Patient

-- DELETE USERS --
-- DROP USER 'username'@'localhost';