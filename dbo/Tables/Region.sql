CREATE TABLE [dbo].[Region] (
    [ODS_region_id]     INT          IDENTITY (1, 1) NOT NULL,
    [RegionDescription] VARCHAR (50) NULL,
    [created_date]      DATE         NULL,
    [last_update]       DATE         NULL,
    PRIMARY KEY CLUSTERED ([ODS_region_id] ASC)
);

