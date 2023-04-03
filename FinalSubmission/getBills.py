def getBillsHospital(myCursor):

    hospitalName = input("From which hospital would you like to retrieve bills due?: ")

    myCursor.execute(f'''SELECT hb.Bill_NO, hb.PrescriptionName, hb.Amount, p.PharmacyName
                    FROM Hospital_Bills as hb 
                    INNER JOIN Pharmacy as p
                    ON hb.PharmacyID = p.PharmacyID 
                    WHERE hb.HospitalName ='{hospitalName}';''')
    
    bills = myCursor.fetchall()

    print(f"{hospitalName} owes the following bills:")
    for bill in bills:
        print(f"Bill number {bill[0]} - Prescription: {bill[1]} - Amount due: {bill[2]} - Pharmacy: {bill[3]}")

    myCursor.close()