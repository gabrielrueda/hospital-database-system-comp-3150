import mysql.connector

# Make your function import like this:
from actions import getDoctorProfile
from actions import addDoctor
from addNurse import addNurse
from addNurse import getNurseProfile

from actions import getDoctorPatientList


f = open("MYSQL_Practice/hospital-database-system-comp-3150/FinalSubmission/info.txt", "r")

user = f.readline()

password = f.readline()


mydb = mysql.connector.connect(
    host="localhost",
    user=user,
    password=password,
    database="HOSPITAL_DB"
)

# make sure your function is stated in the dictionary below:
menu = {
    1: {"Name": "Add Doctor", 
        "Function": "addDoctor(myCursor, mydb)"
        },
    2: {"Name": "Add Nurse", 
        "Function": "addNurse(myCursor, mydb)"
        },
    3: {"Name": "Add Patient", 
        "Function": "addPatient(myCursor)"
        },
    4: {"Name": "Get Bills Due by Hospital", 
        "Function": "getBillsHospital(myCursor)"
        },
    5: {"Name": "View Doctor Profile", 
        "Function": "getDoctorProfile(myCursor)"
        },
    6: {"Name": "View Nurse Profile", 
        "Function": "getNurseProfile(myCursor)"
        },
    7: {"Name": "View Patient Profile", 
        "Function": "getPatientProfile(myCursor)"
        },
    8: {"Name": "Relocate Patient to Another Hospital", 
        "Function": "relocatePatient(myCursor)"
        },
    9: {"Name": "View Doctor's Current Patients", 
        "Function": "getDoctorPatientList(myCursor)"
        },
    10: {"Name": "Treat Patient", 
        "Function": "treatPatient(myCursor)"
        },
}


opt = 1


while(opt != 0):
    print("---\nACTIONS: \n0) Exit")
    for m in menu:
        print(f"{m}) {(menu[m])['Name']}")

    opt = int(input(f"Which action (0-{len(menu)}):"))
    print("---")
    myCursor = mydb.cursor(buffered=True)
    if(opt != 0): eval(menu[opt]["Function"])
    myCursor.close()



mydb.close()