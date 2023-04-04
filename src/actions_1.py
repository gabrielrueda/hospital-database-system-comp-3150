import mysql.connector
from actions_2 import checkValidDate

# Created by Mark Finerty

def addNurse(myCursor, mydb):
    print("Please enter the following information: ")
    fName = input('First Name: ')
    mInitial = input('Middle Initial: ')
    lName = input('Last Name: ')

    myResult = nurseProfile(myCursor, fName, lName)
    if(myResult != []):
        print(f"Nurses of the name {fName} {lName} exist: ")
        for result in myResult:
            print(f"Nurse: ")
            print(f"\tName: {result[0]}")
            print(f"\tSpecialization: {result[1]}")
            print(f"\tAddress: {result[2]}")
            print(f"\tDate {result[3]}")
            print(f"\tSIN Number: {result[4]}")
            print(f"\tSalary: {result[5]}")
        
        question = input("Would you still like to add a Nurse? (y/n)")
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
                                                 
    myCursor.execute(f"INSERT INTO Nurse VALUES(@NewEmpID, (SELECT SpecialID FROM Specialization WHERE SpecialName=\'{specialization}\'), NULL, NULL);")
    
    myCursor.close()


def getNurseProfile(myCursor):
    print("Please enter the following information: ")
    fName = input('First Name: ')
    lName = input('Last Name: ')

    myResult = nurseProfile(myCursor, fName, lName)
    if(myResult == []):
        print(f"This Nurse does not exist.")
        return
    
    if(len(myResult) > 1):
        print(f"There are multiple doctors named {fName} {lName}")
        empID = input("Please specify your Employee ID: ")
        myResult = nurseProfile(myCursor, fName, lName, empID)
    
    myResult = myResult[0]

    print(f"Name: {myResult[0]}")
    print(f"Specialization: {myResult[1]}")
    print(f"Address: {myResult[2]}")
    print(f"Date {myResult[3]}")
    print(f"EmployeeID: {myResult[4]}")
    print(f"Salary: {myResult[5]}")


def nurseProfile(myCursor, fName, lName, empID=None):
    if(empID == None):
        myCursor.execute(f"SELECT CONCAT(e.FirstName,' ', e.MiddleInitials, '. ',  e.LastName), s.SpecialName, CONCAT(e.StreetNum, ' ' , e.StreetName, ', ' , e.City, ', ', e.Province, ', ',  e.PostalCode), e.DateHired, e.SinNumber, CONCAT('$', e.Salary) FROM Nurse as n, Employee as e, Specialization as s WHERE n.EmpID = e.EmpID AND n.Specialization = s.SpecialID AND e.FirstName=\"{fName}\" AND e.LastName=\"{lName}\";")
    else:
        myCursor.execute(f"SELECT CONCAT(e.FirstName,' ', e.MiddleInitials, '. ',  e.LastName), s.SpecialName, CONCAT(e.StreetNum, ' ' , e.StreetName, ', ' , e.City, ', ', e.Province, ', ',  e.PostalCode), e.DateHired, e.SinNumber, CONCAT('$', e.Salary) FROM Nurse as n, Employee as e, Specialization as s WHERE n.EmpID = e.EmpID AND n.Specialization = s.SpecialID AND e.FirstName=\"{fName}\" AND e.LastName=\"{lName}\" AND e.EmpID=\"{empID}\";")
    
    myResult = myCursor.fetchall() 

    return myResult

def getBillsHospital(myCursor):

    hospitalName = input("From which hospital would you like to retrieve bills due?\n \
                         Options are, Ouellette, Grace, and Metropolitan:\n")

    myCursor.execute(f'''SELECT hb.BillNO, hb.PrescriptionName, hb.Amount, p.PharmacyName
                    FROM HospitalBills as hb 
                    INNER JOIN Pharmacy as p
                    ON hb.PharmacyID = p.PharmacyID 
                    WHERE hb.HospitalName ='{hospitalName}';''')
    
    bills = myCursor.fetchall()

    print(f"{hospitalName} owes the following bills:")
    for bill in bills:
        print(f"Bill number {bill[0]} \n\tPrescription: {bill[1]} \n\tAmount due: {bill[2]} \n\tPharmacy: {bill[3]}")

    myCursor.close()