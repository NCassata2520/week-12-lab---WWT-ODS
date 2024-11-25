CREATE TABLE [dbo].[OrderDetails] (
    [ODS_orderdetails_id] INT          IDENTITY (1, 1) NOT NULL,
    [ODS_order_id]        INT          NULL,
    [ODS_product_id]      INT          NULL,
    [Price]               MONEY        NULL,
    [TaxRate]             INT          NULL,
    [Quantity]            INT          NULL,
    [Discount]            INT          NULL,
    [SourceOrderDetailID] INT          NULL,
    [created_date]        DATE         NULL,
    [last_update]         DATE         NULL,
    [SourceName]          VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ODS_orderdetails_id] ASC),
    CONSTRAINT [FK_order_orderdetails_id] FOREIGN KEY ([ODS_order_id]) REFERENCES [dbo].[Orders] ([ODS_order_id]),
    CONSTRAINT [FK_product_orderdetails_id] FOREIGN KEY ([ODS_product_id]) REFERENCES [dbo].[Product] ([ODS_product_id])
);

