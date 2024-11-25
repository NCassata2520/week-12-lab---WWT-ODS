CREATE TABLE [dbo].[Customer] (
    [ODS_customer_id] INT          IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (50) NULL,
    [AddressLine1]    VARCHAR (50) NULL,
    [AddressLine2]    VARCHAR (50) NULL,
    [CompanyName]     VARCHAR (50) NULL,
    [ContactTitle]    VARCHAR (50) NULL,
    [City]            VARCHAR (50) NULL,
    [State]           VARCHAR (50) NULL,
    [ZipCode]         VARCHAR (50) NULL,
    [created_date]    DATE         NULL,
    [last_update]     DATE         NULL,
    [SW_customerID]   INT          NULL,
    [SourceName]      VARCHAR (50) NULL,
    [Phone]           VARCHAR (50) NULL,
    [NW_customerID]   CHAR (5)     NULL,
    PRIMARY KEY CLUSTERED ([ODS_customer_id] ASC)
);

