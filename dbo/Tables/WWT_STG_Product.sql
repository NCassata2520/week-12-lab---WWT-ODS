CREATE TABLE [dbo].[WWT_STG_Product] (
    [ProductID]       INT          NULL,
    [UnitPrice]       MONEY        NULL,
    [ProductName]     VARCHAR (40) NULL,
    [SupplierID]      INT          NULL,
    [CategoryID]      INT          NULL,
    [QuantityPerUnit] VARCHAR (20) NULL,
    [WholesalePrice]  MONEY        NULL,
    [UnitsInStock]    SMALLINT     NULL,
    [UnitsOnOrder]    SMALLINT     NULL,
    [ReorderLevel]    SMALLINT     NULL,
    [Discontinued]    BIT          NULL
);

