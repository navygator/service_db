
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/08/2012 10:29:35
-- Generated from EDMX file: D:\Work\My Documents\Visual Studio 2010\Projects\ServiceDB\ServiceDB\Models\EntityDataModel.edmx
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
IF OBJECT_ID(N'[dbo].[FK_WarrantyRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_WarrantyRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_EmployeeRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_PartRequestPart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItemParts] DROP CONSTRAINT [FK_PartRequestPart];
GO
IF OBJECT_ID(N'[dbo].[FK_SupplierRequestPart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItemParts] DROP CONSTRAINT [FK_SupplierRequestPart];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestItemRequestItemPart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItemParts] DROP CONSTRAINT [FK_RequestItemRequestItemPart];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestItemRequestItemService]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItemServices] DROP CONSTRAINT [FK_RequestItemRequestItemService];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceRequestItemService]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItemServices] DROP CONSTRAINT [FK_ServiceRequestItemService];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestRequestItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_RequestRequestItem];
GO
IF OBJECT_ID(N'[dbo].[FK_StateRequestItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_StateRequestItem];
GO
IF OBJECT_ID(N'[dbo].[FK_StateRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_StateRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_ContragentRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_ContragentRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_GoodRequestItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_GoodRequestItem];
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
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Vendors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vendors];
GO
IF OBJECT_ID(N'[dbo].[RequestItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestItems];
GO
IF OBJECT_ID(N'[dbo].[States]', 'U') IS NOT NULL
    DROP TABLE [dbo].[States];
GO
IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suppliers];
GO
IF OBJECT_ID(N'[dbo].[RequestItemParts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestItemParts];
GO
IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[Goods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Goods];
GO
IF OBJECT_ID(N'[dbo].[Services]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Services];
GO
IF OBJECT_ID(N'[dbo].[RequestItemServices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestItemServices];
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
    [Name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
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

-- Creating table 'RequestItems'
CREATE TABLE [dbo].[RequestItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Request_id] int  NOT NULL,
    [Good_id] int  NOT NULL,
    [Serial_num] nvarchar(max)  NOT NULL,
    [Warranty_id] int  NOT NULL,
    [Employee_id] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Packing] nvarchar(max)  NOT NULL,
    [Defect] nvarchar(max)  NOT NULL,
    [More_info] nvarchar(max)  NULL,
    [Diagnostic_result] nvarchar(max)  NULL,
    [State_id] int  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'States'
CREATE TABLE [dbo].[States] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NOT NULL
);
GO

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Contact_name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'RequestItemParts'
CREATE TABLE [dbo].[RequestItemParts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RequestItem_id] int  NOT NULL,
    [PartItem_id] int  NOT NULL,
    [Updated_at] datetime  NULL
);
GO

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Contragent_id] int  NOT NULL,
    [State_id] int  NOT NULL,
    [Updated_at] datetime  NOT NULL
);
GO

-- Creating table 'Goods'
CREATE TABLE [dbo].[Goods] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NOT NULL
);
GO

-- Creating table 'Services'
CREATE TABLE [dbo].[Services] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Updated_at] datetime  NOT NULL
);
GO

-- Creating table 'RequestItemServices'
CREATE TABLE [dbo].[RequestItemServices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RequestItem_id] int  NOT NULL,
    [Service_id] int  NOT NULL,
    [Price] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'PartItems'
CREATE TABLE [dbo].[PartItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Part_id] int  NOT NULL,
    [Serial_num] nvarchar(max)  NOT NULL,
    [Supplier_id] int  NOT NULL,
    [Date_in] datetime  NOT NULL,
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

