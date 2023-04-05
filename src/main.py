import mysql.connector
import time
import getpass


from actions_1 import getBillsHospital
from actions_1 import addNurse
from actions_1 import getNurseProfile


from actions_2 import getDoctorProfile
from actions_2 import addDoctor
from actions_2 import getDoctorPatientList
from actions_2 import payBill_Patient
from actions_2 import patientList
from actions_2 import employeeList
from actions_2 import addPatient

from actions_3 import getPatientProfile
from actions_3 import relocatePatient
from actions_3 import treatPatient


user = input("User Name:")

password = getpass.getpass()

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
        "Function": "addPatient(myCursor, mydb)"
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
        "Function": "relocatePatient(myCursor, mydb)"
        },
    9: {"Name": "View Doctor's Current Patients", 
        "Function": "getDoctorPatientList(myCursor)"
        },
    10: {"Name": "Treat Patient", 
        "Function": "treatPatient(myCursor, mydb)"
        },
    11: {"Name": "Employee List", 
        "Function": "employeeList(myCursor)"
        },
    12: {"Name": "Patients List", 
        "Function": "patientList(myCursor)"
        },
    13: {"Name": "Patient Pays Bill", 
        "Function": "payBill_Patient(myCursor, mydb)"
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
    try:
        if(opt != 0): eval(menu[opt]["Function"])
    except Exception as e:
        print(e)
    myCursor.close()
    time.sleep(1)


mydb.close()