CREATE TABLE [dbo].[WWT_STG_SW_OrderLine] (
    [OrderLineId]    INT            NULL,
    [OrderId]        INT            NULL,
    [StockItemId]    INT            NULL,
    [Quantity]       INT            NULL,
    [UnitPrice]      NUMERIC (6, 2) NULL,
    [TaxRate]        NUMERIC (3, 2) NULL,
    [ItemPickedDate] DATE           NULL
);

