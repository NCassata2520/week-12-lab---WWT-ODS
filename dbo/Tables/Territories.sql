CREATE TABLE [dbo].[Territories] (
    [ODS_territories_id]   INT          IDENTITY (1, 1) NOT NULL,
    [TerritoryDescription] VARCHAR (50) NULL,
    [ODS_region_id]        INT          NULL,
    [created_date]         DATE         NULL,
    [last_update]          DATE         NULL,
    PRIMARY KEY CLUSTERED ([ODS_territories_id] ASC),
    CONSTRAINT [FK_region_territories_id] FOREIGN KEY ([ODS_region_id]) REFERENCES [dbo].[Region] ([ODS_region_id])
);

