import random

# Created by Simran Banga

# Shows all of the patients in the hospital
# def getPatientProfile(myCursor):
#     myCursor.execute(f"select * from Patient where Hospital = 'Grace';")
#     myCursor.execute(f"select * from Patient where Hospital = 'Metorpolitan';")
#     myCursor.execute(f"select * from Patient where Hospital = 'Outlette';")
#     myResult = myCursor.fetchall() 

#     print(myResult)


def getPatientProfile(myCursor):
    print("Please enter the following information: ")
    fName = input('First Name: ')
    lName = input('Last Name: ')

    myResult = patientProfile(myCursor, fName, lName)
    if(myResult == []):
        print(f"This Doctor does not exist.")
        return
    
    if(len(myResult) > 1):
        print(f"There are multiple patients named {fName} {lName}")
        patientID = input("Please specify your Patient ID: ")
        myResult = patientProfile(myCursor, fName, lName, patientID)
    
    myResult = myResult[0]
    print(f"Name: {myResult[0]}")
    print(f"Age: {myResult[1]}")
    print(f"Address: {myResult[2]}")
    print(f"Mobile Phone: {myResult[3]}")
    print(f"Home Phone: {myResult[4]}")
    print(f"Disease: {myResult[5]}")
    print(f"PatientID: {myResult[6]}")
    print(f"Hospital: {myResult[7]}")



def patientProfile(myCursor, fName, lName, patientID=None):
    if(patientID == None):
        myCursor.execute(f"SELECT CONCAT(pat.FirstName,\' \',  pat.LastName), pat.age, CONCAT(pat.StreetNumber, \' \' , pat.StreetName, \', \' , pat.City, \', \', pat.Province, \', \',  pat.PostalCode), pat.MobilePhone, pat.HomePhone, pat.Disease, pat.PatientID, pat.Hospital FROM Patient as pat WHERE pat.FirstName=\"{fName}\" AND pat.LastName=\"{lName}\";")
    else:
        myCursor.execute(f"SELECT CONCAT(pat.FirstName,\' \',  pat.LastName), pat.age, CONCAT(pat.StreetNumber, \' \' , pat.StreetName, \', \' , pat.City, \', \', pat.Province, \', \',  pat.PostalCode), pat.MobilePhone, pat.HomePhone, pat.Disease, pat.PatientID, pat.Hospital FROM Patient as pat WHERE pat.FirstName=\"{fName}\" AND pat.LastName=\"{lName}\" AND pat.PatientID=\"{patientID}\";")

    myResult = myCursor.fetchall() 

    return myResult

# Randomly assigns a patient into a hospital
def AssignPatientToHospital():
    hospitals = ['Grace', 'Metropolitan', 'Ouellette']
    result = random.choice(hospitals)

    # print(f"Patient has been assigned to {result}.")
    return result

# Relocates patient into a different hospital
def relocatePatient(myCursor, mydb):
    PatientID = input("Patient ID: ")
    NewLocation = input("Hospital: ")

    myCursor.execute(f"update Patient set Hospital = %s where PatientID = %s", (NewLocation, PatientID))
    
    try:
        mydb.commit()
    except:
        pass
    
    myCursor.close()

    print(f"Patient with ID {PatientID} has been relocated to {NewLocation}.")

# Lists the treatments the patient had, updates patient and displays the bill from the pharmacy 
def treatPatient(myCursor, mydb): 
    PatientID = input("PatientID: ")
    Treatment = input("Treatment: ")
    TotalFee = input("Cost: ")

    myCursor.execute(f"SELECT PharmacyName FROM Pharmacy;")

    result = (myCursor.fetchall())

    print(f"Pharmacy (", end="")

    for ph in result:
        print(ph[0] + ", ", end="")

    print("): ", end="")
         


    PharmacyName = input("")



    myCursor.execute(f"SELECT @NewBillNo := MAX(BillNO)+1 FROM HospitalBills; ")
    myCursor.execute(f"insert into HospitalBills values (@NewBillNO, (SELECT Ph.PharmacyID FROM Pharmacy as Ph WHERE Ph.PharmacyName=\'{PharmacyName}\'), (SELECT Pat.Hospital FROM Patient as Pat WHERE Pat.PatientID={PatientID}), \'{Treatment}\', \'{TotalFee}\');")
    
    myCursor.execute(f"update Patient set Treatment = \'{Treatment}\', TotalFee={TotalFee} where PatientID = {PatientID};")

    try:
        mydb.commit()
    except:
        pass
    
    myCursor.close()
    myCursor = mydb.cursor(buffered=True)


    myCursor.execute(f"select Treatment, TotalFee, Hospital from Patient where PatientID = {PatientID};")
    result = myCursor.fetchall() 

    if result:
        Treatment = result[0][0]
        TotalFee = result[0][1]
        print(f"Total bill for patient with ID {PatientID} from {result[0][2]} is: ${TotalFee}")
    else:
        print(f"This patient has no treatment information.")

   
