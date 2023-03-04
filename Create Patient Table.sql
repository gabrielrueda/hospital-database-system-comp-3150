USE [Hospital]
GO

/****** Object:  Table [dbo].[Patient]    Script Date: 2023-03-04 4:46:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Patient](
	[PatientID] [int] NOT NULL,
	[SIN] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
	[StreetNumber] [int] NOT NULL,
	[ApartmentNumber] [int] NULL,
	[MobilePhone] [nchar](10) NOT NULL,
	[HomePhone] [nchar](10) NOT NULL,
	[PrimaryDoctorID] [int] NOT NULL,
	[Disease] [nvarchar](max) NOT NULL,
	[Treatment] [nvarchar](50) NOT NULL,
	[NumberOfDaysAdmitted] [int] NOT NULL,
	[TotalFee] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


