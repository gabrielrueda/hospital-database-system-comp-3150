# Lists the treatments the patient had, updates patient and displays the bill from the pharmacy 
def treatPatient(myCursor): 
    PatientID = input("PatientID: ")
    Treatment = input("Treatment: ")
    TotalFee = input("Cost: ")
    PharmacyName = input("Pharmacy Name: ")

    myCursor.execute(f"insert into HospitalBills (PatientID, Treatment, TotalFee) values (%s, %s, %s)", (PatientID, Treatment, TotalFee))
    
    myCursor.execute(f"update Patient set Treatment = %s where PatientID = %s", (Treatment, PatientID))

    myCursor.execute(f"select Treatment, TotalFee from Patient where PatientID = %s and PharmacyName = %s", (PatientID, PharmacyName))
    result = myCursor.fetchall() 

    if result:
        Treatment = result[0][0]
        TotalFee = result[0][1]
        print(f"Total bill for patient with ID {PatientID} from {PharmacyName} is: ${TotalFee}")
    else:
        print(f"This patient has no treatment information.")