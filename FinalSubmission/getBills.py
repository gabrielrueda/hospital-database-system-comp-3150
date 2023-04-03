import mysql.connector

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