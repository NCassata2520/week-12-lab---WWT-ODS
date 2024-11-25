CREATE TABLE [dbo].[Category] (
    [ODS_category_id] INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName]    VARCHAR (50)  NULL,
    [created_date]    DATE          NULL,
    [last_update]     DATE          NULL,
    [Description]     VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([ODS_category_id] ASC)
);

