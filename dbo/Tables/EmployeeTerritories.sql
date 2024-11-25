CREATE TABLE [dbo].[EmployeeTerritories] (
    [ODS_employee_id]    INT NOT NULL,
    [ODS_territories_id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ODS_employee_id] ASC, [ODS_territories_id] ASC),
    CONSTRAINT [FK_employee_employeeterritories_id] FOREIGN KEY ([ODS_employee_id]) REFERENCES [dbo].[Employees] ([ODS_employee_id]),
    CONSTRAINT [FK_territories_employeeterritories_id] FOREIGN KEY ([ODS_territories_id]) REFERENCES [dbo].[Territories] ([ODS_territories_id])
);

