import mysql.connector
import datetime
from mysql.connector.errors import InternalError
from actions_3 import AssignPatientToHospital


# Created by Gabriel Rueda

def getDoctorProfile(myCursor):
    print("Please enter the following information: ")
    fName = input('First Name: ')
    lName = input('Last Name: ')

    myResult = doctorProfile(myCursor, fName, lName)
    if(myResult == []):
        print(f"This Doctor does not exist.")
        return
    
    if(len(myResult) > 1):
        print(f"There are multiple doctors named {fName} {lName}")
        empID = input("Please specify your Employee ID: ")
        myResult = doctorProfile(myCursor, fName, lName, empID)
    
    myResult = myResult[0]
    print(f"Name: {myResult[0]}")
    print(f"Specialization: {myResult[1]}")
    print(f"Address: {myResult[2]}")
    print(f"Date {myResult[3]}")
    print(f"SIN Number: {myResult[4]}")
    print(f"Salary: {myResult[5]}")


def doctorProfile(myCursor, fName, lName, empID=None):
    if(empID == None):
        myCursor.execute(f"SELECT CONCAT(e.FirstName,' ', e.MiddleInitials, '. ',  e.LastName), s.SpecialName, CONCAT(e.StreetNum, ' ' , e.StreetName, ', ' , e.City, ', ', e.Province, ', ',  e.PostalCode), e.DateHired, e.SinNumber, CONCAT('$', e.Salary),e.EmpID FROM Doctor as d, Employee as e, Specialization as s WHERE d.EmpID = e.EmpID AND d.Specialization = s.SpecialID AND e.FirstName=\"{fName}\" AND e.LastName=\"{lName}\";")
    else:
        myCursor.execute(f"SELECT CONCAT(e.FirstName,' ', e.MiddleInitials, '. ',  e.LastName), s.SpecialName, CONCAT(e.StreetNum, ' ' , e.StreetName, ', ' , e.City, ', ', e.Province, ', ',  e.PostalCode), e.DateHired, e.SinNumber, CONCAT('$', e.Salary) FROM Doctor as d, Employee as e, Specialization as s WHERE d.EmpID = e.EmpID AND d.Specialization = s.SpecialID AND e.FirstName=\"{fName}\" AND e.LastName=\"{lName}\" AND e.EmpID=\"{empID}\";")

    myResult = myCursor.fetchall() 

    return myResult



def checkValidDate(year, month, day):
    try:
        year = int(year)
        month = int(month) 
        day = int(day)
        newDate = datetime.datetime(year,month,day)
        return True
    except ValueError:
        return False
    

