/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [DocID]
      ,[Specialization]
      ,[NumPatients]
  FROM [Hospital].[dbo].[Doctor]