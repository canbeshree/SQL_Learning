CREATE TABLE [dbo].[product] (
    [product_id]       INT           IDENTITY (1, 1) NOT NULL,
    [product_name]     VARCHAR (100) NULL,
    [description]      VARCHAR (255) NULL,
    [price]            FLOAT (53)    NULL,
    [mrp]              FLOAT (53)    NULL,
    [pieces_per_cASE]  FLOAT (53)    NULL,
    [weight_per_piece] FLOAT (53)    NULL,
    [uom]              VARCHAR (30)  NULL,
    [brand]            VARCHAR (100) NULL,
    [category]         VARCHAR (100) NULL,
    [tax_percent]      FLOAT (53)    NULL,
    [active]           CHAR (1)      NULL,
    [created_by]       VARCHAR (20)  NULL,
    [created_date]     DATETIME      DEFAULT (getdate()) NULL,
    [updated_by]       VARCHAR (20)  NULL,
    [updated_date]     DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([product_id] ASC)
);


GO

