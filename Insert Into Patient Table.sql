USE [Hospital]
GO

INSERT INTO [dbo].[Patient]
           ([PatientID]
           ,[SIN]
           ,[FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[Age]
           ,[City]
           ,[Province]
           ,[PostalCode]
           ,[StreetName]
           ,[StreetNumber]
           ,[ApartmentNumber]
           ,[MobilePhone]
           ,[HomePhone]
           ,[PrimaryDoctorID]
           ,[Disease]
           ,[Treatment]
           ,[NumberOfDaysAdmitted]
           ,[TotalFee])
     VALUES
           (<PatientID, int,>
           ,<SIN, int,>
           ,<FirstName, varchar(50),>
           ,<MiddleName, varchar(50),>
           ,<LastName, varchar(50),>
           ,<Age, int,>
           ,<City, varchar(50),>
           ,<Province, char(2),>
           ,<PostalCode, varchar(50),>
           ,<StreetName, varchar(50),>
           ,<StreetNumber, int,>
           ,<ApartmentNumber, int,>
           ,<MobilePhone, char(10),>
           ,<HomePhone, char(10),>
           ,<PrimaryDoctorID, int,>
           ,<Disease, varchar(50),>
           ,<Treatment, varchar(50),>
           ,<NumberOfDaysAdmitted, int,>
           ,<TotalFee, int,>)
GO


