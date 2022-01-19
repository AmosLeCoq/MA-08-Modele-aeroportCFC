-- Create a new database called 'DBairport'
-- Connect to the 'master' database to run this snippet
USE master
GO
 
-- Create the new database if it does not exist already

IF EXISTS (
	 SELECT name
			FROM sys.databases
			WHERE name = N'DBairport'
	
)
DROP DATABASE DBairport

GO

IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'DBairport'
)
CREATE DATABASE DBairport
GO

-- Create a new table called 'gates' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.gates', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.gates
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.gates
(
    id INT NOT NULL IDENTITY PRIMARY KEY,-- primary key column
    name [VARCHAR](5) NOT NULL,
    terminal NUMERIC NOT NULL
    -- specify more columns here
);
GO

-- Create a new table called 'builders' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.builders', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.builders
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.builders
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    name [VARCHAR](25) NOT NULL
    -- specify more columns here
);
GO

-- Create a new table called 'models' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.models', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.models
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.models
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    name [VARCHAR](15) NOT NULL UNIQUE,
    builders_id INT NOT NULL FOREIGN KEY REFERENCES builders(id)
    -- specify more columns here
);
GO

-- Create a new table called 'companys' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.companys', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.companys
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.companys
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    name [VARCHAR](20) NOT NULL UNIQUE
    -- specify more columns here
);
GO


-- Create a new table called 'airports' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.airports', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.airports
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.airports
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    name [VARCHAR](30) NOT NULL,
    city [VARCHAR](20) NOT NULL
    -- specify more columns here
);
GO



-- Create a new table called 'status' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.status', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.status
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.status
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    Type [VARCHAR](10) NOT NULL UNIQUE
    -- specify more columns here
);
GO


-- Create a new table called 'tracks' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.tracks', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.tracks
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.tracks
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    TrackN INT NOT NULL UNIQUE
    -- specify more columns here
);
GO

-- Create a new table called 'planes' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.planes', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.planes
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.planes
(
    id INT NOT NULL IDENTITY PRIMARY KEY,
    name [VARCHAR](5) NOT NULL,
    company_id INT FOREIGN KEY REFERENCES companys(id)
    -- specify more columns here
);
GO

-- Create a new table called 'flights' in schema 'DBairport'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.flights', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.flights
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.flights
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    N_flight INT NOT NULL,
    takeOffTime DATETIME,
    landTime DATETIME,
    date DATE,
    plane_id INT NOT NULL FOREIGN KEY REFERENCES planes(id),
    statu_id INT NOT NULL FOREIGN KEY REFERENCES status(id),
    gate_id INT NOT NULL FOREIGN KEY REFERENCES gates(id),
    airportDeparture_id INT NOT NULL FOREIGN KEY REFERENCES airports(id),
    airportArrival_id INT NOT NULL FOREIGN KEY REFERENCES airports(id),
    trackDeparture_id INT NOT NULL FOREIGN KEY REFERENCES tracks(id),
    trackArrival_id INT NOT NULL FOREIGN KEY REFERENCES tracks(id)
    -- specify more columns here
);
GO

-- Create a new table called 'travelers' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('DBairport.dbo.travelers', 'U') IS NOT NULL
DROP TABLE DBairport.dbo.travelers
GO
-- Create the table in the specified schema
CREATE TABLE DBairport.dbo.travelers
(
    id INT NOT NULL IDENTITY PRIMARY KEY, -- primary key column
    name [VARCHAR](30) NOT NULL,
    lastname [VARCHAR](30) NOT NULL,
    birthday DATE NOT NULL,
    phone [VARCHAR](12) NOT NULL,
    gender [VARCHAR](1) NOT NULL

);
GO