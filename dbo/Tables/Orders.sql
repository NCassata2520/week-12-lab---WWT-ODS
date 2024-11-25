CREATE TABLE [dbo].[Orders] (
    [ODS_order_id]        INT          IDENTITY (1, 1) NOT NULL,
    [ODS_customer_id]     INT          NULL,
    [ODS_employee_id]     INT          NULL,
    [OrderDate]           DATETIME     NULL,
    [RequiredDate]        DATETIME     NULL,
    [ShippedDate]         DATETIME     NULL,
    [Freight]             MONEY        NULL,
    [ShipName]            VARCHAR (50) NULL,
    [ShipAddress]         VARCHAR (50) NULL,
    [ShipCity]            VARCHAR (50) NULL,
    [ShipState]           VARCHAR (50) NULL,
    [ShipPostalCode]      VARCHAR (50) NULL,
    [ShipCountry]         VARCHAR (50) NULL,
    [PurchaseOrderNumber] BIGINT       NULL,
    [SourceOrderID]       INT          NULL,
    [created_date]        DATE         NULL,
    [last_update]         DATE         NULL,
    [SourceName]          VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ODS_order_id] ASC),
    CONSTRAINT [FK_cutsomer_order_id] FOREIGN KEY ([ODS_customer_id]) REFERENCES [dbo].[Customer] ([ODS_customer_id]),
    CONSTRAINT [FK_employee_order_id] FOREIGN KEY ([ODS_employee_id]) REFERENCES [dbo].[Employees] ([ODS_employee_id])
);

