CREATE TABLE [dbo].[Suppliers] (
    [ODS_supplier_id] INT           IDENTITY (1, 1) NOT NULL,
    [SupplierName]    VARCHAR (50)  NULL,
    [ContactName]     VARCHAR (50)  NULL,
    [PhoneNumber]     VARCHAR (50)  NULL,
    [Website]         VARCHAR (200) NULL,
    [Phone]           VARCHAR (50)  NULL,
    [CompanyName]     VARCHAR (100) NULL,
    [ContactTitle]    VARCHAR (50)  NULL,
    [Address]         VARCHAR (50)  NULL,
    [City]            VARCHAR (50)  NULL,
    [State]           VARCHAR (50)  NULL,
    [PostalCode]      VARCHAR (50)  NULL,
    [Country]         VARCHAR (50)  NULL,
    [Fax]             VARCHAR (50)  NULL,
    [created_date]    DATE          NULL,
    [last_update]     DATE          NULL,
    [SourceID]        INT           NULL,
    [SourceName]      VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([ODS_supplier_id] ASC)
);

