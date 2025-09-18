/*
=============================================================
Database and Schema Setup
=============================================================
Overview:
    This script creates a SQL Server database named 'DataWarehouse'. 
    If the database already exists, it will be dropped and recreated. 
    It also defines three schemas within the database: 'bronze', 'silver', and 'gold'.

⚠️ Note:
    Running this script will permanently remove the existing 'DataWarehouse' 
    database and all its contents. Make sure to back up any critical data 
    before executing.
*/

USE master;
GO

-- Remove the 'DataWarehouse' database if it exists, then recreate it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a fresh 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Define schemas for Bronze, Silver, and Gold layers
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
