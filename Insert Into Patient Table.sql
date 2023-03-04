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
           ,<FirstName, nvarchar(50),>
           ,<MiddleName, nvarchar(50),>
           ,<LastName, nvarchar(50),>
           ,<Age, int,>
           ,<City, nvarchar(50),>
           ,<Province, nvarchar(50),>
           ,<PostalCode, nvarchar(50),>
           ,<StreetName, nvarchar(50),>
           ,<StreetNumber, int,>
           ,<ApartmentNumber, int,>
           ,<MobilePhone, nchar(10),>
           ,<HomePhone, nchar(10),>
           ,<PrimaryDoctorID, int,>
           ,<Disease, nvarchar(max),>
           ,<Treatment, nvarchar(50),>
           ,<NumberOfDaysAdmitted, int,>
           ,<TotalFee, int,>)
GO


