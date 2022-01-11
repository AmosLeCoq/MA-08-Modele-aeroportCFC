DROP DATABASE DBairport;

CREATE DATABASE DBairport;

USE DBairport;

CREATE TABLE gates (
    id INT NOT NULL,
    name VARCHAR(5) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE providers (
    id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE fuels (
    id INT NOT NULL,
    name VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE builders(
    id INT NOT NULL,
    name VARCHAR(25) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE companys(
    id INT NOT NULL,
    name VARCHAR(25) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE airport(
    id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    city VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE status(
    id INT NOT NULL,
    name VARCHAR(10) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE tracks(
    id INT NOT NULL,
    name INT NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE planes (
    id INT NOT NULL,
    name VARCHAR(25) NOT NULL,
    company_id INT NOT NULL,
    fuel_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES companys(id),
    FOREIGN KEY (fuel_id) REFERENCES fuels(id)
)

CREATE TABLE models(
    id INT NOT NULL,
    name VARCHAR(15) NOT NULL,
    builder_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (builder_id) REFERENCES builders(id)
)

CREATE TABLE providers_provide_fuels(
    id INT NOT NULL,
    provider_id INT NOT NULL,
    fuel_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (provider_id) REFERENCES providers(id),
    FOREIGN KEY (fuel_id) REFERENCES fuels(id)
)

CREATE TABLE flights(
    id INT NOT NULL,
    N_flight INT NOT NULL,
    takeOffTime VARCHAR(5),
    landTime VARCHAR(5),
    date DATE,
    plane_id INT NOT NULL,
    statu_id INT NOT NULL,
    gate_id INT NOT NULL,
    airportDeparture_id INT NOT NULL,
    airportArrival_id INT NOT NULL,
    trackDeparture_id INT,
    trackArrival_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (plane_id) REFERENCES planes(id),
    FOREIGN KEY (statu_id) REFERENCES status(id),
    FOREIGN KEY (gate_id) REFERENCES gates(id),
    FOREIGN KEY (airportDeparture_id) REFERENCES airports(id),
    FOREIGN KEY (airportArrival_id) REFERENCES airports(id),
    FOREIGN KEY (trackDeparture_id) REFERENCES tracks(id),
    FOREIGN KEY (trackArrival_id) REFERENCES tracks(id)
);