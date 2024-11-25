CREATE TABLE [dbo].[Employees] (
    [ODS_employee_id] INT          IDENTITY (1, 1) NOT NULL,
    [LastName]        VARCHAR (50) NULL,
    [FirstName]       VARCHAR (50) NULL,
    [JobTitle]        VARCHAR (50) NULL,
    [Title]           VARCHAR (50) NULL,
    [BirthDate]       DATE         NULL,
    [HireDate]        DATE         NULL,
    [TerminationDate] DATE         NULL,
    [Address]         VARCHAR (50) NULL,
    [City]            VARCHAR (50) NULL,
    [State]           VARCHAR (50) NULL,
    [PostalCode]      VARCHAR (50) NULL,
    [Country]         VARCHAR (50) NULL,
    [Email]           VARCHAR (50) NULL,
    [Territory]       VARCHAR (50) NULL,
    [created_date]    DATE         NULL,
    [last_update]     DATE         NULL,
    [SourceID]        INT          NULL,
    [SourceName]      VARCHAR (50) NULL,
    [Phone]           VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ODS_employee_id] ASC)
);

