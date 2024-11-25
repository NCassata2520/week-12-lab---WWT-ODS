CREATE TABLE [dbo].[WWT_STG_SW_StockItem] (
    [StockItemId]      INT            NULL,
    [StockItemName]    VARCHAR (100)  NULL,
    [SupplierId]       INT            NULL,
    [Color]            VARCHAR (50)   NULL,
    [Size]             VARCHAR (50)   NULL,
    [QuantityPerOuter] INT            NULL,
    [Cost]             NUMERIC (8, 2) NULL,
    [RetailPrice]      NUMERIC (8, 2) NULL,
    [IsActive]         INT            NULL,
    [ItemCategoryId]   INT            NULL
);

