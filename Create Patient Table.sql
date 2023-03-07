USE [Hospital]
GO

/****** Object:  Table [dbo].[Patient]    Script Date: 2023-03-06 8:00:00 PM ******/
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


