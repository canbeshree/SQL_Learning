CREATE TABLE [dbo].[sales] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [transction_id] INT          NULL,
    [bill_no]       INT          NULL,
    [bill_date]     DATETIME     DEFAULT (getdate()) NULL,
    [bill_location] VARCHAR (30) NULL,
    [customer_id]   INT          NULL,
    [product_id]    INT          NULL,
    [qty]           INT          NULL,
    [uom]           VARCHAR (20) NULL,
    [price]         FLOAT (53)   NULL,
    [gross_price]   FLOAT (53)   NULL,
    [tax_pc]        FLOAT (53)   NULL,
    [tax_amt]       FLOAT (53)   NULL,
    [discount_pc]   FLOAT (53)   NULL,
    [discount_amt]  FLOAT (53)   NULL,
    [net_bill_amt]  FLOAT (53)   NULL,
    [created_by]    VARCHAR (20) NULL,
    [created_date]  DATETIME     DEFAULT (getdate()) NULL,
    [updated_by]    VARCHAR (20) NULL,
    [updated_date]  DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [fk_customer_id] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customer] ([customer_id]),
    CONSTRAINT [fk_product_id] FOREIGN KEY ([product_id]) REFERENCES [dbo].[product] ([product_id])
);


GO

