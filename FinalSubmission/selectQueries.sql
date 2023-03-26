USE HOSPITAL_DB;

SELECT e.FirstName, e.LastName, s.SpecialName FROM Doctor as d, Employee as e, Specialization as s
WHERE d.EmpID = e.EmpID AND d.Specialization = s.SpecialID;
