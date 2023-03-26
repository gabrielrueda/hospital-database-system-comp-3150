
# Put your functions here (make sure it's imported in main just like the way getDoctorProfile is imported)

# Here is an example
# It will just show the first doctor for now, but that will change
def getDoctorProfile(myCursor):

    fName = 'Carlos'
    myCursor.execute(f"SELECT e.FirstName, e.LastName, s.SpecialName FROM Doctor as d, Employee as e, Specialization as s WHERE d.EmpID = e.EmpID AND d.Specialization = s.SpecialID AND e.FirstName='{fName}';")
    myResult = myCursor.fetchall() 

    print(myResult)