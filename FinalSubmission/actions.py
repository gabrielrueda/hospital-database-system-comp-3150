import mysql.connector
import datetime
from mysql.connector.errors import InternalError

# Put your functions here (make sure it's imported in main just like the way getDoctorProfile is imported)


# Here is an example
# It will just show the first doctor for now, but that will change
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
        myCursor.execute(f"SELECT CONCAT(e.FirstName,' ', e.MiddleInitials, '. ',  e.LastName), s.SpecialName, CONCAT(e.StreetNum, ' ' , e.StreetName, ', ' , e.City, ', ', e.Province, ', ',  e.PostalCode), e.DateHired, e.SinNumber, CONCAT('$', e.Salary) FROM Doctor as d, Employee as e, Specialization as s WHERE d.EmpID = e.EmpID AND d.Specialization = s.SpecialID AND e.FirstName=\"{fName}\" AND e.LastName=\"{lName}\";")
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


# def getDoctorPatientList(myCursor):
