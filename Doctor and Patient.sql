USE [Hospital]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 2023-03-07 11:03:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DocID] [int] NOT NULL,
	[Specialization] [varchar](50) NOT NULL,
	[NumPatients] [int] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 2023-03-07 11:03:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] NOT NULL,
	[SIN] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Province] [char](2) NOT NULL,
	[PostalCode] [varchar](50) NOT NULL,
	[StreetName] [varchar](50) NOT NULL,
	[StreetNumber] [int] NOT NULL,
	[ApartmentNumber] [int] NULL,
	[MobilePhone] [char](10) NOT NULL,
	[HomePhone] [char](10) NOT NULL,
	[PrimaryDoctorID] [int] NOT NULL,
	[Disease] [varchar](50) NOT NULL,
	[Treatment] [varchar](50) NOT NULL,
	[NumberOfDaysAdmitted] [int] NOT NULL,
	[TotalFee] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (243512326, N'Pathology', 2)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (332633253, N'Anesthesiology', 3)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (437256322, N'Emergency Medicine', 2)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (535643266, N'Surgery', 5)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (735254623, N'Surgery', 8)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (737343256, N'Pediatrics', 2)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (845393295, N'Internal Medicine', 1)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (854757464, N'Neurology', 1)
INSERT [dbo].[Doctor] ([DocID], [Specialization], [NumPatients]) VALUES (958658445, N'Family Medicine', 10)
GO
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (324212123, 354236423, N'Jade', NULL, N'Silva', 34, N'Windsor', N'ON', N'N9G 3I4', N'Rose', 3022, NULL, N'5193532533', N'4162533325', 958658445, N'Flu', N'Antihistamines', 2, 100)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (342345623, 653457343, N'Alistair', N'Hahn', N'Ortiz', 64, N'Windsor', N'ON', N'N3G 7K3', N'James', 4464, 364, N'2267465322', N'2263743453', 958658445, N'Heart Attack', N'Thrombolytics', 20, 10000)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (344532423, 634534334, N'Keiran', N'Blake', N'Harrell', 76, N'Windsor', N'ON', N'N3G 3H3', N'Bayfield', 3263, NULL, N'5192353232', N'2263245323', 958658445, N'Asthma, Headache', N'Xanthines', 2, 480)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (354234322, 484838747, N'Peter', N'Ginzales', N'Meza', 42, N'Windsor', N'ON', N'N9Y 8Q2', N'Jade', 4483, 2233, N'2264563475', N'2264753485', 958658445, N'Stroke, Fracture', N'Anticoagulants, Closed Reduction', 8, 835)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (354623432, 485342992, N'Zara', NULL, N'Zarah', 6, N'Windsor', N'ON', N'N3E 2P3', N'Main', 4982, NULL, N'5193463262', N'2263456342', 958658445, N'Chicken Pox', N'Antivirals', 10, 70)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (452346323, 577343623, N'Veronica ', N'Lindsey', N'James', 25, N'Windsor', N'ON', N'N9H 4P3', N'Dundas', 3709, NULL, N'5192635354', N'5193764233', 958658445, N'Migraine', N'Analgesics, Glucocorticoids', 4, 450)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (623434362, 564568384, N'Aarom', N'Paul', N'Crawford', 87, N'Windsor', N'ON', N'N9O 8H2', N'Nelson', 4248, 2823, N'5195632643', N'2263758345', 958658445, N'Leukemia', N'Monoclonal Antibodies', 60, 45670)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (634233232, 438492343, N'Carl', N'Donovam', N'Stone', 52, N'Windsor', N'ON', N'N5E 3O9', N'Lynden', 837, NULL, N'2263647232', N'5193247324', 958658445, N'Alopecia, Sunburn', N'Antihypertensive Vasodilator', 1, 110)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (635243221, 546235423, N'Emily', NULL, N'Smith', 20, N'Windsor', N'ON', N'N8P 3D3', N'Paradise', 1291, NULL, N'5144990865', N'5147992583', 958658445, N'Influenza', N'Antiviral, Cough suppressants', 4, 125)
INSERT [dbo].[Patient] ([PatientID], [SIN], [FirstName], [MiddleName], [LastName], [Age], [City], [Province], [PostalCode], [StreetName], [StreetNumber], [ApartmentNumber], [MobilePhone], [HomePhone], [PrimaryDoctorID], [Disease], [Treatment], [NumberOfDaysAdmitted], [TotalFee]) VALUES (635423432, 767345343, N'Taylor', N'Tiffany', N'Gibbons', 99, N'Windsor', N'ON', N'N3I 8H1', N'Lockhart', 5865, NULL, N'2264657345', N'5193672353', 958658445, N'Allergy, Fracture', N'Antihistamines, Closed Reduction', 5, 3283)
GO
