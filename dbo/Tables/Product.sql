CREATE TABLE [dbo].[Product] (
    [ODS_product_id]   INT           IDENTITY (1, 1) NOT NULL,
    [ODS_supplier_id]  INT           NULL,
    [StockItemID]      INT           NULL,
    [ODS_category_id]  INT           NULL,
    [UnitPrice]        MONEY         NULL,
    [WholesalePrice]   MONEY         NULL,
    [UnitsInStock]     INT           NULL,
    [UnitsOnOrder]     INT           NULL,
    [ReorderLevel]     INT           NULL,
    [Discontinued]     BIT           NULL,
    [Color]            VARCHAR (50)  NULL,
    [Size]             VARCHAR (50)  NULL,
    [TargetStockLevel] INT           NULL,
    [created_date]     DATE          NULL,
    [last_update]      DATE          NULL,
    [SourceID]         INT           NULL,
    [SourceName]       VARCHAR (50)  NULL,
    [ProductName]      VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([ODS_product_id] ASC),
    CONSTRAINT [FK_category_product_id] FOREIGN KEY ([ODS_category_id]) REFERENCES [dbo].[Category] ([ODS_category_id]),
    CONSTRAINT [FK_supplier_product_id] FOREIGN KEY ([ODS_supplier_id]) REFERENCES [dbo].[Suppliers] ([ODS_supplier_id])
);

