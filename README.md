# hospital-database-system-comp-3150
COMP-3150 Database Management Systems Course Final Project - Hospital Database System


#### SQL Setup
- Ensure you have MySQL on your machine.
- Create a new Database called HOSPITAL_DB
- Run the .SQL Scripts in the InitialSQLSetup folder
    - NOTE: modify the createUser script with your own username/password
- Order to run SQL scripts:
    - createDatabase.sql
    - createUser.sql
    - createQueries.sql
    - insertQueries.sql

#### Run Python Script
```bash
git clone https://github.com/gabrielrueda/hospital-database-system-comp-3150.git

cd hospital-database-system-comp-3150

python -m pip install mysql-connector-python 

python src/main.py
```
