import random

# Put your functions here (make sure it's imported in main just like the way getDoctorProfile is imported)

# Here is an example
# It will just show the first doctor for now, but that will change
def getDoctorProfile(myCursor):

    fName = 'Carlos'
    myCursor.execute(f"SELECT e.FirstName, e.LastName, s.SpecialName FROM Doctor as d, Employee as e, Specialization as s WHERE d.EmpID = e.EmpID AND d.Specialization = s.SpecialID AND e.FirstName='{fName}';")
    myResult = myCursor.fetchall() 

    print(myResult)

# Shows all of the patients in the hospital
def getPatientProfile(myCursor):
    myCursor.execute(f"select * from Patient where Hospital = 'Grace';")
    myCursor.execute(f"select * from Patient where Hospital = 'Metorpolitan';")
    myCursor.execute(f"select * from Patient where Hospital = 'Outlette';")
    myResult = myCursor.fetchall() 

    print(myResult)

# Randomly assigns a patient into a hospital
def AssignPatientToHospital(myCursor):
    hospitals = ['Grace', 'Metropolitan', 'Outlette']
    result = random.choice(hospitals)

    print(f"Patient has been assigned to {result}.")
    return result

# Relocates patient into a different hospital
def relocatePatient(myCursor):
    PatientID = '324212123'
    NewLocation = 'Grace'

    myCursor.execute(f"update Patient set Hospital = %s where PatientID = %s", (NewLocation, PatientID))
    myCursor.connection.commit()

    print(f"Patient with ID {PatientID} has been relocated to {NewLocation}.")

# Lists the treatments the patient had and display the bill
def treatPatient(myCursor): 
    PatientID = '635423432'
    Treatment = 'Antihistamines, Closed Reduction'
    TotalFee = '3283.00'

    myCursor.execute(f"insert into HospitalBills (PatientID, Treatment, TotalFee) values (%s, %s, %s)", (PatientID, Treatment, TotalFee))
    
    myCursor.execute(f"select Treatment, TotalFee from Treatments where PatientID = %s", (PatientID))
    result = myCursor.fetchall() 

    if result:
        TotalFee = result[0][0]
        print(f"Total bill for patient with ID {PatientID} is: ${TotalFee}")
    else:
        print(f"This patient has no treatment information.")

   
