CREATE VIEW [portes] AS
SELECT name, terminal 
FROM DBairport.dbo.gates;
GO

CREATE VIEW [constructeurs] AS
SELECT name
FROM DBairport.dbo.builders;
GO

CREATE VIEW [modAvion] AS
SELECT name, builders_id
FROM DBairport.dbo.models;
GO

CREATE VIEW [societes] AS
SELECT name
FROM DBairport.dbo.companys;
GO

CREATE VIEW [aeroports] AS
SELECT name, city
FROM DBairport.dbo.airports;
GO

CREATE VIEW [status] AS
SELECT Type
FROM DBairport.dbo.status;
GO

CREATE VIEW [pistes] AS
SELECT TrackN
FROM DBairport.dbo.tracks;
GO

CREATE VIEW [avions] AS
SELECT name, company_id
FROM DBairport.dbo.planes;
GO

CREATE VIEW [voyageurs] AS
SELECT name, lastname, birthday, phone, gender
FROM DBairport.dbo.travelers;
GO

CREATE VIEW [vols] AS
SELECT N_flight, takeOffTime, landTime, date, plane_id, statu_id, gate_id, airportDeparture_id, airportArrival_id, trackDeparture_id, trackArrival_id, traveler_id
FROM DBairport.dbo.flights;
GO