CREATE TABLE [dbo].[WWT_STG_SW_StockItemInventory] (
    [StockItemID]      INT          NULL,
    [QuantityOnHand]   INT          NULL,
    [BinLocation]      VARCHAR (50) NULL,
    [ReorderLevel]     INT          NULL,
    [TargetStockLevel] INT          NULL,
    [LastEditDateTime] DATETIME     NULL
);

