USE HOSPITAL_DB;

-- Create Sample DB Admin User -- 
CREATE USER 'sampleUser'@'localhost' 
IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES ON HOSPITAL_DB.* TO 'sampleUser'@'password123';