-- Creating primary key on [Id] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [PK_RequestItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'States'
ALTER TABLE [dbo].[States]
ADD CONSTRAINT [PK_States]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RequestItemParts'
ALTER TABLE [dbo].[RequestItemParts]
ADD CONSTRAINT [PK_RequestItemParts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Goods'
ALTER TABLE [dbo].[Goods]
ADD CONSTRAINT [PK_Goods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Services'
ALTER TABLE [dbo].[Services]
ADD CONSTRAINT [PK_Services]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RequestItemServices'
ALTER TABLE [dbo].[RequestItemServices]
ADD CONSTRAINT [PK_RequestItemServices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PartItems'
ALTER TABLE [dbo].[PartItems]
ADD CONSTRAINT [PK_PartItems]
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

-- Creating foreign key on [Warranty_id] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_WarrantyRequest]
    FOREIGN KEY ([Warranty_id])
    REFERENCES [dbo].[Warranties]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WarrantyRequest'
CREATE INDEX [IX_FK_WarrantyRequest]
ON [dbo].[RequestItems]
    ([Warranty_id]);
GO

-- Creating foreign key on [Employee_id] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_EmployeeRequest]
    FOREIGN KEY ([Employee_id])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeRequest'
CREATE INDEX [IX_FK_EmployeeRequest]
ON [dbo].[RequestItems]
    ([Employee_id]);
GO

-- Creating foreign key on [RequestItem_id] in table 'RequestItemParts'
ALTER TABLE [dbo].[RequestItemParts]
ADD CONSTRAINT [FK_RequestItemRequestItemPart]
    FOREIGN KEY ([RequestItem_id])
    REFERENCES [dbo].[RequestItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestItemRequestItemPart'
CREATE INDEX [IX_FK_RequestItemRequestItemPart]
ON [dbo].[RequestItemParts]
    ([RequestItem_id]);
GO

-- Creating foreign key on [RequestItem_id] in table 'RequestItemServices'
ALTER TABLE [dbo].[RequestItemServices]
ADD CONSTRAINT [FK_RequestItemRequestItemService]
    FOREIGN KEY ([RequestItem_id])
    REFERENCES [dbo].[RequestItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestItemRequestItemService'
CREATE INDEX [IX_FK_RequestItemRequestItemService]
ON [dbo].[RequestItemServices]
    ([RequestItem_id]);
GO

-- Creating foreign key on [Service_id] in table 'RequestItemServices'
ALTER TABLE [dbo].[RequestItemServices]
ADD CONSTRAINT [FK_ServiceRequestItemService]
    FOREIGN KEY ([Service_id])
    REFERENCES [dbo].[Services]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceRequestItemService'
CREATE INDEX [IX_FK_ServiceRequestItemService]
ON [dbo].[RequestItemServices]
    ([Service_id]);
GO

-- Creating foreign key on [Request_id] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_RequestRequestItem]
    FOREIGN KEY ([Request_id])
    REFERENCES [dbo].[Requests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestRequestItem'
CREATE INDEX [IX_FK_RequestRequestItem]
ON [dbo].[RequestItems]
    ([Request_id]);
GO

-- Creating foreign key on [State_id] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_StateRequestItem]
    FOREIGN KEY ([State_id])
    REFERENCES [dbo].[States]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StateRequestItem'
CREATE INDEX [IX_FK_StateRequestItem]
ON [dbo].[RequestItems]
    ([State_id]);
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

-- Creating foreign key on [Good_id] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_GoodRequestItem]
    FOREIGN KEY ([Good_id])
    REFERENCES [dbo].[Goods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GoodRequestItem'
CREATE INDEX [IX_FK_GoodRequestItem]
ON [dbo].[RequestItems]
    ([Good_id]);
GO

-- Creating foreign key on [Supplier_id] in table 'PartItems'
ALTER TABLE [dbo].[PartItems]
ADD CONSTRAINT [FK_SupplierPartItem]
    FOREIGN KEY ([Supplier_id])
    REFERENCES [dbo].[Suppliers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SupplierPartItem'
CREATE INDEX [IX_FK_SupplierPartItem]
ON [dbo].[PartItems]
    ([Supplier_id]);
GO

-- Creating foreign key on [Part_id] in table 'PartItems'
ALTER TABLE [dbo].[PartItems]
ADD CONSTRAINT [FK_PartPartItem]
    FOREIGN KEY ([Part_id])
    REFERENCES [dbo].[Parts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartPartItem'
CREATE INDEX [IX_FK_PartPartItem]
ON [dbo].[PartItems]
    ([Part_id]);
GO

-- Creating foreign key on [PartItem_id] in table 'RequestItemParts'
ALTER TABLE [dbo].[RequestItemParts]
ADD CONSTRAINT [FK_PartItemRequestItemPart]
    FOREIGN KEY ([PartItem_id])
    REFERENCES [dbo].[PartItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartItemRequestItemPart'
CREATE INDEX [IX_FK_PartItemRequestItemPart]
ON [dbo].[RequestItemParts]
    ([PartItem_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------