def addDoctor(myCursor, mydb):

    print("Please enter the following information: ")
    fName = input('First Name: ')
    mInitial = input('Middle Initial: ')
    lName = input('Last Name: ')

    myResult = doctorProfile(myCursor, fName, lName)
    if(myResult != []):
        print(f"Doctors of the name {fName} {lName} exist: ")
        for result in myResult:
            print(f"Doctor: ")
            print(f"\tName: {result[0]}")
            print(f"\tSpecialization: {result[1]}")
            print(f"\tAddress: {result[2]}")
            print(f"\tDate {result[3]}")
            print(f"\tSIN Number: {result[4]}")
            print(f"\tSalary: {result[5]}")
        
        question = input("Would you still like to add a Doctor? (y/n)")
        if(question.lower() == 'n'): return
            

    myCursor.close()
    myCursor = mydb.cursor(buffered=True)

    provinceConvertor = {
        'Alberta': 'AB',
        'British Columbia': 'BC',
        'Manitoba': 'MB',
        'New Brunswick': 'NB',
        'Newfoundland and Labrador': 'NL',
        'Northwest Territories': 'NT',
        'Nova Scotia': 'NS',
        'Nunavut': 'NU',
        'Ontario': 'ON',
        'Prince Edward Island': 'PE',
        'Quebec': 'QC',
        'Saskatchewan': 'SK',
        'Yukon': 'YT'
    }


    sinNumber = input('SIN Number: ')
    salary = input('Salary: ')
    specialization = input('Specialization: ')
    date = input('Date (YYYY-MM-DD): ')
    while(not checkValidDate(date[0:4], date[5:7], date[8:10])):
        print("Invalid Date!!")
        date = input('Date (YYYY-MM-DD): ')



    streetNum = input('Street Number: ')
    streetName = input('Street Name: ')
    postalCode = input('Postal Code (XXXXXX): ')
    while(len(postalCode) != 6):
        print("Invalid Postal Code!!")
        postalCode = input('Postal Code (XXXXXX): ')

    city = input('City: ')
    province = input("Province:")
    while(province not in provinceConvertor):
        print("Invalid Province!!")
        province = input("Province:")  

    province = provinceConvertor[province]

    myCursor.execute(f'SELECT @NewEmpID := MAX(EmpID)+1 FROM Employee;')

    myCursor.execute(f"INSERT IGNORE into Specialization VALUES((SELECT MAX(SpecialID)+1 FROM Specialization S),\"{specialization}\");")
                     
    
    myCursor.execute(f"INSERT INTO Employee VALUES(\"{fName}\", \"{mInitial}\",\"{lName}\",{sinNumber},@NewEmpID,{salary},\"{date}\",\'{province}\',\'{city}\',{streetNum},\'{streetName}\',\'{postalCode}\');") 
                                                 
    myCursor.execute(f"INSERT INTO Doctor VALUES(@NewEmpID, (SELECT SpecialID FROM Specialization WHERE SpecialName=\'{specialization}\'), 0);")
    
    # myResult = myCursor.fetchall() 

    try:
        mydb.commit()
    except InternalError:
        print("NOTHING")
    
    myCursor.close()


def addPatient(myCursor, mydb):

    print("Please enter the following information: ")
    fName = input('First Name: ')
    mInitial = input('Middle Name: ')
    lName = input('Last Name: ')


    myCursor.close()
    myCursor = mydb.cursor(buffered=True)

    provinceConvertor = {
        'Alberta': 'AB',
        'British Columbia': 'BC',
        'Manitoba': 'MB',
        'New Brunswick': 'NB',
        'Newfoundland and Labrador': 'NL',
        'Northwest Territories': 'NT',
        'Nova Scotia': 'NS',
        'Nunavut': 'NU',
        'Ontario': 'ON',
        'Prince Edward Island': 'PE',
        'Quebec': 'QC',
        'Saskatchewan': 'SK',
        'Yukon': 'YT'
    }


    sinNumber = input('SIN Number: ')
    age = input('Age: ')
    MobileNumber = input('Mobile Number: ')
    HomePhone = input('Home Phone Number: ')
    primaryDoc = input('Primary Docter ID: ')
    disease = input('Disease: ')
    hospital = AssignPatientToHospital()
    date = input('Date (YYYY-MM-DD): ')
    while(not checkValidDate(date[0:4], date[5:7], date[8:10])):
        print("Invalid Date!!")
        date = input('Date (YYYY-MM-DD): ')



    streetNum = input('Street Number: ')
    streetName = input('Street Name: ')
    postalCode = input('Postal Code (XXXXXX): ')
    while(len(postalCode) != 6):
        print("Invalid Postal Code!!")
        postalCode = input('Postal Code (XXXXXX): ')

    city = input('City: ')
    province = input("Province:")
    while(province not in provinceConvertor):
        print("Invalid Province!!")
        province = input("Province:")  

    province = provinceConvertor[province]

    myCursor.execute(f'SELECT @NewPatientID := MAX(EmpID)+1 FROM Employee;')
    myCursor.execute(f"INSERT INTO Patient VALUES (@NewPatientID, {sinNumber}, \'{fName}\', \'{mInitial}\', \'{lName}\', {age}, \'{city}\', \'{province}\', \'{postalCode}\', \'{streetName}\', {streetNum}, NULL, \'{MobileNumber}\', \'{HomePhone}\', {primaryDoc}, \'{disease}\',\'{hospital}\',NULL, 0, 0);")

    try:
        mydb.commit()
    except InternalError:
        print("NOTHING")
    
    myCursor.close()

