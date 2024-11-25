CREATE TABLE [dbo].[WWT_STG_Order] (
    [EmployeeID]        INT          NULL,
    [OrderID]           INT          NULL,
    [CustomerID]        VARCHAR (5)  NULL,
    [OrderDate]         DATETIME     NULL,
    [RequiredDate]      DATETIME     NULL,
    [ShippedDate]       DATETIME     NULL,
    [ShipVia]           INT          NULL,
    [Freight]           MONEY        NULL,
    [ShipName]          VARCHAR (40) NULL,
    [ShipAddress]       VARCHAR (60) NULL,
    [ShipCity]          VARCHAR (15) NULL,
    [ShipStateOrRegion] VARCHAR (15) NULL,
    [ShipPostalCode]    VARCHAR (10) NULL,
    [ShipCountry]       VARCHAR (15) NULL
);

