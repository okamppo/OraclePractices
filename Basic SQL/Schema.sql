/*CREATE TABLES*/

--CUSTOMERS--
CREATE TABLE Customers (
    id          INT NOT NULL PRIMARY KEY,
    first_name  VARCHAR2(255) NOT NULL,
    last_name   VARCHAR2(255) NOT NULL,
    email       VARCHAR2(255) NOT NULL,
    address     VARCHAR2(255) NOT NULL,
    phone       VARCHAR2(255) NOT NULL,
    rut         VARCHAR2(255) NOT NULL
);

--LOCATIONS--
CREATE TABLE Locations (
    id                  INT NOT NULL PRIMARY KEY,
    city                VARCHAR2(255) NOT NULL,
    manager_first_name  VARCHAR2(255) NOT NULL,
    manager_last_name   VARCHAR2(255) NOT NULL
);

--ACCOUNTS--
CREATE TABLE Accounts (
    id             INT NOT NULL PRIMARY KEY,
    type           VARCHAR2(255) NOT NULL CHECK (type IN ('savings','credit_card','loan')),
    aperture_date  DATE NOT NULL,
    balance        DECIMAL(15,2) NOT NULL,
    customer_id    INT NOT NULL CONSTRAINT account_customer_fkey REFERENCES Customers(id),
    location_id    INT NOT NULL CONSTRAINT account_location_fkey REFERENCES Locations(id)
);