def getDoctorPatientList(myCursor):
    print("Please enter the following information: ")
    fName = input('First Name: ')
    lName = input('Last Name: ')
    empID = None

    myResult = doctorProfile(myCursor, fName, lName)
    if(myResult == []):
        print(f"This Doctor does not exist.")
        return
    
    if(len(myResult) > 1):
        print(f"There are multiple doctors named {fName} {lName}")
        empID = input("Please specify your Employee ID: ")
        myResult = doctorProfile(myCursor, fName, lName, empID)
    else:
        empID = myResult[0][6]

    myCursor.execute(f"SELECT Pat.PatientID, CONCAT(Pat.FirstName,' ', Pat.LastName), Pat.Disease, Pat.Treatment FROM Patient as Pat WHERE Pat.PatientID IN (SELECT DPList.PatientID FROM DoctorPatientList as DPList WHERE DPList.DocID={empID});")

    myResult = myCursor.fetchall() 

    if(myResult == []):
        print(f"Dr. {fName} {lName} currently has no patients")
    else:
        for patient in myResult:
            print(f"\nPatient: {patient[1]} ({patient[0]})")
            print(f"\tDisease: {patient[2]}")
            if(patient[3] == None):
                print(f"No Treatement Yet")
            else:
                print(f"\tTreatment: {patient[3]}")
            
            myCursor.execute(f"SELECT CONCAT(E.FirstName,\' \', E.LastName), E.empID FROM Employee as E WHERE EmpID IN (SELECT N.EmpID FROM Nurse as N WHERE N.Patient1={patient[0]} OR N.Patient2={patient[0]});")
            nurses = myCursor.fetchall() 
            print(f"\tNurses:")
            if(nurses == []): print(f"\t\tNone")
            for nurse in nurses:
                print(f"\t\t{nurse[0]} ({nurse[1]})")


def payBill_Patient(myCursor, mydb):
    patientID = input("Patient ID: ")
    myCursor.execute(f"SELECT Treatment, TotalFee FROM Patient WHERE PatientID={patientID};")

    myResult = myCursor.fetchall()
    if(myResult[0][0] == "None"): 
        print(f"No Bills to pay")


    print(f"Bill:")
    print(f"\tTreatment: {myResult[0][0]}") 
    print(f"\tCost: {myResult[0][1]}")

    
    if((input("\nWould you like to pay for this (y/n)? ")).lower() == 'n'): return
    
    myCursor.close()
    myCursor = mydb.cursor(buffered=True)

    myCursor.execute(f'UPDATE Patient SET Treatment=NULL, TotalFee=0 WHERE PatientID={patientID};')
    myCursor.execute(f'DELETE FROM HospitalBills WHERE PrescriptionName=\'{myResult[0][0]}\' and Amount={myResult[0][1]};')

    try:
        mydb.commit()
    except InternalError:
        print("NOTHING")
    
    myCursor.close()

def patientList(myCursor):
    myCursor.execute(f'SELECT CONCAT(FirstName, \' \', LastName), PatientID FROM Patient;')
    patients = myCursor.fetchall()

    print(f"Patient List: ")
    for patient in patients:
        print(f"{patient[0]}: ({patient[1]})")


def employeeList(myCursor):
    myCursor.execute(f'SELECT CONCAT(E.FirstName, \' \', E.LastName), E.EmpID FROM Employee as E WHERE E.EmpID IN (SELECT EmpID FROM Doctor);')
    doctors = myCursor.fetchall()

    print(f"Doctor List: ")
    for doctor in doctors:
        print(f"{doctor[0]}: ({doctor[1]})")

    myCursor.execute(f'SELECT CONCAT(E.FirstName, \' \', E.LastName), E.EmpID FROM Employee as E WHERE E.EmpID IN (SELECT EmpID FROM Nurse);')
    nurses = myCursor.fetchall()

    print(f"\nNurse List: ")
    for nurse in nurses:
        print(f"{nurse[0]}: ({nurse[1]})")


