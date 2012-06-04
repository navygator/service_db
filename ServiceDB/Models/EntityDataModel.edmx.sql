
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/02/2012 14:11:28
-- Generated from EDMX file: I:\Work\Alex\My Documents\Visual Studio 2010\Projects\service_db\ServiceDB\Models\EntityDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ServiceDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CategoryParts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parts] DROP CONSTRAINT [FK_CategoryParts];
GO
IF OBJECT_ID(N'[dbo].[FK_VendorPart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parts] DROP CONSTRAINT [FK_VendorPart];
GO
IF OBJECT_ID(N'[dbo].[FK_StateRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_StateRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_WarrantyRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_WarrantyRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_EmployeeRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_ContragentRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_ContragentRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_PartRequestPart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestsParts] DROP CONSTRAINT [FK_PartRequestPart];
GO
IF OBJECT_ID(N'[dbo].[FK_SupplierRequestPart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestsParts] DROP CONSTRAINT [FK_SupplierRequestPart];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestRequestPart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestsParts] DROP CONSTRAINT [FK_RequestRequestPart];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Contragents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contragents];
GO
IF OBJECT_ID(N'[dbo].[Parts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parts];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Warranties]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Warranties];
GO
IF OBJECT_ID(N'[dbo].[SCs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SCs];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Vendors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vendors];
GO
IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[States]', 'U') IS NOT NULL
    DROP TABLE [dbo].[States];
GO
IF OBJECT_ID(N'[dbo].[Clients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clients];
GO
IF OBJECT_ID(N'[dbo].[RequestsParts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestsParts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Contragents'
CREATE TABLE [dbo].[Contragents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [EMail] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'Parts'
CREATE TABLE [dbo].[Parts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Category_id] int  NOT NULL,
    [Vendor_id] int  NOT NULL,
    [Part_num] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'Warranties'
CREATE TABLE [dbo].[Warranties] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SCs'
CREATE TABLE [dbo].[SCs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Created_at] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'Vendors'
CREATE TABLE [dbo].[Vendors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Item] nvarchar(max)  NOT NULL,
    [Serial_num] nvarchar(max)  NOT NULL,
    [Employee_id] int  NOT NULL,
    [Service] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [More_info] nvarchar(max)  NULL,
    [Packing] nvarchar(max)  NOT NULL,
    [Defect] nvarchar(max)  NOT NULL,
    [Warranty_id] int  NOT NULL,
    [State_id] int  NOT NULL,
    [Contragent_id] int  NOT NULL,
    [SC_num] nvarchar(max)  NULL,
    [Diagnostic_result] nvarchar(max)  NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'States'
CREATE TABLE [dbo].[States] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Contact_name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'RequestsParts'
CREATE TABLE [dbo].[RequestsParts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Request_id] int  NOT NULL,
    [Part_id] int  NOT NULL,
    [Serial_num] nvarchar(max)  NOT NULL,
    [Supplier_id] int  NOT NULL,
    [Date_in] nvarchar(max)  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Contragents'
ALTER TABLE [dbo].[Contragents]
ADD CONSTRAINT [PK_Contragents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Parts'
ALTER TABLE [dbo].[Parts]
ADD CONSTRAINT [PK_Parts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Warranties'
ALTER TABLE [dbo].[Warranties]
ADD CONSTRAINT [PK_Warranties]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SCs'
ALTER TABLE [dbo].[SCs]
ADD CONSTRAINT [PK_SCs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Vendors'
ALTER TABLE [dbo].[Vendors]
ADD CONSTRAINT [PK_Vendors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'States'
ALTER TABLE [dbo].[States]
ADD CONSTRAINT [PK_States]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RequestsParts'
ALTER TABLE [dbo].[RequestsParts]
ADD CONSTRAINT [PK_RequestsParts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_id] in table 'Parts'
ALTER TABLE [dbo].[Parts]
ADD CONSTRAINT [FK_CategoryParts]
    FOREIGN KEY ([Category_id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryParts'
CREATE INDEX [IX_FK_CategoryParts]
ON [dbo].[Parts]
    ([Category_id]);
GO

-- Creating foreign key on [Vendor_id] in table 'Parts'
ALTER TABLE [dbo].[Parts]
ADD CONSTRAINT [FK_VendorPart]
    FOREIGN KEY ([Vendor_id])
    REFERENCES [dbo].[Vendors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VendorPart'
CREATE INDEX [IX_FK_VendorPart]
ON [dbo].[Parts]
    ([Vendor_id]);
GO

-- Creating foreign key on [State_id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_StateRequest]
    FOREIGN KEY ([State_id])
    REFERENCES [dbo].[States]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StateRequest'
CREATE INDEX [IX_FK_StateRequest]
ON [dbo].[Requests]
    ([State_id]);
GO

-- Creating foreign key on [Warranty_id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_WarrantyRequest]
    FOREIGN KEY ([Warranty_id])
    REFERENCES [dbo].[Warranties]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WarrantyRequest'
CREATE INDEX [IX_FK_WarrantyRequest]
ON [dbo].[Requests]
    ([Warranty_id]);
GO

-- Creating foreign key on [Employee_id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_EmployeeRequest]
    FOREIGN KEY ([Employee_id])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeRequest'
CREATE INDEX [IX_FK_EmployeeRequest]
ON [dbo].[Requests]
    ([Employee_id]);
GO

-- Creating foreign key on [Contragent_id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_ContragentRequest]
    FOREIGN KEY ([Contragent_id])
    REFERENCES [dbo].[Contragents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ContragentRequest'
CREATE INDEX [IX_FK_ContragentRequest]
ON [dbo].[Requests]
    ([Contragent_id]);
GO

-- Creating foreign key on [Part_id] in table 'RequestsParts'
ALTER TABLE [dbo].[RequestsParts]
ADD CONSTRAINT [FK_PartRequestPart]
    FOREIGN KEY ([Part_id])
    REFERENCES [dbo].[Parts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartRequestPart'
CREATE INDEX [IX_FK_PartRequestPart]
ON [dbo].[RequestsParts]
    ([Part_id]);
GO

-- Creating foreign key on [Supplier_id] in table 'RequestsParts'
ALTER TABLE [dbo].[RequestsParts]
ADD CONSTRAINT [FK_SupplierRequestPart]
    FOREIGN KEY ([Supplier_id])
    REFERENCES [dbo].[Clients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SupplierRequestPart'
CREATE INDEX [IX_FK_SupplierRequestPart]
ON [dbo].[RequestsParts]
    ([Supplier_id]);
GO

-- Creating foreign key on [Request_id] in table 'RequestsParts'
ALTER TABLE [dbo].[RequestsParts]
ADD CONSTRAINT [FK_RequestRequestPart]
    FOREIGN KEY ([Request_id])
    REFERENCES [dbo].[Requests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestRequestPart'
CREATE INDEX [IX_FK_RequestRequestPart]
ON [dbo].[RequestsParts]
    ([Request_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------