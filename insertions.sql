------------------------
--INSERTIONS
------------------------

USE kampkaravan

----------------------
-- CUSTOMERS
----------------------

-- Insertion for CUSTOMERS
BEGIN TRY
	BEGIN TRANSACTION;
	
-- Insert data into CUSTOMER
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 1
('Turkiye', 'Marmara', 'Istanbul', 'Uskudar', '123 Elma St', 'Building A', '10', '90001', 
'Turkiye', 'Marmara', 'Istanbul', 'Uskudar', '2321 Armut St', 'Building B', '20', '90002', 'mehmet.erbas@example.com', '123-456-7890', '2024-01-15', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Mehmet', 'Erbas', 'M' ,30);



-------------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 2
('Germany', 'Bavaria', 'Munich', 'City Center', '789 Maple Rd', 'Building C', '5', '80331', 
'Germany', 'Bavaria', 'Munich', 'West End', '101 Pine St', 'Building D', '3', '80332', 'fatih.smith@dealer.com', '987-654-3210', '2023-12-01', 'D'); -- Dealer

-- Dealer 1
INSERT INTO DEALER (CustomerID, DealerCompanyName, DealerDiscountRate, DealerRepresentative, DealerIndustry, DealerTaxID)
VALUES
(SCOPE_IDENTITY(), 'Tech Solutions Inc.', 0.15, 'John Doe', 'Technology', '123');



-------------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 3
('France', 'Ile-de-France', 'Paris', 'Montmartre', '45 Rue de Rivoli', 'Building E', '2', '75001', 
 'France', 'Ile-de-France', 'Paris', 'Opera', '123 Champs St', 'Building F', '6', '75002', 
 'julie.dupont@example.com', '456-789-1234', '2023-10-20', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Julie', 'Dupont', 'F' ,34);


-----------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 4
('UK', 'England', 'London', 'Westminster', '10 Downing St', 'Building G', '1', 'SW1A', 
 'UK', 'England', 'London', 'Chelsea', '99 Thames Rd', 'Building H', '15', 'SW1B', 
 'john.doe@dealer.com', '789-123-4567', '2023-11-05', 'D'); -- Dealer


-- Dealer 2
INSERT INTO DEALER (CustomerID, DealerCompanyName, DealerDiscountRate, DealerRepresentative, DealerIndustry, DealerTaxID)
VALUES
(SCOPE_IDENTITY(), 'Green Energy Co.', 0.20, 'Jane Smith', 'Energy', '456');

-----------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 5
('Italy', 'Lombardy', 'Milan', 'Centro', '56 Via Torino', 'Building I', '8', '20121', 
 'Italy', 'Lombardy', 'Milan', 'Porta Nuova', '77 Via Dante', 'Building J', '3', '20122', 
 'marco.rossi@example.com', '321-654-9870', '2023-09-10', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Marco', 'Rossi', 'M', 45);

-----------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 6
('USA', 'California', 'Los Angeles', 'Downtown', '123 Sunset Blvd', 'Building K', '4', '90001', 
 'USA', 'California', 'Los Angeles', 'Hollywood', '789 Pacific Ave', 'Building L', '7', '90002', 
 'emily.clark@dealer.com', '111-222-3333', '2023-08-15', 'D'); -- Dealer


-- Dealer 3
INSERT INTO DEALER (CustomerID, DealerCompanyName, DealerDiscountRate, DealerRepresentative, DealerIndustry, DealerTaxID)
VALUES
(SCOPE_IDENTITY(),'Auto World Ltd.', 0.10, 'Carlos Garcia', 'Automotive', '987');

-----------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 7
('Spain', 'Catalonia', 'Barcelona', 'Eixample', '22 Rambla St', 'Building M', '10', '08001', 
 'Spain', 'Catalonia', 'Barcelona', 'Barri Gotic', '50 Gran Via', 'Building N', '5', '08002', 
 'ana.lopez@example.com', '333-444-5555', '2023-07-20', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Sophia', 'Martin', 'F', 48);


------------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 8
('Japan', 'Tokyo', 'Tokyo City', 'Shinjuku', '88 Sakura Rd', 'Building O', '6', '160-0022', 
 'Japan', 'Tokyo', 'Tokyo City', 'Ginza', '33 Akihabara St', 'Building P', '9', '160-0023', 
 'hiroshi.tanaka@example.com', '555-666-7777', '2023-06-01', 'D'); -- Dealer

-- Dealer 4
INSERT INTO DEALER (CustomerID, DealerCompanyName, DealerDiscountRate, DealerRepresentative, DealerIndustry, DealerTaxID)
VALUES
(SCOPE_IDENTITY(), 'Food Supplies Corp.', 0.12, 'Emily Brown', 'Food', '654');

-----------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 9
('Canada', 'Ontario', 'Toronto', 'Downtown', '11 Queen St', 'Building Q', '20', 'M5H', 
 'Canada', 'Ontario', 'Toronto', 'North York', '78 King Rd', 'Building R', '30', 'M5R', 
 'sophia.martin@example.com', '666-777-8888', '2023-05-15', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Sophia', 'Martin', 'F', 48);

------------------------
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
-- Customer 10
('Australia', 'New South Wales', 'Sydney', 'CBD', '55 Harbour Rd', 'Building S', '12', '2000', 
 'Australia', 'New South Wales', 'Sydney', 'Bondi', '90 Ocean St', 'Building T', '8', '2026', 
 'oliver.jones@dealer.com', '888-999-0000', '2023-04-10', 'D'); -- Dealer


-- Dealer 5
INSERT INTO DEALER (CustomerID, DealerCompanyName, DealerDiscountRate, DealerRepresentative, DealerIndustry, DealerTaxID)
VALUES
(SCOPE_IDENTITY(), 'Construction Masters', 0.18, 'Michael Johnson', 'Construction', '789');


-- Customer 11
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('USA', 'California', 'San Francisco', 'Mission District', '22 Valencia St', 'Building A', '101', '94110', 
 'USA', 'California', 'San Francisco', 'Sunset', '45 Ocean Ave', 'Building B', '202', '94122', 
 'james.miller@example.com', '555-123-4567', '2024-01-01', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'James', 'Miller', 'M', 35);

-- Customer 12
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('UK', 'England', 'London', 'Chelsea', '33 King Rd', 'Building C', '50', 'SW3', 
 'UK', 'England', 'London', 'Camden', '44 High St', 'Building D', '60', 'NW1', 
 'emma.johnson@example.co.uk', '789-654-3210', '2023-12-15', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Emma', 'Johnson', 'F', 29);

-- Customer 13
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Australia', 'New South Wales', 'Sydney', 'Bondi', '12 Campbell Parade', 'Building E', '5', '2026', 
 'Australia', 'New South Wales', 'Sydney', 'Surry Hills', '89 Crown St', 'Building F', '10', '2010', 
 'liam.brown@example.com.au', '444-555-6666', '2023-11-20', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Liam', 'Brown', 'M', 40);

-- Customer 14
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Germany', 'Bavaria', 'Munich', 'Altstadt', '67 Marienplatz', 'Building G', '12', '80331', 
 'Germany', 'Bavaria', 'Munich', 'Schwabing', '89 Leopoldstr', 'Building H', '34', '80802', 
 'mia.schmidt@example.de', '333-444-7777', '2023-10-10', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Mia', 'Schmidt', 'F', 32);

-- Customer 15
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('France', 'Île-de-France', 'Paris', 'Montmartre', '25 Rue Lepic', 'Building I', '3', '75018', 
 'France', 'Île-de-France', 'Paris', 'Le Marais', '12 Rue des Rosiers', 'Building J', '5', '75004', 
 'lucas.durand@example.fr', '222-111-9999', '2023-09-25', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Lucas', 'Durand', 'M', 45);


-- Customer 16
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Japan', 'Tokyo', 'Tokyo', 'Shibuya', '2-21 Dogenzaka', 'Building K', '9', '150-0043', 
 'Japan', 'Tokyo', 'Tokyo', 'Setagaya', '1-14 Yoga', 'Building L', '4', '158-0097', 
 'ayaka.tanaka@example.jp', '888-999-1111', '2024-01-01', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Ayaka', 'Tanaka', 'F', 27);

-- Customer 17
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('India', 'Maharashtra', 'Mumbai', 'Bandra', '56 Linking Rd', 'Building M', '12', '400050', 
 'India', 'Maharashtra', 'Mumbai', 'Andheri', '89 Versova St', 'Building N', '23', '400053', 
 'raj.patel@example.in', '777-555-6666', '2023-11-10', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Raj', 'Patel', 'M', 38);

-- Customer 18
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Brazil', 'São Paulo', 'São Paulo', 'Jardins', '45 Av. Paulista', 'Building O', '18', '01311-200', 
 'Brazil', 'São Paulo', 'São Paulo', 'Pinheiros', '67 Faria Lima', 'Building P', '21', '05426-100', 
 'maria.silva@example.br', '666-444-3333', '2023-10-05', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Maria', 'Silva', 'F', 30);

-- Customer 19
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('South Africa', 'Gauteng', 'Johannesburg', 'Sandton', '78 Nelson Mandela Ave', 'Building Q', '14', '2196', 
 'South Africa', 'Gauteng', 'Johannesburg', 'Rosebank', '56 Oxford Rd', 'Building R', '8', '2198', 
 'sipho.ngcobo@example.za', '555-333-1111', '2023-09-01', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Sipho', 'Ngcobo', 'M', 42);

-- Customer 20
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('China', 'Guangdong', 'Guangzhou', 'Tianhe', '12 Tianhe Rd', 'Building S', '5', '510000', 
 'China', 'Guangdong', 'Guangzhou', 'Baiyun', '34 Baiyun St', 'Building T', '12', '510080', 
 'ling.chen@example.cn', '444-777-9999', '2023-08-20', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Ling', 'Chen', 'F', 28);

-- Customer 21
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Russia', 'Moscow', 'Moscow', 'Arbat', '88 Arbat St', 'Building U', '15', '119019', 
 'Russia', 'Moscow', 'Moscow', 'Khamovniki', '23 Khamovniki Ln', 'Building V', '7', '119048', 
 'ivan.ivanov@example.ru', '333-888-5555', '2023-07-15', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Ivan', 'Ivanov', 'M', 50);

-- Customer 22
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Italy', 'Lombardy', 'Milan', 'Navigli', '19 Navigli St', 'Building W', '8', '20123', 
 'Italy', 'Lombardy', 'Milan', 'Brera', '47 Brera Ave', 'Building X', '3', '20121', 
 'giulia.rossi@example.it', '777-222-4444', '2023-06-10', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Giulia', 'Rossi', 'F', 33);

-- Customer 23
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Mexico', 'Mexico City', 'Mexico City', 'Polanco', '32 Masaryk Ave', 'Building Y', '10', '11560', 
 'Mexico', 'Mexico City', 'Mexico City', 'Condesa', '56 Amsterdam Ave', 'Building Z', '15', '06140', 
 'diego.ramirez@example.mx', '111-222-3341', '2023-05-01', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Diego', 'Ramirez', 'M', 36);

-- Customer 24
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Spain', 'Catalonia', 'Barcelona', 'Gracia', '14 Passeig de Gracia', 'Building AA', '11', '08007', 
 'Spain', 'Catalonia', 'Barcelona', 'Eixample', '78 Diagonal Ave', 'Building BB', '9', '08008', 
 'sofia.martinez@example.es', '555-999-4444', '2023-04-15', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Sofia', 'Martinez', 'F', 31);

-- Customer 25
INSERT INTO CUSTOMER (ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding, ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity, BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber, BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType)
VALUES
('Netherlands', 'North Holland', 'Amsterdam', 'Jordaan', '23 Prinsengracht', 'Building CC', '7', '1015', 
 'Netherlands', 'North Holland', 'Amsterdam', 'De Pijp', '56 Albert Cuyp St', 'Building DD', '2', '1073', 
 'daan.van.der.berg@example.nl', '888-777-6666', '2023-03-30', 'I'); -- Individual Customer

INSERT INTO INDIVIDUAL_CUSTOMER (CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender, IndividiualCustomerAge)
VALUES
(SCOPE_IDENTITY(), 'Daan', 'Van der Berg', 'M', 28);


	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;


--------------------------------------------
--PRODUCT AND SHOPS
------------------------------------------
BEGIN TRY
    BEGIN TRANSACTION;

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('SuperHeater 3000', 'Autoterm', 130, 'Ultra useful heater for heating mobile vehicles', 1345.80, 'H');
	INSERT INTO HEATING_COOLING(HCType, Width, Height, Depth, PowerSource, Capacity, ProductId)
	VALUES ('Heating', 120, 90, 100, '12V', '70', SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Fiamma 540S', 'Fiamma', 10, '5.40 meter awning for vans', 15490.85, 'A');
	INSERT INTO AWNING(ALength, AwningColor, AwningWeight, Width, ProductID)
	VALUES (5.40, 'White', 30.5,  2.2, SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Hymer Sporting 470', 'Hymer', 20, '4.7 meter trailer for caravaners', 2200500.99, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('Hymer', 'Sporting 470', 2016, 4.7, 2.5, 'T', 1900, SCOPE_IDENTITY());
	INSERT INTO TRAILER(TrailerType, VehicleID)
	VALUES ('Single Wheel', SCOPE_IDENTITY());


	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Knaus MK340', 'Bravia', 5, 'A motocaravan for offroad use', 1180000.00, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('Knaus', 'MK340', 2018, 4.0, 2.0, 'M', 2200, SCOPE_IDENTITY());
	INSERT INTO MOTOCARAVAN(EngineSize, FuelType, VehicleID)
	VALUES (4.0, 'Diesel', SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Bravia Wolf 5', 'Bravia', 9, 'A campervan for holidays', 800000.10, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('Bravia', 'Wolf 5', 2015, 5.5, 3.0, 'C', 2000, SCOPE_IDENTITY());
	INSERT INTO CAMPER(EngineSize, FuelType, Kitchenette, PopupRoof, VehicleID)
	VALUES (3.0, 'Diesel', '1', '0', SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Hakpol Towbar - Audi A3 2016', 'Hakpol', 97, 'Towbar for Audi A3', 4800.85, 'T');
	INSERT INTO TOWBAR(MaxTowingCapacity, ProductID)
	VALUES (2000, SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Next NextStar TV 27 Inch', 'Next', 12, 'Television for motocaravans', 6250.75, 'F');
	INSERT INTO FURNITURE_MULTIMEDIA(FDepth, FLength, FMType, FWidth, PowerRequirement, ProductID)
	VALUES (10.2, 50.0, 'Television', 95.0, '220V', SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Columbia Outdoor Shoes', 'Columbia', 32, 'Shoes for outdoor use', 7500.99, 'O');
	INSERT INTO OUTDOOR(IsWaterProof, OutdoorType, ProductID)
	VALUES (1, 'Shoe', SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Victron Phoenix MT455', 'Victron', 44, 'Inverter for caravans', 17670.40, 'E');
	INSERT INTO ENERGY_SYSTEM(BatteryCapacity, EDepth, ELength, EnergySystemType, EWidth, PowerOutput, ProductID)
	VALUES (3210, 60.0, 120.5, 'Inverter', 60.0, '220V', SCOPE_IDENTITY());

	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Thetford Blue Chemical', 'Thetford', 217, 'Toilet chemical', 169.70, 'S');
	INSERT INTO SANITATION(IsPortable, SanitationType, SDepth, SLength, SWidth, WaterConsumption, ProductID)
	VALUES (1, 'Toilet Chemical', 30.2, 10.6, 12.5, 'No', SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

BEGIN TRY
    BEGIN TRANSACTION;

	-- Insert Product: 'MegaVent 5000'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('MegaVent 5000', 'TechAir', 95, 'Advanced air vent for large spaces', 1850.50, 'H');
	INSERT INTO HEATING_COOLING(HCType, Width, Height, Depth, PowerSource, Capacity, ProductId)
	VALUES ('Cooling', 150, 110, 120, '220V', '150', SCOPE_IDENTITY());

	-- Insert Product: 'AeroScreen 370'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('AeroScreen 370', 'AeroTech', 15, 'Windshield for trucks', 5400.75, 'A');
	INSERT INTO AWNING(ALength, AwningColor, AwningWeight, Width, ProductID)
	VALUES (3.70, 'Blue', 22.0, 2.5, SCOPE_IDENTITY());

	-- Insert Product: 'Voyager 550'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Voyager 550', 'StarTrailers', 25, '5.5 meter caravan for family trips', 289900.99, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('StarTrailers', 'Voyager 550', 2020, 5.5, 2.6, 'C', 2500, SCOPE_IDENTITY());
	INSERT INTO TRAILER(TrailerType, VehicleID)
	VALUES ('Double Axle', SCOPE_IDENTITY());

	-- Insert Product: 'Elite Max 300'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Elite Max 300', 'EliteMobiles', 8, 'Mobile home for off-road adventures', 350000.00, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('EliteMobiles', 'Elite Max 300', 2019, 6.0, 2.8, 'M', 3000, SCOPE_IDENTITY());
	INSERT INTO MOTOCARAVAN(EngineSize, FuelType, VehicleID)
	VALUES (5.0, 'Petrol', SCOPE_IDENTITY());

	-- Insert Product: 'Xplorer 4x4'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Xplorer 4x4', 'Xplorer', 7, 'Rugged campervan for extreme terrains', 970000.75, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('Xplorer', '4x4', 2021, 5.0, 2.7, 'C', 2200, SCOPE_IDENTITY());
	INSERT INTO CAMPER(EngineSize, FuelType, Kitchenette, PopupRoof, VehicleID)
	VALUES (4.5, 'Diesel', '1', '1', SCOPE_IDENTITY());

	-- Insert Product: 'MotorBase Towbar - Volvo XC60'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('MotorBase Towbar - Volvo XC60', 'MotorBase', 65, 'Towbar for Volvo XC60', 5200.60, 'T');
	INSERT INTO TOWBAR(MaxTowingCapacity, ProductID)
	VALUES (2500, SCOPE_IDENTITY());

	-- Insert Product: 'ProVision Smart TV 32 Inch'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('ProVision Smart TV 32 Inch', 'ProVision', 20, 'Smart TV for vehicles', 7999.40, 'F');
	INSERT INTO FURNITURE_MULTIMEDIA(FDepth, FLength, FMType, FWidth, PowerRequirement, ProductID)
	VALUES (8.5, 60.0, 'Smart TV', 100.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'Hiking Pro Boots'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Hiking Pro Boots', 'HikeGear', 50, 'Durable boots for hiking', 4500.20, 'O');
	INSERT INTO OUTDOOR(IsWaterProof, OutdoorType, ProductID)
	VALUES (1, 'Boots', SCOPE_IDENTITY());

	-- Insert Product: 'SolarEnergy Pro 1200W'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('SolarEnergy Pro 1200W', 'SolarTech', 40, 'Portable solar panel for caravans', 13250.95, 'E');
	INSERT INTO ENERGY_SYSTEM(BatteryCapacity, EDepth, ELength, EnergySystemType, EWidth, PowerOutput, ProductID)
	VALUES (4000, 70.0, 130.0, 'Solar Panel', 80.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'EcoFresh Portable Toilet'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('EcoFresh Portable Toilet', 'EcoFresh', 150, 'Portable eco-friendly toilet', 1100.80, 'S');
	INSERT INTO SANITATION(IsPortable, SanitationType, SDepth, SLength, SWidth, WaterConsumption, ProductID)
	VALUES (1, 'Eco Toilet', 40.0, 15.0, 14.0, 'Yes', SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

BEGIN TRY
    BEGIN TRANSACTION;

	-- Insert Product: 'ClimateMaster 7000'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('ClimateMaster 7000', 'CoolVent', 130, 'High-performance air conditioning unit', 2200.00, 'H');
	INSERT INTO HEATING_COOLING(HCType, Width, Height, Depth, PowerSource, Capacity, ProductId)
	VALUES ('Cooling', 140, 100, 100, '110V', '120', SCOPE_IDENTITY());

	-- Insert Product: 'SolarShade 500'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('SolarShade 500', 'SunBlock', 25, 'Solar panel awning for mobile homes', 7500.60, 'A');
	INSERT INTO AWNING(ALength, AwningColor, AwningWeight, Width, ProductID)
	VALUES (5.0, 'Black', 25.0, 2.3, SCOPE_IDENTITY());

	-- Insert Product: 'Nomad X1'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Nomad X1', 'RoamTech', 40, 'Compact caravan with luxury interior', 185000.00, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('RoamTech', 'Nomad X1', 2022, 6.2, 2.4, 'C', 2200, SCOPE_IDENTITY());
	INSERT INTO TRAILER(TrailerType, VehicleID)
	VALUES ('Single Axle', SCOPE_IDENTITY());

	-- Insert Product: 'Explorer 1200'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Explorer 1200', 'RVWorld', 10, 'Luxury RV with integrated kitchen and bath', 1200000.99, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('RVWorld', 'Explorer 1200', 2021, 7.5, 2.6, 'M', 3500, SCOPE_IDENTITY());
	INSERT INTO MOTOCARAVAN(EngineSize, FuelType, VehicleID)
	VALUES (6.0, 'Diesel', SCOPE_IDENTITY());

	-- Insert Product: 'TrailX Off-road Camper'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('TrailX Off-road Camper', 'TrailX', 18, 'Off-road capable camper for adventurous trips', 650000.50, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('TrailX', 'Off-road Camper', 2020, 5.2, 2.8, 'C', 2400, SCOPE_IDENTITY());
	INSERT INTO CAMPER(EngineSize, FuelType, Kitchenette, PopupRoof, VehicleID)
	VALUES (4.2, 'Petrol', '1', '1', SCOPE_IDENTITY());

	-- Insert Product: 'TowSafe Towbar - BMW X5'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('TowSafe Towbar - BMW X5', 'TowSafe', 80, 'Towbar for BMW X5', 4200.00, 'T');
	INSERT INTO TOWBAR(MaxTowingCapacity, ProductID)
	VALUES (2200, SCOPE_IDENTITY());

	-- Insert Product: 'VisionTech Ultra HD TV'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('VisionTech Ultra HD TV', 'VisionTech', 30, '4K TV for mobile homes', 8999.99, 'F');
	INSERT INTO FURNITURE_MULTIMEDIA(FDepth, FLength, FMType, FWidth, PowerRequirement, ProductID)
	VALUES (10.0, 55.0, '4K TV', 110.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'Adventurer Hiking Boots'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Adventurer Hiking Boots', 'AdventureGear', 40, 'Water-resistant hiking boots', 3500.00, 'O');
	INSERT INTO OUTDOOR(IsWaterProof, OutdoorType, ProductID)
	VALUES (1, 'Boots', SCOPE_IDENTITY());

	-- Insert Product: 'EnergyMax Power Bank 1500W'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('EnergyMax Power Bank 1500W', 'EnergyMax', 50, 'Portable power bank for RVs', 10500.80, 'E');
	INSERT INTO ENERGY_SYSTEM(BatteryCapacity, EDepth, ELength, EnergySystemType, EWidth, PowerOutput, ProductID)
	VALUES (4500, 75.0, 140.0, 'Power Bank', 90.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'EcoClean Portable Toilet'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('EcoClean Portable Toilet', 'EcoClean', 120, 'Compact and eco-friendly portable toilet', 1400.60, 'S');
	INSERT INTO SANITATION(IsPortable, SanitationType, SDepth, SLength, SWidth, WaterConsumption, ProductID)
	VALUES (1, 'Portable Toilet', 38.0, 14.0, 13.0, 'No', SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

BEGIN TRY
    BEGIN TRANSACTION;

	-- Insert Product: 'ArcticCool 12000'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('ArcticCool 12000', 'CoolAir', 50, 'Premium cooling system for RVs', 2500.75, 'H');
	INSERT INTO HEATING_COOLING(HCType, Width, Height, Depth, PowerSource, Capacity, ProductId)
	VALUES ('Cooling', 160, 110, 130, '110V', '180', SCOPE_IDENTITY());

	-- Insert Product: 'ShadePro 450'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('ShadePro 450', 'SolarTech', 30, 'Advanced shade system for motorhomes', 4200.00, 'A');
	INSERT INTO AWNING(ALength, AwningColor, AwningWeight, Width, ProductID)
	VALUES (4.5, 'Gray', 18.0, 3.0, SCOPE_IDENTITY());

	-- Insert Product: 'Adventura X6'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Adventura X6', 'HorizonTrailers', 10, 'Luxury off-road trailer with advanced features', 350000.00, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('HorizonTrailers', 'Adventura X6', 2023, 6.8, 2.7, 'C', 2800, SCOPE_IDENTITY());
	INSERT INTO TRAILER(TrailerType, VehicleID)
	VALUES ('Triple Axle', SCOPE_IDENTITY());

	-- Insert Product: 'Roadster 1500'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Roadster 1500', 'RVWorld', 20, 'Compact motorhome with all-terrain capabilities', 450000.00, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('RVWorld', 'Roadster 1500', 2022, 6.3, 2.5, 'M', 3500, SCOPE_IDENTITY());
	INSERT INTO MOTOCARAVAN(EngineSize, FuelType, VehicleID)
	VALUES (5.0, 'Diesel', SCOPE_IDENTITY());

	-- Insert Product: 'Survivor 300'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Survivor 300', 'TrailBlaze', 12, 'Tough off-road caravan for extreme conditions', 950000.99, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('TrailBlaze', 'Survivor 300', 2021, 6.0, 2.6, 'C', 3000, SCOPE_IDENTITY());
	INSERT INTO CAMPER(EngineSize, FuelType, Kitchenette, PopupRoof, VehicleID)
	VALUES (4.0, 'Petrol', '1', '1', SCOPE_IDENTITY());

	-- Insert Product: 'TrekMaster Towbar - Land Rover Discovery'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('TrekMaster Towbar - Land Rover Discovery', 'TrekMaster', 40, 'Heavy-duty towbar for Land Rover Discovery', 6000.00, 'T');
	INSERT INTO TOWBAR(MaxTowingCapacity, ProductID)
	VALUES (3500, SCOPE_IDENTITY());

	-- Insert Product: 'VisionPro Smart TV 55 Inch'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('VisionPro Smart TV 55 Inch', 'VisionPro', 22, 'High-definition TV for outdoor use', 9999.80, 'F');
	INSERT INTO FURNITURE_MULTIMEDIA(FDepth, FLength, FMType, FWidth, PowerRequirement, ProductID)
	VALUES (10.0, 55.0, 'Smart TV', 120.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'MountainTrail Hiking Boots'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('MountainTrail Hiking Boots', 'TrailGear', 55, 'All-terrain boots for mountain hiking', 5000.50, 'O');
	INSERT INTO OUTDOOR(IsWaterProof, OutdoorType, ProductID)
	VALUES (1, 'Boots', SCOPE_IDENTITY());

	-- Insert Product: 'EcoPower 2000W Generator'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('EcoPower 2000W Generator', 'EcoPower', 35, 'Portable generator for mobile homes', 12500.30, 'E');
	INSERT INTO ENERGY_SYSTEM(BatteryCapacity, EDepth, ELength, EnergySystemType, EWidth, PowerOutput, ProductID)
	VALUES (5000, 80.0, 145.0, 'Generator', 90.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'EcoFlow Portable Toilet'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('EcoFlow Portable Toilet', 'EcoFlow', 90, 'Compact and hygienic portable toilet', 950.60, 'S');
	INSERT INTO SANITATION(IsPortable, SanitationType, SDepth, SLength, SWidth, WaterConsumption, ProductID)
	VALUES (1, 'Portable Toilet', 38.0, 16.0, 14.5, 'No', SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

BEGIN TRY
    BEGIN TRANSACTION;

	-- Insert Product: 'ThermoCool 20000'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('ThermoCool 20000', 'ColdBreeze', 80, 'Heavy-duty cooling unit for large vehicles', 2700.00, 'H');
	INSERT INTO HEATING_COOLING(HCType, Width, Height, Depth, PowerSource, Capacity, ProductId)
	VALUES ('Cooling', 180, 120, 140, '220V', '220', SCOPE_IDENTITY());

	-- Insert Product: 'SunBlocker 650'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('SunBlocker 650', 'SunTech', 50, 'High-efficiency solar panel awning for caravans', 5500.00, 'A');
	INSERT INTO AWNING(ALength, AwningColor, AwningWeight, Width, ProductID)
	VALUES (6.5, 'White', 30.0, 3.5, SCOPE_IDENTITY());

	-- Insert Product: 'TrailBlaze X9'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('TrailBlaze X9', 'OffRoadMasters', 15, 'Premium off-road trailer for extreme conditions', 400000.00, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('OffRoadMasters', 'TrailBlaze X9', 2023, 7.0, 2.8, 'C', 3500, SCOPE_IDENTITY());
	INSERT INTO TRAILER(TrailerType, VehicleID)
	VALUES ('Dual Axle', SCOPE_IDENTITY());

	-- Insert Product: 'RoadXpert 1700'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('RoadXpert 1700', 'OutdoorAdventures', 25, 'Compact and lightweight motorhome for travel', 400000.50, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('OutdoorAdventures', 'RoadXpert 1700', 2021, 6.0, 2.4, 'M', 3000, SCOPE_IDENTITY());
	INSERT INTO MOTOCARAVAN(EngineSize, FuelType, VehicleID)
	VALUES (5.2, 'Diesel', SCOPE_IDENTITY());

	-- Insert Product: 'Ranger 200'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('Ranger 200', 'TrailRider', 18, 'Small off-road camper for rugged terrains', 800000.00, 'V');
	INSERT INTO VEHICLE(VehicleBrand, VehicleModel, VehicleYear, VLength, VWidth, VehicleType, WeightCapacity, ProductID)
	VALUES ('TrailRider', 'Ranger 200', 2020, 5.5, 2.5, 'C', 2500, SCOPE_IDENTITY());
	INSERT INTO CAMPER(EngineSize, FuelType, Kitchenette, PopupRoof, VehicleID)
	VALUES (3.5, 'Petrol', '1', '0', SCOPE_IDENTITY());

	-- Insert Product: 'MegaTow Towbar - Ford F-150'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('MegaTow Towbar - Ford F-150', 'MegaTow', 70, 'Heavy-duty towbar for Ford F-150', 7000.00, 'T');
	INSERT INTO TOWBAR(MaxTowingCapacity, ProductID)
	VALUES (4000, SCOPE_IDENTITY());

	-- Insert Product: 'ClearView Smart TV 60 Inch'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('ClearView Smart TV 60 Inch', 'ClearView', 40, 'Large-screen TV for mobile homes', 11500.30, 'F');
	INSERT INTO FURNITURE_MULTIMEDIA(FDepth, FLength, FMType, FWidth, PowerRequirement, ProductID)
	VALUES (12.0, 60.0, 'Smart TV', 130.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'AlpineTrail Hiking Boots'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('AlpineTrail Hiking Boots', 'MountainGear', 60, 'Weather-resistant boots for alpine hiking', 6000.40, 'O');
	INSERT INTO OUTDOOR(IsWaterProof, OutdoorType, ProductID)
	VALUES (1, 'Boots', SCOPE_IDENTITY());

	-- Insert Product: 'EcoJet 3000W Power Generator'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('EcoJet 3000W Power Generator', 'EcoJet', 25, 'High-capacity power generator for outdoor use', 14000.00, 'E');
	INSERT INTO ENERGY_SYSTEM(BatteryCapacity, EDepth, ELength, EnergySystemType, EWidth, PowerOutput, ProductID)
	VALUES (7000, 85.0, 150.0, 'Power Generator', 100.0, '220V', SCOPE_IDENTITY());

	-- Insert Product: 'QuickFlush Portable Toilet'
	INSERT INTO PRODUCT_(ProductName, ProductBrand, Stock, ProductDescription, ProductPrice, ProductType)
	VALUES ('QuickFlush Portable Toilet', 'FlushMaster', 100, 'Easy-to-use portable toilet', 1100.80, 'S');
	INSERT INTO SANITATION(IsPortable, SanitationType, SDepth, SLength, SWidth, WaterConsumption, ProductID)
	VALUES (1, 'Portable Toilet', 35.0, 15.5, 14.0, 'Yes', SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

-- Insertion for Showroom
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO SHOP(PhoneNumber, ShopType)
	VALUES('02124727656','S');

	INSERT INTO SHOWROOM(ShowroomAddress, ShowroomVehicleCapacity, ShopID)
	VALUES('Istanbul-Avcilar',40,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for REPAIR_SHOP
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO SHOP(PhoneNumber,ShopType)
	VALUES('02124827886','R');

	INSERT INTO REPAIR_SHOP(RepairShopAddress, TechnicianCount, ToolCapacity, RepairVehicleCapacity,ShopID)
	VALUES('Istanbul-Bahcelievler', 12, 120, 30, SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for ONLINE_SHOP
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO SHOP(PhoneNumber,ShopType)
	VALUES('02124927981','O');

	INSERT INTO ONLINE_SHOP(ShopID)
	VALUES(SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for WEBSITE
BEGIN TRY
	BEGIN TRANSACTION;
	--ASPJDSADSA
	INSERT INTO WEBSITE(WebsiteAddress,OnlineShopID)
	VALUES('onlineshopkampkaravan.com',1);

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;


BEGIN TRY
    BEGIN TRANSACTION;

	INSERT INTO SERVICE_(RepairShopID, ServiceDescription, ServiceName, ServicePrice, ServiceType, VehicleRegistrationID)
	VALUES (1, 'Awning installation on vans', 'Awning Installation', 1500.0, 'I', 752);
	INSERT INTO INSTALLATION(ServiceID)
	VALUES (SCOPE_IDENTITY());

	INSERT INTO SERVICE_(RepairShopID, ServiceDescription, ServiceName, ServicePrice, ServiceType, VehicleRegistrationID)
	VALUES (1, 'Repair of van windows', 'Window Repair', 500.0, 'R', 555);
	INSERT INTO REPAIR(ServiceID)
	VALUES (SCOPE_IDENTITY());

	BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO SERVICE_(RepairShopID, ServiceDescription, ServiceName, ServicePrice, ServiceType, VehicleRegistrationID)
    VALUES (1, 'Side light install on vans', 'Light Installation', 1800.0, 'I', 334);
    INSERT INTO INSTALLATION(ServiceID)
    VALUES (SCOPE_IDENTITY());

    INSERT INTO SERVICE_(RepairShopID, ServiceDescription, ServiceName, ServicePrice, ServiceType, VehicleRegistrationID)
    VALUES (1, 'Repair broken doors in RVs', 'Door Fix', 550.0, 'R', 223);
    INSERT INTO REPAIR(ServiceID)
    VALUES (SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;



	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;


--------------------------------------------
--DEPARTMENTS
--------------------------------------------

BEGIN TRY
	BEGIN TRANSACTION;
	


-- Insert data into DEPARTMENT
INSERT INTO DEPARTMENT (ShopID, DepartmentName, DepartmentType)
VALUES
(1,'Main Office', 'O'),
(2,'Repair and Installation', 'R');

-- Insert data into OFFICE
INSERT INTO OFFICE (DepartmentId, OfficeType, ComputerCount, PrinterCount, OfficeSubDepartmentType)
VALUES
(1, 'Headquarters', 50, 20, 'E'),  -- E-COMMERCE office
(1, 'Branch Office', 30, 10, 'A'),  -- ACCOUNTING office
(1, 'Customer Support', 20, 5, 'C');  -- CUSTOMER_SERVICE office

-- Insert data into E_COMMERCE
INSERT INTO E_COMMERCE (OfficeID, WebsiteName)
VALUES
(1, 'www.electronics.com');

-- Insert data into E_COMMERCE_MONTHLY_PROFIT
INSERT INTO E_COMMERCE_MONTHLY_PROFIT (EcommerceID, EcommerceMonthlyProfitAmount, EcommerceMonthlyProfitMonth, EcommerceMonthlyProfitYear)
VALUES
(1, 50000, 1, 2024),  
(1, 55000, 2, 2024),  
(1, 60000, 3, 2024),
(1, 30000, 4, 2024),
(1, 42000, 5, 2024),
(1, 100000, 6, 2024),
(1, 122000, 7, 2024),
(1, 129000, 8, 2024),
(1, 40000, 9, 2024),
(1, 79000, 10, 2024),
(1, 89000, 11, 2024),
(1, 90000, 12, 2024);

-- Insert data into ACCOUNTING
INSERT INTO ACCOUNTING (OfficeID, FinanceTool, MonthlyTotalProfit, MonthlyExpenses)
VALUES
(1, 'QuickBooks', 300000, 50000);

-- Insert data into ACCOUNTING_MONTHLY_PROFIT
INSERT INTO ACCOUNTING_MONTHLY_PROFIT (AccountingID, AccountingMonthlyProfitAmount, AccountingMonthlyProfitMonth, AccountingMonthlyProfitYear)
VALUES
(1, 50000, 1, 2024),  
(1, 42000, 2, 2024),  
(1, 34000, 3, 2024),
(1, 92000, 4, 2024),
(1, 10000, 5, 2024),
(1, 12000, 6, 2024),
(1, 13000, 7, 2024),
(1, 15000, 8, 2024),
(1, 90000, 9, 2024),
(1, 79000, 10, 2024),
(1, 89000, 11, 2024),
(1, 90000, 12, 2024);

-- Insert data into ACCOUNTING_MONTHLY_EXPENSES
INSERT INTO ACCOUNTING_MONTHLY_EXPENSES (AccountingID, AccountingMonthlyExpensesAmount, AccountingMonthlyExpensesMonth, AccountingMonthlyExpensesYear)
VALUES
(1, 20000, 1, 2024), 
(1, 3000, 2, 2024),  
(1, 3000, 3, 2024),
(1, 35000, 4, 2024),
(1, 32000, 5, 2024),
(1, 60000, 6, 2024),
(1, 45000, 7, 2024),
(1, 37000, 8, 2024),
(1, 40000, 9, 2024),
(1, 55000, 10, 2024),
(1, 60000, 11, 2024),
(1, 55000, 12, 2024);

-- Insert data into CUSTOMER_SERVICE
INSERT INTO CUSTOMER_SERVICE (OfficeID, SupportTool, TotalCallLogs, TotalComplaints, AverageSatisfactionScore)
VALUES
(1, 'Zendesk', '1200', '50', 4.7);

-- Insert data into REPAIR_INSTALLATION
INSERT INTO REPAIR_INSTALLATION (DepartmentID, Specialization, MonthlyTotalProfit)
VALUES
(2, 'HVAC Repair', 10000);

-- Insert data into REPAIR_INSTALLATION_PROFIT
INSERT INTO REPAIR_INSTALLATION_PROFIT (RepairInstallationID, RepairInstallationProfitAmount, RepairInstallationProfitMonth, RepairInstallationProfitYear)
VALUES
(1, 25000, 1, 2024), 
(1, 32000, 2, 2024),  
(1, 9000, 3, 2024),
(1, 33000, 4, 2024),
(1, 90000, 5, 2024),
(1, 55000, 6, 2024),
(1, 80000, 7, 2024),
(1, 76000, 8, 2024),
(1, 44000, 9, 2024),
(1, 12000, 10, 2024),
(1, 98000, 11, 2024),
(1, 100000, 12, 2024);

-- Insert data into REPAIR_INSTALLATION_TOOLS_INVENTORY
INSERT INTO REPAIR_INSTALLATION_TOOLS_INVENTORY (RepairID, ToolName, ToolQuantity)
VALUES
(1, 'Wrench Set', 10),
(1, 'Pipe Cutter', 5),
(1, 'Soldering Iron', 7);

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;


--------------------------------------
--INSERTIONS EREN
----------------------------------------

-- Insertion for GENERAL_MANAGER
--1
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Ahmet', 'Demir', 'Male', 'ahmetdemir1@gmail.com', '1993-03-15', '+905443433346', 'Istanbul-Bakirkoy-Atakoy', 67500, '2013-04-12', 'M');

	INSERT INTO MANAGER(AnnualLeaveDays,ManagerType,WorkerID)
	VALUES(30,'G',SCOPE_IDENTITY());

	INSERT INTO GENERAL_MANAGER(IsShareHolder, SharePercentage, ManagerID)
	VALUES(1,55.0,SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

--2
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Fatma', 'Yilmaz', 'Female', 'fatmayilmaz1@gmail.com', '1991-07-20', '+905443433347', 'Istanbul-Kadikoy-Moda', 67500, '2014-06-18', 'M');

	INSERT INTO MANAGER(AnnualLeaveDays,ManagerType,WorkerID)
	VALUES(30,'G',SCOPE_IDENTITY());

	INSERT INTO GENERAL_MANAGER(IsShareHolder, SharePercentage, ManagerID)
	VALUES(1,45.0,SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

--3
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Mehmet', 'Kaya', 'Male', 'mehmetkaya1@gmail.com', '1994-02-10', '+905443433348', 'Istanbul-Besiktas-Levent', 17200, '2015-03-10', 'M');

	INSERT INTO MANAGER(AnnualLeaveDays,ManagerType,WorkerID)
	VALUES(30,'G',SCOPE_IDENTITY());

	INSERT INTO GENERAL_MANAGER(IsShareHolder, SharePercentage, ManagerID)
	VALUES(0,0,SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

-- Insertion for DEPARTMENT_MANAGER
--1
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Emirhan', 'Kurt', 'Male', 'emirhankurt@gmail.com', '1992-05-14', '+905443433312', 'Istanbul-Fatih-Cerrahpasa', 51000, '2013-03-20', 'M');

	INSERT INTO MANAGER(AnnualLeaveDays,ManagerType,WorkerID)
	VALUES(30,'D',SCOPE_IDENTITY());

	INSERT INTO DEPARTMENT_MANAGER(DepartmentID,GeneralManagerID,ManagerID)
	VALUES(1,1,SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

--2
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Zeynep', 'Tekin', 'Female', 'zeyneptekin@gmail.com', '1990-07-30', '+905443433321', 'Istanbul-Beykoz-Kavacik', 17250, '2014-05-15', 'M');

	INSERT INTO MANAGER(AnnualLeaveDays,ManagerType,WorkerID)
	VALUES(25,'D',SCOPE_IDENTITY());

	INSERT INTO DEPARTMENT_MANAGER(DepartmentID,GeneralManagerID,ManagerID)
	VALUES(2,1,SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

--3
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Burak', 'Acar', 'Male', 'burakacar@gmail.com', '1993-08-18', '+905443433345', 'Istanbul-Maltepe-Zumrutevler', 17300, '2015-07-10', 'M');

	INSERT INTO MANAGER(AnnualLeaveDays,ManagerType,WorkerID)
	VALUES(30,'D',SCOPE_IDENTITY());

	INSERT INTO DEPARTMENT_MANAGER(DepartmentID,GeneralManagerID,ManagerID)
	VALUES(2,2,SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

--4
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Ayse', 'Kaya', 'Female', 'aysekaya@gmail.com', '1991-11-22', '+905443433378', 'Istanbul-Kartal-Yakacik', 17450, '2016-10-05', 'M');

	INSERT INTO MANAGER(AnnualLeaveDays,ManagerType,WorkerID)
	VALUES(30,'D',SCOPE_IDENTITY());

	INSERT INTO DEPARTMENT_MANAGER(DepartmentID,GeneralManagerID,ManagerID)
	VALUES(1,3,SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;

-- Insertion for Showroom
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO SHOP(PhoneNumber, ShopType)
	VALUES('2132108','S');

	INSERT INTO SHOWROOM(ShowroomAddress, ShowroomVehicleCapacity, ShopID)
	VALUES('Istanbul-Avcilar',40,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for REPAIR_SHOP
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO SHOP(PhoneNumber,ShopType)
	VALUES('21321089','R');

	INSERT INTO REPAIR_SHOP(RepairShopAddress, TechnicianCount, ToolCapacity, RepairVehicleCapacity,ShopID)
	VALUES('Istanbul-Bahcelievler', 12, 120, 30, SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for ONLINE_SHOP
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO SHOP(PhoneNumber,ShopType)
	VALUES('9182312','O');

	INSERT INTO ONLINE_SHOP(ShopID)
	VALUES(SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for WEBSITE
BEGIN TRY
	BEGIN TRANSACTION;
	--A2222
	INSERT INTO WEBSITE(WebsiteAddress,OnlineShopID)
	VALUES('onlineshopkampkaravan2.com',2);

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for Shipping Partner
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO SHIPPING_PARTNER(PartnerName, OnlineShopID)
	VALUES('FedEx', 1);

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for Full-Time x 15  
--1
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Veli', 'Yilmaz', 'Male', 'veliyilmaz@gmail.com', '1995-12-24', '+905030303030', 'Istanbul-Haznedar', 22000, '2012-12-12', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,1,'F',80,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--2
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Ali', 'Kaya', 'Male', 'alikaya@gmail.com', '1987-05-10', '+905333333333', 'Istanbul-Bagcilar-Goztepe', 40000, '2010-06-01', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,1,'F',90,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(30,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--3
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Ayse', 'Demir', 'Female', 'aysedemir@gmail.com', '1990-08-14', '+905444444444', 'Kocaeli-Darýca', 32000, '2011-09-20', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,1,'F',80,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(30,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--4
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Fatma', 'Yildiz', 'Female', 'fatmayildiz@gmail.com', '1985-04-18', '+905666666666', 'Istanbul-Besiktas', 32000, '2009-03-01', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,1,'F',80,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--5
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Hasan', 'Celik', 'Male', 'hasancelik@gmail.com', '1992-02-22', '+905777777777', 'Istanbul-GOP-Karadeniz', 23000, '2014-08-10', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,2,'F',90,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--6
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Elif', 'Karaca', 'Female', 'elifkaraca@gmail.com', '1997-11-12', '+905888888888', 'Istanbul-Esenyurt', 27000, '2015-12-05', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,2,'F',79,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--7
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Mehmet', 'Gunes', 'Male', 'mehmetgunes@gmail.com', '1988-01-01', '+905999999999', 'Ankara-Polatlý', 37000, '2013-01-01', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,2,'F',95,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(30,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--8
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Zeynep', 'Arslan', 'Female', 'zeyneparslan@gmail.com', '1993-07-30', '+905111111111', 'Ankara-Mamak', 24000, '2016-05-25', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,2,'F',80,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--9
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Burak', 'Aydin', 'Male', 'burakaydin@gmail.com', '1991-10-15', '+905222222222', 'Ankara-Sincan', 23500, '2014-07-19', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,3,'F',60,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--10
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Cem', 'Ozturk', 'Male', 'cemozturk@gmail.com', '1989-03-03', '+905333331133', 'Istanbul-Zeytinburnu', 24500, '2012-11-30', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,3,'F',80,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--11
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Seda', 'Ersoy', 'Female', 'sedaersoy@gmail.com', '1994-12-01', '+905441144444', 'Istanbul-Gungoren-Merkez', 22000, '2015-10-11', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,3,'F',65,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(15,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--12
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Eren', 'Koc', 'Male', 'erenkoc@gmail.com', '1986-06-17', '+905555555555', 'Ankara-Çankaya', 35000, '2008-09-23', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,3,'F',70,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(30,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--13
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Melike', 'Sahin', 'Female', 'melikesahin@gmail.com', '1998-03-29', '+905666116666', 'Kocaeli-Izmit', 27500, '2016-02-14', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,4,'F',70,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--14
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Murat', 'Tekin', 'Male', 'murattekin@gmail.com', '1990-09-05', '+905777721321', 'Istanbul-Zeytinburnu-Merkezefendi', 23000, '2013-04-17', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,4,'F',60,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--15
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Esra', 'Simsek', 'Female', 'esrasimsek@gmail.com', '1984-11-22', '+905888888811', 'Balikesir-Karesi', 26000, '2007-08-02', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,4,'F',90,SCOPE_IDENTITY());

	INSERT INTO FULL_TIME(AnnualLeaveDays,EmployeeID)
	VALUES(20,SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-- Insertion for Part-Time x 5
--1
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Ahmet', 'Altun', 'Male', 'ahmetaltun@gmail.com', '1990-01-15', '+905112223344', 'Istanbul-Bakirkoy', 18000, '2015-06-10', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,1,'P',60,SCOPE_IDENTITY());

	INSERT INTO PART_TIME(EmployeeID)
	VALUES(SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--2
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Hakan', 'Durmaz', 'Male', 'hakandurmaz@gmail.com', '1985-04-20', '+905223344556', 'Istanbul-Kadikoy', 19000, '2012-03-05', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,2,'P',50,SCOPE_IDENTITY());

	INSERT INTO PART_TIME(EmployeeID)
	VALUES(SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--3
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Sevda', 'Polat', 'Female', 'sevdapolat@gmail.com', '1993-09-12', '+905334455667', 'Istanbul-Uskudar', 20000, '2018-09-22', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,3,'P',70,SCOPE_IDENTITY());

	INSERT INTO PART_TIME(EmployeeID)
	VALUES(SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--4
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Deniz', 'Yaman', 'Female', 'denizyaman@gmail.com', '1992-07-05', '+905445566778', 'Istanbul-Sisli', 17002, '2017-11-18', 'E');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(2,4,'P',80,SCOPE_IDENTITY());

	INSERT INTO PART_TIME(EmployeeID)
	VALUES(SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--5
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKER(FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
	VALUES('Baris', 'Erdem', 'Male', 'bariserdem@gmail.com', '1995-03-30', '+905556677889', 'Istanbul-Beyoglu', 17500, '2019-01-15', 'M');

	INSERT INTO EMPLOYEE(DepartmentID,DepartmentManagerID,EmployeeType,PerformanceRate,WorkerID)
	VALUES(1,4,'P',90,SCOPE_IDENTITY());

	INSERT INTO PART_TIME(EmployeeID)
	VALUES(SCOPE_IDENTITY());

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;


-- Insertion for WorkingTimes x 10
--1
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Monday',1);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--2
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Tuesday',1);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--3
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Wednesday',2);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--4
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Thursday',2);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--5
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Monday',3);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--6
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Friday',3);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--7
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Thursday',4);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--8
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Tuesday',4);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--9
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Monday',5);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

--10
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO WORKING_TIMES(StartTime,EndTime,Day_,PartTimeID)
	VALUES('09:00:00','15:00:00','Wednesday',5);

	COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

-----------------------------------------------------
-- INSERTIONS MELISA
-----------------------------------------------------

BEGIN TRY
    BEGIN TRANSACTION;


	INSERT INTO SUPPLIER(Building, CategoryID, City, Country, District, DoorNumber, PrimaryContactNumber, Province, Street, SupplierName, SupplierRepresentative, SupplierType, Zipcode)
	VALUES ('Kozyataðý Ýþ Merkezi', 1, 'Ýstanbul', 'Turkey', 'Sahil Mah.', 1, '2166657842', 'Kozyataðý', 'Kadife Sok.', 'Eltesan Mobil', 'Bora Gündüz', 'R', 4424);
	INSERT INTO REGULAR_SUPPLIER(ContractStartDate, ContractEndDate, RestockFrequency, SupplierID)
	VALUES ('2019-07-19', '2025-09-23', 1, SCOPE_IDENTITY());

	INSERT INTO SUPPLIER(Building, CategoryID, City, Country, District, DoorNumber, PrimaryContactNumber, Province, Street, SupplierName, SupplierRepresentative, SupplierType, Zipcode)
	VALUES ('Dudullu Organize Sanayi 4. Blok', 1, 'Ýstanbul', 'Turkey', 'Sanayi Mah.', 1, '2164432390', 'Ümraniye', 'Tosun Sok.', 'Karavanist', 'Serdar Akýn', 'I', 245);
	INSERT INTO IRREGULAR_SUPPLIER(LastSupplyDate,SUPPLIER)
	VALUES ('2024-06-27', SCOPE_IDENTITY()); --SupplierID foreign key yazýlmamýþ


    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
	VALUES ('TRY', 1, 1, 1, 232.89, 1465.0, '2024-02-22', 'Done', 'C');
	INSERT INTO CASH(ChangeGiven, EmployeeID, TransactionID)
	VALUES (50.65, 1, SCOPE_IDENTITY());

	INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
	VALUES ('EUR', 2, 1, 1, 19.60, 225.75, '2023-01-12', 'Done', 'BT');
	INSERT INTO BANK_TRANSFER(AccountNumber, BankName, BankTransferDiscount, TrancationID)
	VALUES ('234858515134', 'Akbank', 0.05, SCOPE_IDENTITY());

	INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
	VALUES ('TRY', 2, 2, 1, 2441.09, 34000.35, '2013-07-11', 'Done', 'CC');
	INSERT INTO CREDIT_CARD(CardIssuer, CardType, TransactionFee, TransactionID)
	VALUES ('Garanti', 'MasterCard', 40.34, SCOPE_IDENTITY());



	COMMIT TRANSACTION;
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION;

	THROW;
END CATCH;

BEGIN TRY
    BEGIN TRANSACTION;

    -- Transaction 1: Credit Card Payment
    INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
    VALUES ('USD', 3, 2, 1, 180.50, 1290.25, '2024-01-15', 'Done', 'C');
    INSERT INTO CASH(ChangeGiven, EmployeeID, TransactionID)
    VALUES (75.50, 2, SCOPE_IDENTITY());

    -- Transaction 2: Bank Transfer
    INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
    VALUES ('EUR', 2, 1, 1, 50.90, 300.75, '2024-03-16', 'Done', 'BT');
    INSERT INTO BANK_TRANSFER(AccountNumber, BankName, BankTransferDiscount, TrancationID)
    VALUES ('128374658934', 'Ýþbank', 0.03, SCOPE_IDENTITY());

    -- Transaction 3: Credit Card Payment
    INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
    VALUES ('TRY', 1, 2, 1, 1000.45, 8500.50, '2022-11-09', 'Done', 'CC');
    INSERT INTO CREDIT_CARD(CardIssuer, CardType, TransactionFee, TransactionID)
    VALUES ('VakýfBank', 'Visa', 25.90, SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

BEGIN TRY
    BEGIN TRANSACTION;

    -- Transaction 1: Credit Card Payment
    INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
    VALUES ('USD', 3, 2, 1, 120.75, 980.60, '2023-09-03', 'Done', 'C');
    INSERT INTO CASH(ChangeGiven, EmployeeID, TransactionID)
    VALUES (50.00, 3, SCOPE_IDENTITY());

    -- Transaction 2: Bank Transfer
    INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
    VALUES ('TRY', 4, 2, 1, 300.00, 2150.90, '2024-09-05', 'Done', 'BT');
    INSERT INTO BANK_TRANSFER(AccountNumber, BankName, BankTransferDiscount, TrancationID)
    VALUES ('184739254819', 'Ziraat Bank', 0.07, SCOPE_IDENTITY());

    -- Transaction 3: Credit Card Payment
    INSERT INTO TRANSACTION_(CurrentType, CustomerID, ShopID, SupplierID, TaxAmount, TotalAmount, TransactionDate, TransactionStatus, TransactionType)
    VALUES ('EUR', 2, 1, 1, 200.65, 2100.45, '2023-07-17', 'Done', 'CC');
    INSERT INTO CREDIT_CARD(CardIssuer, CardType, TransactionFee, TransactionID)
    VALUES ('Yapý Kredi', 'American Express', 38.50, SCOPE_IDENTITY());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

