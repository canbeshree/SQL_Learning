CREATE TABLE [dbo].[customer] (
    [customer_id] INT           IDENTITY (1, 1) NOT NULL,
    [user_name]   VARCHAR (20)  NULL,
    [first_name]  VARCHAR (100) NULL,
    [last_name]   VARCHAR (100) NULL,
    [country]     VARCHAR (50)  NULL,
    [town]        VARCHAR (50)  NULL,
    [address]     VARCHAR (255) NULL,
    [active]      CHAR (1)      NULL,
    PRIMARY KEY CLUSTERED ([customer_id] ASC)
);


GO

